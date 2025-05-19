`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/19/2025 07:30:32 AM
// Design Name: 
// Module Name: tb_output_port_0
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


module tb_output_port_0();
    parameter CLK_PERIOD = 20;
    reg clk = 1'b1;
    reg rst_n;
    wire [1023:0] data_arbiter_recv;
    reg [63:0]data_out_port_0;
    wire done_decap_pkt;
    wire [9:0] dst_addr_arbiter_recv;
    wire empty_output_queue_0;
    reg rd_output_port_0;
    wire valid_dfx_data;
    reg we_output_port_0;
    
    output_port_0_wrapper output_port_0_wrapper_i(
        .clk(clk),
        .rst_n(rst_n),
        .data_out_port_0(data_out_port_0),
        .we_output_port_0(we_output_port_0),
        .rd_output_port_0(rd_output_port_0),
        .data_arbiter_recv(data_arbiter_recv),
        .dst_addr_arbiter_recv(dst_addr_arbiter_recv),
        .empty_output_queue_0(empty_output_queue_0),
        .done_decap_pkt(done_decap_pkt),
        .valid_dfx_data(valid_dfx_data)
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
         we_output_port_0 = 0;
         #40;
         we_output_port_0 = 1;
         data_out_port_0 = 64'h11111111_22222222;
        #(CLK_PERIOD);
        data_out_port_0 = 64'h33333333_44444444;
        #(CLK_PERIOD);
        data_out_port_0 = 64'h55555555_66666666;
        #(CLK_PERIOD);
        data_out_port_0 = 64'h77777777_88888888;
        #(CLK_PERIOD);
        data_out_port_0 = 64'h99999999_AAAAAAAA;
        #(CLK_PERIOD);
        data_out_port_0 = 64'hBBBBBBBB_CCCCCCCC;
        #(CLK_PERIOD);
        data_out_port_0 = 64'hDDDDDDDD_EEEEEEEE;
        #(CLK_PERIOD);
        data_out_port_0 = 64'hFFFFFFFF_00000000;
        #(CLK_PERIOD);
        data_out_port_0 = 64'h00000000_11111111;
        #(CLK_PERIOD);
        data_out_port_0 = 64'h22222222_33333333;
        #(CLK_PERIOD);
        data_out_port_0 = 64'h44444444_55555555;
        #(CLK_PERIOD);
        data_out_port_0 = 64'h66666666_77777777;
        #(CLK_PERIOD);
        data_out_port_0 = 64'h88888888_99999999;
        #(CLK_PERIOD);
        data_out_port_0 = 64'hAAAAAAAA_BBBBBBBB;
        #(CLK_PERIOD);
        data_out_port_0 = 64'hCCCCCCCC_DDDDDDDD;
        #(CLK_PERIOD);
        data_out_port_0 = 64'hEEEEEEEE_FFFFFFFF;
        #(CLK_PERIOD);
        data_out_port_0 = 64'h00000000_11111111;
        #(CLK_PERIOD);
        data_out_port_0 = 64'h22222222_33333333;
        #(CLK_PERIOD);
        data_out_port_0 = 64'h44444444_55555555;
        #(CLK_PERIOD);
        we_output_port_0 = 0; 
        rd_output_port_0 = 1;
        #(CLK_PERIOD*19);
        we_output_port_0 = 1; 
        rd_output_port_0 = 0;
        data_out_port_0 = 64'h11111111_22222222;
        #(CLK_PERIOD);
        data_out_port_0 = 64'h33333333_44444444;
        #(CLK_PERIOD);
        data_out_port_0 = 64'h55555555_66666666;
        #(CLK_PERIOD);
        data_out_port_0 = 64'h77777777_88888888;
        #(CLK_PERIOD);
        data_out_port_0 = 64'h99999999_AAAAAAAA;
        #(CLK_PERIOD);
        data_out_port_0 = 64'hBBBBBBBB_CCCCCCCC;
        #(CLK_PERIOD);
        data_out_port_0 = 64'hDDDDDDDD_EEEEEEEE;
        #(CLK_PERIOD);
        data_out_port_0 = 64'hFFFFFFFF_00000000;
        #(CLK_PERIOD);
        data_out_port_0 = 64'h00000000_11111111;
        #(CLK_PERIOD);
        data_out_port_0 = 64'h22222222_33333333;
        #(CLK_PERIOD);
        data_out_port_0 = 64'h44444444_55555555;
        #(CLK_PERIOD);
        data_out_port_0 = 64'h66666666_77777777;
        #(CLK_PERIOD);
        data_out_port_0 = 64'h88888888_99999999;
        #(CLK_PERIOD);
        data_out_port_0 = 64'hAAAAAAAA_BBBBBBBB;
        #(CLK_PERIOD);
        data_out_port_0 = 64'hCCCCCCCC_DDDDDDDD;
        #(CLK_PERIOD);
        data_out_port_0 = 64'hEEEEEEEE_FFFFFFFF;
        #(CLK_PERIOD);
        data_out_port_0 = 64'h00000000_11111111;
        #(CLK_PERIOD);
        data_out_port_0 = 64'h22222222_33333333;
        #(CLK_PERIOD);
        data_out_port_0 = 64'h44444444_55555555;  
        #(CLK_PERIOD);
        we_output_port_0 = 0; 
        rd_output_port_0 = 1;
        #(CLK_PERIOD*20);
        //$finish; 
    end
    
endmodule

