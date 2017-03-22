for molecule in BTX HTX TTX PTXa PTXb PTXd TTX
do
	for model in D1-V D1-A D3-A D4-T D4-I D1-D D1-E D2p-I Pterribilis Dcaptivus73 Dtinctorius73 Aparvula73 Abilinguis73 Dcaptivus Dtinctorius Aparvula Sflotator Aelegans AelegansEx Walker1
	do
		for trial in 1 2 3
		do
			DATA=${molecule}_${model}_${trial}_10000
			sed -e s/RECEPTOR/${model}/ -e s/LIGAND/${molecule}/g -e s/OUTFILE/${DATA}.pdbqt/ skeleton_conf.txt > ${DATA}_conf.txt
			launcher_creator.py -n $DATA -t 10:00:00 -b "vina --config ${DATA}_conf.txt --log ${DATA}_log.txt" -q normal -a Dendrobatidae -m "module load intel/11.1; module load boost; module load autodock_vina" -w 1
		done
	done
done
