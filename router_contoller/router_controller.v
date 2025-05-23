module router_controller
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
    output reg         router_done,
    ////////////arbiter////////////
    input                           arbiter_read_gnt,
    input                           arbiter_write_gnt,
    output reg                      arbiter_read_req,
    output reg                      arbiter_write_req,
    output reg [ADDR_WIDTH - 1:0]   arbiter_src_addr,
    output reg [ADDR_WIDTH - 1:0]   arbiter_dst_addr,
////crossbar//////
    input [AURORA_DATA_WIDTH - 1:0]         data_port1_before,
    output reg [AURORA_DATA_WIDTH - 1:0]    data_port1_after,
    output reg [1:0]                        control_crossbar,
////////////input port 0////////////
    input                           empty_input_port_0,
    input                           encap_done,
    output reg                      start_encap_pkt,
    output reg [ADDR_WIDTH - 1:0]   router_dst_addr_send,
    output reg [8:0]                header_pkt_send,
    output reg                      rd_input_port_0,
/////////////input port 1////////////
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
    output reg                      we_output_port_1
);
reg [1:0] pkt_TTL = 2'b11;
reg [$clog2(NUMBER_PACKET) - 1:0] pkt_number;
reg [RECOGNIZE_ROUTER_WIDTH - 1:0] pkt_src_router = 2'b00;
///////////////arbiter////////////
reg [3:0] current_state;
reg [3:0] next_state;
parameter IDLE = 4'b0000;
parameter READ_ARBITER = 4'b0001;
parameter READ_ARBITER_DELAY = 4'b0010;
parameter START_ENCAP_PKT = 4'b0011;
parameter ENCAP_PKT = 4'b0100;
parameter READ_INPUT_0 = 4'b0101;
parameter READ_OUTPUT_1 = 4'b0110;
parameter READ_INPUT_1 = 4'b0111;
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        current_state <= IDLE;
        next_state <= IDLE;
    end
    else begin
        current_state <= next_state;
    end
end
reg [1:0] pkt_TTL_recv;
reg [$clog2(NUMBER_PACKET) - 1:0] pkt_number_recv;
reg [RECOGNIZE_ROUTER_WIDTH - 1:0] pkt_src_router_recv;
reg [63:0] data_port1_after_next;
always @(*) begin
    case(current_state)
        IDLE: begin
            if(router_start_req) begin
                next_state = READ_ARBITER;
            end else if(empty_input_port_1 == 0) begin
                next_state = READ_INPUT_1;
            end else begin
                next_state = IDLE;
            end
        end
        READ_ARBITER: begin
            next_state = arbiter_read_gnt ? READ_ARBITER_DELAY : READ_ARBITER;
        end
        READ_ARBITER_DELAY: begin
            next_state = START_ENCAP_PKT;
        end
        START_ENCAP_PKT: begin
            next_state = ENCAP_PKT;
        end
        ENCAP_PKT: begin
            next_state = (empty_input_port_0 == 0) ? READ_INPUT_0 : ENCAP_PKT;
        end
        READ_INPUT_0: begin
            // if(empty_input_port_0 == 0) begin
            //     next_state = READ_INPUT_0;
            // end
            // else begin
            //     next_state = READ_OUTPUT_0;
            // end
            next_state = READ_OUTPUT_1;
        end
        READ_OUTPUT_1: begin
            if(empty_input_port_0 == 0) begin
                next_state = READ_OUTPUT_1;
            end
            else begin
                next_state = IDLE;
            end
        end
        READ_INPUT_1: begin
            if(empty_input_port_1 == 0) begin
                next_state = READ_INPUT_1;
            end
            else begin
                next_state = IDLE;
            end
        end
        default: next_state = IDLE;
    endcase
