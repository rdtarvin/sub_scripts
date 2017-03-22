#!/bin/bash
#SBATCH -J blastS_XX.YY
#SBATCH -o blastS.o%j        # output and error file name (%j expands to jobID)
#SBATCH -N 1                # number of nodes requested
#SBATCH -n 1               # total number of mpi tasks requested
#SBATCH -p normal      # queue (partition) -- normal, development, etc.
#SBATCH -t 24:00:00         # run time (hh:mm:ss) - 1.5 hours


module load blast

blastx -query $WORK/all_soapAssemblies/XX_40_out.contig -db $WORK/databases/YY -out $SCRATCH/blast_soap/XX_YY_blastx.outfmt6 -num_threads 12 -max_target_seqs 1 -evalue 1e-5 -outfmt "6 std qseqid sscinames stitle sblastnames"
