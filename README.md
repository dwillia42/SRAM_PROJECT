This project implements a 16×32 SRAM using a hierarchical digital design approach in Intel Quartus Prime. Starting from a basic SR latch, progressively larger memory structures were developed and verified through simulation in ModelSim.

The design flow follows:

SR Latch
   ↓
Gated SR Latch
   ↓
D Latch
   ↓
SRAM Cell
   ↓
16×1 SRAM (+ 2x4 Decoder)
   ↓
16×4 SRAM
   ↓
16×32 SRAM

Development Tools:
* Intel Quartus Prime
* ModelSim
* VHDL (Quartus Generated)

Design Components:

* SR LATCH: The fundemental sequential circuit used to store 1-bit.
  
* GATED SR LATCH: Modified SR Latch with an enable input
  
* D LATCH: Modified gated SR Latch so that input cannot be invalid
  
* SRAM CELL: Uses two D Latches to create a master-slave flip flop
  
* 16x1 SRAM: Memory array implementation using 16 SRAM Cells
  
* 16x4 SRAM: Expansion of memory width using 4 16x1 SRAM's
  
* 16x32 SRAM: Further memory width expansion using 8 16x4 SRAM's

Simulations and vector waveforms are in the simulations folder

Author:

Dwann Williams
Computer Engineering Student
The City College of New York

