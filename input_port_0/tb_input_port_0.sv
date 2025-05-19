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
  reg arbiter_gnt_0;
  reg [1023:0]data_arbiter_send_0;
  wire [63:0]dout_0;
  reg [9:0]dst_addr_arbiter_send_0;
  wire empty_0;
  reg [8:0]header_pkt_send_0;
  reg rd_en_0;
  wire ready_encap_dfx_0;
  
 reg clk_0 = 1'b1;
 reg rst_n_0;
  input_port_0_wrapper input_port_0_wrapper_i(
        .clk_0(clk_0),
        .rst_n_0(rst_n_0),
        .arbiter_gnt_0(arbiter_gnt_0),
        .data_arbiter_send_0(data_arbiter_send_0),
        .dout_0(dout_0),
        .dst_addr_arbiter_send_0(dst_addr_arbiter_send_0),
        .empty_0(empty_0),
        .header_pkt_send_0(header_pkt_send_0),
        .rd_en_0(rd_en_0),
        .ready_encap_dfx_0(ready_encap_dfx_0)
    );
    
    initial begin
        forever #10 clk_0 = !clk_0;
    end
     
    initial begin
        rst_n_0 = 0;
        #20;
        rst_n_0 = 1;
    end
    
    initial begin 
        arbiter_gnt_0 = 0;
        rd_en_0 = 0;
        #20;   
        arbiter_gnt_0 = 1;
        data_arbiter_send_0 = 1024'h111122223333444455556666777788889999111122223333444455556666777788889999111122223333444455556666777788889999111122223333444455556666777788889999111122223333444455556666777788889999111122223333444455556666777788889999;
        dst_addr_arbiter_send_0 = 10'hA;
        header_pkt_send_0 = 9'b100111101;
        #20;
        arbiter_gnt_0 = 0;
        @(posedge ready_encap_dfx_0);
        rd_en_0 = 1;
        #50;
 
    end
endmodule

