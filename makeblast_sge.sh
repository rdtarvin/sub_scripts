#!/bin/bash
echo "Hello."
##this line makes a list of file names, stripping the endings
#for i in $(ls *.fasta);
#	do 
#		FNAME=$i
#		LNAME=`expr length $FNAME`
#		if [ "$LNAME" -eq 21 ]; then
#			basename $i .fasta | rev | cut -c 1-7 | rev | cat >> listBlast.txt
#		elif [ "$LNAME" -eq 23 ]; then
#			basename $i .fasta | rev | cut -c 1-9 | rev | cat >> listBlast.txt
#		else
#			basename $i .fasta | rev | cut -c 1-8 | rev | cat >> listBlast.txt
#		fi
#	done

##this line executes this script for all files in that file line
#for i in $(cat listBlast.txt); do master.sh master_BLASTX.sh $i uniprot; done
#for i in $(cat listBlast.txt); do master.sh master_BLASTX.sh $i amphibia; done
#for i in $(cat listBlast.txt); do master.sh master_BLASTX.sh $i channel; done

##this file is meant to create blastx scripts 
INFILES=$1
NAME=$2
DATABASE=$3
for i in $INFILES;
	do  
		cat $i | sed -e s/XX/$NAME/g -e s/YY/$DATABASE/g | cat >> $SCRATCH/blast_soap/$NAME.$DATABASE.slurm
	done
