`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/17/2025 10:39:02 PM
// Design Name: 
// Module Name: tb_input_port_0
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_input_port_0();
  reg arbiter_gnt;
  reg [1023:0]data_arbiter_send;
  wire [63:0]dout;
  reg [9:0]dst_addr_arbiter_send;
  wire empty;
  reg [8:0]header_pkt_send;
  reg rd_en;
  wire ready_encap_dfx;
  
 reg clk = 1'b1;
 reg rst_n;
  input_port_0_wrapper input_port_0_wrapper_i(
        .clk(clk),
        .rst_n(rst_n),
        .arbiter_gnt(arbiter_gnt),
        .data_arbiter_send(data_arbiter_send),
        .dout(dout),
        .dst_addr_arbiter_send(dst_addr_arbiter_send),
        .empty(empty),
        .header_pkt_send(header_pkt_send),
        .rd_en(rd_en),
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
        arbiter_gnt = 0;
        rd_en = 0;
        #20;   
        arbiter_gnt = 1;
        data_arbiter_send = 1024'h111122223333444455556666777788889999111122223333444455556666777788889999111122223333444455556666777788889999111122223333444455556666777788889999111122223333444455556666777788889999111122223333444455556666777788889999;
        dst_addr_arbiter_send = 10'hA;
        header_pkt_send = 9'b100111101;
        #20;
        arbiter_gnt = 0;
        @(posedge ready_encap_dfx);
        rd_en = 1;
        #50;
 
    end
endmodule

