module encap_packet
#(
    parameter DATA_WIDTH = 1024,
    parameter ADDR_WIDTH = 10,
    parameter DATA_DFX_WIDTH = DATA_WIDTH + ADDR_WIDTH, //1034
    parameter RECOGNIZE_ROUTER_WIDTH = 2,
    parameter NUMBER_PACKET = 19,
    parameter TTL_WIDTH = $clog2(3), //2
    parameter HEADER_WIDTH = RECOGNIZE_ROUTER_WIDTH + $clog2(NUMBER_PACKET) + TTL_WIDTH, //9
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

reg[4:0] index;

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        data_dfx_send_reg <= 0;
        header_pkt_send_reg <= 0;
        ready_encap_dfx <= 0;
        index <= 0;
    end else begin
        if (arbiter_gnt) begin
            data_dfx_send_reg <= data_dfx_send;
            header_pkt_send_reg <= header_pkt_send;
        end else begin
            data_dfx_send_reg <= data_dfx_send_reg;
            header_pkt_send_reg <= header_pkt_send_reg;
        end
    end
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        data_in_port_0 <= 64'b0;
        data_encap_valid <= 0;

    end else begin
        if(data_dfx_send_reg == 1034'b0) begin
            data_encap_valid <= 0;
            data_in_port_0 <= 64'b0;
            ready_encap_dfx <=1;

        end else 
        
         begin
            data_in_port_0 <= {data_dfx_send_reg[54:0], header_pkt_send_reg};
            data_dfx_send_reg <= {55'b0, data_dfx_send_reg[DATA_DFX_WIDTH - 1:55]};
            data_encap_valid <= 1;
            ready_encap_dfx <= 0;
            index <= index + 1;
        end
    end
end

always @(posedge clk or negedge rst_n) begin
    if(index > (DATA_DFX_WIDTH/(AURORA_DATA_WIDTH - HEADER_WIDTH)))
            begin
                data_encap_valid <= 0;
                data_in_port_0 <= 64'b0;
                ready_encap_dfx <=1;
            end
end

endmodule