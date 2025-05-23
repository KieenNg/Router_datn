onbreak {quit -f}
onerror {quit -f}

vsim  -lib xil_defaultlib input_0_arbiter_opt

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {input_0_arbiter.udo}

run 1000ns

quit -force
