module encap_packet_top
#(
    parameter DATA_WIDTH = 1024,
    parameter ADDR_WIDTH = 10,
    parameter DATA_DFX_WIDTH = DATA_WIDTH + ADDR_WIDTH,
    parameter RECOGNIZE_ROUTER_WIDTH = 2,
    parameter NUMBER_PACKET = 19,
    parameter TTL_WIDTH = $clog2(3),
    parameter HEADER_WIDTH = RECOGNIZE_ROUTER_WIDTH + $clog2(NUMBER_PACKET) + TTL_WIDTH,
    parameter AURORA_DATA_WIDTH = 64,
    parameter PAYLOAD_WIDTH = AURORA_DATA_WIDTH - HEADER_WIDTH
)(
    input                                   clk,
    input                                   rst_n,
    input [DATA_WIDTH - 1:0]    data_arbiter_send,
    input [ADDR_WIDTH - 1:0]    router_dst_addr_send,
    input [HEADER_WIDTH - 1:0]              header_pkt_send,
    input                                   start_encap_pkt,
    output [AURORA_DATA_WIDTH - 1:0]    data_send,
    output                              data_encap_valid,
    output                              encap_done
);
wire [DATA_DFX_WIDTH - 1:0]            data_dfx_send;

merge_addr_data merge_addr_data_i(
    .data_arbiter_send(data_arbiter_send),
    .router_dst_addr_send(router_dst_addr_send),
    .data_dfx_send(data_dfx_send)
);
encap_packet encap_packet_i(
    .clk(clk),
    .rst_n(rst_n),
    .data_dfx_send(data_dfx_send),
    .header_pkt_send(header_pkt_send),
    .start_encap_pkt(start_encap_pkt),
    .data_send(data_send),
    .data_encap_valid(data_encap_valid),
    .encap_done(encap_done)
);
endmodule 