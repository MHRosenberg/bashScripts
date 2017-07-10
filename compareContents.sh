#!/bin/sh

cd /space/raid6/data/monti/Analysis/ShortTermMemory/GroupAnalysis/Masks
for id in *.nii.gz;       #foreach in tcsh
do 
   
  matt=`fslstats ${id} -R`
  echo ${id} ${matt}  
done  #end in tcsh

cd /space/raid6/data/monti/Analysis/ShortTermMemory/GroupAnalysis/backUpMasks/Masks
for id in *.nii.gz;       #foreach in tcsh
do 
   
  matt=`fslstats ${id} -R`
  echo ${id} ${matt}  
done  #end in tcsh
