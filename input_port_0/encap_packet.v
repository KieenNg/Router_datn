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
    input                                   start_encap_pkt,
    output reg [AURORA_DATA_WIDTH - 1:0]    data_send,
    output reg                              data_encap_valid,
    output reg                              encap_done
);
parameter IDLE = 1'b0;
parameter ENCAP_PKT = 1'b1;
reg [DATA_DFX_WIDTH - 1:0] data_dfx_send_reg;
reg [HEADER_WIDTH - 1:0] header_pkt_send_reg;

reg current_state;
reg next_state;

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        data_dfx_send_reg <= 0;
        header_pkt_send_reg <= 0;
    end else begin
        if(start_encap_pkt) begin
            data_dfx_send_reg <= data_dfx_send;
            header_pkt_send_reg <= header_pkt_send;
        end
        else begin
            data_dfx_send_reg <= data_dfx_send_reg;
            header_pkt_send_reg <= header_pkt_send_reg;
        end
    end
end
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        current_state <= IDLE;
        next_state <= IDLE;
    end else begin
        current_state <= next_state;
    end
end
always @(*) begin
    case(current_state)
        IDLE: begin
            if(start_encap_pkt) begin
                next_state = ENCAP_PKT;
            end else begin
                next_state = IDLE;
            end
        end
        ENCAP_PKT: begin
            if(encap_done) begin
                next_state = IDLE;
            end else begin
                next_state = ENCAP_PKT;
            end
        end
        default: next_state = IDLE;
    endcase
end
reg [$clog2(19)-1:0] index = 0;
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
            data_send <= 64'h0;
            data_encap_valid <= 0;
            encap_done <= 0;
            index <= 0;
    end else begin
        case (current_state)
            IDLE: begin
                data_send <= 64'h0;
                data_encap_valid <= 0;
                encap_done <= 0;
                index <= 0;
            end
            ENCAP_PKT: begin
                if(index < 19) begin
                    data_encap_valid <= 1;
                    //encap_done <= 0;
                    index <= index + 1;
                    if(index == 18) begin
                        data_send <= {11'b0, data_dfx_send_reg[1023:990], header_pkt_send_reg};
                        encap_done <= 1;
                    end else begin
                        data_send <= {data_dfx_send_reg[index*55 +:55], header_pkt_send_reg};
                        encap_done <= 0;
                    end
                end else begin
                    data_send <= 0;
                    data_encap_valid <= 0;
                    encap_done <= 0;
                    index <= 0;
                end
            end
            default: begin
                data_send <= 0;
                data_encap_valid <= 0;
                encap_done <= 0;
                index <= 0;
            end
        endcase
    end
end


endmodule