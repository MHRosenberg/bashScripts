#!/bin/bash
#Dicom Header Reader

cd /space/raid6/data/monti/Data/Vespa_EpiBios/EpiBios_Acute/

echo "subject~scan~sequence~protocol~series" > textfiles/checkdicomheader.txt

folder0=`ls -d EB*/`

for d0 in ${folder0}; do

    subject=`echo ${d0}`

    cd ${d0}

    folder1=`ls -d */`

    cd ${folder1}

    folder2=`ls -d */`

    cd ${folder2}

    folder3=`ls -d */`

    for d1 in ${folder3}; do

        scan=`echo ${d1} | cut -d'-' -f1`

        cd ${d1}

        file1=`ls *dcm | head -1`

        sequence=`dicom_hdr ${file1} | grep "ACQ Sequence Name" | cut -d'/' -f5 --output-delimiter='-' | sed 's/^[ \t]*//'`

        protocol=`dicom_hdr ${file1} | grep "ACQ Protocol Name" | cut -d'/' -f5 --output-delimiter='-' | sed 's/^[ \t]*//'`

        series=`dicom_hdr ${file1} | grep "ID Series Description" | cut -d'/' -f5 --output-delimiter='-' | sed 's/^[ \t]*//'`

        echo ${subject}~${scan}~${sequence}~${protocol}~${series} >> /space/raid6/data/monti/Data/Vespa_EpiBios/EpiBios_Chronic/textfiles/checkdicomheader.txt

        cd ../

    done

    cd ../../../

done

