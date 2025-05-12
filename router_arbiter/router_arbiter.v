module router_arbiter(
    input clk,
    input rst_n,
    // Input from the regfile
    input [63:0] data_buffer_in,
    input valid_buffer_in,
    output ready_buffer_in,
    input last_buffer_in,
    //output to the regfile
    output reg [63:0] data_buffer_out,
    output reg valid_buffer_out,
    input ready_buffer_out,
    output reg last_buffer_out,
    // Input from the left interface
    input [63:0] tdata_left_in,
    input tvalid_left_in,
    output tready_left_in,
    input tlast_left_in,
    // Output to the left interface
    output reg [63:0] tdata_left_out,
    output reg tvalid_left_out,
    input tready_left_out,
    output reg tlast_left_out,
    // Input from the right interface
    input [63:0] tdata_right_in,
    input tvalid_right_in,
    output tready_right_in,
    input tlast_right_in,
    // Output to the right interface
    output reg [63:0] tdata_right_out,
    output reg tvalid_right_out,
    input tready_right_out,
    output reg tlast_right_out
);
localparam IDLE = 2'b00;
localparam PROCESS_LOCAL_BUFFER = 2'b01;
localparam PROCESS_LEFT = 2'b10;
localparam PROCESS_RIGHT = 2'b11;
reg [1:0] state;
reg [1:0] next_state;
// header information
reg [63:0] header;
reg [9:0] src_addr;
reg [1:0] dest_fpga;
reg [9:0] dest_addr;
///////
reg [1:0] select_input;
reg [1:0] select_output;

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        state <= IDLE;
    end else begin
        state <= next_state;
    end
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        select_input<= 2'b00;
        select_output<= 2'b00;
    end else begin
        if (state ) begin

        end
    end
end
endmodule