import socket
sdf
server = socket.socket()
server.bind(('', 8080))
server.listen(1)

with open('/etc/python-listener/default.conf', 'r') as conf_file:
    for line in conf_file:
        if 'LOG:' in line:
            log_file_path = line.split('\'')[1]
conf_file.close()

while True:
    with open(log_file_path, 'a') as log_file:
        conn, address = server.accept()
        log_file.write('{} connected\n'.format(address))
        conn.send(str('It Works\n'))
        conn.close()
        log_file.write('{} disconnected\n'.format(address))
    log_file.close()
