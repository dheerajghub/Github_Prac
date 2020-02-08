import os
import argparse
parser = argparse.ArgumentParser()
parser.add_argument('-m', '--msg', 
    help="shows output")
args = parser.parse_args() 
os.system("git add .")
os.system('git commit -m "'+args.msg+'"')
os.system("git push -u origin master")