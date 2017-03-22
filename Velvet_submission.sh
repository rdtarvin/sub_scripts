for reads in Etricolor_SC027-SC029GLS-EtriBMGL EtricolorChaBM EtricolorChaG EtricolorChaL
do
	launcher_creator.py -n ${reads}_V2551 -t 24:00:00 -q largemem -m "module load velvet; module load oases" -b "python /opt/apps/oases/0.2.08/scripts/oases_pipeline.py -m 25 -M 51 -s 23 -g 51 -d '-shortPaired -fastq -separate ../cleanreads/${reads}_R1.fastq ../cleanreads/${reads}_R2.fastq' -o Assem_${reads} -c"
done
