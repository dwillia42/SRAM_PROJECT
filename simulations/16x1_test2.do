vlib work
vmap work work

# 2. Compile the design file
vcom -work work WILLIAMS_DWANN_2x4Decoder.vhd
vcom -work work WILLIAMS_DWANN_D_LATCH.vhd
vcom -work work WILLIAMS_DWANN_SRAM_CELL.vhd
vcom -work work WILLIAMS_DWANN_SRAM_16x1.vhd

# 3. Load the simulation
vsim work.WILLIAMS_DWANN_SRAM_16x1


# 1. Reset simulation and set up the wave viewer with critical pins

add wave address
add wave Data
add wave CS
add wave WE
add wave OE
add wave output
add wave b2v_inst16/Data_Out

# 2. Initialize all inputs to a safe 0 state
force A0 0
force A1 0
force A2 0
force A3 0
force Data 0
force CS 0
force WE 0
force OE 0
run 10 ns

# 3. WRITE a '1' to address 0000
force CS 1
force WE 1
force OE 0
force Data 1
run 20 ns

# 4. LATCH the data (Drop WE low while holding Data and address steady)
force WE 0
run 10 ns

# 5. READ the '1' from address 0000
force OE 1
run 20 ns

# 6. WRITE a '0' to address 0000
force OE 0
force WE 1
force Data 0
run 20 ns

# 7. LATCH the data
force WE 0
run 10 ns

# 8. READ the '0' from address 0000
force OE 1
run 20 ns