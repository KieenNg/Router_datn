module router_controller
#(
    parameter AURORA_DATA_WIDTH = 64,
    parameter ADDR_WIDTH = 10,
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
    input                           read_gnt,
    input                           write_gnt,
    output reg                      read_req,
    output reg                      write_req,
    output reg [ADDR_WIDTH - 1:0]   arbiter_src_addr,
    output reg [ADDR_WIDTH - 1:0]   arbiter_dst_addr,
////crossbar//////
    input [AURORA_DATA_WIDTH - 1:0]         data_port1_before,
    output reg [AURORA_DATA_WIDTH - 1:0]    data_port1_after,
    output reg [1:0]                        control_crossbar,
////////////input port 0////////////
    input                           empty_input_port_0,
    input                           ready_encap_dfx,
    output reg [ADDR_WIDTH - 1:0]   router_dst_addr_send,
    output reg [8:0]                header_pkt_send,
    output reg                      rd_input_port_0,
/////////////input port 1////////////
    input               empty_input_port_1,
    output reg          rd_input_port_1,
/////////////output port 0////////////
    input                           valid_dfx_data,
    input [ADDR_WIDTH - 1:0]        dst_addr_arbiter_recv,
    output reg                      rd_output_port_0,
    output reg                      we_output_port_0,
/////////////output port 1////////////
    output reg                      we_output_port_1
);
reg [1:0] pkt_TTL = 2'b10;
reg [$clog2(NUMBER_PACKET) - 1:0] pkt_numer;
reg [RECOGNIZE_ROUTER_WIDTH - 1:0] pkt_src_router = 2'b00;
///////////////arbiter////////////
reg next_state;
parameter IDLE = 3'b000;
parameter READ = 3'b001;
parameter READDELAY = 3'b010;
parameter ROUTER_PROC = 3'b011;
parameter ROUTER_PROCDELAY = 3'b100;
always @(*) begin
    case(state)
        IDLE: begin
            next_state = router_start_req? READ : IDLE;
        end
        READ: begin
            next_state = read_gnt? READDELAY : READ;
        end
        READDELAY: begin
            next_state = ROUTER_PROC;
        end
        ROUTER_PROC: begin
            next_state = router_done? ROUTER_PROCDELAY : ROUTER_PROC;
        end

    endcase
end
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        read_req    <= 0;
        arbiter_src_addr        <= 9'd0;
        router_done <= 0;
    end
    else begin
        if(router_start_req) begin
            read_req <= 1;
            arbiter_src_addr <= router_scr_addr;
            if(read_gnt) begin
                read_req <= 0;
                router_done <= 1;
            end
            else begin
                router_done <= 0;
            end
        end
        else begin
            read_req <= 0;
            arbiter_src_addr <= 9'd0;
            router_done <= 0;
        end
    end  
end
/////input port 0//////////
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        pkt_numer   <= 1'b0;
        router_dst_addr_send <= 0;
        header_pkt_send <= 0;
    end
    else begin
        if(ready_encap_dfx) begin
            if(pkt_numer == NUMBER_PACKET) begin
                pkt_numer <= 1'b1;
            end
            else begin
                pkt_numer <= pkt_numer + 1;
            end
            router_dst_addr_send <= router_dst_addr;
            header_pkt_send <= {pkt_TTL, pkt_numer, pkt_src_router};
        end
        else begin
            pkt_numer <= pkt_numer;
            router_dst_addr_send <= router_dst_addr_send;
            header_pkt_send <= header_pkt_send;
        end

    end
end
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        rd_input_port_0 <= 0;
    end
    else begin
        if(!empty_input_port_0) begin
            rd_input_port_0 <= 1;
        end
        else begin
            rd_input_port_0 <= 0;
        end
    end
end
/////input port 1/////////
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        rd_input_port_1 <= 0;
    end
    else begin
        if(!empty_input_port_1) begin
            rd_input_port_1 <= 1;
        end
        else begin
            rd_input_port_1 <= 0;
        end
    end
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        data_port1_after <= 63'b0;
        control_crossbar <= 2'b00;
        we_output_port_0 <= 0;
        we_output_port_1 <= 0;
    end
    else begin
        if(!empty_input_port_0) begin
            data_port1_after <= data_port1_after;
            control_crossbar <= 2'b01;
            we_output_port_0 <= 0;
            we_output_port_1 <= 1;
        end
        else if(!empty_input_port_1) begin
            if(data_port1_before[8:7] > 1)begin
                data_port1_after[8:7] <= data_port1_before[8:7] - 1;
                data_port1_after[63:9] <= data_port1_before[63:9];
                data_port1_after[6:0] <= data_port1_before[6:0];
                control_crossbar <= 2'b11;
                we_output_port_0 <= 1;
                we_output_port_1 <= 1;
            end
            else if(data_port1_before[8:7] == 1) begin
                data_port1_after[8:7] <= 0;
                data_port1_after[63:9] <= data_port1_before[63:9];
                data_port1_after[6:0] <= data_port1_before[6:0];
                control_crossbar <= 2'b10;
                we_output_port_0 <= 1;
                we_output_port_1 <= 0;
            end
            else begin
                data_port1_after <= 63'b0;
                control_crossbar <= 2'b00;
                we_output_port_0 <= 0;
                we_output_port_1 <= 0;
            end
        end
        else begin
            data_port1_after <= 63'b0;
            control_crossbar <= 2'b00;
            we_output_port_0 <= 0;
            we_output_port_1 <= 0;
        end
    end
end
/////output port 0/////////
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        rd_output_port_0 <= 0;
        write_req <= 0;
        arbiter_dst_addr <= 0;
    end
    else begin
        if(valid_dfx_data) begin
            write_req <= 1;
            if(write_gnt) begin
                write_req <= 0;
                rd_output_port_0 <= 1;
                arbiter_dst_addr <= dst_addr_arbiter_recv;
            end
            else begin
                write_req <= 0;
                rd_output_port_0 <= 0;
                arbiter_dst_addr <= dst_addr_arbiter_recv;
            end
        end
        else begin
            write_req <= 0;
            rd_output_port_0 <= 0;
            arbiter_dst_addr <= 0;
        end
    end
end
endmodule