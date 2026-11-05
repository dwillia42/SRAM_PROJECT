onerror {exit -code 1}
vlib work
vlog -work work WILLIAMS_DWANN_SRAM_16x32.vo
vlog -work work WILLIAMS_DWANN_D_LATCH.vwf.vt
vsim -novopt -c -t 1ps -L cyclonev_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate_ver -L altera_lnsim_ver work.WILLIAMS_DWANN_D_LATCH_vlg_vec_tst
vcd file -direction WILLIAMS_DWANN_SRAM_16x32.msim.vcd
vcd add -internal WILLIAMS_DWANN_D_LATCH_vlg_vec_tst/*
vcd add -internal WILLIAMS_DWANN_D_LATCH_vlg_vec_tst/i1/*
proc simTimestamp {} {
    echo "Simulation time: $::now ps"
    if { [string equal running [runStatus]] } {
        after 2500 simTimestamp
    }
}
after 2500 simTimestamp
run -all
quit -f
