# Verilog Playground
* Half Adder
* Full Adder
    * Full adder (1 bit)
    * 4-bit full adder (ripple carry adder)
    * 4-bit full Adder (carry lookahead adder)
* Binary to Gray Code Converter
* Flip Flop
    * D flip flop with asynchronous reset
* Multiplexer
    * Multiplexer 4x1
* Comparator

## Usage
```shell
$ make check     # compiles your verilog design - good for checking code
$ make simulate  # compiles your design and testbench & simulates your design
$ make display   # compiles, simulates and displays waveforms
```

## Requirements
* Icarus Verilog
* GTKWave