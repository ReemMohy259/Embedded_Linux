# 🚀 Bash Script Task B
## 🔍 Overview:
- This task is required to monitor processes.
- The script use interactive mode and the user choose the required operation needed from a menue.
## 🌟 Script Functions:
1. **ListRunningProcesses**
   - Lists all the running processes in the system.
2. **ProcessInfo**
   -It takes the process name as an argument and show some information about it. 
3. **KillProcess** 
   -It takes the process ID as an argument and kill it.
4. **ProcessStatistics**
   -It show the statistics of all running processes.
5. **RealTimeMonitor**
   - It monitor the processes in real time that update every certain seconds like top command.
6. **ResourceUsageAlert**
   - It give alert to user if the process exceed resource threshold. 
7. **main**
   - Function that contain the script logic.
## 🛠️ Configuration Options:
-  **Configuration File**:
  - Fine-tune the script by editing a configuration file. 
  - Set the update time interval for real-time monitoring.
  - Define alert thresholds for CPU and memory usage.

## 💻 Run The Script:

   ```bash
   chmod +x Process_Monitor.sh
   ./Process_Monitor.sh
