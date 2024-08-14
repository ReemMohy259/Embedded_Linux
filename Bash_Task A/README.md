# 🚀 Bash Script Task A
## 🔍 Overview:
- This task is required to organize files in a directory based on the file type.
- The script take the required directory path as an argument.
- Itterate over all files inside it and get the file extention.
- The script create a subdirectory and move the file to it.
## 🌟 Script Functions:
1. **GetExtention**
   - It take the file as an argument and extract its extention.
2. **Move2txt**
   - If the file extention is .txt we call this function that create a txt subdirectory if not already exist then move this file to it. 
3. **Move2jpg**
   - If the file extention is .jpg we call this function that create a jpg subdirectory if not already exist then move this file to it. 
4. **Move2pdf**
   - If the file extention is .pdf we call this function that create a pdf subdirectory if not already exist then move file to it. 
5. **Move2misc**
   - For any other cases like no extention or unkown extention and hidden files we call this function that create a misc subdirectory if not already exist then move this file to it. 
6. **main**
   - Function that contain the script logic.
## 📁 Screenshot from the directory after organization using this script:
![Screenshot 2024-08-07 190909](https://github.com/user-attachments/assets/63fa7ac0-474e-4efe-95fd-1a551746319a)

## 💻 Run The Script:

   ```bash
   chmod +x File_Organizer.sh
   ./File_Organizer.sh
