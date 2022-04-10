import os
from pathlib import Path


bash_command = ["cd ~/PycharmProjects/DevOps-HomeWork", "git status"]
# bash_command = ["cd ~/netology/sysadm-homeworks", "git status"]
result_os = os.popen(' && '.join(bash_command)).read()
is_change = False
for result in result_os.split('\n'):
    if result.find('modified') != -1:
        prepare_result = Path(result.replace('\tmodified:   ', '')).absolute()
        print(prepare_result)
