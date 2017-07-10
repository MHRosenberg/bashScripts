#!/bin/sh

for id in *.nii.gz; do
echo ${id}
fslval ${id} dim4
done

