module decap_packet 
#(
    parameter DATA_WIDTH = 1024,
    parameter ADDR_WIDTH = 10,
    parameter DATA_DFX_WIDTH = DATA_WIDTH + ADDR_WIDTH,
    parameter AURORA_DATA_WIDTH = 64
)(
    input                                   clk,
    input                                   rst_n,
    input [AURORA_DATA_WIDTH - 1:0]         data_in_dfx,
    input                                   rd_output_port_0,
    output reg [DATA_DFX_WIDTH - 1:0]       data_dfx_recv,
    output reg                              valid_dfx_data,
    output reg                              done_decap_pkt
);
reg [DATA_DFX_WIDTH - 1:0] data_dfx_recv_reg;
reg [$clog2(19)-1:0] frame_cnt;
reg start_decap_pkt;
reg start_decap_pkt_next;
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        start_decap_pkt <= 0;
        start_decap_pkt_next <= 0;
    end else begin
        start_decap_pkt_next <= rd_output_port_0;
        start_decap_pkt <= start_decap_pkt_next;
    end
end
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        data_dfx_recv <= 1034'b0;
        data_dfx_recv_reg <= 1034'b0;
        valid_dfx_data <= 0;
        frame_cnt <= 0;
        done_decap_pkt <= 0;
    end else begin
        if(start_decap_pkt) begin
           if(frame_cnt < 19) begin
            data_dfx_recv_reg[frame_cnt*55 +: 55] <= (frame_cnt == 18) ? {11'b0, data_in_dfx[52:9]} : data_in_dfx[63:9];
            frame_cnt <= frame_cnt + 1;
            valid_dfx_data <= 1;
            done_decap_pkt <= 0;
           end
           if(frame_cnt == 18) begin
            data_dfx_recv <= data_dfx_recv_reg;
            done_decap_pkt <= 1;
            valid_dfx_data <= 1;
            frame_cnt <= 0; // Reset frame count for next packet
           end 
        end else begin
            done_decap_pkt <= 1'b0;
            valid_dfx_data <= 0;
        end
    end
end
// end else begin
//         if (empty_output_queue_0) begin
//             data_dfx_recv <= 1034'b0;
//             valid_dfx_data <= 0;
//             index <= 0;
//         end else begin
//             if(index + 1 < (DATA_DFX_WIDTH/55)) begin
//                 data_dfx_recv[(index *55-1) -: 55] <= data_in_dfx[63:9];
//                 index <= index + 1;
//                 valid_dfx_data <= 1;
//             end else begin
//                 data_dfx_recv[1033:990] <= data_in_dfx [52:9];
//                 index <= index + 1;
//                 valid_dfx_data <= 1;
//             end
//         end
//     end
endmodule