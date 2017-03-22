#!/bin/bash
for i in $(ls *.fasta);
	do 
		FNAME=$i
		basename $i .fasta | sed s/'Trinity_'// | cat >> listBlast.txt
	done
