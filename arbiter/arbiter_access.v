module arbiter_access 
#(
    parameter ADDR_WIDTH = 10,
    parameter DATA_WIDTH = 1024
)(
    input                           clk,
    input                           rst_n,

    input                           valid_i,
    output reg                      ready_o,   
    output reg                      data_valid_o, 
    input                           rd_or_wr_ctrl,
    input [ADDR_WIDTH - 1:0]        addr_ctrl,

    
    input                           arbiter_read_gnt,
    output reg                      arbiter_read_req,
    output reg [ADDR_WIDTH - 1:0]   arbiter_src_addr,
    
    input                           arbiter_write_gnt,
    output reg                      arbiter_write_req,
    output reg [ADDR_WIDTH - 1:0]   arbiter_dst_addr
);
parameter IDLE = 3'b000;
parameter READ_ARBITER = 3'b001;
parameter READ_ARBITER_DELAY = 3'b010;
parameter  WRITE_ARBITER = 3'b011;
reg [2:0] current_state;
reg [2:0] next_state;

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        current_state <= IDLE;
        next_state <= IDLE;
    end
    else current_state <= next_state;
end
/***************************************************************
* Next state logic
**************************************************************/
always @(*) begin
    case(current_state)
        IDLE: begin
            if(valid_i && ready_o) begin
                if(rd_or_wr_ctrl) begin
                    next_state = READ_ARBITER;
                end
                else next_state = WRITE_ARBITER;
            end
            else begin
                next_state = IDLE;
            end
        end
        READ_ARBITER: begin
            if(arbiter_read_gnt) begin
                next_state = IDLE;
            end
            else begin
                next_state = READ_ARBITER;
            end
        end
        READ_ARBITER_DELAY: begin
            next_state = IDLE;
        end
        WRITE_ARBITER: begin
            next_state = IDLE;
        end
        default: begin
            next_state = IDLE;
        end
    endcase
end
  /***************************************************************
   * Output logic: Control signals
   **************************************************************/
reg [ADDR_WIDTH - 1:0] addr_ctrl_reg;
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        ready_o <= 0;
        addr_ctrl_reg <= 10'h0;
        data_valid_o <= 0;
    end
    else begin
        case(current_state)
            IDLE: begin
                if(valid_i && ready_o) begin
                    ready_o <= 0;
                    addr_ctrl_reg <= addr_ctrl;
                    data_valid_o <= 0;
                end
                else begin
                    ready_o <= 1;
                    data_valid_o <= 0;
                end
            end
            default: begin
                ready_o <= 0;
                data_valid_o <= 0;
            end
        endcase
    end
end
  /***************************************************************
   * Output logic: Arbiter signals
   **************************************************************/
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        arbiter_read_req <= 0;
        arbiter_src_addr <= 10'h0;
        arbiter_write_req <= 0;
        arbiter_dst_addr <= 10'h0;
        data_valid_o <= 0;
    end
    else begin
        case(current_state)
            READ_ARBITER: begin
                arbiter_read_req <= 1;
                arbiter_src_addr <= addr_ctrl_reg;
                data_valid_o <= 1; 
            end
            READ_ARBITER_DELAY: begin
                arbiter_read_req <= 1;
                data_valid_o <= 1; 
            end
            WRITE_ARBITER: begin
                arbiter_write_req <= 1;
                arbiter_dst_addr <= addr_ctrl_reg;
                data_valid_o <= 0; 
            end
            default: begin
                arbiter_read_req <= 0;
                arbiter_write_req <= 0;
                data_valid_o <= 0; 
            end
        endcase
    end
end
endmodule