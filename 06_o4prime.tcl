#prabin: this script lists/sorts the resid_resname around a molecule/ion

set mol [mol new "step3_charmm2omm.psf" waitfor all]
mol addfile "step3_charmm2omm.pdb" waitfor all
mol addfile "sys8all_4.8us_ev500ps.dcd" molid $mol step 2 waitfor all
set nf [molinfo $mol get numframes]
set outfile [open "residue_unique_eachvisit_MGw2.5_o4prime_4.8us_ev1ns_MG26-30.dat" w]

# loop over all frames
for {set i 1} {$i < $nf} {incr i} {
	for {set j 26} {$j < 31} {incr j} {
               set sel [atomselect top "nucleic and name O4' and within 2.5 of (name MG and resid $j)" frame $i]
               set n [lsort -unique [$sel get {resid resname}]]
#	       set n [$sel get {resid resname}]
#               puts "$i $j $n"
               puts $outfile "$i $j $n"
               }
}
close $outfile
unset sel
unset i
unset j
unset nf
unset n
unset outfile
unset mol
exit
