SRC_DIR = src
TB_DIR  = tb
SIM_DIR = sim

VLOG = vlog
VSIM = vsim

default: compile simulate

compile:
	$(VLOG) $(SRC_DIR)/*.v $(TB_DIR)/*.v

simulate:
	$(VSIM) -c ALU_tb -do "do $(SIM_DIR)/wave.do"

clean:
	rm -f transcript vsim.wlf work/*

.PHONY: compile simulate clean