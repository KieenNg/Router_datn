module decode_packet 
#(
    parameter DATA_WIDTH = 1024,
    parameter ADDR_WIDTH = 10,
    parameter DATA_DFX_WIDTH = DATA_WIDTH + ADDR_WIDTH,
    parameter AURORA_DATA_WIDTH = 64,
    parameter NUMBER_PACKET = 19
)(
    input                                   clk,
    input                                   rst_n,
    input [AURORA_DATA_WIDTH - 1:0]         data_recv,
    
    input                                   start_decode_pkt,
    output reg                              ready_decode_pkt,
    output reg                              decode_done,

    output reg                              valid_dfx_data,
    output reg [DATA_DFX_WIDTH - 1:0]       data_dfx_recv
);

reg [1:0] current_state;
reg [1:0] next_state;
parameter IDLE = 2'b00;
parameter DECODE_PKT = 2'b01;
parameter DECODE_PKT_DONE = 2'b10;

parameter ROUTER_0 = 2'b00;
parameter ROUTER_1 = 2'b01;
parameter ROUTER_2 = 2'b10;
parameter ROUTER_3 = 2'b11;
reg [DATA_DFX_WIDTH - 1:0] data_dfx_recv_router_0;
reg [DATA_DFX_WIDTH - 1:0] data_dfx_recv_router_1;
reg [DATA_DFX_WIDTH - 1:0] data_dfx_recv_router_2;
reg [DATA_DFX_WIDTH - 1:0] data_dfx_recv_router_3;

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
            if(start_decode_pkt && ready_decode_pkt) begin
                next_state = DECODE_PKT;
            end else begin
                next_state = IDLE;
            end
        end
        DECODE_PKT: begin
            if (decode_done) begin
                next_state = DECODE_PKT_DONE;
            end else begin
                next_state = DECODE_PKT;
            end
        end
        DECODE_PKT_DONE: begin
            next_state = IDLE;
        end
        default: next_state = IDLE;
    endcase
end

reg [AURORA_DATA_WIDTH - 1:0] data_recv_reg;
reg [1:0] src_router;
reg [$clog2(NUMBER_PACKET) - 1:0] pkt_number;
always @(*) begin
    pkt_number = data_recv_reg[6:2];
    src_router = data_recv_reg[1:0];
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        data_recv_reg <= 0;
    end else begin
        case(current_state)
            IDLE: begin
                if(start_decode_pkt && ready_decode_pkt) begin
                    data_recv_reg <= data_recv;
                    ready_decode_pkt <= 1'b0;
                end else begin
                    ready_decode_pkt <= 1'b1;
                end
            end
            default: begin
                ready_decode_pkt <= 1'b0;
            end
        endcase
    end
