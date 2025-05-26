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
    input                           arbiter_write_gnt,
    output reg                      arbiter_read_req,
    output reg                      arbiter_write_req,
    output reg [ADDR_WIDTH - 1:0]   arbiter_src_addr,
    output reg [ADDR_WIDTH - 1:0]   arbiter_dst_addr,
////////////encode packet////////////
    input                           ctrl_encode_ready_i,
    output reg                      ctrl_encode_valid_o,
    output reg [ADDR_WIDTH - 1:0]   router_dst_addr_send,
    input                           encode_done,
///////////fifo input 0////////////
    input                           empty_input_port_0,
    output reg                      rd_input_port_0,
/////////////fifo input 1////////////
    input               empty_input_port_1,
    output reg          rd_input_port_1, 
/////////////output port 0////////////
    input                           empty_output_port_0,
    input                           decap_done,
    input [ADDR_WIDTH - 1:0]        dst_addr_arbiter_recv,
    input [8:0]                     header_pkt_recv,
    output reg                      start_decap_pkt,
    output reg                      rd_output_port_0,
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
parameter READ_OUTPUT_0 = 4'b0111;
parameter DECAP_PKT = 4'b1000;

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
            next_state = router_start_req ? READ_ARBITER : IDLE;
        end
        READ_ARBITER: begin
            next_state = arbiter_read_gnt ? START_ENCODE_PKT : READ_ARBITER;
        end
        // READ_ARBITER_DELAY: begin
        //     next_state = ENCODE_PKT;
        // end
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
            if(empty_input_port_0 == 0) begin
              next_state = READ_INPUT_0;
            end
            else begin
                next_state = IDLE;
            end
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
            default: begin
                router_done <= 0;
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
        arbiter_write_req <= 0;
        arbiter_src_addr <= 10'h0;
        arbiter_dst_addr <= 10'h0;
    end
    else begin
        case(current_state)
            READ_ARBITER: begin
                arbiter_read_req <= 1;
                arbiter_src_addr <= router_scr_addr_reg;
                arbiter_write_req <= 0;
            end
            // READ_ARBITER_DELAY: begin
            //     arbiter_read_req <= 1;
            //     arbiter_write_req <= 0;
            // end
            default: begin
                arbiter_read_req <= 0;
                arbiter_write_req <= 0;
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
   * Output logic: read fifo in 0 and transmit 
   **************************************************************/
// always @(posedge clk or negedge rst_n) begin
//     if(!rst_n) begin
//         rd_input_port_0 <= 0;
//         data_port1_after <= 0;
//         control_crossbar <= 2'b00;
//         we_output_port_1 <= 0;
//     end
//     else begin
//         case(current_state)
//             READ_INPUT_0: begin
//               rd_input_port_0 <= 1;
//               data_port1_after <= 0;
//               control_crossbar <= 2'b01;
//               we_output_port_1 <= 1;
//             end
//             default: begin
//                 rd_input_port_0 <= 0;
//                 data_port1_after <= 0;
//                 control_crossbar <= 2'b00;
//                 we_output_port_1 <= 0;
//             end
//         endcase
//     end
// end
always @(posedge clk or negedge rst_n) begin
    case(current_state)
        READ_INPUT_0: begin
            rd_input_port_0 = 1;
            data_port1_after = 0;
            control_crossbar = 2'b01;
            we_output_port_1 = 1;
        end
        default: begin
            rd_input_port_0 = 0;
            data_port1_after = 0;
            control_crossbar = 2'b00;
            we_output_port_1 = 0;
        end
    endcase
end
endmodule
