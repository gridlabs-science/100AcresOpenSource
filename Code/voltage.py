import board
import busio
import adafruit_ads1x15.ads1115 as ADS
from adafruit_ads1x15.analog_in import AnalogIn
 
# Initialize the I2C interface
i2c = busio.I2C(board.SCL, board.SDA)
  
# Create an ADS1115 object
ads = ADS.ADS1115(i2c)
   
# Define the analog input channel
channel = AnalogIn(ads, ADS.P0)
    
# Loop to read the analog input continuously
print(channel.voltage * 5)
