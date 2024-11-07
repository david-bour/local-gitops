import subprocess
import time

while True:
    subprocess.run("argocd app sync app-root", shell=True, check=True)
    time.sleep(10)