end
always @(*) begin
    case (current_state)
        IDLE: begin
            router_done = 1;
            arbiter_src_addr = 10'h0;
            arbiter_dst_addr = 10'h0;
            arbiter_read_req = 0;
            arbiter_write_req = 0;
            //input port 0
            router_dst_addr_send = 10'h0;
            start_encap_pkt = 0;
            header_pkt_send = 9'h0;
            rd_input_port_0 = 0;
            //input port 1
            rd_input_port_1 = 0;
            //output port 0
            rd_output_port_0 = 0;
            we_output_port_0 = 0;
            start_decap_pkt = 0;
            //output port 1
            we_output_port_1 = 0;
            //crossbar
            data_port1_after = 64'h0;
            control_crossbar = 2'b00;
        end
        READ_ARBITER: begin
            router_done = 0;
            arbiter_src_addr = router_scr_addr;
            arbiter_dst_addr = 10'h0;
            arbiter_read_req = 1;
            arbiter_write_req = 0;
            //input port 0
            start_encap_pkt = 0;
            router_dst_addr_send = router_dst_addr;
            header_pkt_send = 9'h0;
            rd_input_port_0 = 0;
            //input port 1
            rd_input_port_1 = 0;
            //output port 0
            rd_output_port_0 = 0;
            we_output_port_0 = 0;
            start_decap_pkt = 0;
            //output port 1
            we_output_port_1 = 0;
            //crossbar
            data_port1_after = 64'h0;
            control_crossbar = 2'b00;            
        end
        READ_ARBITER_DELAY: begin
            router_done = 0;
            arbiter_src_addr = router_scr_addr;
            arbiter_dst_addr = 10'h0;
            arbiter_read_req = 1;
            arbiter_write_req = 0;
            //input port 0
            start_encap_pkt = 0;
            router_dst_addr_send = router_dst_addr;
            header_pkt_send = 9'h0;
            rd_input_port_0 = 0;
            //input port 1
            rd_input_port_1 = 0;
            //output port 0
            rd_output_port_0 = 0;
            we_output_port_0 = 0;
            start_decap_pkt = 0;
            //output port 1
            we_output_port_1 = 0;
            //crossbar
            data_port1_after = 64'h0;
            control_crossbar = 2'b00;            
        end
        START_ENCAP_PKT: begin
            router_done = 0;
            arbiter_src_addr = router_scr_addr;
            arbiter_dst_addr = 10'h0;
            arbiter_read_req = 0;
            arbiter_write_req = 0;
            //input port 0
            start_encap_pkt = 1;
            router_dst_addr_send = router_dst_addr;
            header_pkt_send = 9'h0;
            rd_input_port_0 = 0;
            //input port 1
            rd_input_port_1 = 0;
            //output port 0
            rd_output_port_0 = 0;
            we_output_port_0 = 0;
            start_decap_pkt = 0;
            //output port 1
            we_output_port_1 = 0;
            //crossbar
            data_port1_after = 64'h0;
            control_crossbar = 2'b00;            
        end
        ENCAP_PKT: begin
            router_done = 0;
            arbiter_src_addr = router_scr_addr;
            arbiter_dst_addr = 10'h0;
            arbiter_read_req = 0;
            arbiter_write_req = 0;
            //input port 0
            start_encap_pkt = 0;
            router_dst_addr_send = router_dst_addr;
            header_pkt_send = {pkt_TTL, pkt_number, pkt_src_router};
            rd_input_port_0 = 0;
            //input port 1
            rd_input_port_1 = 0;
            //output port 0
            rd_output_port_0 = 0;
            we_output_port_0 = 0;
            start_decap_pkt = 0;
            //output port 1
            we_output_port_1 = 0;
            //crossbar
            data_port1_after = 64'h0;
            control_crossbar = 2'b00;            
        end
        READ_INPUT_0: begin
            router_done = 0;
            arbiter_src_addr = 10'h0;
            arbiter_dst_addr = 10'h0;
            arbiter_read_req = 0;
            arbiter_write_req = 0;
            //input port 0
            start_encap_pkt = 0;
            router_dst_addr_send = router_dst_addr;
            header_pkt_send = 9'h0;
            rd_input_port_0 = 1;
            //input port 1
            rd_input_port_1 = 0;
            //output port 0
            rd_output_port_0 = 0;
            we_output_port_0 = 0;
            start_decap_pkt = 0;
            //output port 1
            we_output_port_1 = 0;
            //crossbar
            data_port1_after = 64'h0;
            control_crossbar = 2'b01;            
        end
        READ_OUTPUT_1: begin
            router_done = 0;
            arbiter_src_addr = 10'h0;
            arbiter_dst_addr = 10'h0;
            arbiter_read_req = 0;
            arbiter_write_req = 0;
            //input port 0
            start_encap_pkt = 0;
            router_dst_addr_send = router_dst_addr;
            header_pkt_send = 9'h0;
            rd_input_port_0 = 1;
            //input port 1
            rd_input_port_1 = 0;
            //output port 0
            rd_output_port_0 = 0;
            //we_output_port_0 = 0;
            start_decap_pkt = 0;
            //output port 1
            we_output_port_1 = 1;
            //crossbar
            data_port1_after = 64'h0;
            control_crossbar = 2'b01;            
        end
        READ_INPUT_1: begin
            router_done = 0;
            arbiter_src_addr = 10'h0;
            arbiter_dst_addr = 10'h0;
            arbiter_read_req = 0;
            arbiter_write_req = 0;
            //input port 0
            start_encap_pkt = 0;
            router_dst_addr_send = 10'h0;
            header_pkt_send = 9'h0;
            rd_input_port_0 = 0;
            //input port 1
            rd_input_port_1 = 1;
            //output port 0
            rd_output_port_0 = 0;
            //we_output_port_0 = 0;
            start_decap_pkt = 0;
            //output port 1
            //we_output_port_1 = 1;
            //crossbar
            data_port1_after[6:0] = data_port1_before[6:0];
            data_port1_after[63:9] = data_port1_before[63:9];            
            data_port1_after[8:7] = data_port1_before[8:7] - 1;
            if(data_port1_before[8:7] > 2'b01)begin
                control_crossbar = 2'b11;   
                we_output_port_0 = 1;
                we_output_port_1 = 1;         
            end else if(data_port1_before[8:7] == 2'b01) begin
                control_crossbar = 2'b10;   
                we_output_port_0 = 1;
                we_output_port_1 = 0;
            end
            else begin
                control_crossbar = 2'b00;   
                we_output_port_0 = 1;
                we_output_port_1 = 0;
            end
        end
    endcase
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        pkt_number <= 0;
        // control_crossbar <= 2'b00;
        data_port1_after <= 64'h0;
        // we_output_port_0 <= 0;
        // we_output_port_1 <= 0;
        data_port1_after_next <= 64'h0;
    end
    else begin
        case (current_state)
            IDLE: begin
                pkt_number <= 0;
                // control_crossbar <= 2'b00;
                data_port1_after <= 64'h0;
                // we_output_port_0 <= 0;
                // we_output_port_1 <= 0;
                data_port1_after_next <= 64'h0;
            end
            READ_ARBITER: begin
                pkt_number <= 0;
                // control_crossbar <= 2'b00;
                // data_port1_after <= 64'h0;
                // we_output_port_0 <= 0;
                // we_output_port_1 <= 0;
            end
            READ_ARBITER_DELAY: begin
                pkt_number <= 0;
                // control_crossbar <= 2'b00;
                // data_port1_after <= 64'h0;
                // we_output_port_0 <= 0;
                // we_output_port_1 <= 0;
            end
            START_ENCAP_PKT: begin
                pkt_number <= 0;
                // control_crossbar <= 2'b00;
                // data_port1_after <= 64'h0;
                // we_output_port_0 <= 0;
                // we_output_port_1 <= 0;
            end
            ENCAP_PKT: begin
                pkt_number <= 0;
                if(pkt_number == NUMBER_PACKET - 1) begin
                    pkt_number <= 0;
                end
                else begin
                    pkt_number <= pkt_number + 1;
                end
                // control_crossbar <= 2'b00;
                // data_port1_after <= 64'h0;
                // we_output_port_0 <= 0;
                // we_output_port_1 <= 0;
            end
            READ_INPUT_0: begin
                // pkt_number <= 0;
                // control_crossbar <= 2'b01;
                // data_port1_after <= 64'h0;
                // we_output_port_0 <= 0;
                // we_output_port_1 <= 1;
            end
            READ_OUTPUT_1: begin
                // pkt_number <= 0;
                // control_crossbar <= 2'b00;
                // data_port1_after <= 64'h0;
                // we_output_port_0 <= 0;
                // we_output_port_1 <= 0;
            end
            READ_INPUT_1: begin
                data_port1_after_next <= ;
                // pkt_number <= 0;
                //data_port1_after[8:7] <= data_port1_before[8:7] - 1;
                // if(data_port1_before[8:7] > 2'b01)begin
                //     control_crossbar <= 2'b11;
                //     we_output_port_0 <= 1;
                //     we_output_port_1 <= 1;
                // end
                // else begin
                //     control_crossbar <= 2'b10;
                //     we_output_port_0 <= 1;
                //     we_output_port_1 <= 0;
                // end
            end
        endcase
    end
end
endmodule