#prabin: this script lists/sorts the resid_resname around a molecule/ion

set mol [mol new "step3_charmm2omm.psf" waitfor all]
mol addfile "step3_charmm2omm.pdb" waitfor all
mol addfile "sys7all_1.6us_ev500ps.dcd" molid $mol step 1 waitfor all
set nf [molinfo $mol get numframes]
# open a file for writing the data to
set outfile [open "residue_nonunique_MGw2.5O1PO2P_1.6us_ev500ps.dat" w]

# loop over all frames
for {set i 1} {$i < $nf} {incr i} {
    
        set sel [atomselect top "nucleic and name O1P O2P and within 2.5 of name MG" frame $i]
#	set n [llength [lsort -unique -integer [$sel get resid]]]
#	set n [lsort -unique [$sel get {resid resname}]]
	set n [$sel get {resid resname}]
        puts "$i $n"

#        puts $outfile [format "%7i %7i" $frame $n]
        puts $outfile "$i $n"
}

# close the file 
close $outfile
