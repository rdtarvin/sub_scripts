genes=$1
missmatch=$2

mkdir ${genes}_sequences
for reads in AeleCapBML_all AfemLumGL_all AhahCanBMGS_all AkinYanL_all AparRNBMGLS_all AsylCamBL_all AtalCeiBML_all AzapAhuGS_all AzapPasBMGLS_all CentCapBML_all CfugCanBMGLS_all CgraCamBL_all DcapZumMGLS_all EantStPBMGL_all EbouAraBMGLS_all EdarMinBMGLS_all EmacRPBMGLS_all Etricolor_SC027-SC029GLS-EtriBMGL_all GrioCapBML_all HawaOtoL_all HjacMolLS_all HlepCamBL_all HmacCanBML_all HnexRNBML_all HpicCapBML_all HpulBaeL_all HverJorL_all InebTexBML_all PwniStLL_all  BbombinaL_ERR632222  BorientalisL_ERR632225  BvariegataL_ERR632223-ERR632224   NviridescensBHs_SRR653283-SRR653292-SRR653294 AcarolinensisB_SRR579556 Pnigomaculata_gonad_SRR1269553 HretardatusB_DRR016729-DRR016731 RpipiensBKgL_all PlessonaeHT_SRR1171014-SRR1164893 Azeteki_GS_SRR957178-SRR957179-SRR957174 Rclamitans_SRR493674
do
	## get the correct directory name
	if [ ${reads} == PlessonaeHT_SRR1171014-SRR1164893 ]; then 	
		kbait=31
		dir=${reads}_${genes}_interleaved_k${kbait}_m${missmatch}
	elif [ ${reads} == Azeteki_GS_SRR957178-SRR957179-SRR957174 ]; then
		kbait=45
		dir=${reads}_${genes}_k${kbait}_m${missmatch}
	elif [ ${reads} == Rclamitans_SRR493674 ]; then
		kbait=31
		dir=${reads}_${genes}_k${kbait}_m${missmatch}
	else
		kbait=45
		dir=${reads}_${genes}_interleaved_k${kbait}_m${missmatch}
	fi

	## figure out what the highest iteration of the program was
	iter=$(ls $dir/ | grep iter | tail -1)
	python $HOME/sequence-manipulation/rename_mitobim_output.py $dir/${iter}/${reads}-${genes}_assembly/${reads}-${genes}_d_results/${reads}-${genes}_out_${reads}.unpadded.fasta $iter $reads
	cp $dir/${iter}/${reads}-${genes}_assembly/${reads}-${genes}_d_results/${reads}-${genes}_out_${reads}.unpadded.renamed.fasta  ${genes}_sequences/
	sed -i s/[Xx]/'-'/g ${genes}_sequences/${reads}-${genes}_out_${reads}.unpadded.renamed.fasta

done
