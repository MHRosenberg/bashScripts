#display 1st levels
#set p = "/space/raid6/data/monti/Analysis/ShortTermMemory/1stLevelAnalysis"
#foreach tr (150TRs 160TRs)
#foreach i ( `ls ${p}/${tr}/*.feat -d` )
#set s = `echo $i | cut -d"_" -f1`
#set visit = `echo $i | cut -d"_" -f2`
#set scan = `echo $i | cut -d"_" -f3`
#echo $i
#echo $s $visit $scan
#fslview ${i}/rendered_thresh_zstat1.nii.gz
#end
#end
cd /space/raid6/data/monti/Analysis/ShortTermMemory
foreach i ( `ls *New1stLevelAnalysis.feat -d` )
echo $i
fslview ${i}/filtered_func_data.nii.gz ${i}/thresh_zstat1.nii.gz -l "Blue-Lightblue" ${i}/thresh_zstat2.nii.gz -l "Red-Yellow"
end
