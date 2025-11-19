package require pbctools
set mol [mol new "step3_charmm2omm.psf" waitfor all]
mol addfile "output_1.dcd" molid $mol step 25  waitfor all
mol addfile "output_2.dcd" molid $mol step 25  waitfor all
mol addfile "output_3.dcd" molid $mol step 25  waitfor all
mol addfile "output_4.dcd" molid $mol step 25  waitfor all
mol addfile "output_5.dcd" molid $mol step 25  waitfor all
mol addfile "output_6.dcd" molid $mol step 25  waitfor all
mol addfile "output_7.dcd" molid $mol step 25  waitfor all
mol addfile "output_8.dcd" molid $mol step 25  waitfor all
mol addfile "output_9.dcd" molid $mol step 25  waitfor all
mol addfile "output_10.dcd" molid $mol step 25  waitfor all
mol addfile "output_11.dcd" molid $mol step 25  waitfor all
mol addfile "output_12.dcd" molid $mol step 25  waitfor all
mol addfile "output_13.dcd" molid $mol step 25  waitfor all
mol addfile "output_14.dcd" molid $mol step 25  waitfor all
mol addfile "output_15.dcd" molid $mol step 25  waitfor all
mol addfile "output_16.dcd" molid $mol step 25  waitfor all
mol addfile "output_17.dcd" molid $mol step 25  waitfor all
mol addfile "output_18.dcd" molid $mol step 25  waitfor all
mol addfile "output_19.dcd" molid $mol step 25  waitfor all
mol addfile "output_20.dcd" molid $mol step 25  waitfor all
mol addfile "output_21.dcd" molid $mol step 25  waitfor all
mol addfile "output_22.dcd" molid $mol step 25  waitfor all
mol addfile "output_23.dcd" molid $mol step 25  waitfor all
mol addfile "output_24.dcd" molid $mol step 25  waitfor all
#mol addfile "output_25.dcd" molid $mol step 25  waitfor all
#mol addfile "output_26.dcd" molid $mol step 25  waitfor all
#mol addfile "output_27.dcd" molid $mol step 25  waitfor all
#mol addfile "output_28.dcd" molid $mol step 25  waitfor all
#mol addfile "output_29.dcd" molid $mol step 25  waitfor all
#pbc unwrap -sel nucleic
pbc wrap -centersel "nucleic" -center com -compound residue -all
set frame0 [atomselect top "nucleic" frame 0]
set nf [molinfo top get numframes]
for {set i 0 } {$i < $nf } { incr i } {
    set sel [atomselect top "nucleic" frame $i]
    set all [atomselect top all frame $i]
    $all move [measure fit $sel $frame0]
}

set sel [atomselect top all]
set nuc [atomselect top nucleic]
#animate write dcd sys8all_1.8us_ev500ps.dcd skip 1 waitfor all sel $sel
animate write dcd sys8all_4.8us_ev500ps.dcd skip 1 waitfor all sel $sel
#set sel0 [atomselect top "noh" frame 0]
#$sel0 writepsf TBM.psf

