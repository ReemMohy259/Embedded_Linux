#! /usr/bin/bash

############################################## 1. script information ######################################################
# Description : Bash Script to Analyze Network Traffic
# Input       : Path of the captured data file taken from wireshark (.pcap file)
# Output      : Summary report containing identified patterns and key statistics
# Auther      : Reem Mohy
# Date        : 27-8-2024
############################################################################################################################



################################# 2. Source file & Global variables & Function decleration #################################

# Function to analyze the traffic and print the statistics based on the .pcap file #
function analyze_traffic() {
    declare PCAP_FILE=$1
    declare -i TOTAL_PACKETS_NUMBER=0
    declare -i HTTP_PACKETS_NUMBER=0
    declare -i HTTPS_TLS_PACKETS_NUMBER=0

    # List all captured packets then count the number of output lines #
    TOTAL_PACKETS_NUMBER=$(tshark -r "${PCAP_FILE}" | wc -l)      
    
    # List the captured packets filtered with specific protocol type then count the number of output lines #
    HTTP_PACKETS_NUMBER=$(tshark -r "${PCAP_FILE}" -Y http | wc -l)
    HTTPS_TLS_PACKETS_NUMBER=$(tshark -r "${PCAP_FILE}" -Y tls | wc -l)


    # Output analysis summary
    echo "----- Network Traffic Analysis Report -----"

    echo "1. Total Packets : ${TOTAL_PACKETS_NUMBER}"
    echo "2. Protocols:"
    echo "   - HTTP: ${HTTP_PACKETS_NUMBER} packets"
    echo "   - HTTPS/TLS: ${HTTPS_TLS_PACKETS_NUMBER} packets"
    echo ""
    echo "3. Top 5 Source IP Addresses:"
    # Provide the top source IP addresses
    tshark -r net.pcap -T fields -e ip.src | head -n 6
    echo ""
    echo "4. Top 5 Destination IP Addresses:"
    # Provide the top destination IP addresses
    tshark -r net.pcap -T fields -e ip.dst | head -n 6
    echo ""
    
    echo "------------- End of Report --------------"
}
############################################################################################################################



########################################### 3. Main function (Script logic) ################################################
function main () {
    analyze_traffic "$1"    # Call the analyze_traffic function with the positional parameter passed to main #
}
############################################################################################################################



####################################### 4. Calling main function with its arguments ######################################## 
main "$1"   # Call the main function with the positional parameter taken from the terminal (pcap file path) #
############################################################################################################################