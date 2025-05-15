`timescale 1ps/1ps

module tb_merge_addr_data;

    // Parameters
    localparam DATA_WIDTH = 1024;
    localparam ADDR_WIDTH = 10;
    localparam DATA_DFX_WIDTH = DATA_WIDTH + ADDR_WIDTH;

    // Testbench signals
    reg  [DATA_WIDTH-1:0]      data_arbiter_send;
    reg  [ADDR_WIDTH-1:0]      dst_addr_arbiter_send;
    wire [DATA_DFX_WIDTH-1:0]  data_dfx_send;

    // Instantiate the DUT
    merge_addr_data #(
        .DATA_WIDTH(DATA_WIDTH),
        .ADDR_WIDTH(ADDR_WIDTH)
    ) dut (
        .data_arbiter_send(data_arbiter_send),
        .dst_addr_arbiter_send(dst_addr_arbiter_send),
        .data_dfx_send(data_dfx_send)
    );

    // Test procedure
    initial begin
        // Test vector 1
        data_arbiter_send = {DATA_WIDTH{1'b0}};
        dst_addr_arbiter_send = {ADDR_WIDTH{1'b0}};
        #10;
        $display("Test 1: data_arbiter_send=0x%h, dst_addr_arbiter_send=0x%h, data_dfx_send=0x%h", 
                 data_arbiter_send, dst_addr_arbiter_send, data_dfx_send);

        // Test vector 2
        data_arbiter_send = {DATA_WIDTH{1'b1}};
        dst_addr_arbiter_send = {ADDR_WIDTH{1'b1}};
        #10;
        $display("Test 2: data_arbiter_send=0x%h, dst_addr_arbiter_send=0x%h, data_dfx_send=0x%h", 
                 data_arbiter_send, dst_addr_arbiter_send, data_dfx_send);

        // Test vector 3
        data_arbiter_send = 1024'hA5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5;
        dst_addr_arbiter_send = 10'h2AA;
        #10;
        $display("Test 3: data_arbiter_send=0x%h, dst_addr_arbiter_send=0x%h, data_dfx_send=0x%h", 
                 data_arbiter_send, dst_addr_arbiter_send, data_dfx_send);

        // Test vector 4: Random values
        data_arbiter_send = $random;
        dst_addr_arbiter_send = $random;
        #10;
        $display("Test 4: data_arbiter_send=0x%h, dst_addr_arbiter_send=0x%h, data_dfx_send=0x%h", 
                 data_arbiter_send, dst_addr_arbiter_send, data_dfx_send);
        
        $display("Test 4: data_arbiter_send=0x%h, dst_addr_arbiter_send=0x%h, data_dfx_send=0x%h, data_dfx_send[3:0]=0x%h", 
                 data_arbiter_send, dst_addr_arbiter_send, data_dfx_send, data_dfx_send[3:0]);
        $finish;
    end

endmodule