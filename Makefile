GHDL = /usr/local/bin/ghdl
COMP = -a
EXE = -e
RUN = -r

calculator:
	$(GHDL) $(COMP) ALU.vhdl
	$(GHDL) $(COMP) calculator.vhdl
	$(GHDL) $(COMP) carry.vhdl
	$(GHDL) $(COMP) mux.vhdl
	$(GHDL) $(COMP) demux.vhdl
	$(GHDL) $(COMP) full_adder.vhdl
	$(GHDL) $(COMP) reg_file.vhdl
	$(GHDL) $(COMP) reg.vhdl
	$(GHDL) $(EXE) cal_tb

run-calculator: calculator
	$(GHDL) $(RUN) cal_tb

dump-calculator: calculator
	$(GHDL) $(RUN) cal_tb

clean:
	rm -f *.o *.cf *.out *.vcd
