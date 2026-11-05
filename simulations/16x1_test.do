# 1. Compilation and Environment Setup
vlib work
vmap work work
vcom -work work WILLIAMS_DWANN_2x4Decoder.vhd
vcom -work work WILLIAMS_DWANN_D_LATCH.vhd
vcom -work work WILLIAMS_DWANN_SRAM_CELL.vhd
vcom -work work WILLIAMS_DWANN_SRAM_16x1.vhd
vsim work.WILLIAMS_DWANN_SRAM_16x1

# 2. Reset simulation and setup waveform viewer
restart -f
view wave
delete wave *

# Top level pins
add wave address Data CS WE OE output

# Internal cell Data_Out signals
add wave b2v_inst16/Data_Out  ;# Address 0000
add wave b2v_inst39/Data_Out  ;# Address 0001
add wave b2v_inst45/Data_Out  ;# Address 0010
add wave b2v_inst49/Data_Out  ;# Address 0011
add wave b2v_inst17/Data_Out  ;# Address 0100
add wave b2v_inst20/Data_Out  ;# Address 0101
add wave b2v_inst23/Data_Out  ;# Address 0110
add wave b2v_inst26/Data_Out  ;# Address 0111
add wave b2v_inst18/Data_Out  ;# Address 1000
add wave b2v_inst21/Data_Out  ;# Address 1001
add wave b2v_inst24/Data_Out  ;# Address 1010
add wave b2v_inst27/Data_Out  ;# Address 1011
add wave b2v_inst19/Data_Out  ;# Address 1100
add wave b2v_inst22/Data_Out  ;# Address 1101
add wave b2v_inst25/Data_Out  ;# Address 1110
add wave b2v_inst28/Data_Out  ;# Address 1111

# 3. Define a reusable test procedure for any address
proc test_address {val3 val2 val1 val0} {
    # Set the address
    force A3 $val3
    force A2 $val2
    force A1 $val1
    force A0 $val0
    
    # WRITE a '1'
    force CS 1
    force WE 1
    force OE 0
    force Data 1
    run 20 ns
    
    # LATCH the data
    force WE 0
    run 10 ns
    
    # READ the '1'
    force OE 1
    run 20 ns
    
    # WRITE a '0'
    force OE 0
    force WE 1
    force Data 0
    run 20 ns
    
    # LATCH the data
    force WE 0
    run 10 ns
    
    # READ the '0'
    force OE 1
    run 20 ns
}

# 4. Initialize all inputs to a safe 0 state
force A3 0
force A2 0
force A1 0
force A0 0
force Data 0
force CS 0
force WE 0
force OE 0
run 10 ns

# 5. Execute the test procedure for all 16 addresses
test_address 0 0 0 0
test_address 0 0 0 1
test_address 0 0 1 0
test_address 0 0 1 1
test_address 0 1 0 0
test_address 0 1 0 1
test_address 0 1 1 0
test_address 0 1 1 1
test_address 1 0 0 0
test_address 1 0 0 1
test_address 1 0 1 0
test_address 1 0 1 1
test_address 1 1 0 0
test_address 1 1 0 1
test_address 1 1 1 0
test_address 1 1 1 1