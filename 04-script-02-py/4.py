import socket
import time


servers = {'drive.google.com': '0.0.0.0',
           'mail.google.com': '0.0.0.0',
           'google.com': '0.0.0.0'
           }

n = 1
max_n = 50

while n <= max_n:
    print(f'n = {n} of {max_n}')

    for host in servers.keys():
        ip_host = socket.gethostbyname(host)

        if n == 1:
            servers[host] = ip_host
            print(f'{host} - {ip_host}')
        elif ip_host != servers[host]:
            print('****************')
            print(f'[ERROR] {host} IP mismatch: {servers[host]} {ip_host}')

            servers[host] = ip_host
        else:

            print(f'{host} - {ip_host}')
    n += 1
    print('')

    time.sleep(1)
