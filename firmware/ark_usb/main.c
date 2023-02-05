/*
 * ark_usb.c
 *
 * Created: 05/02/2023 16:04:18
 * Author : kuro68k
 */ 

#include <avr/io.h>
#include <avr/interrupt.h>  /* for sei() */
#include <avr/pgmspace.h>   /* required by usbdrv.h */
#include "usbdrv.h"
#include <util/delay.h>     /* for _delay_ms() */

// PORT A
#define	DATA1_PIN_bm	(1<<0)
#define	CLOCK_PIN_bm	(1<<2)
#define	READ_PIN_bm		(1<<3)
#define	BUTTON1_PIN_bm	(1<<4)
#define	DATA2_PIN_bm	(1<<5)
#define	BUTTON2_PIN_bm	(1<<6)
#define	POT_PIN_bm		(1<<7)

PROGMEM const char usbHidReportDescriptor[52] = { /* USB report descriptor, size must match usbconfig.h */
    0x05, 0x01,                    // USAGE_PAGE (Generic Desktop)
    0x09, 0x02,                    // USAGE (Mouse)
    0xa1, 0x01,                    // COLLECTION (Application)
    0x09, 0x01,                    //   USAGE (Pointer)
    0xA1, 0x00,                    //   COLLECTION (Physical)
    0x05, 0x09,                    //     USAGE_PAGE (Button)
    0x19, 0x01,                    //     USAGE_MINIMUM
    0x29, 0x03,                    //     USAGE_MAXIMUM
    0x15, 0x00,                    //     LOGICAL_MINIMUM (0)
    0x25, 0x01,                    //     LOGICAL_MAXIMUM (1)
    0x95, 0x03,                    //     REPORT_COUNT (3)
    0x75, 0x01,                    //     REPORT_SIZE (1)
    0x81, 0x02,                    //     INPUT (Data,Var,Abs)
    0x95, 0x01,                    //     REPORT_COUNT (1)
    0x75, 0x05,                    //     REPORT_SIZE (5)
    0x81, 0x03,                    //     INPUT (Const,Var,Abs)
    0x05, 0x01,                    //     USAGE_PAGE (Generic Desktop)
    0x09, 0x30,                    //     USAGE (X)
    0x09, 0x31,                    //     USAGE (Y)
    0x09, 0x38,                    //     USAGE (Wheel)
    0x15, 0x81,                    //     LOGICAL_MINIMUM (-127)
    0x25, 0x7F,                    //     LOGICAL_MAXIMUM (127)
    0x75, 0x08,                    //     REPORT_SIZE (8)
    0x95, 0x03,                    //     REPORT_COUNT (3)
    0x81, 0x06,                    //     INPUT (Data,Var,Rel)
    0xC0,                          //   END_COLLECTION
    0xC0,                          // END COLLECTION
};

typedef struct{
	uint8_t	button;
	int8_t	pot;
}report_t;

static report_t reportBuffer;
static uchar    idleRate;   /* repeat rate for keyboards, never used for mice */

int main(void)
{
	PORTA = DATA1_PIN_bm | BUTTON1_PIN_bm | DATA2_PIN_bm | BUTTON2_PIN_bm;	// pull ups
	DDRA =	CLOCK_PIN_bm | READ_PIN_bm;

	PORTB = 0b10000111;		// programmer SPI interface pull ups
	DDRB =  0b00000000;

	// USI in SPI mode on PORT B
	USIPP = USIPOS;			// PORT A
	USICR = USIWM0;			// 3 wire mode
	
	usbInit();
	usbDeviceDisconnect();  // enforce re-enumeration, do this while interrupts are disabled!
	_delay_ms(255);			// USB reset
	usbDeviceConnect();
	sei();
	
	for (;;)
	{
		usbPoll();
		// read controller
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
			return sizeof(reportBuffer);
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
