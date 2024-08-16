# OSD Pages Installation Guide

## Overview
This guide will help you set up PHP pages on your server with Nginx, MySQL, and PHP.

## Requirements
- Nginx
- MySQL Database Server
- PHP-FPM
- PHP

1. **Installation Steps:**
    1. Extract the OSD_SOURCE_CODE folder and go to DATABASE folder and check it's path:
        Update the path of the DATABASE folder in the mysql_setup.sh file loacted in the install folder.
       $ cd /OSD_SOURCE_CODE/install
       $ vi mysql_setup.sh
       $ sudo mysql -u root -p kvm < /path/to/kvm.sql             ------- (Replace /path/to/kvm.sql with the actual path)
        save the file.

    2. Check the path of OSD_SOURCE_CODE folder:
        Update the path of the OSD_SOURCE_CODE folder in the php_setup.sh file loacted in the install folder.
       $ cd /OSD_SOURCE_CODE/install
       $ vi php_setup.sh 
       $ sudo cp -r /path/to/OSD_SOURCE_CODE/* /var/www/html/od        -----(change the path of OSD_SOURCE_CODE in this line)
        Save the file.
        
    3. Check the path of config file:
         Update the path of the config file in the update_nginx_config.sh file loacted in the install folder.
        $ cd KVM_DECODER/LINUX_PACKAGE_INSTALLER/rtsp-stream/config/                                                      ------------(this is the path of the Remote decoder application created)
        $ pwd                                                                                                (Take this path)
        $ cd /OSD_SOURCE_CODE/install
        $ vi update_nginx_config.sh
         location /home/user/Desktop/LINUX_PACKAGE_INSTALLER/rtsp-stream/config/default.json {                  -----(change the path of config file in this line)
        # Configuration for serving default.json                                                                  
        alias /home/user/Desktop/LINUX_PACKAGE_INSTALLER/rtsp-stream/config/default.json;                     -----(change the path of config file in this line)
    }                                                                                                      
        Save the file.

    4. Update the path of the config file in the user.php file loacted in the od folder on line number 159.
        cd KVM_DECODER/LINUX_PACKAGE_INSTALLER/rtsp-stream/config/                                                      ------------(this is the path of the Remote decoder application created)
        $ pwd                                                                                                (Take this path)
        $ cd /var/www/html/od
        $ vi user.php
         updateDefaultJson(ip_address, '/home/user/Desktop/LINUX_PACKAGE_INSTALLER/rtsp-stream/config/default.json', id, decoder_id, path, decoder_ip);  change the path of config file from above line.                                                                                 ---------(/home/user/Desktop/LINUX_PACKAGE_INSTALLER/rtsp-stream/config/   in place of this change the above path)

    5. Update the file index.html from od folder.
        $ cd /var/www/html/od
        $ vi index.html                                                                                         --------(on line numbers:117 and 136 change the ip address with your switch ip address.)
        Update this part (ws://192.168.1.120:9999) in place of 192.168.1.120 add your switch ip address.

    6. Make the file executable:
       $ chmod +x setup.sh
        Run this script: While running it will ask for password enter system's password.
        ./setup.sh

1. **Access PHP Pages:**
   Open a web browser and navigate to your Board IP address and specify /od.
   (eg. 192.168.1.115/od/index.php)   where 192.168.1.115 is your board ip address.

2. **Login as Admin:** Currently only 2 uers are available and their credentials are listed below. You can login into OSD using them.
   On the Login page enter login credentials as:
    - Username: Admin
    - Password: Admin@123
    - Now you will be able to access the OSD pages and navigate through different tabs and make changes accordingly.

   On the Login page enter login credentials as:
    - Username: User2
    - Password: User2@12345
    - Now you will be able to access the OSD pages and navigate through different tabs and make changes accordingly.

3. **OSD pages will display on the browser**

4. **Make changes on OSD:**  Currently Encoder1 is set to be viewed on the OSD and Encoder2 is set to be viewed on Local Decoder.
    1. To access the video stream from Encoder1 you can navigate through:
    Port Access-> Encoder1 -> Click on Connect button.

**Working modules on OSD:**
  
   1. Able to view Video stream on OSD.
   2. Mouse and Keyboard functionality working on OSD.
   3. Able Update Username and Enable or Disable user.
      
**Known Issues:**
   
   1. Delay in video streaming.
   2. Port Setting, Kvm setting, Maintainance and Help tabs are disabled. Currently these tabs won't be accessible.

**Troubleshooting:**
- Ensure that file permissions are set correctly on the PHP files and directories.
- Verify that Nginx, MySQL, and PHP-FPM are all running and configured correctly.
