#!/bin/sh

cd /space/raid6/data/monti/Analysis/VertexAnalysis/verified/unsorted_images/

for id in 10543_20080410 13926_20080123 14108_20080401 14108_20080402 14140_20080415 14184_20080429 14184_20080430 14216_20080514 14274_20080715 16223_20081014 16223_20081015 16259_20081029 16259_20081030 16478_20081125 16656_20090217 16656_20090218 16678_20090310 16678_20100427 16678_20101019 16761_20090421 16761_20090422 16761_20101201 17570_20090609 17570_20100721 17570_20101102 17611_20090623 17654_20090714 17654_20090716 17680_20090721 17680_20101006 17819_20091014 17853_20091027 17972_20100113 18068_20100209 18141_20100223 18141_20100921 18141_20100922 18195_20100309 18195_20100803 18195_20100804 18794_20100908 19046_20101117; do

cp *${id}*.nii.gz /space/raid6/data/monti/Analysis/ShortTermMemory/wholehead2/
done