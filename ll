
import os
import socket
##############
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
host=socket.gethostname()
port=5555
s.bind((host,port))
