vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib

vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xil_defaultlib -64 -incr -mfcu  \
"../../../bd/input_0_arbiter/ip/input_0_arbiter_router_controller_0_0/sim/input_0_arbiter_router_controller_0_0.v" \
"../../../bd/input_0_arbiter/ip/input_0_arbiter_arbiter_bram_0_0/sim/input_0_arbiter_arbiter_bram_0_0.v" \
"../../../bd/input_0_arbiter/ip/input_0_arbiter_fifo_generator_0_0/sim/input_0_arbiter_fifo_generator_0_0.v" \
"../../../bd/input_0_arbiter/ip/input_0_arbiter_encap_packet_top_0_0/sim/input_0_arbiter_encap_packet_top_0_0.v" \
"../../../bd/input_0_arbiter/ip/input_0_arbiter_util_vector_logic_0_0/sim/input_0_arbiter_util_vector_logic_0_0.v" \
"../../../bd/input_0_arbiter/ip/input_0_arbiter_fifo_in_port_0_0/sim/input_0_arbiter_fifo_in_port_0_0.v" \
"../../../bd/input_0_arbiter/ip/input_0_arbiter_crossbar_0_0/sim/input_0_arbiter_crossbar_0_0.v" \
"../../../bd/input_0_arbiter/ip/input_0_arbiter_fifo_in_port_0_1/sim/input_0_arbiter_fifo_in_port_0_1.v" \
"../../../bd/input_0_arbiter/ip/input_0_arbiter_fifo_out_port_1_0/sim/input_0_arbiter_fifo_out_port_1_0.v" \
"../../../bd/input_0_arbiter/sim/input_0_arbiter.v" \


vlog -work xil_defaultlib \
"glbl.v"

