

TBENCHSRC	= tb.v
STDCELLSRC	= /afs/eos.ncsu.edu/lockers/research/ece/wdavis/tech/nangate/NangateOpenCellLibrary_PDKv1_2_v2008_10/verilog/NangateOpenCellLibrary_PDKv1_2_v2008_10_typical_conditional.v
SRCDIR		= ../src/rtl
#SRCDIR		= ../src/gate
VERILOGSRC	= $(wildcard $(SRCDIR)/*.v)
SVERILOGSRC	= $(wildcard ./*.sv)
VERILOGTOP	= tb


# Mentor Graphics QuestaSim/ModelSim
sim:	$(VERILOGSRC) $(SVERILOGSRC) $(TBENCHSRC) $(STDCELLSRC)
	vlib work
	vlog $(STDCELLSRC) $(VERILOGSRC) $(SVERILOGSRC) $(TBENCHSRC)
	vopt $(VERILOGTOP) -o $(VERILOGTOP)_opt
	vsim $(VERILOGTOP)_opt -c -do "run -all"

gui:	$(VERILOGSRC) $(SVERILOGSRC) $(TBENCHSRC) $(STDCELLSRC)
	vlib work
	vlog $(STDCELLSRC) $(VERILOGSRC) $(SVERILOGSRC) $(TBENCHSRC)
	vsim -novopt $(VERILOGTOP)

clean:
	-rm -rf work
	-rm -f ram.bin
	-rm -f $(CPROGRAM).elf
	-rm -f transcript
	-rm -f vsim.wlf
	-rm -f waves.vcd
