root_dir := $(PWD)
src_dir := ./src
syn_dir := ./syn
inc_dir := ./include
sim_dir := ./sim
bld_dir := ./build
mem_dir := ./mem
CYCLE=`grep -v '^$$' $(root_dir)/sim/CYCLE`
MAX=`grep -v '^$$' $(root_dir)/sim/MAX`

$(bld_dir):
	mkdir -p $(bld_dir)

$(syn_dir):
	mkdir -p $(syn_dir)

# RTL simulation
rtl_all: clean 

top_tb: | $(bld_dir)
	cd $(bld_dir); \
	irun $(root_dir)/$(sim_dir)/testbench/top_tb.sv \
	+incdir+$(root_dir)/$(src_dir)+$(root_dir)/$(inc_dir)+$(root_dir)/$(sim_dir)+$(root_dir)/$(mem_dir) \
	-define CYCLE=$(CYCLE) \
	-define MAX=$(MAX) \
	+access+r -loadpli1 debpli:novas_pli_boot \
	+output_path=$(root_dir)/test_result_v	


TF_tb: | $(bld_dir)
	@if [ $$(echo $(CYCLE) '>' 20.0 | bc -l) -eq 1 ]; then \
		echo "Cycle time shouldn't exceed 20"; \
		exit 1; \
	fi; \
	cd $(bld_dir); \
	irun $(root_dir)/$(sim_dir)/testbench/TF_gen_tb.sv \
	+incdir+$(root_dir)/$(src_dir)+$(root_dir)/$(inc_dir)+$(root_dir)/$(sim_dir) \
	-define CYCLE=$(CYCLE) \
	-define MAX=$(MAX) \
	+access+r \
	-loadpli1 debpli:novas_pli_boot

mem_tb: | $(bld_dir)
	@if [ $$(echo $(CYCLE) '>' 20.0 | bc -l) -eq 1 ]; then \
		echo "Cycle time shouldn't exceed 20"; \
		exit 1; \
	fi; \
	cd $(bld_dir); \
	irun $(root_dir)/$(sim_dir)/testbench/MEM_tb.sv \
	+incdir+$(root_dir)/$(src_dir)+$(root_dir)/$(inc_dir)+$(root_dir)/$(sim_dir) \
	-define CYCLE=$(CYCLE) \
	-define MAX=$(MAX) \
	+access+r \
	-loadpli1 debpli:novas_pli_boot

R16_tb: | $(bld_dir)
	@if [ $$(echo $(CYCLE) '>' 20.0 | bc -l) -eq 1 ]; then \
		echo "Cycle time shouldn't exceed 20"; \
		exit 1; \
	fi; \
	make -C $(sim_dir)/prog0/; \
	cd $(bld_dir); \
	irun $(root_dir)/$(sim_dir)/testbench/R16_BU_tb.sv \
	+incdir+$(root_dir)/$(src_dir)+$(root_dir)/$(inc_dir)+$(root_dir)/$(sim_dir) \
	-define CYCLE=$(CYCLE) \
	-define MAX=$(MAX) \
	+access+r \
	-loadpli1 debpli:novas_pli_boot

BU2_NWC_tb: | $(bld_dir)
	@if [ $$(echo $(CYCLE) '>' 20.0 | bc -l) -eq 1 ]; then \
		echo "Cycle time shouldn't exceed 20"; \
		exit 1; \
	fi; \
	make -C $(sim_dir)/prog1/; \
	cd $(bld_dir); \
	irun $(root_dir)/$(sim_dir)/testbench/BU2_NWC_tb.sv \
	+incdir+$(root_dir)/$(src_dir)+$(root_dir)/$(inc_dir)+$(root_dir)/$(sim_dir) \
	-define CYCLE=$(CYCLE) \
	-define MAX=$(MAX) \
	+access+r \
	-loadpli1 debpli:novas_pli_boot

AGU_tb: | $(bld_dir)
	@if [ $$(echo $(CYCLE) '>' 20.0 | bc -l) -eq 1 ]; then \
		echo "Cycle time shouldn't exceed 20"; \
		exit 1; \
	fi; \
	cd $(bld_dir); \
	irun $(root_dir)/$(sim_dir)/testbench/AGU_tb.sv \
	+incdir+$(root_dir)/$(src_dir)+$(root_dir)/$(inc_dir)+$(root_dir)/$(sim_dir) \
	-define CYCLE=$(CYCLE) \
	-define MAX=$(MAX) \
	+access+r \
	-loadpli1 debpli:novas_pli_boot


# Post-Synthesis simulation
syn_all: clean syn0 syn1 syn2 syn3

SYN: | $(bld_dir)
	cd $(bld_dir); \
	irun $(root_dir)/$(sim_dir)/testbench/top_tb.sv \
	-sdf_file $(root_dir)/$(syn_dir)/top_syn.sdf \
	+incdir+$(root_dir)/$(syn_dir)+$(root_dir)/$(inc_dir)+$(root_dir)/$(sim_dir)+$(root_dir)/$(mem_dir) \
	+define+SYN \
	-define CYCLE=$(CYCLE) \
	-define MAX=$(MAX) \
	+access+r -loadpli1 debpli:novas_pli_boot \
	+output_path=$(root_dir)/test_result_syn


# Utilities
nWave: | $(bld_dir)
	cd $(bld_dir); \
	nWave &
	
superlint: | $(bld_dir)
	cd $(bld_dir); \
	jg -superlint ../script/superlint.tcl &

dv: | $(bld_dir) $(syn_dir)
	cp script/synopsys_dc.setup $(bld_dir)/.synopsys_dc.setup; \
	cd $(bld_dir); \
	dc_shell -gui -no_home_init

synthesize: | $(bld_dir) $(syn_dir)
#	cp script/synopsys_dc.setup $(bld_dir)/.synopsys_dc.setup; 
	cd $(bld_dir); \
	dc_shell -no_home_init -f ../script/synthesis.tcl


.PHONY: clean

clean:
	rm -rf $(bld_dir); \
	rm -rf $(sim_dir)/prog*/result*.txt; \

	rm -rf $(root_dir)/INCA_libs; \
	rm -rf $(root_dir)/$(src_dir)/INCA_libs; \
	rm -rf $(root_dir)/$(src_dir)/*.history; \
	rm -rf $(root_dir)/$(src_dir)/*.log; \
	rm -rf $(root_dir)/$(src_dir)/simv.daidir; \
	
	rm -rf $(root_dir)/$(sim_dir)/testbench/INCA_libs;\
	rm -rf $(root_dir)/$(sim_dir)/testbench/*.history;\
	rm -rf $(root_dir)/$(sim_dir)/testbench/*.log;\

	rm -rf $(root_dir)/$(mem_dir)/*.log; \
	rm -rf $(root_dir)/$(mem_dir)/*.history; \
	rm -rf $(root_dir)/$(mem_dir)/INCA_libs; \

	rm -rf $(root_dir)/*.log; \
	rm -rf $(root_dir)/*.history;\
