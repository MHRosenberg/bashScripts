#!/bin/bash
#Dicom Header Reader

cd /space/raid6/data/monti/Data/Vespa_EpiBios/EpiBios_Acute/

echo "subject~scan~sequence~protocol~series" > textfiles/checkdicomheader.txt

priorFile="initialize"
IFS=''
while read line; 
do
	currentFile=`dicom_hdr "${line}" | grep "DICOM File" | rev | cut -d"/" --complement -f1 | rev`
	if [ ${currentFile} != ${priorFile} ];
	then
		echo ${line}
		subject=`dicom_hdr "${line}" | grep "DICOM File" | cut -d'/' -f9` 

		scan=`dicom_hdr "${line}" | grep "DICOM File" | rev | cut -d'/' -f2 | rev` 	
	
		sequence=`dicom_hdr "${line}" | grep "ACQ Sequence Name" | cut -d'/' -f5 --output-delimiter='-'` #| sed 's/^[ \t]*//'`

        	protocol=`dicom_hdr "${line}" | grep "ACQ Protocol Name" | cut -d'/' -f5 --output-delimiter='-'` #| sed 's/^[ \t]*//'`

        	series=`dicom_hdr "${line}" | grep "ID Series Description" | cut -d'/' -f5 --output-delimiter='-'` #| sed 's/^[ \t]*//'`
		priorFile=${currentFile}  #`dicom_hdr "${line}" | grep "DICOM File" | rev | cut -d"/" --complement -f1 | rev`
		echo "priorFileBelow"
		echo ${priorFile}
		echo ${subject}~${scan}~${sequence}~${protocol}~${series} >> /space/raid6/data/monti/Data/Vespa_EpiBios/EpiBios_Acute/textfiles/checkdicomheader.txt	
	fi 
done < /space/raid6/data/monti/Data/Vespa_EpiBios/EpiBios_Acute/scripts/scans_woQuotes.txt
