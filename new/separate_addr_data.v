module separate_addr_data 
#(
    parameter DATA_WIDTH = 1024,
    parameter ADDR_WIDTH = 10,
    parameter DATA_DFX_WIDTH = DATA_WIDTH + ADDR_WIDTH
)(
    input [DATA_DFX_WIDTH - 1:0] data_dfx_recv,
    output [DATA_WIDTH - 1:0] data_arbiter_recv,
    output [ADDR_WIDTH - 1:0] dst_addr_arbiter_recv
);
assign dst_addr_arbiter_recv = data_dfx_recv[ADDR_WIDTH - 1:0];
assign data_arbiter_recv = data_dfx_recv[DATA_DFX_WIDTH - 1:ADDR_WIDTH];
endmodule