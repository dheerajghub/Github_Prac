import os
import argparse
parser = argparse.ArgumentParser()
parser.add_argument('--msg', required=True)
args = parser.parse_args() 
os.system("git add .")
os.system('git commit -m "'+args.msg+'"')
os.system("git push -u origin master")