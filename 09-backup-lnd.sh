#!/bin/bash
  
DT=`date +"%Y%m%d_%I%M%S"`
FOUT='~/backup/lnd-'$DT'.bak'
lncli exportchanbackup --all --output_file $FOUT
lncli verifychanbackup --multi_file $FOUT
