for trans in AbilAhuaBMGLS AfemLumGL AhahCanBMGS AkinYanL AparRNBMGLS AtalCeiBML AzapAhuGS AzapPasBMGLS CfugCanBMGLS DcapZumMGLS EantStPBMGL EbouAraBMGLS EdarMinBMGLS EmacRPBMGLS HawaOtoL HjacMolLS HmacCanBML HnexRNBML HpicCapBML HpulBaeL HverJorL InebTexBML PwniStLL
do
	launcher_creator.py -n ${trans}_SOAP40_uniprot -t 24:00:00 -q normal -w 12 -m "module load blast" -b "blastx -query /scratch/02576/rdtarvin/soap2/whole_trans_soaps/${trans}_40_out.contig -db /scratch/02576/rdtarvin/databases/uniprot_Feb2015 -out ${trans}_SOAP40_uniprot_blastx.outfmt6 -num_threads 12 -max_target_seqs 1 -evalue 1e-5 -outfmt '6 std qseqid sscinames stitle sblastnames'"
done