end
// always @(*) begin
//     case(current_state)
//         IDLE: begin
//             valid_dfx_data = 0;
//             data_dfx_recv = 0;
//             decode_done = 0;
//         end
//         DECODE_PKT: begin
//             decode_done = 1;
//             case(src_router)
//                 ROUTER_0: begin
//                     if (pkt_number < 18) begin
//                         data_dfx_recv_router_0[pkt_number*55 +: 55] = data_recv_reg[63:9];
//                         valid_dfx_data = 0;
//                         data_dfx_recv = 0;
//                     end else begin
//                         data_dfx_recv_router_0[1033:990] = data_recv_reg[52:9];
//                         valid_dfx_data = 1;
//                         data_dfx_recv = data_dfx_recv_router_0;
//                     end
//                 end
//                 ROUTER_1: begin
//                     if (pkt_number < 18) begin
//                         data_dfx_recv_router_1[pkt_number*55 +: 55] = data_recv_reg[63:9];
//                         valid_dfx_data = 0;
//                         data_dfx_recv = 0;
//                     end else begin
//                         data_dfx_recv_router_1[1033:990] = data_recv_reg[52:9];
//                         valid_dfx_data = 1;
//                         data_dfx_recv = data_dfx_recv_router_1;
//                     end
//                 end
//                 ROUTER_2: begin
//                     if (pkt_number < 18) begin
//                         data_dfx_recv_router_2[pkt_number*55 +: 55] = data_recv_reg[63:9];
//                         valid_dfx_data = 0;
//                         data_dfx_recv = 0;
//                     end else begin
//                         data_dfx_recv_router_2[1033:990] = data_recv_reg[52:9];
//                         valid_dfx_data = 1;
//                         data_dfx_recv = data_dfx_recv_router_2;
//                     end
//                 end
//                 ROUTER_3: begin
//                     if (pkt_number < 18) begin
//                         data_dfx_recv_router_3[pkt_number*55 +: 55] = data_recv_reg[63:9];
//                         valid_dfx_data = 0;
//                         data_dfx_recv = 0;
//                     end else begin
//                         data_dfx_recv_router_3[1033:990] = data_recv_reg[52:9];
//                         valid_dfx_data = 1;
//                         data_dfx_recv = data_dfx_recv_router_3;
//                     end
//                 end
//                 default: begin
//                     data_dfx_recv_router_0 = data_dfx_recv_router_0;
//                     data_dfx_recv_router_1 = data_dfx_recv_router_1;
//                     data_dfx_recv_router_2 = data_dfx_recv_router_2;
//                     data_dfx_recv_router_3 = data_dfx_recv_router_3;
//                     valid_dfx_data = 0;
//                     data_dfx_recv = 0;
//                 end
//             endcase
//         end
//         DECODE_PKT_DONE: begin
//             valid_dfx_data = 0;
//             data_dfx_recv = 0;
//             decode_done = 0;
//         end
//         default: begin
//         end
//     endcase
// end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        data_dfx_recv_router_0 <= 0;
        data_dfx_recv_router_1 <= 0;
        data_dfx_recv_router_2 <= 0;
        data_dfx_recv_router_3 <= 0;
        valid_dfx_data <= 0;
        data_dfx_recv <= 0;
        decode_done <= 0;
    end
    case(current_state)
        IDLE: begin
            valid_dfx_data <= 0;
            data_dfx_recv <= 0;
            decode_done <= 0;
        end
        DECODE_PKT: begin
            decode_done <= 1;
            case(src_router)
                ROUTER_0: begin
                    if (pkt_number < 18) begin
                        data_dfx_recv_router_0[pkt_number*55 +: 55] <= data_recv_reg[63:9];
                        valid_dfx_data <= 0;
                        data_dfx_recv <= 0;
                    end else begin
                        data_dfx_recv_router_0[1033:990] <= data_recv_reg[52:9];
                        valid_dfx_data <= 1;
                        data_dfx_recv <= data_dfx_recv_router_0;
                    end
                end
                ROUTER_1: begin
                    if (pkt_number < 18) begin
                        data_dfx_recv_router_1[pkt_number*55 +: 55] <= data_recv_reg[63:9];
                        valid_dfx_data <= 0;
                        data_dfx_recv <= 0;
                    end else begin
                        data_dfx_recv_router_1[1033:990] <= data_recv_reg[52:9];
                        valid_dfx_data <= 1;
                        data_dfx_recv <= data_dfx_recv_router_1;
                    end
                end
                ROUTER_2: begin
                    if (pkt_number < 18) begin
                        data_dfx_recv_router_2[pkt_number*55 +: 55] <= data_recv_reg[63:9];
                        valid_dfx_data <= 0;
                        data_dfx_recv <= 0;
                    end else begin
                        data_dfx_recv_router_2[1033:990] <= data_recv_reg[52:9];
                        valid_dfx_data <= 1;
                        data_dfx_recv <= data_dfx_recv_router_2;
                    end
                end
                ROUTER_3: begin
                    if (pkt_number < 18) begin
                        data_dfx_recv_router_3[pkt_number*55 +: 55] <= data_recv_reg[63:9];
                        valid_dfx_data <= 0;
                        data_dfx_recv <= 0;
                    end else begin
                        data_dfx_recv_router_3[1033:990] <= data_recv_reg[52:9];
                        valid_dfx_data <= 1;
                        data_dfx_recv <= data_dfx_recv_router_3;
                    end
                end
                default: begin
                    data_dfx_recv_router_0 <= data_dfx_recv_router_0;
                    data_dfx_recv_router_1 <= data_dfx_recv_router_1;
                    data_dfx_recv_router_2 <= data_dfx_recv_router_2;
                    data_dfx_recv_router_3 <= data_dfx_recv_router_3;
                    valid_dfx_data <= 0;
                    data_dfx_recv <= 0;
                end
            endcase
        end
        DECODE_PKT_DONE: begin
            valid_dfx_data <= 0;
            data_dfx_recv <= 0;
            decode_done <= 0;
        end
        default: begin
        end
    endcase
end

// always @(posedge clk or negedge rst_n) begin
//     if(!rst_n) begin
//         decode_done <= 0;
//     end else begin
//         case(current_state)
//             DECODE_PKT_DONE: begin
//                 decode_done <= 1;
//             end
//             default: begin
//                 decode_done <= 0;
//             end
//         endcase
//     end
// end
endmodule