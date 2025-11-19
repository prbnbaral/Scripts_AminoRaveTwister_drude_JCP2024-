package require pbctools
set mol [mol new "step3_charmm2omm.psf" waitfor all]
mol addfile "output_11.dcd" molid $mol step 1  waitfor all

pbc unwrap -sel nucleic
pbc wrap -centersel "nucleic or ions" -center com -compound residue -all
set frame0 [atomselect top "nucleic" frame 0]
set nf [molinfo top get numframes]
for {set i 0 } {$i < $nf } { incr i } {
    set sel [atomselect top "nucleic" frame $i]
    set all [atomselect top all frame $i]
    $all move [measure fit $sel $frame0]
}

set sel [atomselect top all]
set nuc [atomselect top nucleic]
animate write dcd output_11_vmd2.dcd skip 1 waitfor all sel $sel
#set sel0 [atomselect top "noh" frame 0]
#$sel0 writepsf TBM.psf

