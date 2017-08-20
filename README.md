## Dependencies:
ExtractXX utilizes <a href="https://www.python.org/downloads/">Python3</a>, <a href="http://bio-bwa.sourceforge.net/">BWA</a>, <a href="http://samtools.sourceforge.net/">SAMtools</a>. To be able to execute the above programs by typing their name on the command line, the program executables must be in one of the directories listed in the PATH environment variable.


click <a href="http://xinzhouneuroscience.org/wp-content/uploads/2017/08/barcode4M.fa.zip">barcode4M.fa</a> to download
or 
```
wget http://xinzhouneuroscience.org/wp-content/uploads/2017/08/barcode4M.fa
```

## Running The Code:
### Step1:

```
python ExtractXX_step1.py -i ../../S_12878_barcoded_sorted_rmdup_bybarcode.bam --out_dir ../../extract_fastqs/ 
```
```
usage: ExtractXX_step1.py [-h] [--input_file INPUT_FILE] [--out_dir OUT_DIR]

Run 10x Extract -- step1

optional arguments:
  -h, --help            show this help message and exit
  --input_file INPUT_FILE, -i INPUT_FILE
                        input bam file
  --out_dir OUT_DIR, -o_dir OUT_DIR
                        Directory to store outputs
```
### Step2:

```
python ExtractXX_step2.py -f1 ../../S12878_RA.fastq -f2 ../../S12878_I1.fastq -b ../doc/barcode4M.fa --out_dir ../../extract_fastqs/ --h5_dir ../../qual_20/ --Cr 0.19 
```
Or use flag "all" to extract all fastqs files
```
python ExtractXX_step2.py -f1 ../../S12878_RA.fastq -f2 ../../S12878_I1.fastq -b ../doc/barcode4M.fa --out_dir ../../extract_fastqs/ --h5_dir ../../qual_20/ --Cr 0.19 --flag all
```
```
usage: ExtractXX_step2.py [-h] [--out_dir OUT_DIR] [--h5_dir H5_DIR]
                          [--barcode_whitelist BARCODE_WHITELIST] [--Cr CR]
                          [--fastq_RA FASTQ_RA] [--fastq_I1 FASTQ_I1]
                          [--flag FLAG]

Run 10x Extract -- step2

optional arguments:
  -h, --help            show this help message and exit
  --out_dir OUT_DIR, -o_dir OUT_DIR
                        Directory to store outputs
  --h5_dir H5_DIR, -h5_dir H5_DIR
                        Directory for storing h5 files of molecules
  --barcode_whitelist BARCODE_WHITELIST, -b BARCODE_WHITELIST
                        Barcode white list
  --Cr CR, -c CR        Read coverage per molecule
  --fastq_RA FASTQ_RA, -f1 FASTQ_RA
                        origin fastq reads file
  --fastq_I1 FASTQ_I1, -f2 FASTQ_I1
                        origin fastq index file
  --flag FLAG, -flag FLAG
                        all or subset

```
### Step3:

```
python ExtractXX_step3.py --out_dir ../../extract_fastqs/
```
```
usage: ExtractXX_step3.py [-h] [--out_dir OUT_DIR]

Run 10x Extract -- step 3: concatenate all fastqs files

optional arguments:
  -h, --help            show this help message and exit
  --out_dir OUT_DIR, -o OUT_DIR
                        Directory to store output
```
