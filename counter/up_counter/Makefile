# TOOL INPUT
SRC = UP_COUNTER.v
TESTBENCH = TESTBED.v
COUTPUT = compiler.out
TBOUTPUT = test.vcd

# TOOLS
COMPILER = iverilog
SIMULATOR = vvp
VIEWER = gtkwave

# TOOL OPTIONS
COFLAGS = -o
SFLAGS = -i

#MAKE DIRECTIVES
.PHONY : check simulate displays
check: $(SRC)
	@echo "Check $(SRC)"
	@$(COMPILER) $(COFLAGS) $(COUTPUT) $(SRC)

simulate: $(COUTPUT) $(TESTBENCH)
	@echo "Simulate $(COUTPUT)"
	@$(COMPILER) $(COFLAGS) $(COUTPUT) $(TESTBENCH)
	@$(SIMULATOR) $(SFLAGS) $(COUTPUT)

display: $(TBOUTPUT)
	@echo "Display $(TBOUTPUT)"
	@$(VIEWER) $(TBOUTPUT) &

#CLEAN THE FILE
.PHONY : clean
clean:
	@echo "Clean $(COUTPUT) $(TBOUTPUT)"
	@rm -rf $(COUTPUT) $(TBOUTPUT)

#DISPLAY THE HELP
.PHONY : help
help:
	@echo "Help Info:"
	@echo "make check    - compiles your verilog design - good for checking code"
	@echo "make simulate - compiles your design and testbench & simulates your design"
	@echo "make display  - compiles, simulates and displays waveforms"