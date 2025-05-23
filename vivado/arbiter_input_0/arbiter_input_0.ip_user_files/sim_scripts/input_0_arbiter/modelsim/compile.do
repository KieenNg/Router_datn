vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/fifo_generator_v13_2_10
vlib modelsim_lib/msim/util_vector_logic_v2_0_4

vmap xpm modelsim_lib/msim/xpm
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap fifo_generator_v13_2_10 modelsim_lib/msim/fifo_generator_v13_2_10
vmap util_vector_logic_v2_0_4 modelsim_lib/msim/util_vector_logic_v2_0_4

vlog -work xpm -64 -incr -mfcu  -sv \
"/media/socone/3d608d90-f9bc-47ba-a88e-fa074a0a5a5b/socone/tool/Vivado/2024.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/media/socone/3d608d90-f9bc-47ba-a88e-fa074a0a5a5b/socone/tool/Vivado/2024.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93  \
"/media/socone/3d608d90-f9bc-47ba-a88e-fa074a0a5a5b/socone/tool/Vivado/2024.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib -64 -incr -mfcu  \
"../../../bd/input_0_arbiter/ip/input_0_arbiter_router_controller_0_0/sim/input_0_arbiter_router_controller_0_0.v" \
"../../../bd/input_0_arbiter/ip/input_0_arbiter_arbiter_bram_0_0/sim/input_0_arbiter_arbiter_bram_0_0.v" \

vlog -work fifo_generator_v13_2_10 -64 -incr -mfcu  \
"../../../../arbiter_input_0.gen/sources_1/bd/input_0_arbiter/ipshared/1443/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_10 -64 -93  \
"../../../../arbiter_input_0.gen/sources_1/bd/input_0_arbiter/ipshared/1443/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_10 -64 -incr -mfcu  \
"../../../../arbiter_input_0.gen/sources_1/bd/input_0_arbiter/ipshared/1443/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work xil_defaultlib -64 -incr -mfcu  \
"../../../bd/input_0_arbiter/ip/input_0_arbiter_fifo_generator_0_0/sim/input_0_arbiter_fifo_generator_0_0.v" \
"../../../bd/input_0_arbiter/ip/input_0_arbiter_encap_packet_top_0_0/sim/input_0_arbiter_encap_packet_top_0_0.v" \

vlog -work util_vector_logic_v2_0_4 -64 -incr -mfcu  \
"../../../../arbiter_input_0.gen/sources_1/bd/input_0_arbiter/ipshared/fd7b/hdl/util_vector_logic_v2_0_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr -mfcu  \
"../../../bd/input_0_arbiter/ip/input_0_arbiter_util_vector_logic_0_0/sim/input_0_arbiter_util_vector_logic_0_0.v" \
"../../../bd/input_0_arbiter/ip/input_0_arbiter_fifo_in_port_0_0/sim/input_0_arbiter_fifo_in_port_0_0.v" \
"../../../bd/input_0_arbiter/ip/input_0_arbiter_crossbar_0_0/sim/input_0_arbiter_crossbar_0_0.v" \
"../../../bd/input_0_arbiter/ip/input_0_arbiter_fifo_in_port_0_1/sim/input_0_arbiter_fifo_in_port_0_1.v" \
"../../../bd/input_0_arbiter/ip/input_0_arbiter_fifo_out_port_1_0/sim/input_0_arbiter_fifo_out_port_1_0.v" \
"../../../bd/input_0_arbiter/sim/input_0_arbiter.v" \

vlog -work xil_defaultlib \
"glbl.v"

