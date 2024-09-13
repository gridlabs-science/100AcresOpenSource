#!/bin/bash
# Path to your Python script that reads the voltage
PYTHON_SCRIPT="/home/100acresranchs9/voltage.py"

# File to store miners
MINERS_FILE="/home/100acresranchs9/miners.csv"
IP_START="192.168.1.1"
IP_END="192.168.1.255"
if ! test -e $MINERS_FILE; then
	/home/100acresranchs9/luxminer-cli-linux-arm scan range $IP $IP -o $MINERS_FILE
fi

while :; do
	# Read voltage from Python script
	VOLTAGE=$(python3 $PYTHON_SCRIPT)
	echo "Voltage: $VOLTAGE" >> /home/100acresranchs9/log.txt

	# Determine the frequency based on the voltage
	if (( $(echo "$VOLTAGE >= 13.6" | bc -l) )); then
		FREQUENCY=650
		VOLTAGE=9
	elif (( $(echo "$VOLTAGE >= 13.5" | bc -l) )); then
		FREQUENCY=550
		VOLTAGE=8.8
	elif (( $(echo "$VOLTAGE >= 13.3" | bc -l) )); then
		FREQUENCY=500
		VOLTAGE=8.7
	elif (( $(echo "$VOLTAGE >= 13.1" | bc -l) )); then
		FREQUENCY=450
		VOLTAGE=8.6
	elif (( $(echo "$VOLTAGE >= 12.6" | bc -l) )); then
		FREQUENCY=350
		VOLTAGE=8.5
	elif (( $(echo "$VOLTAGE >= 12.4" | bc -l) )); then
		FREQUENCY=300
		VOLTAGE=8.4
	else
		FREQUENCY=200
		VOLTAGE=8.3
	fi

	LAST_VOLTAGE=`cat /home/100acresranchs9/voltage.csv`
	if [[ $VOLTAGE == $LAST_VOLTAGE ]]; then
		echo "VOLTAGE SAME"
		continue
	fi
	/home/100acresranchs9/luxminer-cli-linux-arm config read -i $MINERS_FILE -o /home/100acresranchs9/miners_new.csv
	
	head -n 1 /home/100acresranchs9/miners_new.csv > /home/100acresranchs9/miners_updated.csv
	# Update the CSV file to set the desired voltage and frequency
	linept1=`grep ,luxos, /home/100acresranchs9/miners_new.csv | cut -d ',' -f 1-5`
	linept2=`grep ,luxos, /home/100acresranchs9/miners_new.csv | cut -d ',' -f 8-`
	echo -e "$linept1,$VOLTAGE,$FREQUENCY,$linept2" >> /home/100acresranchs9/miners_updated.csv
	echo $VOLTAGE,$FREQUENCY
	# Update the miners with the new voltage and frequency settings
	/home/100acresranchs9/luxminer-cli-linux-arm config write voltage frequency -i /home/100acresranchs9/miners_updated.csv --yes

	echo $VOLTAGE > /home/100acresranchs9/voltage.csv
	sleep 1

done
