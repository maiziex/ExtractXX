set -x 
out_dir=$1
barcode_whitelist=$2
h5_dir=$3
Cr=$4
raw_fastq_RA=$5
raw_fastq_I1=$6
flag="all"
used_flag=$7

for i in {1..22} X;
do
    echo $i
    chr_num=chr$i
    cp run_step2.sbatch run_step2_$i.sbatch

    echo python create_barcode_fastq_for_sam.py $out_dir$chr_num"_rmdup_paired.sam" $out_dir$chr_num"_rmdup_paired_barcode.fastq" >> run_step2_$i.sbatch

    echo bwa mem -t 32 -k 5 -T 1 $barcode_whitelist -p $out_dir$chr_num"_rmdup_paired_barcode.fastq" \> $out_dir$chr_num"_rmdup_paired_barcode.sam" >> run_step2_$i.sbatch

    echo python write_sam_by_barcodematch_dict_and_correctbarcode.py $barcode_whitelist $out_dir$chr_num"_rmdup_paired_barcode.sam" $out_dir$chr_num"_rmdup_paired.sam" $out_dir$chr_num"_rmdup_paired_correctbarcode.sam" >> run_step2_$i.sbatch
    
    if [ $used_flag == $flag ]
    then
        echo python Extract_final_qname_byall.py $h5_dir$chr_num"_cb.h5" $out_dir$chr_num"_rmdup_paired_correctbarcode.sam" $out_dir$chr_num"_final_qname.txt" $out_dir$chr_num"_qname_barcode_dict.p" $Cr >> run_step2_$i.sbatch
    else
        echo python Extract_final_qname.py $h5_dir$chr_num"_cb.h5" $out_dir$chr_num"_rmdup_paired_correctbarcode.sam" $out_dir$chr_num"_final_qname.txt" $out_dir$chr_num"_qname_barcode_dict.p" $Cr >> run_step2_$i.sbatch
    fi

    echo python Extract_final_fastq_reads_RA.py $out_dir$chr_num"_qname_barcode_dict.p" $raw_fastq_RA $out_dir$chr_num"_RA.fastq" >>run_step2_$i.sbatch

    echo python Extract_final_fastq_reads_I1.py $out_dir$chr_num"_qname_barcode_dict.p" $raw_fastq_I1 $out_dir$chr_num"_I1.fastq" >>run_step2_$i.sbatch

 
    sbatch run_step2_$i.sbatch
 
done


