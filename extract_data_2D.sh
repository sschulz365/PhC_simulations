awk -f bsfiles_2D.awk example.out > example.bs.dat
awk -f ngfiles_2D.awk example.out > example.ng.dat
for AA in first-row second-row third-row
do
   grep integral-gamma-holes-list-$AA: example.out | grep Band > example.gamma.$AA.dat
   grep integral-rho-holes-list-$AA: example.out | grep Band > example.rho.$AA.dat
done
