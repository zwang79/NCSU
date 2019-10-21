comp_wb_pkg:
	vlog -sv +incdir+$(ECE745_COMMON_HOME)/ncsu_pkg $(ECE745_PROJECT_HOME)/verification_ip/interface_packages/wb_pkg/wb_pkg.sv
	vlog +incdir+$(ECE745_COMMON_HOME)/ncsu_pkg $(ECE745_PROJECT_HOME)/verification_ip/interface_packages/i2c_pkg/src/emu_type_pkg.sv
	vlog +incdir+$(ECE745_COMMON_HOME)/ncsu_pkg $(ECE745_PROJECT_HOME)/verification_ip/interface_packages/i2c_pkg/i2c_pkg.sv
	vlog -sv $(ECE745_PROJECT_HOME)/verification_ip/interface_packages/wb_pkg/src/wb_if.sv
