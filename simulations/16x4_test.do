# 1. Compilation and Environment Setup
vlib work
vmap work work
# Add any additional .vhd files needed for the 16x4 top level here
vcom -work work WILLIAMS_DWANN_2x4Decoder.vhd
vcom -work work WILLIAMS_DWANN_D_LATCH.vhd
vcom -work work WILLIAMS_DWANN_SRAM_CELL.vhd
vcom -work work WILLIAMS_DWANN_SRAM_16x1.vhd
vcom -work work WILLIAMS_DWANN_SRAM_16x4.vhd
vsim work.WILLIAMS_DWANN_SRAM_16x4

# 2. Reset simulation and setup waveform viewer
restart -f
view wave
delete wave *

# 3. Add top-level buses and control pins
add wave address
add wave Data_In
add wave CS
add wave WE
add wave OE
add wave Data_Out

# 4. Define a reusable test procedure with setup and hold timing
proc test_word {addr_val data_val} {
    # SETUP PHASE: Apply address and data while WE is safely low
    force address $addr_val
    force Data_In $data_val
    force CS 1
    force WE 0
    force OE 0
    run 5 ns
    
    # WRITE PHASE: Pulse WE high to let data into the master latch
    force WE 1
    run 20 ns
    
    # HOLD PHASE: Drop WE low to lock data into the slave latch
    force WE 0
    run 5 ns
    
    # READ PHASE: Turn on the output buffers
    force OE 1
    run 20 ns
}

# 5. Initialize all inputs to a safe 0 state
force address 0000
force Data_In 0000
force CS 0
force WE 0
force OE 0
run 10 ns

# 6. Execute the test procedure for all 16 addresses with distinct patterns
test_word 0000 1010
test_word 0001 0101
test_word 0010 1100
test_word 0011 0011
test_word 0100 1111
test_word 0101 0000
test_word 0110 1001
test_word 0111 0110
test_word 1000 1110
test_word 1001 0111
test_word 1010 1011
test_word 1011 0100
test_word 1100 1101
test_word 1101 0010
test_word 1110 1000
test_word 1111 0001