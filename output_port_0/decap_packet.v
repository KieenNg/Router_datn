module decap_packet 
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
    input                                   start_decap_pkt,
    output reg [DATA_DFX_WIDTH - 1:0]       data_dfx_recv,
    output reg                              valid_dfx_data,
    output reg                              decap_done
);

parameter IDLE = 2'b00;
parameter DECAP_PKT = 2'b01;
parameter DONE = 2'b11;

parameter ROUTER_0 = 2'b00;
parameter ROUTER_1 = 2'b01;
parameter ROUTER_2 = 2'b10;
parameter ROUTER_3 = 2'b11;

reg [1:0] current_state;
reg [1:0] next_state;

reg [DATA_DFX_WIDTH - 1:0] data_dfx_recv_router_0;
reg [DATA_DFX_WIDTH - 1:0] data_dfx_recv_router_1;
reg [DATA_DFX_WIDTH - 1:0] data_dfx_recv_router_2;
reg [DATA_DFX_WIDTH - 1:0] data_dfx_recv_router_3;



reg [AURORA_DATA_WIDTH - 1:0] data_recv_reg;
reg [$clog2(NUMBER_PACKET) - 1:0] pkt_number;
reg [1:0] src_router;

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        data_recv_reg <= 64'h0;
    end else begin
        if(start_decap_pkt) begin
            data_recv_reg <= data_recv;
        end   
        else data_recv_reg <= data_recv_reg;
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
    pkt_number = data_recv[6:2];
    src_router = data_recv[1:0];
    case (current_state)
        IDLE: begin
            if(start_decap_pkt) begin
                next_state = DECAP_PKT;
            end else begin
                next_state = IDLE;
            end       
        end
        DECAP_PKT: begin
            //next_state = DONE;
            if(pkt_number == 18) begin
                next_state = DONE;
            end
            else begin 
                next_state = DECAP_PKT;
            end
        end
        DONE: begin
            next_state = IDLE;        
        end
    endcase
end
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        data_dfx_recv_router_0 <= 1034'h0;
        data_dfx_recv_router_1 <= 1034'h0;
        data_dfx_recv_router_2 <= 1034'h0;
        data_dfx_recv_router_3 <= 1034'h0;
        decap_done <= 0;
    end
    else begin
        case (current_state)
            IDLE: begin
                data_dfx_recv_router_0 <= data_dfx_recv_router_0;
                data_dfx_recv_router_1 <= data_dfx_recv_router_1;
                data_dfx_recv_router_2 <= data_dfx_recv_router_2;
                data_dfx_recv_router_3 <= data_dfx_recv_router_3;
                valid_dfx_data <= 0;
                decap_done <= 1;
            end
            DECAP_PKT: begin
                decap_done <= 0;
                if(pkt_number == 18) begin
                    valid_dfx_data <= 1;
                end else valid_dfx_data <= 0;
                case (src_router)
                    ROUTER_0: begin
                        if(pkt_number < 18) begin
                            data_dfx_recv_router_0 [pkt_number*55 +: 55] <= data_recv[63:9];
                            data_dfx_recv <= data_dfx_recv;
                            valid_dfx_data <= 0;
                        end else if(pkt_number == 18) begin
                            data_dfx_recv_router_0[1033:990] <= data_recv[52:9];
                            data_dfx_recv <= data_dfx_recv_router_0;
                            valid_dfx_data <= 1;
                        end
                        else begin
                            data_dfx_recv <= 0;
                            valid_dfx_data <= 0;
                        end
                    end
                    ROUTER_1: begin
                        data_dfx_recv_router_1[pkt_number*55 +: 55] <= data_recv[63:9];
                        if(pkt_number == 18) begin
                            data_dfx_recv <= data_dfx_recv_router_1;
                            valid_dfx_data <= 1;
                        end else begin
                            data_dfx_recv <= 0;
                            valid_dfx_data <= 0;
                        end
                    end
                    ROUTER_2: begin
                        data_dfx_recv_router_2[pkt_number*55 +: 55] <= data_recv[63:9];
                        if(pkt_number == 18) begin
                            data_dfx_recv <= data_dfx_recv_router_2;
                            valid_dfx_data <= 1;
                        end else begin
                            data_dfx_recv <= 0;
                            valid_dfx_data <= 0;
                        end
                    end            
                    ROUTER_3: begin
                        data_dfx_recv_router_3[pkt_number*55 +: 55] <= data_recv[63:9];
                        if(pkt_number == 18) begin
                            data_dfx_recv <= data_dfx_recv_router_3;
                            valid_dfx_data <= 1;
                        end else begin
                            data_dfx_recv <= 0;
                            valid_dfx_data <= 0;
                        end
                    end
                endcase 
             end
             DONE: begin
                decap_done <= 1;
                valid_dfx_data <= valid_dfx_data;
             end        
        endcase 
    end
