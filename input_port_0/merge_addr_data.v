module merge_addr_data
#(
    parameter DATA_WIDTH = 1024,
    parameter ADDR_WIDTH = 10,
    parameter DATA_DFX_WIDTH = DATA_WIDTH + ADDR_WIDTH
)(
    input [DATA_WIDTH - 1:0]    data_arbiter_send,
    input [ADDR_WIDTH - 1:0]    router_dst_addr_send,
    output [DATA_DFX_WIDTH - 1:0]   data_dfx_send
);
assign data_dfx_send = {data_arbiter_send, router_dst_addr_send};
endmodule