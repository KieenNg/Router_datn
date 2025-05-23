transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+input_0_arbiter  -L xpm -L xil_defaultlib -L fifo_generator_v13_2_10 -L util_vector_logic_v2_0_4 -L unisims_ver -L unimacro_ver -L secureip -O2 xil_defaultlib.input_0_arbiter xil_defaultlib.glbl

do {input_0_arbiter.udo}

run

endsim

quit -force
