set -x 
input_file=$1
out_dir=$2

for i in {1..22} X;
do
    echo $i
    chr_num=chr$i
    cp run_step1.sbatch run_step1_$i.sbatch
    echo samtools view $input_file $chr_num \> $out_dir$chr_num"_rmdup.sam" >> run_step1_$i.sbatch

    echo awk -F"'\t'" "'{print "'$1'"}'" $out_dir$chr_num"_rmdup.sam" "|sort|uniq -d|grep -F -f -" $out_dir$chr_num"_rmdup.sam" \> $out_dir$chr_num"_rmdup_paired.sam" >> run_step1_$i.sbatch

 
    sbatch run_step1_$i.sbatch
 
done


