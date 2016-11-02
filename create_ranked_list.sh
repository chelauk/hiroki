#!/bin/bash
DGE=$1
RNK=$(echo "${DGE//.csv/.rnk}")
string="stirng" ; echo "${string//ir/ri}"
echo "$RNK"
sed 1d "$DGE" \
| sort -t$',' -k6g \
| awk -F, '!arr[$1]++' \
| awk -F, '{OFS="\t"}
{ if ($3>0) printf "%s\t%4.3e\n", $1, 1/$6 ;
else printf "%s\t%4.3e\n", $1, -1/$6 }' \
| sort -k2gr > "$RNK"
