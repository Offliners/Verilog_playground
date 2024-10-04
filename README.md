# Verilog Playground
* Adder
    * [Half adder](./adder/half_adder/)
    * [1-bit full adder](./adder/full_adder_1_bit/)
    * [4-bit full adder (ripple carry adder)](./adder/full_adder_4_bits_RCA/)
    * [4-bit full adder (carry lookahead adder)](./adder/full_adder_4_bits_CLA/)
* Converter
    * [Binary to Gray Code Converter](./converter/bin2gray/)
* Flip Flop
    * [D flip flop with asynchronous reset](./flipflop/async_d_flipflop/)
* Multiplexer
    * [Multiplexer 4x1](./multiplexer/mux_4x1/)
* Comparator
    * [Comparator](./comparator/comparator/)
* Bit Manipulation
    * [Bit reverse](./bit_manipulation/bit_reverse/)
* Counter
    * [4-bit up counter](./counter/up_counter_4_bit/)
    * [4-bit down counter](./counter/down_counter_4_bit/)
    * [4-bit up-down counter](./counter/updown_counter_4_bit/)

## Usage
```shell
$ make check     # compiles your verilog design - good for checking code
$ make simulate  # compiles your design and testbench & simulates your design
# PASS
        ----------------------------
        --                        --       |\__|\
        --  Congratulations !!    --      / O.O  |
        --                        --    /_____   |
        --  Simulation PASS!!     --   /^ ^ ^ \  |
        --                        --  |^ ^ ^ ^ |w|
        ----------------------------   \m___m__|_|
# FAIL
        ----------------------------
        --                        --       |\__|\
        --  OOPS!!                --      / X,X  |
        --                        --    /_____   |
        --  Simulation FAIL!!     --   /^ ^ ^ \  |
        --                        --  |^ ^ ^ ^ |w|
        ----------------------------   \m___m__|_|

$ make display   # compiles, simulates and displays waveforms
```

## Requirements
* Icarus Verilog
* GTKWave