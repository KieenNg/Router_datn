module router_controller2
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
    output reg                      router_done,
    ////////////arbiter////////////
    input                           arbiter_read_gnt,
    output reg                      arbiter_read_req,
    output reg [ADDR_WIDTH - 1:0]   arbiter_src_addr,
////////////encode packet////////////
    input                           ctrl_encode_ready_i,
    output reg                      ctrl_encode_valid_o,
    output reg [ADDR_WIDTH - 1:0]   router_dst_addr_send,
    input                           encode_done,
////////////decode packet////////////
    // input                           decode_done,
    // input [ADDR_WIDTH - 1:0]        dst_addr_arbiter_recv,
    // input [8:0]                     header_pkt_recv,
    // output reg                      start_decap_pkt,
///////////fifo input 0////////////
    input                           empty_input_port_0,
    output reg                      rd_input_port_0,
/////////////fifo input 1////////////
    input               empty_input_port_1,
    output reg          rd_input_port_1, 
/////////////output port 0////////////
    output reg                      we_output_port_0,
/////////////output port 1////////////
    output reg                      we_output_port_1,
////crossbar//////
    input [AURORA_DATA_WIDTH - 1:0]         data_port1_before,
    output reg [AURORA_DATA_WIDTH - 1:0]    data_port1_after,
    output reg [1:0]                        control_crossbar
);
reg [1:0] pkt_TTL = 2'b11;
reg [RECOGNIZE_ROUTER_WIDTH - 1:0] pkt_src_router = 2'b00;
///////////////arbiter////////////
reg [3:0] current_state;
reg [3:0] next_state;
parameter IDLE = 4'b0000;
parameter READ_ARBITER = 4'b0001;
parameter READ_ARBITER_DELAY = 4'b0010;
parameter START_ENCODE_PKT = 4'b0011;
parameter ENCODE_PKT = 4'b0100;
parameter READ_INPUT_0 = 4'b0101;
parameter READ_INPUT_1 = 4'b0110;
parameter HEADER_MODIFY = 4'b0111;
parameter WRITE_OUTPUT_0 = 4'b1000;
parameter WRITE_OUTPUT_1 = 4'b1001;
parameter WRITE_OUTPUT_01 = 4'b1010;
// parameter READ_OUTPUT_0 = 4'b1000;
// parameter DECAP_PKT = 4'b1001;

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        current_state <= IDLE;
        next_state <= IDLE;
    end
    else begin
        current_state <= next_state;
    end
end
  /***************************************************************
   * Next state logic
   **************************************************************/
always @(*) begin
    case(current_state)
        IDLE: begin
            if(router_start_req) begin
              next_state = READ_ARBITER;
            end
            else if (empty_input_port_1 == 0) begin
                next_state = READ_INPUT_1;
            end
            else begin
              next_state = IDLE;
            end
        end
        READ_ARBITER: begin
            next_state = arbiter_read_gnt ? START_ENCODE_PKT : READ_ARBITER;
        end
        START_ENCODE_PKT: begin
            next_state = ENCODE_PKT;
        end
        ENCODE_PKT: begin
            if(encode_done) begin
                next_state = READ_INPUT_0;
            end
            else next_state = ENCODE_PKT;
        end
        READ_INPUT_0: begin
            next_state = WRITE_OUTPUT_1;
        end
        READ_INPUT_1: begin
            next_state = HEADER_MODIFY;
        end
        HEADER_MODIFY: begin
            if(data_port1_before[8:7] > 1) begin
                next_state = WRITE_OUTPUT_01;
            end
            else begin
                next_state = WRITE_OUTPUT_0;
            end
        end
        WRITE_OUTPUT_0: begin
            if(empty_input_port_1 == 0) begin
              next_state = READ_INPUT_1;
            end
            else begin
                next_state = IDLE;
            end
        end
        WRITE_OUTPUT_1: begin
            if(empty_input_port_0 == 0) begin
              next_state = READ_INPUT_0;
            end
            else begin
                next_state = IDLE;
            end
        end
        WRITE_OUTPUT_01: begin
            if(empty_input_port_1 == 0) begin
              next_state = READ_INPUT_1;
            end
            else begin
                next_state = IDLE;
            end
        end
        default: begin
            next_state = IDLE;
        end
    endcase
end
  /***************************************************************
   * Output logic: Control signals
   **************************************************************/
reg [ADDR_WIDTH - 1:0] router_scr_addr_reg;
reg [ADDR_WIDTH - 1:0] router_dst_addr_reg;
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        router_done <= 0;
        router_scr_addr_reg <= 10'h0;
        router_dst_addr_reg <= 10'h0;
    end
    else begin
        case(current_state)
            IDLE: begin
                router_done <= 1;
                router_scr_addr_reg <= router_scr_addr;
                router_dst_addr_reg <= router_dst_addr;
            end
            // READ_INPUT_0: begin
            //     router_done <= 1;
            // end
            READ_INPUT_1: begin
                router_done <= 1;
            end
            HEADER_MODIFY: begin
                router_done <= 1;
            end
            WRITE_OUTPUT_0: begin
                router_done <= 1;
            end
            // WRITE_OUTPUT_1: begin
            //     router_done <= 1;
            // end
            WRITE_OUTPUT_01: begin
                router_done <= 1;
            end
            default: begin
                router_done <= 0;
                router_scr_addr_reg <= router_scr_addr_reg;
                router_dst_addr_reg <= router_dst_addr_reg;
            end
        endcase
    end
