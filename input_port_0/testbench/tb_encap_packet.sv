`timescale 1ns/1ps

module tb_encap_packet;

    // Parameters
    localparam DATA_WIDTH = 1024;
    localparam ADDR_WIDTH = 10;
    localparam DATA_DFX_WIDTH = DATA_WIDTH + ADDR_WIDTH;
    localparam RECOGNIZE_ROUTER_WIDTH = 2;
    localparam NUMBER_PACKET = 19;
    localparam TTL_WIDTH = $clog2(3);
    localparam HEADER_WIDTH = RECOGNIZE_ROUTER_WIDTH + $clog2(NUMBER_PACKET) + TTL_WIDTH;
    localparam AURORA_DATA_WIDTH = 64;
    localparam PAYLOAD_WIDTH = AURORA_DATA_WIDTH - HEADER_WIDTH;

    // Signals
    reg clk;
    reg rst_n;
    reg [DATA_DFX_WIDTH-1:0] data_dfx_send;
    reg [HEADER_WIDTH-1:0] header_pkt_send;
    reg arbiter_gnt;
    wire [AURORA_DATA_WIDTH-1:0] data_in_port_0;
    wire data_encap_valid;
    reg ready_encap_dfx;

reg [DATA_DFX_WIDTH-1:0] golden_data;
reg [AURORA_DATA_WIDTH-1:0] golden_output_array [0:DATA_DFX_WIDTH/PAYLOAD_WIDTH-1];
integer i;
integer output_index;

    // Instantiate DUT
    encap_packet #(
        .DATA_WIDTH(DATA_WIDTH),
        .ADDR_WIDTH(ADDR_WIDTH),
        .DATA_DFX_WIDTH(DATA_DFX_WIDTH),
        .RECOGNIZE_ROUTER_WIDTH(RECOGNIZE_ROUTER_WIDTH),
        .NUMBER_PACKET(NUMBER_PACKET),
        .TTL_WIDTH(TTL_WIDTH),
        .HEADER_WIDTH(HEADER_WIDTH),
        .AURORA_DATA_WIDTH(AURORA_DATA_WIDTH),
        .PAYLOAD_WIDTH(PAYLOAD_WIDTH)
    ) dut (
        .clk(clk),
        .rst_n(rst_n),
        .data_dfx_send(data_dfx_send),
        .header_pkt_send(header_pkt_send),
        .arbiter_gnt(arbiter_gnt),
        .data_in_port_0(data_in_port_0),
        .data_encap_valid(data_encap_valid),
        .ready_encap_dfx(ready_encap_dfx)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk;

    // Test procedure
    initial begin
        // rst_n = 0;
        // data_dfx_send = 0;
        // header_pkt_send = 0;
        // arbiter_gnt = 0;
        // #20;
        // rst_n = 1;
        // #10;

        // // Test vector 1: All zeros
        // data_dfx_send = {DATA_DFX_WIDTH{1'b0}};
        // header_pkt_send = {HEADER_WIDTH{1'b0}};
        // arbiter_gnt = 1;
        // #10;
        // arbiter_gnt = 0;
        // #100;
        // wait(ready_encap_dfx == 1);
        // rst_n = 0;
        // #10;
        // rst_n = 1;
        // // Test vector 2: All ones
        // data_dfx_send = {DATA_DFX_WIDTH{1'b1}};
        // header_pkt_send = {HEADER_WIDTH{1'b1}};
        // arbiter_gnt = 1;
        // #10;
        // arbiter_gnt = 0;
        // #100;
        // wait(ready_encap_dfx == 1);
        // // Test vector 3: Patterned data
        // data_dfx_send = {1024'hA5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5, 10'h2AA};
        // header_pkt_send = {HEADER_WIDTH{1'b0}} | 7'h55;
        // arbiter_gnt = 1;
        // #10;
        // arbiter_gnt = 0;
        // #200;

        // Test vector 4: Random data
        rst_n = 0;
        #10;
        rst_n = 1;
        data_dfx_send = {1024'hA3F1C9D8B6724E0F59AB12CD3478FFEE11223344556677889900AABBCCDDEEFF00112233445566778899AABBCCDDEEFF102030405060708090A0B0C0D0E0F000ABCDEF1234567890FEDCBA0987654321123456789ABCDEFFEDCBA9876543210CAFEBABEDEADBEEFBADDCAFEFACEB00CDEADC0DEFEEDFACEC001D00DDEADFA11, 10'h2AA};
        header_pkt_send = $random;
        arbiter_gnt = 1;
        #10;
        arbiter_gnt = 0;
        #200;
        wait(ready_encap_dfx == 1);
        //$finish;
    end

initial begin
    wait(data_dfx_send!=0);
    golden_data = data_dfx_send;

    for (i = 0; i< (DATA_DFX_WIDTH/PAYLOAD_WIDTH ); i = i + 1) begin
        golden_output_array[i] = {
            golden_data[(i+1) *55 -1 -: 55],  // lấy từ MSB giảm về
            header_pkt_send
        };
        //golden_data = {55'b0, golden_data[DATA_DFX_WIDTH-1:55]};  // dịch phải 55 bit
    end
end


initial begin
    output_index = 0;
    wait(rst_n == 1); // Chờ reset kết thúc
    @(posedge data_encap_valid); // Bắt đầu kiểm tra khi có dữ liệu hợp lệ

    forever begin
        @(posedge clk);
        if (data_encap_valid) begin
            if (data_in_port_0 == golden_output_array[output_index]) begin
                $display("✅ MATCH at cycle %0d: DUT = 0x%h | GOLDEN = 0x%h",
                          output_index, data_in_port_0, golden_output_array[output_index]);
            end else begin
                $display("❌ FAIL at cycle %0d: DUT = 0x%h | GOLDEN = 0x%h",
                          output_index, data_in_port_0, golden_output_array[output_index]);
            end
            output_index = output_index + 1;
        end
        if (ready_encap_dfx == 1) begin
            $display("✅ DONE: All packets processed.");
            $finish;
        end
    end
end

    // Monitor outputs
    // initial begin
    //     $monitor("Time=%0t | rst_n=%b | arbiter_gnt=%b | data_encap_valid=%b | data_in_port_0=0x%h", 
    //         $time, rst_n, arbiter_gnt, data_encap_valid, data_in_port_0);
    // end

endmodule