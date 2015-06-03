#this awk program greps for zevenfreqs and outputs the bandstructure
#from a mpb .out file
BEGIN {FS = ","; OFS = " "; ORS = " "; NM=0} 
/zevenfreqs/ && NM>0 {{print $6} for (i=7;i<=NF;i++) {print $i} {print "\n"}} 
/zevenfreqs/ {NM++}   #NM is used to exclude the first (descriptive) line
