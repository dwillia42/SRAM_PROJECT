# 1. Load the simulation for the single cell
vlib work
vmap work work
vcom -work work WILLIAMS_DWANN_SRAM_CELL.vhd
vsim work.WILLIAMS_DWANN_SRAM_CELL

# 2. Reset and setup wave viewer
restart -f
view wave
delete wave *
add wave Data_In
add wave SEL
add wave WE
add wave Data_Out

# 3. Initialize to known state
force Data_In 0
force SEL 0
force WE 0
run 10 ns

# 4. SETUP: Apply data while WE is low
# Master latch tracks Data_In when SEL=1 and WE=0
force SEL 1
force Data_In 1
run 10 ns

# 5. WRITE: Pulse WE high
# Master locks the data; Slave becomes transparent and passes it to output
force WE 1
run 20 ns

# 6. HOLD: Drop WE low
# Slave locks the data; cell is now storing the '1'
force WE 0
run 10 ns

# 7. READ: Keep SEL high
# Data_Out should hold steady at '1'
run 20 ns

# 8. WRITE a '0' using the same sequence
force Data_In 0
run 10 ns
force WE 1
run 20 ns
force WE 0
run 10 ns

# 9. DESELECT: Drop SEL low
# Tri-state buffer should turn off, sending Data_Out to 'Z'
force SEL 0
run 20 ns