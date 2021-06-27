import os
import socket
##############
s = socket.socket()
host=socket.gethostname()
port=5555
s.bind((host,port))
##############
print("")
print("Server is currently running @",host)
print("")
print("Waiting for any incoming connections...")
s.listen(1)
conn, addr = s.accept()
print("")
print (addr, "Has Connected to the server successfully..")
##############
while 1:
	print("")
	command = input(str("pwd==[Enter Your Command]==>>"))
	if  command == "ls":
		conn.send(command.encode())
		print("")
		print("Done.. Waiting For Execution...")
		print("")
		files = conn.recv(7000)
		files = files.decode("utf-8")
		print("Done.. Output >> ",files)
		
	elif command == "rmdir":
		  conn.send(command.encode())
		  print("")
		  print("Done.. Waiting For Execution...")
		  print("")
		  files = conn.recv(6000)
		  files = files.decode("utf-8")
		  print("Done.. Output >> ",files)
		  
	elif command == "rm":
	      conn.send(command.encode())
	      print("")
	      print("Done.. Waiting For Execution...")
	      print("")
	      files = conn.recv(5000)
	      files = files.decode("utf-8")
	      print("Done.. Output >> ",files)
	      
	elif command == "cd":
	      conn.send(command.encode())
	      print("")
	      print("Done.. Waiting For Execution...")
	      print("")
	      files = conn.recv(4000)
	      files = files.decode("utf-8")
	      print("Done.. Output >>",files)
	      
	elif command == "pkg":
		  conn.send(command.encode())
		  print("")
		  print("Done.. Waiting For Execution...")
		  print("")
		  files = conn.recv(3000)
		  files = files.decode("utf-8")
		  print("Done.. Output >>",files)
		  
	elif command == "nano":
		conn.send(command.encode())
		print("")
		print("Done..Waiting For Execution...")
		print("")
		files = conn.recv(2000)
		files = files.decode("utf-8")
		print("Done.. Output>>",files)
