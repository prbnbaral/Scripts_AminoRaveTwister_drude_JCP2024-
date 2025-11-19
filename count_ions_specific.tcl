#prabin: this script lists/sorts the resid_resname around a molecule/ion

set mol [mol new "step3_charmm2omm.psf" waitfor all]
mol addfile "step3_charmm2omm.pdb" waitfor all
mol addfile "sys8all_4.8us_ev500ps.dcd" molid $mol step 4 waitfor all
set nf [molinfo $mol get numframes]
set outfile1 [open "s8_count_Mg70percent_w42_o1po2p_4.8us_ev2ns.dat" w]
set outfile2 [open "s8_count_Mg70percent_w42_bases_4.8us_ev2ns.dat" w]

# loop over all frames
for {set i 1} {$i < $nf} {incr i} {
        set sel1 [atomselect top "name MG and within 4.2 of (nucleic and resid 6 7 8 9 25 26 and name O1P O2P)" frame $i]
        set sel2 [atomselect top "name MG and within 4.2 of (nucleic and resid 7 9 13 34 35 46 49 50 and name N9 DN9 C4 DC4 N3 DN3 LP3 C2 DC2 H2 N1 DN1 LP1 C6 DC6 N6 DN6 H61 H62 C5 DC5 N7 DN7 LP7 C8 DC8 H8 H1 H6 N2 DN2 H21 H22 O6 DO6 LP6A LP6B O2 DO2 LP2A LP2B H3 O4 DO4 LP4A LP4B N4 DN4 H41 H42 C5M DC5M H51 H52 H53 H5)" frame $i]
	set n1 [llength [lsort -unique [$sel1 get {resid resname}]]]
	set n2 [llength [lsort -unique [$sel2 get {resid resname}]]]
#	set n [$sel get {resid resname}]
#        puts "$i $j $n"
        puts $outfile1 "$i $n1"
        puts $outfile2 "$i $n2"
}
close $outfile1
close $outfile2
unset sel
unset i
unset nf
unset n
unset outfile4
unset outfile5
unset mol
exit
