# this script should be run like `bash run_mitobim.sh <gene prefix (str)> <missmatch number (int)> <run time (hr, 00)>`
genes=$1
missmatch=$2
hours=$3

if [ -a /work/02576/rdtarvin/lonestar/gene_dbs/${genes}.fa ]; then
	echo "Great, /work/02576/rdtarvin/lonestar/gene_dbs/${genes}.fa exists!"
else
	echo "Try again, you should use a genes prefix that exists. /work/02576/rdtarvin/lonestar/gene_dbs/${genes}.fa is not a file."
	exit 1
fi

for reads in AeleCapBML_all AfemLumGL_all AhahCanBMGS_all AkinYanL_all AparRNBMGLS_all AsylCamBL_all AtalCeiBML_all AzapAhuGS_all AzapPasBMGLS_all CentCapBML_all CfugCanBMGLS_all CgraCamBL_all DcapZumMGLS_all EantStPBMGL_all EbouAraBMGLS_all EdarMinBMGLS_all EmacRPBMGLS_all Etricolor_SC027-SC029GLS-EtriBMGL_all GrioCapBML_all HawaOtoL_all HjacMolLS_all HlepCamBL_all HmacCanBML_all HnexRNBML_all HpicCapBML_all HpulBaeL_all HverJorL_all InebTexBML_all PwniStLL_all BbombinaL_ERR632222  BorientalisL_ERR632225  BvariegataL_ERR632223-ERR632224   NviridescensBHs_SRR653283-SRR653292-SRR653294 AcarolinensisB_SRR579556 Pnigomaculata_gonad_SRR1269553 HretardatusB_DRR016729-DRR016731 RpipiensBKgL_all PlessonaeHT_SRR1171014-SRR1164893 Azeteki_GS_SRR957178-SRR957179-SRR957174 Rclamitans_SRR493674
do
	## get the correct directory name
	if [ ${reads} == PlessonaeHT_SRR1171014-SRR1164893 ]; then 	
		kbait=31
		dir=${reads}_${genes}_interleaved_k${kbait}_m${missmatch}
		prefix=${reads}_interleaved
	elif [ ${reads} == Azeteki_GS_SRR957178-SRR957179-SRR957174 ]; then
		kbait=45
		dir=${reads}_${genes}_k${kbait}_m${missmatch}
		prefix=${reads}
	elif [ ${reads} == Rclamitans_SRR493674 ]; then
		kbait=31
		dir=${reads}_${genes}_k${kbait}_m${missmatch}
		prefix=${reads}
	else
		kbait=45
		dir=${reads}_${genes}_interleaved_k${kbait}_m${missmatch}
		prefix=${reads}_interleaved
	fi
	
	mkdir $dir
	cd $dir
	if [ -a /scratch/02576/rdtarvin/dendrobatidae/${prefix}.fastq ]; then
		launcher_creator.py -n ${genes}_${reads}_mitobim -q normal -t ${hours}:00:00 -b "/work/02576/rdtarvin/lonestar/MITObim/MITObim_1.8.pl --mirapath /work/02576/rdtarvin/lonestar/mira/bin/ -end 100 --verbose -sample ${reads} -ref ${genes} -readpool /scratch/02576/rdtarvin/dendrobatidae/${prefix}.fastq --clean -kbait ${kbait} --missmatch ${missmatch} --quick $WORK/gene_dbs/${genes}.fa"
		echo "##### making submission script for ${reads} using ${genes} genes with kbait of ${kbait} and missmatch parameter of ${missmatch} for ${hours}"
	else 
		launcher_creator.py -n ${genes}_${reads}_mitobim -q normal -t ${hours}:00:00 -b "/work/02576/rdtarvin/lonestar/MITObim/MITObim_1.8.pl --mirapath /work/02576/rdtarvin/lonestar/mira/bin/ -end 100 --verbose -sample ${reads} -ref ${genes} -readpool /scratch/02576/rdtarvin/outgroups/${prefix}.fastq --clean -kbait ${kbait} --missmatch ${missmatch} --quick $WORK/gene_dbs/${genes}.fa"
		echo "##### making submission script for ${reads} using ${genes} genes with kbait of ${kbait} and missmatch parameter of ${missmatch} for ${hours}"	
	fi
	sbatch ${genes}_${reads}_mitobim.slurm
	cd ..
done
