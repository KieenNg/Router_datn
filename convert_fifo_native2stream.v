module fifo_native2stream
#(
    parameter DATA_WIDTH = 64
)(
    input wire clk,
    input wire rst_n,
    // FIFO interface
    input empty,
    output reg rd_en,
    input [DATA_WIDTH - 1:0] dout,
    // Stream interface
    input s_axis_tready,
    output reg s_axis_tvalid,
    output reg [DATA_WIDTH - 1:0] s_axis_tdata
);
    // Internal state
    reg state;
    localparam IDLE = 1'b0,
               TRANSFER = 1'b1;

    // Logic
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            rd_en <= 1'b0;
            s_axis_tvalid <= 1'b0;
            s_axis_tdata <= 64'b0;
            state <= IDLE;
        end
        else begin
            case (state)
                IDLE: begin
                    s_axis_tvalid <= 1'b0;
                    rd_en <= 1'b0;
                    if (!empty && s_axis_tready) begin
                        // FIFO has data and AXI is ready
                        rd_en <= 1'b1;
                        s_axis_tdata <= dout;
                        s_axis_tvalid <= 1'b1;
                        state <= TRANSFER;
                    end
                end
                
                TRANSFER: begin
                    rd_en <= 1'b0; // Pulse rd_en for one cycle
                    if (!empty && s_axis_tready) begin
                        // Continue transfer if more data available
                        s_axis_tdata <= dout;
                        s_axis_tvalid <= 1'b1;
                        rd_en <= 1'b1;
                    end
                    else begin
                        // No more data or AXI not ready
                        s_axis_tvalid <= 1'b0;
                        state <= IDLE;
                    end
                end
                
                default: begin
                    state <= IDLE;
                    rd_en <= 1'b0;
                    s_axis_tvalid <= 1'b0;
                    s_axis_tdata <= 64'b0;
                end
            endcase
        end
    end
endmodule