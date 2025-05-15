`timescale 1ns/1ps

module tb_encap_packet;

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
    reg arbiter_gnt;
    wire [AURORA_DATA_WIDTH-1:0] data_in_port_0;
    wire data_encap_valid;

    // Instantiate DUT
    encap_packet #(
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
        .data_dfx_send(data_dfx_send),
        .header_pkt_send(header_pkt_send),
        .arbiter_gnt(arbiter_gnt),
        .data_in_port_0(data_in_port_0),
        .data_encap_valid(data_encap_valid)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk;

    // Test procedure
    initial begin
        rst_n = 0;
        data_dfx_send = 0;
        header_pkt_send = 0;
        arbiter_gnt = 0;
        #20;
        rst_n = 1;
        #10;

        // Test vector 1: All zeros
        data_dfx_send = {DATA_DFX_WIDTH{1'b0}};
        header_pkt_send = {HEADER_WIDTH{1'b0}};
        arbiter_gnt = 1;
        #10;
        arbiter_gnt = 0;
        #100;

        // Test vector 2: All ones
        data_dfx_send = {DATA_DFX_WIDTH{1'b1}};
        header_pkt_send = {HEADER_WIDTH{1'b1}};
        arbiter_gnt = 1;
        #10;
        arbiter_gnt = 0;
        #100;

        // Test vector 3: Patterned data
        data_dfx_send = {1024'hA5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5, 10'h2AA};
        header_pkt_send = {HEADER_WIDTH{1'b0}} | 7'h55;
        arbiter_gnt = 1;
        #10;
        arbiter_gnt = 0;
        #200;

        // Test vector 4: Random data
        data_dfx_send = $random;
        header_pkt_send = $random;
        arbiter_gnt = 1;
        #10;
        arbiter_gnt = 0;
        #200;

        $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time=%0t | rst_n=%b | arbiter_gnt=%b | data_encap_valid=%b | data_in_port_0=0x%h", 
            $time, rst_n, arbiter_gnt, data_encap_valid, data_in_port_0);
    end

endmodule