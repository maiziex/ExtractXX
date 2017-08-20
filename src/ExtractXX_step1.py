import sys
import os

from argparse import ArgumentParser

parser = ArgumentParser(description="Run 10x Extract -- step1")
parser.add_argument('--input_file','-i', help="input bam file")
parser.add_argument('--out_dir','-o_dir', help="Directory to store outputs", default='./temp_extact/')

args = parser.parse_args()

if __name__ == "__main__":
    if len(sys.argv) == 1:
        os.system("python ExtractXX_step1.py -h")
    else:
        if not os.path.exists(args.out_dir):
            os.system("mkdir " + args.out_dir)

        command_1 = "./ExtractXX_step1.sh "  + args.input_file  + " " + args.out_dir 
        os.system(command_1)

        






