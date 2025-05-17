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
    reg clk = 0;
    reg rst_n;
    reg [DATA_DFX_WIDTH-1:0] data_dfx_send;
    reg [HEADER_WIDTH-1:0] header_pkt_send;
    reg arbiter_gnt;
    wire [AURORA_DATA_WIDTH-1:0] data_in_port_0;
    wire data_encap_valid;
    wire ready_encap_dfx;
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
        .data_encap_valid(data_encap_valid),
        .ready_encap_dfx(ready_encap_dfx)
    );

    initial begin
        forever #10 clk = !clk;
    end
     
    initial begin
        rst_n = 0;
        #20;
        rst_n = 1;
    end
    
    initial begin 
        arbiter_gnt = 1'b0;
        #20;
        arbiter_gnt = 1'b1;
        data_dfx_send = 1034'h111122223333444455556666777788889999111122223333444455556666777788889999111122223333444455556666777788889999111122223333444455556666777788889999111122223333444455556666777788889999111122223333444455556666777788889999;
        header_pkt_send = 9'b10_01111_01;
        #20;
        arbiter_gnt = 1'b0;
        @(posedge ready_encap_dfx);
        #20;
        arbiter_gnt = 1'b1;
        data_dfx_send = 1034'h777888899991111222233334444555566667777888899991111222233334444555566667777888899991111222233334444555566667777888899991111222233334444555566667777888899991111222233334444555566667777888899991111222233334444555566667;
        header_pkt_send = 9'b11_01100_01;
        #20;
        arbiter_gnt = 1'b0;
        @(posedge ready_encap_dfx);
        
        
        #20;
        // arbiter_gnt = 1'b1;
        // data_dfx_send = 1034'h777888899991111222233334444555566667777888899991111222233334444555566667777888899991111222233334444555566667777888899991111222233334444555566667777888899991111222233334444555566667777888899991111222233334444555566667;
        // header_pkt_send = 9'b11_01100_01;
        // wait(ready_encap_dfx);
        // arbiter_gnt = 1'b0;
        // #20;
        // arbiter_gnt = 1'b1;
        // data_dfx_send = 1034'h444222233334444555566667755556666777788889999111122277788889199911112222333344445555666677778888999911112222333344445555666677778888999911112222333342333344445555666677778888999911177888899991111222233334444555566667;
        // header_pkt_send = 9'b11_01100_01;
        // wait(ready_encap_dfx);
        // arbiter_gnt = 1'b0;
        // #20;
        // #500;

    end

endmodule