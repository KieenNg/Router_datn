`timescale 1ns/1ps

module decap_packet_tb;

    // Parameters
    parameter DATA_WIDTH = 1024;
    parameter ADDR_WIDTH = 10;
    parameter DATA_DFX_WIDTH = DATA_WIDTH + ADDR_WIDTH;
    parameter AURORA_DATA_WIDTH = 64;
    parameter CLK_PERIOD = 10; // 10ns clock period

    // Signals
    reg                             clk;
    reg                             rst_n;
    reg [AURORA_DATA_WIDTH-1:0]     data_in_dfx;
    reg                             rd_output_port_0;
    wire [DATA_DFX_WIDTH-1:0]       data_dfx_recv;
    wire                            valid_dfx_data;
    wire                            done_decap_pkt;

    // Golden outputs
    reg [DATA_DFX_WIDTH-1:0]        golden_data_dfx_recv;
    reg                             golden_valid_dfx_data;
    reg                             golden_done_decap_pkt;

    // Test status
    integer                         test_passed = 0;
    integer                         total_tests = 0;

    // Instantiate DUT
    decap_packet #(
        .DATA_WIDTH(DATA_WIDTH),
        .ADDR_WIDTH(ADDR_WIDTH),
        .DATA_DFX_WIDTH(DATA_DFX_WIDTH),
        .AURORA_DATA_WIDTH(AURORA_DATA_WIDTH)
    ) dut (
        .clk(clk),
        .rst_n(rst_n),
        .data_in_dfx(data_in_dfx),
        .rd_output_port_0(rd_output_port_0),
        .data_dfx_recv(data_dfx_recv),
        .valid_dfx_data(valid_dfx_data),
        .done_decap_pkt(done_decap_pkt)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk = ~clk;
    end

    // Test procedure
    initial begin
        // Initialize signals
        rst_n = 0;
        rd_output_port_0 = 0;
        data_in_dfx = 0;

        golden_data_dfx_recv = 0;
        golden_valid_dfx_data = 0;
        golden_done_decap_pkt = 0;

        // Reset
        #(CLK_PERIOD*2);
        rst_n = 1;
        #(CLK_PERIOD);
   
        // Testcase 1: Sequential data
        $display("Starting Testcase 1: Sequential data");
        total_tests = total_tests + 1;
        golden_data_dfx_recv = 0; // Reset golden output
        rd_output_port_0 = 1; // Start decapsulation
         // Provide data for 19 framesgitkieegit
            for (integer j = 0; j < 19; j = j + 1) begin
                // Generate data
                if (j<18) begin
                    data_in_dfx = 64'hFFFFFFFFFFFFABCD; // Sequential data
                    golden_data_dfx_recv[((j+1)*55-1) -: 55] = data_in_dfx[63:9];
                end else begin
                    data_in_dfx =  64'hFFFFFFFFFFFFABCD; // Random data
                    golden_data_dfx_recv[18*55 +: 44] =  64'hFFFFFFFABCD;
                end
                
                @(posedge clk);
            end

    //         initial begin
    // @(posedge rd_output_port_0);
    // for (integer i = 0; i < 19; i = i + 1) begin
  
    //         // Calculate golden output for each frame
    //         if (i < 18) begin
    //             golden_data_dfx_recv[i*55 +: 55] =  64'hFFFFFFFFFFFFABCD; // 55-bit data
    //         end else begin
    //             golden_data_dfx_recv[18*55 +: 44] =  64'hFFFFFFFABCD; // 44-bit data
    //         end
    //         @(posedge clk);
    //     end
//end
        
        #(CLK_PERIOD);
        rd_output_port_0 = 0; // Stop decapsulation
        // Wait for done_decap_pkt to be high
        wait (done_decap_pkt == 1);
        #(CLK_PERIOD/2); // Wait for outputs to settle
        // Check outputs
        golden_valid_dfx_data = 1;
        golden_done_decap_pkt = 1;
        if (data_dfx_recv == golden_data_dfx_recv &&
            valid_dfx_data == golden_valid_dfx_data &&
            done_decap_pkt == golden_done_decap_pkt) begin
            $display("Testcase 1 PASSED");
            test_passed = test_passed + 1;
        end else begin
            $display("Testcase 1 FAILED");
            $display("Expected: data_dfx_recv = %b, valid_dfx_data = %b, done_decap_pkt = %b",
                     golden_data_dfx_recv, golden_valid_dfx_data, golden_done_decap_pkt);
            $display("Got: data_dfx_recv = %b, valid_dfx_data = %b, done_decap_pkt = %b",
                     data_dfx_recv, valid_dfx_data, done_decap_pkt);
        end
        #(CLK_PERIOD*2); // Wait before next testcase

        // Reset for next testcase
        rst_n = 0;
        #(CLK_PERIOD*2);
        rst_n = 1;
        #(CLK_PERIOD);

        // Testcase 2: Random data
        // $display("Starting Testcase 2: Random data");
        // total_tests = total_tests + 1;
        // golden_data_dfx_recv = 0; // Reset golden output
        // rd_output_port_0 = 1;
        // for (integer i = 0; i < 19; i = i + 1) begin
        //     data_in_dfx = $random & 64'hFFFFFFFFFFFFFFFF; // Random 64-bit data
        //     // Calculate golden output for each frame
        //     if (i < 18) begin
        //         golden_data_dfx_recv[i*55 +: 55] = data_in_dfx[63:9]; // 55-bit data
        //     end else begin
        //         golden_data_dfx_recv[18*55 +: 44] = data_in_dfx[52:9]; // 44-bit data
        //     end
        //     #(CLK_PERIOD);
        // end
        // rd_output_port_0 = 0;
        // // Wait for done_decap_pkt to be high
        // wait (done_decap_pkt == 1);
        // #(CLK_PERIOD/2);
        // // Check outputs
        // golden_valid_dfx_data = 1;
        // golden_done_decap_pkt = 1;
        // if (data_dfx_recv === golden_data_dfx_recv &&
        //     valid_dfx_data === golden_valid_dfx_data &&
        //     done_decap_pkt === golden_done_decap_pkt) begin
        //     $display("Testcase 2 PASSED");
        //     test_passed = test_passed + 1;
        // end else begin
        //     $display("Testcase 2 FAILED");
        //     $display("Expected: data_dfx_recv = %h, valid_dfx_data = %b, done_decap_pkt = %b",
        //              golden_data_dfx_recv, golden_valid_dfx_data, golden_done_decap_pkt);
        //     $display("Got: data_dfx_recv = %h, valid_dfx_data = %b, done_decap_pkt = %b",
        //              data_dfx_recv, valid_dfx_data, done_decap_pkt);
        // end
        // #(CLK_PERIOD*2);

        // Summary
        $display("Test Summary: %0d/%0d tests passed", test_passed, total_tests);
        $finish;
    end

endmodule