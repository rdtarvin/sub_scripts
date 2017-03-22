for reads in AbilAhuaBMGLS AfemLumGL AhahCanBMGS AkinYanL AparRNBMGLS AtalCeiBML AzapAhuGS AzapPasBMGLS CfugCanBMGLS DcapZumMGLS EantStPBMGL EbouAraBMGLS EdarMinBMGLS EmacRPBMGLS HawaOtoL HjacMolLS HmacCanBML HnexRNBML HpicCapBML HpulBaeL HverJorL InebTexBML PwniStLL 
do			
		sed s/PREFIX/${reads}/g skeleton.config > ${reads}_40.config
		launcher_creator.py -n ${reads}_40_SOAP -t 24:00:00 -q largemem -w 8 -m "module load soaptrans" -b "SOAPdenovo-Trans-127mer all -s ${reads}_40.config -o ${reads}_40_out -K 40 -p 8"
done

