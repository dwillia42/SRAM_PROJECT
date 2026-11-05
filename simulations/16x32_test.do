# 1. Compilation and Environment Setup
vlib work
vmap work work
vcom -work work WILLIAMS_DWANN_2x4Decoder.vhd
vcom -work work WILLIAMS_DWANN_D_LATCH.vhd
vcom -work work WILLIAMS_DWANN_SRAM_CELL.vhd
vcom -work work WILLIAMS_DWANN_SRAM_16x1.vhd
vcom -work work WILLIAMS_DWANN_SRAM_16x4.vhd
vcom -work work WILLIAMS_DWANN_SRAM_16x32.vhd
vsim work.WILLIAMS_DWANN_SRAM_16x32

# 2. Reset simulation and setup waveform viewer
restart -f
view wave
delete wave *

# 3. Add top-level buses and control pins with hex radix
add wave -radix hex address
add wave -radix hex Data_In
add wave -radix hex Data_Out
add wave CS
add wave WE
add wave OE

# 4. Define a reusable test procedure for 32-bit words using hex values
proc test_word {addr_val data_val} {
    # SETUP PHASE: Apply address and data while WE is safely low
    force address 16#$addr_val
    force Data_In 16#$data_val
    force CS 1
    force WE 0
    force OE 0
    run 5 ns
    
    # WRITE PHASE: Pulse WE high to let data into the master latches
    force WE 1
    run 20 ns
    
    # HOLD PHASE: Drop WE low to lock data into the slave latches
    force WE 0
    run 5 ns
    
    # READ PHASE: Turn on the output buffers
    force OE 1
    run 20 ns
}

# 5. Initialize all inputs to a safe 0 state
force address 16#0
force Data_In 16#00000000
force CS 0
force WE 0
force OE 0
run 10 ns

# 6. Execute the test procedure for all 16 addresses with distinct 32-bit hex patterns
test_word 0 AAAAAAAA
test_word 1 55555555
test_word 2 DEADBEEF
test_word 3 8BADF00D
test_word 4 CAFEBABE
test_word 5 BADDCAFE
test_word 6 FEEDFACE
test_word 7 01234567
test_word 8 89ABCDEF
test_word 9 11111111
test_word A 22222222
test_word B 33333333
test_word C 44444444
test_word D F0F0F0F0
test_word E 0F0F0F0F
test_word F FFFFFFFF