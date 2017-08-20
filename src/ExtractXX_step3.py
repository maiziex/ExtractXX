import sys
import os

from argparse import ArgumentParser

parser = ArgumentParser(description="Run 10x Extract -- step 3: concatenate all fastqs files ")
parser.add_argument('--out_dir','-o', help="Directory to store output", default='./extract_temp/')

args = parser.parse_args()

if __name__ == "__main__":
    if len(sys.argv) == 1:
        os.system("python ExtractXX_step3.py -h")
    else:
        if not os.path.exists(args.h5_dir):
            os.system("mkdir " + args.h5_dir)
        
        command_1 = "./cat_fastqs.sh "  + " " + args.out_dir 
        os.system(command_1)

        






