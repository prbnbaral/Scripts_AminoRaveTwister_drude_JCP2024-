#prabin: this script lists/sorts the resid_resname around a molecule/ion

set mol [mol new "step3_charmm2omm.psf" waitfor all]
mol addfile "step3_charmm2omm.pdb" waitfor all
mol addfile "sys7all_1.6us_ev500ps.dcd" molid $mol step 1 waitfor all
set nf [molinfo $mol get numframes]
set outfile [open "residue_nonunique_eachvisit_MGw2.5O1PO2P_1.6us_ev500ps_MG31-40.dat" w]

# loop over all frames
for {set i 1} {$i < $nf} {incr i} {
	for {set j 31} {$j < 41} {incr j} {
               set sel [atomselect top "nucleic and name O1P O2P and within 2.5 of (name MG and resid $j)" frame $i]
               set n [$sel get {resid resname}]
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
