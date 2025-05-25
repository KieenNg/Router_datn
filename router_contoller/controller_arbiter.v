`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/21/2025 10:47:17 PM
// Design Name: 
// Module Name: controller_arbiter
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


module controller_arbiter
#(
    parameter DATA_WIDTH = 1024,
    parameter ADDR_WIDTH = 10,
    parameter DATA_DFX_WIDTH = DATA_WIDTH + ADDR_WIDTH,
    parameter AURORA_DATA_WIDTH = 64,
    parameter NUMBER_PACKET = 19,
    parameter RECOGNIZE_ROUTER_WIDTH = 2
)(
    input clk,
    input rst_n,
    ////////////total controller////////////
    input                           router_start_req,
    input [ADDR_WIDTH - 1:0]        router_scr_addr,
    input [ADDR_WIDTH - 1:0]        router_dst_addr,
    output reg         router_done,
    ////////////arbiter////////////
//    input                           arbiter_read_gnt,
//    input                           arbiter_write_gnt,
//    output reg                      arbiter_read_req,
//    output reg                      arbiter_write_req,
//    output reg [ADDR_WIDTH - 1:0]   arbiter_src_addr,
//    output reg [ADDR_WIDTH - 1:0]   arbiter_dst_addr,
////crossbar//////
    input [AURORA_DATA_WIDTH - 1:0]         data_port1_before,
    output reg [AURORA_DATA_WIDTH - 1:0]    data_port1_after,
    output reg [1:0]                        control_crossbar,
////////////input port 0////////////
    input                           empty_input_port_0,
    input                           encap_done,
    output reg                      start_encap_pkt,
    output reg [ADDR_WIDTH - 1:0]   router_dst_addr_send,
    output reg [8:0]                header_pkt_send,
    output reg                      rd_input_port_0,
/////////////input port 1////////////
    input               empty_input_port_1,
    output reg          rd_input_port_1,
/////////////output port 0////////////
    input                           empty_output_port_0,
    input                           decap_done,
    input                           empty_arbiter_fifo,
    input [ADDR_WIDTH - 1:0]        dst_addr_arbiter_recv,

    output reg                      start_decap_pkt,
    output reg                      rd_output_port_0,
    output reg                      we_output_port_0,
    output reg                      read_arbiter_fifo,
/////////////output port 1////////////
    output reg                      we_output_port_1
);
    wire                           arbiter_read_gnt;
    wire                           arbiter_write_gnt;
    wire                        arbiter_read_req;
    wire                        arbiter_write_req;
    wire [ADDR_WIDTH - 1:0]     arbiter_src_addr;
    wire [ADDR_WIDTH - 1:0]     arbiter_dst_addr;
    wire  [DATA_WIDTH-1:0] data_arbiter_send;
    wire [DATA_WIDTH-1:0] data_arbiter_recv;
    
    arbiter_bram arbiter_bram_i(
        .clk(clk),
        .rst_n(rst_n),
        .src_addr(arbiter_src_addr),
        .data_arbiter_send(data_arbiter_send),
        .read_req(arbiter_read_req),
        .read_gnt(arbiter_read_gnt),
        .dst_addr(arbiter_dst_addr),
        .data_arbiter_recv(data_arbiter_recv),
        .write_req(arbiter_write_req),
        .write_gnt(arbiter_write_gnt)
    );
    router_controller router_controller_i (
    
    );
endmodule