end
  /***************************************************************
   * Output logic: Read arbiter signals
   **************************************************************/
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        arbiter_read_req <= 0;
        arbiter_src_addr <= 10'h0;
    end
    else begin
        case(current_state)
            READ_ARBITER: begin
                arbiter_read_req <= 1;
                arbiter_src_addr <= router_scr_addr_reg;
            end
            default: begin
                arbiter_read_req <= 0;
            end
        endcase
    end
end
  /***************************************************************
   * Output logic: encode packet 
   **************************************************************/
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        ctrl_encode_valid_o <= 0;
        router_dst_addr_send <= 10'h0;
    end
    else begin
        case(current_state)
            START_ENCODE_PKT: begin
                ctrl_encode_valid_o <= 1;
                router_dst_addr_send <= router_dst_addr_reg;
            end
            ENCODE_PKT: begin
                ctrl_encode_valid_o <= 0;
                router_dst_addr_send <= router_dst_addr_reg;
            end
            default: begin
                ctrl_encode_valid_o <= 0;
            end
        endcase
    end
end



  /***************************************************************
   * Output logic: fifo in 0 interface
   **************************************************************/
always @(*) begin
    case(current_state)
        READ_INPUT_0: begin
            rd_input_port_0 = 1;
        end
        WRITE_OUTPUT_1: begin
            rd_input_port_0 = 0;
        end
        default: begin
            rd_input_port_0 = 0;
        end
    endcase
end

  /***************************************************************
   * Output logic: fifo out 1 interface
   **************************************************************/
always @(*) begin
    case(current_state)
        READ_INPUT_0: begin
            we_output_port_1 = 0;
        end
        WRITE_OUTPUT_1: begin
            we_output_port_1 = 1;
        end
        WRITE_OUTPUT_01: begin
            we_output_port_1 = 1;
        end
        default: begin
            we_output_port_1 = 0;
        end
    endcase
end
  /***************************************************************
   * Output logic: crossbar control 
   **************************************************************/
reg [AURORA_DATA_WIDTH - 1:0] data_port1_before_reg;
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        data_port1_before_reg <= 0;
    end
    else begin
        case(current_state)
            READ_INPUT_1: begin
                data_port1_before_reg <= 0;
            end
            HEADER_MODIFY: begin
                if(data_port1_before[8:7] > 1'b1) begin
                    data_port1_before_reg[8:7] <= data_port1_before[8:7] - 1'b1;
                    data_port1_before_reg[63:9] <= data_port1_before[63:9];
                    data_port1_before_reg[6:0] <= data_port1_before[6:0];
                end
                else begin
                    data_port1_before_reg <= data_port1_before;
                end
            end
            default: begin
                data_port1_before_reg <= data_port1_before;
            end
        endcase
    end
end
always @(*) begin
    case(current_state)
        READ_INPUT_1: begin
            control_crossbar = 2'b00;
            data_port1_after = 0;
        end
        HEADER_MODIFY: begin
            control_crossbar = 2'b00;
            data_port1_after = data_port1_before_reg;
        end
        WRITE_OUTPUT_1: begin
            control_crossbar = 2'b01;
            data_port1_after = 0;
        end
        WRITE_OUTPUT_0: begin
            control_crossbar = 2'b10;
            data_port1_after = data_port1_before_reg;
        end
        WRITE_OUTPUT_01: begin
            control_crossbar = 2'b11;
            data_port1_after = data_port1_before_reg;
        end
        default: begin
            control_crossbar = 2'b00;
        end
    endcase
end
  /***************************************************************
   * Output logic: fifo in 1 interface
   **************************************************************/
always @(*) begin
    case(current_state)
        READ_INPUT_1: begin
            rd_input_port_1 = 1;
        end
        HEADER_MODIFY: begin
            rd_input_port_1 = 0;
        end
        WRITE_OUTPUT_0: begin
            rd_input_port_1 = 0;
        end
        WRITE_OUTPUT_01: begin
            rd_input_port_1 = 0;
        end
        default: begin
            rd_input_port_1 = 0;
        end
    endcase
end
  /***************************************************************
   * Output logic: fifo out 0 interface
   **************************************************************/
always @(*) begin
    case(current_state)
        READ_INPUT_1: begin
            we_output_port_0 = 0;
        end
        HEADER_MODIFY: begin
            
        end
        WRITE_OUTPUT_0: begin
            we_output_port_0 = 1;
        end
        WRITE_OUTPUT_01: begin
            we_output_port_0 = 1;
        end
        default: begin
            we_output_port_0 = 0;
        end
    endcase
end
endmodule
