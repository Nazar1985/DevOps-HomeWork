import socket
import time
import json
import yaml

servers = {"drive.google.com": "0.0.0.0",
           "mail.google.com": "0.0.0.0",
           "google.com": "0.0.0.0"
           }

n = 1
max_n = 50

while n <= max_n:
    print(f'n = {n} of {max_n}')
    data_js = []
    data_yaml = []
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

        data_js.append({host: ip_host})
        serv_data_json = json.dumps(data_js)
        with open(f'data.json', 'w') as f_js:
            json.dump(serv_data_json, f_js)

        data_yaml.append({host: ip_host})
        serv_data_yaml = yaml.dump(data_yaml)
        with open(f'data.yaml', 'w') as f_y:
            yaml.dump(serv_data_yaml, f_y)

    n += 1
    print('')

    time.sleep(3)
