{
#!/bin/bash
# This script normalizes the histograms so that the area under the curve integrates to 1. The binwidth of our data is 2. So, mathematically, normalized_values = count/(total_count*binwidth). For example: in bdna t1, for range 0-2, count = 35, total_count = 40757. Further modification might be needed to print column 1 as "1, 3, 5, etc." instead of "2, 4, 6, etc." for binwidths 0-2, 2-4, 4-6, etc. 

cat t1_histo.dat | awk -F' ' '{print $2-1 " " $3/(3601*2)}' > t1_histo_normalized_bin2.dat
cat t2_histo.dat | awk -F' ' '{print $2-1 " " $3/(3601*2)}' > t2_histo_normalized_bin2.dat
cat t4_histo.dat | awk -F' ' '{print $2-1 " " $3/(3601*2)}' > t4_histo_normalized_bin2.dat

paste t1_histo_normalized_bin2.dat t2_histo_normalized_bin2.dat t4_histo_normalized_bin2.dat | awk '{print $1 " " $2 " " $4 " " $6}' > t1t2t4_histo_normalized_bin2.dat

rm t1_histo_normalized_bin2.dat t2_histo_normalized_bin2.dat t4_histo_normalized_bin2.dat
rm t1_histo.dat t2_histo.dat t4_histo.dat
}
