#prabin: this script lists/sorts the resid_resname around a molecule/ion

set mol [mol new "step3_charmm2omm.psf" waitfor all]
mol addfile "step3_charmm2omm.pdb" waitfor all
mol addfile "sys8all_4.8us_ev500ps.dcd" molid $mol step 4 waitfor all
set nf [molinfo $mol get numframes]
#set outfile1 [open "s8_countTotal_allions_w9nucleicnoh_4.8us_ev2ns.dat" w]
#set outfile2 [open "countTotal_MGw4.2NBPOs_4.8us_ev2ns.dat" w]
#set outfile3 [open "countTotal_MGw4.2bases_4.8us_ev2ns.dat" w]

set outfile4 [open "s8_countTotal_Pot_w9nucleicnoh_4.8us_ev2ns.dat" w]
set outfile5 [open "s8_countTotal_Cl_w9nucleicnoh_4.8us_ev2ns.dat" w]

# loop over all frames
for {set i 1} {$i < $nf} {incr i} {
        set sel4 [atomselect top "name POT and within 9 of (nucleic and noh)" frame $i]
        set sel5 [atomselect top "name CLA and within 9 of (nucleic and noh)" frame $i]
        #set sel [atomselect top "name MG and within 4.2 of (name O1P O2P)" frame $i]
        #set sel [atomselect top "name MG and within 4.2 of (nucleic and name N9 DN9 C4 DC4 N3 DN3 LP3 C2 DC2 H2 N1 DN1 LP1 C6 DC6 N6 DN6 H61 H62 C5 DC5 N7 DN7 LP7 C8 DC8 H8 H1 H6 N2 DN2 H21 H22 O6 DO6 LP6A LP6B O2 DO2 LP2A LP2B H3 O4 DO4 LP4A LP4B N4 DN4 H41 H42 C5M DC5M H51 H52 H53 H5)" frame $i]
	set n4 [llength [lsort -unique [$sel4 get {resid resname}]]]
	set n5 [llength [lsort -unique [$sel5 get {resid resname}]]]
#	set n [$sel get {resid resname}]
#        puts "$i $j $n"
        puts $outfile4 "$i $n4"
        puts $outfile5 "$i $n5"
}
close $outfile4
close $outfile5
unset sel
unset i
unset nf
unset n
unset outfile
unset mol
exit
