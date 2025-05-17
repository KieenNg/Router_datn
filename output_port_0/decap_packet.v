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
    input                                   empty_output_queue_0,
    output reg [DATA_DFX_WIDTH - 1:0]       data_dfx_recv,
    output reg                              valid_dfx_data
);

reg [$clog2(DATA_DFX_WIDTH)-1:0] index;
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        data_dfx_recv <= 1034'b0;
        valid_dfx_data <= 0;
        index <= 0;
    end else begin
        if (empty_output_queue_0) begin
            data_dfx_recv <= 1034'b0;
            valid_dfx_data <= 0;
            index <= 0;
        end else begin
            if(index + 54 < DATA_DFX_WIDTH) begin
                data[index + 54 : index] <= data_in_dfx[63:9];
                index <= index + 55;
                valid_dfx_data <= 1;
            end else begin
                data[1033:990] <= data_in_dfx [52:9];
                index <= index + 55;
                valid_dfx_data <= 1;
            end
        end
    end
end
endmodule