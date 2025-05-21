`timescale 1ns/1ps

module tb_encap_packet_top;

    // Parameters
    localparam DATA_WIDTH = 1024;
    localparam ADDR_WIDTH = 10;
    localparam DATA_DFX_WIDTH = DATA_WIDTH + ADDR_WIDTH;
    localparam RECOGNIZE_ROUTER_WIDTH = 2;
    localparam NUMBER_PACKET = 19;
    localparam TTL_WIDTH = $clog2(3);
    localparam HEADER_WIDTH = RECOGNIZE_ROUTER_WIDTH + $clog2(NUMBER_PACKET) + TTL_WIDTH;
    localparam AURORA_DATA_WIDTH = 64;
    localparam PAYLOAD_WIDTH = AURORA_DATA_WIDTH - HEADER_WIDTH;

    // Signals
    reg clk;
    reg rst_n;
    reg [DATA_DFX_WIDTH-1:0] data_dfx_send;
    reg [HEADER_WIDTH-1:0] header_pkt_send;
    reg start_encap_pkt;
    wire [AURORA_DATA_WIDTH-1:0] data_send;
    wire data_encap_valid;
    wire encap_done;
 
    reg [DATA_WIDTH - 1:0]    data_arbiter_send;
    reg [ADDR_WIDTH - 1:0]    router_dst_addr_send;
    // Instantiate DUT
    encap_packet_top #(
        .DATA_WIDTH(DATA_WIDTH),
        .ADDR_WIDTH(ADDR_WIDTH),
        .DATA_DFX_WIDTH(DATA_DFX_WIDTH),
        .RECOGNIZE_ROUTER_WIDTH(RECOGNIZE_ROUTER_WIDTH),
        .NUMBER_PACKET(NUMBER_PACKET),
        .TTL_WIDTH(TTL_WIDTH),
        .HEADER_WIDTH(HEADER_WIDTH),
        .AURORA_DATA_WIDTH(AURORA_DATA_WIDTH),
        .PAYLOAD_WIDTH(PAYLOAD_WIDTH)
    ) dut (
        .clk(clk),
        .rst_n(rst_n),
        .data_arbiter_send(data_arbiter_send),
        .router_dst_addr_send(router_dst_addr_send),
        .header_pkt_send(header_pkt_send),
        .start_encap_pkt(start_encap_pkt),
        .data_send(data_send),
        .data_encap_valid(data_encap_valid),
        .encap_done(encap_done)
    );
    parameter CLK_PERIOD = 10;
    // Clock generation
    initial clk = 1;
    always #(CLK_PERIOD/2) clk = ~clk;

    initial begin
        rst_n = 0;
        #(CLK_PERIOD*2);
        rst_n = 1;
    end

    initial begin
        start_encap_pkt = 0;
        #(CLK_PERIOD*4);
        start_encap_pkt = 1;
        data_arbiter_send = 1024'h1111111122222222333333334444444455555555666666667777777788888888111111112222222233333333444444445555555566666666777777778888888811111111222222223333333344444444555555556666666677777777888888881111111122222222333333334444444455555555666666667777777788888888;
        router_dst_addr_send = 10'b0000000001;
        header_pkt_send = 9'b10_00100_01;
        #(CLK_PERIOD);
        start_encap_pkt = 0;
    end
endmodule