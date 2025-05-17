module router_controller 
#(
    parameter ADDR_WIDTH = 10,
    parameter NUMBER_PACKET = 19,
    parameter RECOGNIZE_ROUTER_WIDTH = 2,

)(
    input clk,
    input rst_n,
    ////////////total controller////////////
    input           router_start_req,
    input [ADDR_WIDTH - 1:0]     router_scr_addr,
    input [ADDR_WIDTH - 1:0]     router_dst_addr,
    output          router_done,
    ////////////crossbar////////////
    input           read_gnt,
    input           write_gnt,
    output          read_req,
    output          write_req,
    output [ADDR_WIDTH - 1:0]    addr,
////////////input port 0////////////
    input           empty_input_port_0,
    input           ready_encap_dfx,
    output reg [ADDR_WIDTH - 1:0]    router_dst_addr_send,
    output reg [8:0]    header_pkt_send,
    output reg          rd_input_port_0,
/////////////input port 1////////////
    input           empty_input_port_1
    output          rd_input_port_1,
/////////////output port 0////////////
    input           valid_dfx_data,
    input [ADDR_WIDTH - 1:0]     dst_addr_arbiter_recv,
/////////////output port 1////////////
    output          we_output_port_1
);
reg [1:0] pkt_TTL = 2'b10;
reg [$clog2(NUMBER_PACKET) - 1:0] pkt_numer;
reg [RECOGNIZE_ROUTER_WIDTH - 1:0] pkt_src_router = 2'b00;
///////////////arbiter////////////
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        read_req    <= 0;
        addr        <= 9'd0;
        router_done <= 0;
    end
    else begin
        if(router_start_req) begin
            read_req <= 1;
            addr <= router_scr_addr;
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
            addr <= 9'd0;
            router_done <= 0;
        end
    end
        
end
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
            header_input_port_0 <= {pkt_TTL, pkt_numer, pkt_src_router};
        end
        else begin
            pkt_numer <= pkt_numer;
            router_dst_addr_send <= router_dst_addr_send;
            header_input_port_0 <= header_input_port_0;
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
endmodule