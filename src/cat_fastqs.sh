out_dir=$1
for i in {1..22} X;
do
    chr_num="chr"$i
    cat $out_dir$chr_num"_RA.fastq">>$out_dir"all_RA.fastq"
    cat $out_dir$chr_num"_I1.fastq">>$out_dir"all_I1.fastq"
    
done


