import os
import sys
from pathlib import Path


my_path = sys.argv[1] if len(sys.argv) > 1 else os.path.abspath(os.curdir)
if os.path.isdir(f'{my_path}/.git'):
    bash_command = [f"cd {my_path}", "git status"]
    result_os = os.popen(' && '.join(bash_command)).read()
    is_change = False
    for result in result_os.split('\n'):
        if result.find('modified') != -1:
            prepare_result = Path(result.replace('\tmodified:   ', '')).absolute()
            print(prepare_result)
else:
    print("not a git repository (or any of the parent directories): .git")
