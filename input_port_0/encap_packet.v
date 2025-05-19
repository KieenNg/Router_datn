module encap_packet
#(
    parameter DATA_WIDTH = 1024,
    parameter ADDR_WIDTH = 10,
    parameter DATA_DFX_WIDTH = DATA_WIDTH + ADDR_WIDTH,
    parameter RECOGNIZE_ROUTER_WIDTH = 2,
    parameter NUMBER_PACKET = 19,
    parameter TTL_WIDTH = $clog2(3),
    parameter HEADER_WIDTH = RECOGNIZE_ROUTER_WIDTH + $clog2(NUMBER_PACKET) + TTL_WIDTH,
    parameter AURORA_DATA_WIDTH = 64,
    parameter PAYLOAD_WIDTH = AURORA_DATA_WIDTH - HEADER_WIDTH
)(
    input                                   clk,
    input                                   rst_n,
    input [DATA_DFX_WIDTH - 1:0]            data_dfx_send,
    input [HEADER_WIDTH - 1:0]              header_pkt_send,
    input                                   arbiter_gnt,
    output reg [AURORA_DATA_WIDTH - 1:0]    data_in_port_0,
    output reg                              data_encap_valid,
    output reg                              ready_encap_dfx
);
reg [DATA_DFX_WIDTH - 1:0] data_dfx_send_reg;
reg [HEADER_WIDTH - 1:0] header_pkt_send_reg;
reg [$clog2(19)-1:0] index;
reg start_encap_dfx;

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        data_in_port_0 <= 64'b0;
        data_encap_valid <= 0;
        ready_encap_dfx <= 1;
        index <= 0;
        data_dfx_send_reg <= 1034'b0;
        header_pkt_send_reg <= 9'b0;
        start_encap_dfx <= 0;
    end else begin
        if(arbiter_gnt) begin
            data_dfx_send_reg <= data_dfx_send;
            header_pkt_send_reg <= header_pkt_send;
            start_encap_dfx <= 1;
            index <= 0;
            ready_encap_dfx <= 0;
            data_encap_valid <= 0;
            data_in_port_0 <= 64'b0;
        end else if (start_encap_dfx) begin
            if(index < 19) begin
                ready_encap_dfx <= 0;
                data_encap_valid <= 1;
                data_in_port_0 <= {data_dfx_send_reg[index*55+:55], header_pkt_send_reg};
                index <= index + 1;
            end else begin
                ready_encap_dfx <= 1;
                data_in_port_0 <= 64'b0;
                data_encap_valid <= 0;
                index <= 0;
                start_encap_dfx <= 0; // Reset start_encap_dfx after processing
            end
        end 
    end
end

endmodule