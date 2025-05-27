module encode_packet
#(
    parameter DATA_WIDTH = 1024,
    parameter ADDR_WIDTH = 10,
    parameter DATA_DFX_WIDTH = DATA_WIDTH + ADDR_WIDTH,
    parameter NUMBER_PACKET = 19,
    parameter AURORA_DATA_WIDTH = 64
)(
    input                                   clk,
    input                                   rst_n,
    //arbiter
    input [DATA_WIDTH - 1:0]                data_arbiter_send,
    input                                   arbiter_gnt,
    //router_controller
    input                                   ctrl_encode_valid_i,
    output reg                              ctrl_encode_ready_o,
    input [ADDR_WIDTH - 1:0]                router_dst_addr_send,
    output reg                              encode_done,
    //fifo
    output reg                              encode_valid_o,
    output reg [63:0]                       data_send
);
reg [1:0] TTL = 2'b11;
reg [1:0] src_router = 2'b00;
reg [4:0] pkt_number;

reg [1:0] current_state;
reg [1:0] next_state;
parameter IDLE = 2'b00;
parameter ENCODE_PKT = 2'b01;
parameter ENCODE_PKT_DONE = 2'b10;
// arbiter
//reg [DATA_WIDTH - 1:0] data_arbiter_send_reg;
reg arbiter_gnt_next;
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        arbiter_gnt_next <= 0;
    end
    else arbiter_gnt_next <= arbiter_gnt;
end
always @(posedge clk or negedge rst_n) begin
    if(arbiter_gnt_next) begin
        data_dfx_send_reg[1033:10] <= data_arbiter_send;
    end
    else data_dfx_send_reg <= data_dfx_send_reg;
end
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        current_state <= IDLE;
        next_state <= IDLE;
    end
    else current_state <= next_state;
end

/***************************************************************
    * Next state logic
**************************************************************/
always @(*) begin
    case(current_state)
        IDLE: begin
            if(ctrl_encode_valid_i && ctrl_encode_ready_o) begin
                next_state = ENCODE_PKT;
            end
            else begin
                next_state = IDLE;
            end
        end
        ENCODE_PKT: begin
            if(pkt_number == 18) begin
                next_state = IDLE;
            end
            else begin
                next_state = ENCODE_PKT;
            end
        end
        // ENCODE_PKT_DONE: begin
        //     next_state = IDLE;
        // end
        default: begin
            next_state = IDLE;
        end
    endcase
end
/***************************************************************
 * Output logic: control signals
**************************************************************/
reg [DATA_DFX_WIDTH - 1:0] data_dfx_send_reg;
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        data_dfx_send_reg <= 0;
        ctrl_encode_ready_o <= 0;
    end
    else begin
        case (current_state)
            IDLE: begin
                if(ctrl_encode_valid_i && ctrl_encode_ready_o) begin
                    data_dfx_send_reg[9:0] <= router_dst_addr_send;
                    ctrl_encode_ready_o <= 0;
                end
                else begin
                    ctrl_encode_ready_o <= 1;
                end
            end
            default: begin
                ctrl_encode_ready_o <= 0;
            end
        endcase
    end
end
/***************************************************************
 * Output logic: fifo 
**************************************************************/
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        encode_valid_o <= 0;
        data_send <= 0;
        pkt_number <= 0;
        encode_done <= 0;
    end
    else begin
        case (current_state)
            ENCODE_PKT: begin
                encode_valid_o <= 1;
                if(pkt_number == NUMBER_PACKET - 1) begin
                    encode_done <= 1;
                    pkt_number <= 0;
                    data_send <= {11'b0, data_dfx_send_reg[1033:990], TTL, pkt_number, src_router};
                end
                else begin
                    encode_done <= 0;
                    pkt_number <= pkt_number + 1;
                    data_send <= {data_dfx_send_reg[pkt_number*55 +: 55], TTL, pkt_number, src_router};
                end
            end
            default: begin
                encode_done <= 0;
                pkt_number <= 0;
                encode_valid_o <= 0;
                data_send <= 0;
                data_send <= 0;
            end
        endcase
    end
end
endmodule