end
//always @(posedge clk or negedge rst_n) begin
//    if (!rst_n) begin
//        data_dfx_recv_router_0 <= 1034'h0;
//        data_dfx_recv_router_1 <= 1034'h0;
//        data_dfx_recv_router_2 <= 1034'h0;
//        data_dfx_recv_router_3 <= 1034'h0;
//        decap_done <= 0;
//    end
//    else begin
//        case (current_state)
//            IDLE: begin
//                data_dfx_recv_router_0 <= data_dfx_recv_router_0;
//                data_dfx_recv_router_1 <= data_dfx_recv_router_1;
//                data_dfx_recv_router_2 <= data_dfx_recv_router_2;
//                data_dfx_recv_router_3 <= data_dfx_recv_router_3;
//                valid_dfx_data <= 0;
//                decap_done <= 1;
//            end
//            DECAP_PKT: begin
//                decap_done <= 0;
//                if(pkt_number == 18) begin
//                    valid_dfx_data <= 1;
//                end else valid_dfx_data <= 0;
//                case (data_recv_reg[1:0])
//                    ROUTER_0: begin
//                        data_dfx_recv_router_0[pkt_number*55 +: 55] <= data_recv_reg[63:9];
//                        if(pkt_number == 18) begin
//                            data_dfx_recv <= data_dfx_recv_router_0;
//                            valid_dfx_data <= 1;
//                        end else begin
//                            data_dfx_recv <= 0;
//                            valid_dfx_data <= 0;
//                        end
//                    end
//                    ROUTER_1: begin
//                        data_dfx_recv_router_1[pkt_number*55 +: 55] <= data_recv_reg[63:9];
//                        if(pkt_number == 18) begin
//                            data_dfx_recv <= data_dfx_recv_router_1;
//                            valid_dfx_data <= 1;
//                        end else begin
//                            data_dfx_recv <= 0;
//                            valid_dfx_data <= 0;
//                        end
//                    end
//                    ROUTER_2: begin
//                        data_dfx_recv_router_2[pkt_number*55 +: 55] <= data_recv_reg[63:9];
//                        if(pkt_number == 18) begin
//                            data_dfx_recv <= data_dfx_recv_router_2;
//                            valid_dfx_data <= 1;
//                        end else begin
//                            data_dfx_recv <= 0;
//                            valid_dfx_data <= 0;
//                        end
//                    end            
//                    ROUTER_3: begin
//                        data_dfx_recv_router_3[pkt_number*55 +: 55] <= data_recv_reg[63:9];
//                        if(pkt_number == 18) begin
//                            data_dfx_recv <= data_dfx_recv_router_3;
//                            valid_dfx_data <= 1;
//                        end else begin
//                            data_dfx_recv <= 0;
//                            valid_dfx_data <= 0;
//                        end
//                    end
//                endcase 
//             end
//             DONE: begin
//                decap_done <= 1;
//                valid_dfx_data <= valid_dfx_data;
//             end        
//        endcase 
//    end
//end

endmodule