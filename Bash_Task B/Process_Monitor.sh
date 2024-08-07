#! /usr/bin/bash -i

############################################## 1. script information ######################################################
# Description: Create a Bash script that serves as a simple process monitor, allowing users to view, manage, and analyze 
#              running processes on a Unix-like system, using an iteractive mode.
# Input: The selected option from the menue. 
# Output: According to the option selected we take different action.
# Auther: Reem Mohy
############################################################################################################################



################################# 2. Source file & Global variables & Function decleration #################################

# Source the configuration file and check if it exist or not.
CONFIG_FILE="Process_Monitor.conf"

if [[ -f "$CONFIG_FILE" ]]; then
    source "${CONFIG_FILE}"
else
    echo "Error: Configuration file not found."
    exit 1
fi

# Set a default values only used if the config varaible is
UPDATE_INTERVAL=${UPDATE_INTERVAL:-5}
CPU_ALERT_THRESHOLD=${CPU_ALERT_THRESHOLD:-90}
MEMORY_ALERT_THRESHOLD=${MEMORY_ALERT_THRESHOLD:-80}

#----------------------------------------------------------------------------------------------------------------------------#
# Function that list all the running process showing iths ID, name, CPU and memory usage
function ListRunningProcesses () { 

    ps -eo pid,comm,%cpu,%mem   # To see all processes with a user-defined format.
}
#----------------------------------------------------------------------------------------------------------------------------#
# Function that provide information about a specific process.
function ProcessInfo () {

    declare PROCESSNAME=$1   

    # Aceses a specific process from its name with a user-defined format.    
    ps -C "${PROCESSNAME}" -o pid,ppid,user,%cpu,%mem,etime,cmd  
}
#----------------------------------------------------------------------------------------------------------------------------#
# Function that allow the user to kill a specific process through its PID
function KillProcess () {
     
    declare PROCESSPID=$1  
    (kill "${PROCESSPID}" && echo "The process with PID ${PROCESSPID} is killed") || (echo "Invalid PID" ; exit 1)
}
#----------------------------------------------------------------------------------------------------------------------------#
# Function that print the statistics of all processes in the system
function ProcessStatistics () {

    echo "----------------------- Number of Processes ------------------------"
    echo "Total number of processes : $(ps -e | wc -l)"    # Count all lines resulted from ps command

    echo "-------------------------- Memory usage ----------------------------"
    free -h | awk '/Mem/{print "Memory usage: "$3"/"$2}'

    echo "---------------------------- CPU Load ------------------------------"
    # Run top command in batch mode (-b) to enable pipeline its output and update once (-n1).
    # awk command is a text processing that calculate and print the total cpu load of the system without the idle time. 
    top -bn1 | grep "Cpu(s)" | awk '{print "CPU Load: " 100 - $8 "%"}'
}
#----------------------------------------------------------------------------------------------------------------------------#
# Function that monitor the processes in real time that update every certain seconds like top command
function RealTimeMonitor () {
    
    while true; do
        clear
        ListRunningProcesses ""
        sleep "${UPDATE_INTERVAL}"
    done
}
#----------------------------------------------------------------------------------------------------------------------------#
# Function that give alerts if the process exceed some threshold. 
function ResourceUsageAlert () {

   ps aux | awk -v cpu_threshold="${CPU_ALERT_THRESHOLD}" -v mem_threshold="${MEMORY_ALERT_THRESHOLD}" '
    NR > 1 {
        if ($3 > cpu_threshold) {
            print "Alert: Process "$11" (PID: "$2") is using more than "cpu_threshold"% CPU."
        }
        if ($4 > mem_threshold) {
            print "Alert: Process "$11" (PID: "$2") is using more than "mem_threshold"% memory."
        }
    }'
}
############################################################################################################################


########################################### 3. Main function (Script logic) ################################################

# Function that contain the script logic.
function main () {

    declare PROCESSNAME
    declare PROCESSPID

    select option in "List all running processes" "Get process information" "Kill process" "Print process statistics" "Real time monitor" "Resource usage alert" "Quit"; do
        case "${REPLY}" in
            1)
                ListRunningProcesses ""
            ;;
            2)
                read -p "Enter the required process name: " PROCESSNAME
                ProcessInfo "${PROCESSNAME}"
            ;;
            3)
                read -p "Enter the required process PID: " PROCESSPID
                KillProcess "${PROCESSPID}"
            ;;
            4)
                ProcessStatistics ""
            ;;
            5)
                RealTimeMonitor ""
            ;;
            6)
                ResourceUsageAlert ""
            ;;
            7)
                echo "Good Bye :)"
                exit 0
            ;;
            *)
                echo "Error: Invalid option."
                exit 1
            ;;
        esac
    done 
}
############################################################################################################################


####################################### 4. Calling main function with its arguments ######################################## 
main ""
############################################################################################################################