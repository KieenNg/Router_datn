`timescale 1ns/1ps

module tb_serializer;

    // Parameters
    localparam NUMER_OF_LANE = 1;
    localparam AURORA_DATA_WIDTH = 64 * NUMER_OF_LANE;
    localparam SEND_DATA_WIDTH = 1024;
    localparam RECOGNIZE_HEADER_WIDTH = 1;
    localparam RECOGNIZE_ROUTER_WIDTH = 2;
    localparam HOST_PAYLOAD_WIDTH = AURORA_DATA_WIDTH - RECOGNIZE_HEADER_WIDTH - RECOGNIZE_ROUTER_WIDTH;
    localparam NUMBER_PACKET = SEND_DATA_WIDTH / HOST_PAYLOAD_WIDTH + 1; // 17
    localparam ADDR_WIDTH = 10;
    localparam NUMBER_OF_TTL = 1;
    localparam TTL_WIDTH = $clog2(NUMBER_OF_TTL);
    localparam CLK_PERIOD = 10; // 10ns clock period

    // Signals
    reg clk;
    reg rst_n;
    reg send_data_valid;
    reg [SEND_DATA_WIDTH-1:0] v_data_read;
    reg [ADDR_WIDTH-1:0] dst_addr_send;
    reg [1:0] TTL_send;
    reg [1:0] router_id_send;
    wire axis_tx_tvalid;
    wire axis_tx_tlast;
    wire [AURORA_DATA_WIDTH-1:0] axis_tx_tdata;
    wire done_serializer;

    // Instantiate the serializer module
    serializer #(
        .NUMER_OF_LANE(NUMER_OF_LANE),
        .AURORA_DATA_WIDTH(AURORA_DATA_WIDTH),
        .SEND_DATA_WIDTH(SEND_DATA_WIDTH),
        .RECOGNIZE_HEADER_WIDTH(RECOGNIZE_HEADER_WIDTH),
        .RECOGNIZE_ROUTER_WIDTH(RECOGNIZE_ROUTER_WIDTH),
        .HOST_PAYLOAD_WIDTH(HOST_PAYLOAD_WIDTH),
        .NUMBER_PACKET(NUMBER_PACKET),
        .ADDR_WIDTH(ADDR_WIDTH),
        .NUMBER_OF_TTL(NUMBER_OF_TTL),
        .TTL_WIDTH(TTL_WIDTH)
    ) uut (
        .clk(clk),
        .rst_n(rst_n),
        .send_data_valid(send_data_valid),
        .v_data_read(v_data_read),
        .dst_addr_send(dst_addr_send),
        .TTL_send(TTL_send),
        .router_id_send(router_id_send),
        .axis_tx_tvalid(axis_tx_tvalid),
        .axis_tx_tlast(axis_tx_tlast),
        .axis_tx_tdata(axis_tx_tdata),
        .done_serializer(done_serializer)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk = ~clk;
    end

    // Test stimulus
    initial begin
        // Initialize signals
        rst_n = 0;
        send_data_valid = 0;
        v_data_read = 0;
        dst_addr_send = 0;
        TTL_send = 0;
        router_id_send = 0;

        // Reset the system
        #(CLK_PERIOD * 2);
        rst_n = 1;


        @(posedge clk);
        send_data_valid = 1;
        v_data_read = 1024'h1111222233334444555566667777888899991111222233334444555566667777888899991111222233334444555566667777888899991111222233334444555566667777888899991111222233334444555566667777888899991111222233334444555566667777888899991111222233334444555566667777888899991111; // Sample data
        dst_addr_send = 10'hA;
        TTL_send = 2'b01;    
        router_id_send = 2'b10;  

        @(posedge clk);
        send_data_valid = 0;

        // Wait for serialization to complete
        wait (done_serializer == 1);
        #(CLK_PERIOD * 2);

        // // Test case 2: Send another valid data
        // @(posedge clk);
        // send_data_valid = 1;
        // v_data_read = 1024'h55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555; // Different sample data
        // dst_addr_send = 10'h1AA; // Different destination address
        // TTL_send = 2'b10;        // Different TTL
        // router_id_send = 2'b11;  // Different router ID

        // @(posedge clk);
        // send_data_valid = 0;

        // Wait for serialization to complete
        wait (done_serializer == 1);
        #(CLK_PERIOD * 50);


        // End simulation
        $display("Simulation finished.");
        $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time=%0t rst_n=%b send_data_valid=%b axis_tx_tvalid=%b axis_tx_tlast=%b axis_tx_tdata=%h done_serializer=%b 
                frame_count = %d header_or_payload=%b src_router = %h payload = %h",
                 $time, rst_n, send_data_valid, axis_tx_tvalid, axis_tx_tlast, axis_tx_tdata, done_serializer, uut.frame_count, axis_tx_tdata[0:0], axis_tx_tdata[2:1], v_data_read[63:3]);
    end

endmodule
