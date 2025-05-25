`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/21/2025 11:03:27 PM
// Design Name: 
// Module Name: tb_input_o_arbiter
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


module tb_input_o_arbiter;
    reg clk;
    reg [9:0] router_dst_addr;
    reg [9:0] router_scr_addr;
    reg router_start_req;
    reg rst_n;
    reg [63:0] aurora_rx_tdata;
    reg aurora_rx_tvalid;
    wire router_done;
    input_0_arbiter_wrapper input_0_arbiter_wrapper_i(
        //.aurora_rx_tdata(aurora_rx_tdata),
        //.aurora_rx_tvalid(aurora_rx_tvalid),
        .router_done(router_done),
        .clk(clk),
        .router_dst_addr(router_dst_addr),
        .router_scr_addr(router_scr_addr),
        .router_start_req(router_start_req),
        .rst_n(rst_n)
    );
    parameter CLK_PERIOD = 10;
    initial begin
        clk = 1;
        forever #(CLK_PERIOD/2) clk = ~clk;
    end
    initial begin
        rst_n = 0;
        #(CLK_PERIOD*2);
        rst_n = 1;
    end
     initial begin 
         router_start_req = 0;
         #(CLK_PERIOD*4);
         router_start_req = 1;
         router_scr_addr = 10'h1;
         router_dst_addr = 10'h5;
         #(CLK_PERIOD*1);  
         router_start_req = 0;
         router_scr_addr = 10'h0;
         router_dst_addr = 10'h0;
         @(posedge router_done)
         #(CLK_PERIOD*10);
         router_start_req = 1;
         router_scr_addr = 10'h2;
         router_dst_addr = 10'h6;
         #(CLK_PERIOD*1);  
         router_start_req = 0;
         router_scr_addr = 10'h0;
         router_dst_addr = 10'h0;
         @(posedge router_done)
         #(CLK_PERIOD*30);
         router_start_req = 1;
         router_scr_addr = 10'h0;
         router_dst_addr = 10'h4;
         #(CLK_PERIOD*1);  
         router_start_req = 0;
         router_scr_addr = 10'h0;
         router_dst_addr = 10'h0;
         @(posedge router_done)

         #(CLK_PERIOD*50)
         $finish;
     end 
//    initial begin 
//        aurora_rx_tvalid = 0;
//        aurora_rx_tdata = 64'h0;
//        #(CLK_PERIOD*4);
//        aurora_rx_tvalid = 1;
//        aurora_rx_tdata = 64'hbbbc444444400b80;

//        #(CLK_PERIOD*200);
//        $finish;
//    end 
     initial begin
         $monitor("Time=%0t | data_arbiter = 0x%h", 
             $time, input_0_arbiter_wrapper.input_0_arbiter_i.separate_addr_data_0.data_arbiter_recv);
     end
endmodule
