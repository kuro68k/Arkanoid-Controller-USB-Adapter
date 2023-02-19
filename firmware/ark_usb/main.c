/*
 * ark_usb.c
 *
 * Created: 05/02/2023 16:04:18
 * Author : kuro68k
 */ 

#include <stdbool.h>
#include <avr/io.h>
#include <avr/interrupt.h>  /* for sei() */
#include <avr/pgmspace.h>   /* required by usbdrv.h */
#include "usbdrv.h"
#include <util/delay.h>     /* for _delay_ms() */

#define ABSOLUTE_MODE

PROGMEM const char usbHidReportDescriptor[USB_CFG_HID_REPORT_DESCRIPTOR_LENGTH] = { /* USB report descriptor, size must match usbconfig.h */
    0x05, 0x01,                    // USAGE_PAGE (Generic Desktop)
    0x09, 0x04,                    // USAGE (Joystick)
    0xa1, 0x01,                    // COLLECTION (Application)
    0xa1, 0x00,                    //   COLLECTION (Physical)
    0x05, 0x09,                    //     USAGE_PAGE (Button)
    0x19, 0x01,                    //     USAGE_MINIMUM (Button 1)
    0x29, 0x01,                    //     USAGE_MAXIMUM (Button 1)
    0x15, 0x00,                    //     LOGICAL_MINIMUM (0)
    0x25, 0x01,                    //     LOGICAL_MAXIMUM (1)
    0x95, 0x01,                    //     REPORT_COUNT (1)
    0x75, 0x01,                    //     REPORT_SIZE (1)
    0x81, 0x02,                    //     INPUT (Data,Var,Abs)
    0x95, 0x01,                    //     REPORT_COUNT (1)
    0x75, 0x07,                    //     REPORT_SIZE (7)
    0x81, 0x03,                    //     INPUT (Cnst,Var,Abs)
    0x05, 0x01,                    //     USAGE_PAGE (Generic Desktop)
    0x09, 0x30,                    //     USAGE (X)
#ifdef ABSOLUTE_MODE
    0x16, 0x00, 0x00,              //     LOGICAL_MINIMUM (0)
    0x26, 0xff, 0x01,              //     LOGICAL_MAXIMUM (511)
#else
    0x16, 0x01, 0xff,              //     LOGICAL_MINIMUM (-255)
    0x26, 0xff, 0x00,              //     LOGICAL_MAXIMUM (255)
#endif
    0x75, 0x09,                    //     REPORT_SIZE (9)
    0x95, 0x01,                    //     REPORT_COUNT (1)
    0x81, 0x02,                    //     INPUT (Data,Var,Abs)
    0x75, 0x07,                    //     REPORT_SIZE (7)
    0x95, 0x01,                    //     REPORT_COUNT (1)
    0x81, 0x03,                    //     INPUT (Cnst,Var,Abs)
    0xc0,                          //     END_COLLECTION
    0xc0                           // END_COLLECTION
};

typedef struct{
	uint8_t	button;
	int16_t	pot;
}report_t;

static report_t reportBuffer;
static volatile uint8_t reportBufferIdx_AT = 0;
static uchar    idleRate;   /* repeat rate for keyboards, never used for mice */

// PORT A
#define	DATA1_PIN_bm	(1<<0)
#define	CLOCK_PIN_bm	(1<<2)
#define	READ_PIN_bm		(1<<3)
#define	BUTTON1_PIN_bm	(1<<4)
#define	DATA2_PIN_bm	(1<<5)
#define	BUTTON2_PIN_bm	(1<<6)
#define	POT_PIN_bm		(1<<7)


int main(void)
{
	PORTA = DATA1_PIN_bm | BUTTON1_PIN_bm | DATA2_PIN_bm | BUTTON2_PIN_bm;	// pull ups
	DDRA =	CLOCK_PIN_bm | READ_PIN_bm;

	PORTB = 0b10000111;		// programmer SPI interface pull ups
	DDRB =  0b00000001;		// MOSI as output

	// USB interrupt, port B pin 6 change, INT0
	MCUCR |= (1<<ISC00);	// any change triggers the interrupt
	MCUCR &= ~(1<<ISC01);
	GIMSK = (1<<INT0);

	// USI in SPI mode on PORT B
	USIPP = (1<<USIPOS);	// PORT A
	USICR = (1<<USIWM0);	// 3 wire mode

	usbInit();
	usbDeviceDisconnect();  // enforce re-enumeration, do this while interrupts are disabled!
	_delay_ms(255);			// USB reset
	usbDeviceConnect();
	sei();

#ifdef ABSOLUTE_MODE
	uint16_t min = 255;
	uint16_t max = 256;
#else
	uint16_t last_pot = 511;
#endif
	for (;;)
	{
		usbPoll();
		if (usbInterruptIsReady())
		{
			// clock out bits via SPI
			USISR = (1<<USIOIF);		// clear overflow flag, counter = 0
			for (uint8_t i = 0; i < 8; i++)
			{
				_delay_us(10);
				USICR = (1<<USIWM0) | (1<<USICS1) | (1<<USITC);
				_delay_us(10);
				USICR = (1<<USIWM0) | (1<<USICS1) | (1<<USICLK) | (1<<USITC);
			}
			int16_t pot = (uint16_t)USIDR << 1;
			_delay_us(10);
			USICR = (1<<USIWM0) | (1<<USICS1) | (1<<USITC);
			_delay_us(10);
			USICR = (1<<USIWM0) | (1<<USICS1) | (1<<USICLK) | (1<<USITC);
			pot |= USIDR & 1;
			if (pot > 511)
				pot = 511;

			if ((pot > 100) && (pot < 500))
			{
#ifdef ABSOLUTE_MODE
				if (min > pot)
					min = pot;
				if (max < pot)
					max = pot;
				float scale = 511 / ((float)max - (float)min);
				scale *= (float)pot - (float)min;
				pot = scale;
				if (pot > 511)
					pot = 511;
#else
				int16_t temp = pot;
				pot = pot - last_pot;
				last_pot = temp;
				pot *= 10;
#endif
				cli();
				reportBuffer.pot = pot;
				reportBuffer.button = PINA & BUTTON1_PIN_bm ? 0 : 1;
				sei();

				usbSetInterrupt((uchar *)&reportBuffer, sizeof(report_t));
			}

			// read controller again
			PORTA |= READ_PIN_bm;
			_delay_us(100);
			PORTA &= ~READ_PIN_bm;
		}
	}
}

usbMsgLen_t usbFunctionSetup(uchar data[8])
{
	usbRequest_t    *rq = (void *)data;

	/* The following requests are never used. But since they are required by
	* the specification, we implement them in this example.
	*/
	if((rq->bmRequestType & USBRQ_TYPE_MASK) == USBRQ_TYPE_CLASS)	/* class request type */
	{
		if(rq->bRequest == USBRQ_HID_GET_REPORT)	/* wValue: ReportType (highbyte), ReportID (lowbyte) */
		{
			/* we only have one report type, so don't look at wValue */
			usbMsgPtr = (usbMsgPtr_t)&reportBuffer;
			return sizeof(report_t);
		}
		else if(rq->bRequest == USBRQ_HID_GET_IDLE)
		{
			usbMsgPtr = (usbMsgPtr_t)&idleRate;
			return 1;
		}
		else if(rq->bRequest == USBRQ_HID_SET_IDLE)
		{
			idleRate = rq->wValue.bytes[1];
		}
	}
	else
	{
		/* no vendor specific requests implemented */
	}
	return 0;   /* default for not implemented requests: return no data back to host */
}
