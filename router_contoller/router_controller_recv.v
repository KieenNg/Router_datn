module router_controller_recv
#(
    parameter DATA_WIDTH = 1024,
    parameter ADDR_WIDTH = 10,
    parameter DATA_DFX_WIDTH = DATA_WIDTH + ADDR_WIDTH,
    parameter NUMBER_PACKET = 19,
    parameter AURORA_DATA_WIDTH = 64
)(
    input                                   clk,
    input                                   rst_n,
    //////////////////packet fifo/////////////////////////
    input                                   empty_pkt_fifo,
    output reg                              read_pkt_fifo,
    /////////////////decode packet///////////////////////
    input                           ready_decode_pkt,
    output reg                      start_decode_pkt,
    input                           decode_done,
    /////////////arbiter data fifo/////////////////////
    input                        empty_arbiter_fifo,
    output reg                 read_arbiter_fifo,
    ////////////////////arbiter///////////////////////////
    input                           arbiter_write_gnt,
    output reg                      arbiter_write_req
);
reg [1:0] current_state;
reg [1:0] next_state;

parameter IDLE = 2'b00;
parameter READ_PKT = 2'b01;
parameter DECODE_PKT = 2'b10;
parameter WRITE_ARBITER = 2'b11;

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
            if(!empty_arbiter_fifo)begin
                next_state = WRITE_ARBITER;
            end else if(!empty_pkt_fifo) begin
                next_state = READ_PKT;
            end else begin
                next_state = IDLE;
            end
        end
        READ_PKT: begin
            next_state = DECODE_PKT;
        end
        DECODE_PKT: begin
            if(decode_done) begin
                next_state = IDLE;
            end else begin
                next_state = DECODE_PKT;
            end
        end
        WRITE_ARBITER: begin
            if(arbiter_write_gnt) begin
                next_state = IDLE;
            end else begin
                next_state = WRITE_ARBITER;
            end
        end
        default: next_state = IDLE;
    endcase 
end
// write arbiter interface
always @(*) begin
    case (current_state)
        IDLE: begin
            if(!empty_arbiter_fifo) begin
                arbiter_write_req = 1'b1;
            end else begin
                arbiter_write_req = 1'b0;
            end
        end
        WRITE_ARBITER: begin
            if(arbiter_write_gnt) begin
                read_arbiter_fifo = 1'b1;
            end else begin
                read_arbiter_fifo = 1'b0;
            end
        end
        default: begin
            arbiter_write_req = 1'b0;
            read_arbiter_fifo = 1'b0;
        end
    endcase
end
// packet fifo interface
always @(*) begin
    case (current_state)
        IDLE: begin
            read_pkt_fifo = 1'b0;
        end
        READ_PKT: begin
            read_pkt_fifo = 1'b1;
        end
        DECODE_PKT: begin
            read_pkt_fifo = 1'b0;
        end
        default: begin
            read_pkt_fifo = 1'b0;
        end
    endcase
end
//decode interface
always @(*) begin
    case (current_state)
        IDLE: begin
            start_decode_pkt = 1'b0;
        end
        READ_PKT: begin
            start_decode_pkt = 1'b0;
        end
        DECODE_PKT: begin
            start_decode_pkt = 1'b1;
        end
        default: begin
            start_decode_pkt = 1'b0;
        end
    endcase
end


endmodule