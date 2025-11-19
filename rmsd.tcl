# This script compares the rmsd between frames in a trajectory with respect to the first.
# to execute: vmd -dispdev text < rmsd.tcl

set outfile [open rmsd_292d_700mM_nontermbbsug_120ns_ev20ps.dat w];                                             
set mol [mol new "step3_charmm2omm.psf" waitfor all]
mol addfile "step3_charmm2omm.pdb" waitfor all
mol addfile "292d_700mMnacl_120ns_ev20ps.dcd" molid $mol step 1 waitfor all

set nf [molinfo top get numframes]
set frame0 [atomselect top "nucleic and not resid 1 6 7 12 and name P DP O1P DO1P O2P DO2P O5' DO5' C5' DC5' C4' DC4' O4' DO4' LPRA LPRB LPX C1' DC1' C2' DC2' C3' DC3' O3' DO3' " frame 0]

# rmsd calculation loop
for {set i 1 } {$i < $nf } { incr i } {
    set sel [atomselect top "nucleic and not resid 1 6 7 12 and name P DP O1P DO1P O2P DO2P O5' DO5' C5' DC5' C4' DC4' O4' DO4' LPRA LPRB LPX C1' DC1' C2' DC2' C3' DC3' O3' DO3' " frame $i]
    set all [atomselect top all frame $i]
    $all move [measure fit $sel $frame0]
    set out "[measure rmsd $sel $frame0]"
#    puts $outfile "[measure rmsd $sel $frame0]"
    puts $outfile [format "%.2f" $out]

}

close $outfile
