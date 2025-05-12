module serializer
#(
    parameter NUMER_OF_LANE = 1,
    parameter AURORA_DATA_WIDTH = 64*NUMER_OF_LANE,
    parameter SEND_DATA_WIDTH = 1024,
    parameter RECOGNIZE_HEADER_WIDTH = 1,
    parameter RECOGNIZE_ROUTER_WIDTH = 2,
    parameter HOST_PAYLOAD_WIDTH = AURORA_DATA_WIDTH-RECOGNIZE_HEADER_WIDTH-RECOGNIZE_ROUTER_WIDTH,
    parameter NUMBER_PACKET = SEND_DATA_WIDTH/HOST_PAYLOAD_WIDTH + 1, //17
    parameter ADDR_WIDTH = 10,
    parameter NUMBER_OF_TTL = 1,
    parameter TTL_WIDTH = $clog2(NUMBER_OF_TTL)
)(
    input                     clk,
    input                     rst_n,
    input                               send_data_valid,
    input [SEND_DATA_WIDTH-1:0]         v_data_read,
    input [ADDR_WIDTH - 1:0]            dst_addr_send,
    input [1:0]                         TTL_send,
    input [1:0]                         router_id_send,

    output reg                          axis_tx_tvalid,
    output reg                          axis_tx_tlast,
    output reg [AURORA_DATA_WIDTH-1:0]  axis_tx_tdata,
    output reg                          done_serializer
);
// State machine for serializer
reg current_state;
reg next_state;

localparam IDLE = 2'b00;
localparam SEND_HEADER = 2'b01;
localparam SEND_PAYLOAD = 2'b10;
localparam DONE = 2'b11;

reg [$clog2(NUMBER_PACKET) - 1:0]frame_count;

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        current_state <= 0;
    end else begin
        current_state <= next_state;
    end
end
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        axis_tx_tvalid <= 0;
        axis_tx_tlast <= 0;
        axis_tx_tdata <= 0;
        done_serializer <= 0;
        frame_count <= 0;
    end else begin
        case (current_state)
            IDLE: begin
                if(send_data_valid)begin
                    next_state <= SEND_HEADER;
                end
                else begin
                    next_state <= IDLE;
                end
            end
            SEND_HEADER: begin
                axis_tx_tvalid <= 1;
                axis_tx_tlast <= 0;
                axis_tx_tdata <= {49'b0, dst_addr_send, TTL_send, router_id_send, 1'b1};
                done_serializer <= 0;
                frame_count <= frame_count + 1;
                next_state <= SEND_PAYLOAD;
            end
            SEND_PAYLOAD: begin
                if(frame_count == NUMBER_PACKET) begin
                    axis_tx_tlast <= 1;
                end else begin
                    axis_tx_tlast <= 0;
                end
                if(frame_count == NUMBER_PACKET) begin
                    frame_count <= 0;
                    next_state <= DONE;
                end else begin
                    frame_count <= frame_count + 1;
                    next_state <= SEND_PAYLOAD;
                end

                axis_tx_tvalid <= 1;
                axis_tx_tdata <= {v_data_read[(frame_count)],router_id_send,1'b0};
                done_serializer <= 0;
                if (send_data_valid) begin
                    next_state <= SEND_PAYLOAD;
                end else begin
                    next_state <= DONE;
                end
            end
            DONE: begin
                axis_tx_tvalid <= 0;
                axis_tx_tlast <= 1;
                axis_tx_tdata <= 0;
                done_serializer <= 1;
                next_state <= IDLE;
            end
        endcase
    end
end
endmodule