#used to grep mpb .out file with zevenfreqs and zevenvelocity
#outputs frequency, -1/(x-component of group velocity)=group index
BEGIN {FS = ","; OFS = " "; ORS = " "; b=23} 
/solve_kpoint/ {print substr($1,15,length($1))}
/zevenfreqs/ {split($0,freqs)}
/zevenvelocity/ {print freqs[6+b]; split($(2+b),gv," "); print -1/substr(gv[1],3,length(gv[1])); print "\n"}
