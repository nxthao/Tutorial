from ftplib import FTP
import ftplib
import io
from io import BytesIO     # for handling byte strings

try:
    ftp_file_is_uploaded = False
    ftp_is_connected = False
    ftp = ftplib.FTP("Url")
    # connect to FTP server
    ftp.login("user", "Password")
    ftp_is_connected = True
    ftp.cwd("/tmp")
    ftp_cmd = 'STOR ' + "data.txt"
    # open a RAM buffer for file
    ftp_data ="Legato"
    file_obj = io.BytesIO(ftp_data.encode('utf-8'))
    # upload a binary file
    ftp.storbinary(ftp_cmd, file_obj)
    file_obj.close()
    ftp_file_is_uploaded = True
except ftplib.all_errors as resp:
    if verbose:
        print("FTP error :", resp)
if ftp_is_connected:
    ftp.quit()
if not ftp_file_is_uploaded:
    if verbose:
        print("\nPROBLEM: FTP server does not have the file data.txt uploaded.\n")