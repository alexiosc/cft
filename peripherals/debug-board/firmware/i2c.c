// Adapted from code at: http://www.ermicro.com/blog/?p=744

#include <avr/io.h>
#include <util/delay.h>
#include <compat/twi.h>

#define MAX_TRIES 50
#define I2C_START 0
#define I2C_DATA  1
#define I2C_STOP  2

unsigned char
i2c_transmit(unsigned char type)
{
	switch(type) {
	case I2C_START:    // Send Start Condition
		TWCR = (1 << TWINT) | (1 << TWSTA) | (1 << TWEN);
		break;
	case I2C_DATA:     // Send Data
		TWCR = (1 << TWINT) | (1 << TWEN);
		break;
	case I2C_STOP:     // Send Stop Condition
		TWCR = (1 << TWINT) | (1 << TWEN) | (1 << TWSTO);
		return 0;
	}

	// Wait for TWINT flag set in TWCR Register
	while (!(TWCR & (1 << TWINT)));

	// Return TWI Status Register, mask the prescaler bits (TWPS1,TWPS0)
	return (TWSR & 0xF8);
}


int i2c_writebyte(unsigned int i2c_address, unsigned int dev_id,
                  unsigned int dev_addr,char data) {
	unsigned char n = 0;
	unsigned char twi_status;
	char r_val = -1;
i2c_retry:
	if (n++ >= MAX_TRIES) return r_val;

	// Transmit Start Condition
	twi_status=i2c_transmit(I2C_START);

	// Check the TWI Status
	if (twi_status == TW_MT_ARB_LOST) goto i2c_retry;
	if ((twi_status != TW_START) && (twi_status != TW_REP_START)) goto i2c_quit;

	// Send slave address (SLA_W)
	TWDR = (dev_id & 0xF0) | ((dev_addr & 0x07) << 1) | TW_WRITE;

	// Transmit I2C Data
	twi_status=i2c_transmit(I2C_DATA);

	// Check the TWSR status
	if ((twi_status == TW_MT_SLA_NACK) || (twi_status == TW_MT_ARB_LOST)) goto i2c_retry;
	if (twi_status != TW_MT_SLA_ACK) goto i2c_quit;

	// Send the High 8-bit of I2C Address
	TWDR = i2c_address >> 8;

	// Transmit I2C Data
	twi_status=i2c_transmit(I2C_DATA);

	// Check the TWSR status
	if (twi_status != TW_MT_DATA_ACK) goto i2c_quit;

	// Send the Low 8-bit of I2C Address
	TWDR = i2c_address;

	// Transmit I2C Data
	twi_status=i2c_transmit(I2C_DATA);

	// Check the TWSR status
	if (twi_status != TW_MT_DATA_ACK) goto i2c_quit;

	// Put data into data register and start transmission
	TWDR = data;

	// Transmit I2C Data
	twi_status=i2c_transmit(I2C_DATA);

	// Check the TWSR status
	if (twi_status != TW_MT_DATA_ACK) goto i2c_quit;

	// TWI Transmit Ok
	r_val=1;
i2c_quit:
	// Transmit I2C Data
	twi_status=i2c_transmit(I2C_STOP);
	return r_val;
}


int
i2c_readbyte(unsigned int i2c_address, unsigned int dev_id,
	     unsigned int dev_addr, char *data)
{
	unsigned char n = 0;
	unsigned char twi_status;
	char r_val = -1;

i2c_retry:
	if (n++ >= MAX_TRIES) return r_val;

	// Transmit Start Condition
	twi_status=i2c_transmit(I2C_START);

	// Check the TWSR status
	if (twi_status == TW_MT_ARB_LOST) goto i2c_retry;
	if ((twi_status != TW_START) && (twi_status != TW_REP_START)) goto i2c_quit;

	// Send slave address (SLA_W) 0xa0
	TWDR = (dev_id & 0xF0) | ((dev_addr << 1) & 0x0E) | TW_WRITE;

	// Transmit I2C Data
	twi_status=i2c_transmit(I2C_DATA);

	// Check the TWSR status
	if ((twi_status == TW_MT_SLA_NACK) || (twi_status == TW_MT_ARB_LOST)) goto i2c_retry;
	if (twi_status != TW_MT_SLA_ACK) goto i2c_quit;

	// Send the High 8-bit of I2C Address
	TWDR = i2c_address >> 8;

	// Transmit I2C Data
	twi_status=i2c_transmit(I2C_DATA);

	// Check the TWSR status
	if (twi_status != TW_MT_DATA_ACK) goto i2c_quit;

	// Send the Low 8-bit of I2C Address
	TWDR = i2c_address;

	// Transmit I2C Data
	twi_status=i2c_transmit(I2C_DATA);

	// Check the TWSR status
	if (twi_status != TW_MT_DATA_ACK) goto i2c_quit;  

	// Send start Condition
	twi_status=i2c_transmit(I2C_START);

	// Check the TWSR status
	if (twi_status == TW_MT_ARB_LOST) goto i2c_retry;
	if ((twi_status != TW_START) && (twi_status != TW_REP_START)) goto i2c_quit;

	// Send slave address (SLA_R)
	TWDR = (dev_id & 0xF0) | ((dev_addr << 1) & 0x0E) | TW_READ;

	// Transmit I2C Data
	twi_status=i2c_transmit(I2C_DATA);  

	// Check the TWSR status
	if ((twi_status == TW_MR_SLA_NACK) || (twi_status == TW_MR_ARB_LOST)) goto i2c_retry;
	if (twi_status != TW_MR_SLA_ACK) goto i2c_quit;

	// Read I2C Data
	twi_status=i2c_transmit(I2C_DATA);
	if (twi_status != TW_MR_DATA_NACK) goto i2c_quit;

	// Get the Data
	*data=TWDR;
	r_val=1;

i2c_quit:
	// Send Stop Condition
	twi_status=i2c_transmit(I2C_STOP);
	return r_val;
}

// End of file.
