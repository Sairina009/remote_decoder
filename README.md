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
       cd /OSD_SOURCE_CODE/install
       vi mysql_setup.sh
       sudo mysql -u root -p kvm < /path/to/kvm.sql                                                      (Replace /path/to/kvm.sql with the actual path)
       save the file.

    2. Check the path of OSD_SOURCE_CODE folder:
       Update the path of the OSD_SOURCE_CODE folder in the php_setup.sh file loacted in the install folder.
       cd /OSD_SOURCE_CODE/install
       vi php_setup.sh 
       sudo cp -r /path/to/OSD_SOURCE_CODE/* /var/www/html/od                                            (change the path of OSD_SOURCE_CODE in this line)
       Save the file.
       
    3. Check the path of config file:
       Update the path of the config file in the update_nginx_config.sh file loacted in the install folder.
       cd KVM_DECODER/LINUX_PACKAGE_INSTALLER/rtsp-stream/config/                                        (this is the path of the Remote decoder application created)
       pwd                                                                                               (Take this path)
       cd /OSD_SOURCE_CODE/install
       vi update_nginx_config.sh
       location /home/user/Desktop/LINUX_PACKAGE_INSTALLER/rtsp-stream/config/default.json {              (change the path of config file in this line)
       Configuration for serving default.json                                                                  
       alias /home/user/Desktop/LINUX_PACKAGE_INSTALLER/rtsp-stream/config/default.json;                  (change the path of config file in this line)
    }                                                                                                      
       Save the file.
       
    4. Make the file executable:
       chmod +x setup.sh
       Run this script: While running it will ask for password enter system's password.
       ./setup.sh

    5. Change path in od folder:
       cd /var/www/html/od
       vi user.php 
       updateDefaultJson(ip_address, '/home/user/Desktop/LINUX_PACKAGE_INSTALLER/rtsp-stream/config/default.json', id, decoder_id, path, decoder_ip);              (line 159 change with the path from above step 3 line number 30)
       cd /var/www/html/od/cache
       vi user.php.cache
       updateDefaultJson(ip_address, '/home/user/Desktop/LINUX_PACKAGE_INSTALLER/rtsp-stream/config/default.json', id, decoder_id, path, decoder_ip);              (line 245 change with the path from above step 3 line number 30)                                                                              
       cd /var/www/html/od
       vi index.html 
       (ws://127.0.0.1:9999)                                                    (Line number 35 and 36: Change the ip address with your board ip address eg. ws://192.168.1.115:9999))

1. **Access PHP Pages:**
   Open a web browser and navigate to your Board IP address and specify /od.
   (eg. 192.168.1.115/od/index.php)   where 192.168.1.115 is your board ip address.


2. **Login as Admin:** Currently only 4 users are available and their credentials are listed below. You can login into OSD using them.
   On the Login page enter login credentials as:
    - Username: Admin
    - Password: Admin@123

    - Username: User2
    - Password: User2@12345

    - Username: User3
    - Password: User3@12345

    - Username: User4
    - Password: User4@12345

3. **OSD pages will display on the browser**

4. **Make changes on OSD:**  Currently Encoder1 is set to be viewed on the OSD.
    1. To access the video stream from Encoder1 you can navigate through:
    Port Access-> Encoder1 -> Click on Connect button.

**Working modules on OSD:**
  
   1. Streaming of Audio and video on OSD.
   2. At a time 3 decoders can view 1 Encoder.
      
**Known Issues:**
   
   1. Delay in video streaming.

**Troubleshooting:**
- Ensure that file permissions are set correctly on the PHP files and directories.
- Verify that Nginx, MySQL, and PHP-FPM are all running and configured correctly.
