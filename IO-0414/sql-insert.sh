#!/bin/bash
#author y
outfile=members.sql
IFS=','
while read lname fname address city state zip
do 
cat >>outfile <<EOF
INSERT INFO members (lname,fname,address,city,state,zip ) VALUES ('$lname','$fname','$address','$address','$city','$state','$zip')
EOF

done <${1}


