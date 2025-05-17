module tb_router_controller;

    // Parameters
    parameter AURORA_DATA_WIDTH = 64;
    parameter ADDR_WIDTH = 10;
    parameter NUMBER_PACKET = 19;
    parameter RECOGNIZE_ROUTER_WIDTH = 2;
    parameter CLK_PERIOD = 5;

    // Signals
    logic clk;
    logic rst_n;
    // Total controller signals
    logic router_start_req;
    logic [ADDR_WIDTH-1:0] router_scr_addr;
    logic [ADDR_WIDTH-1:0] router_dst_addr;
    logic router_done;
    // Arbiter signals
    logic read_gnt;
    logic write_gnt;
    logic read_req;
    logic write_req;
    logic [ADDR_WIDTH-1:0] addr;
    // Crossbar signals
    logic [AURORA_DATA_WIDTH-1:0] data_port1_before;
    logic [AURORA_DATA_WIDTH-1:0] data_port1_after;
    logic [1:0] control_crossbar;
    // Input port 0 signals
    logic empty_input_port_0;
    logic ready_encap_dfx;
    logic [ADDR_WIDTH-1:0] router_dst_addr_send;
    logic [8:0] header_pkt_send;
    logic rd_input_port_0;
    // Input port 1 signals
    logic empty_input_port_1;
    logic rd_input_port_1;
    // Output port 0 signals
    logic valid_dfx_data;
    logic [ADDR_WIDTH-1:0] dst_addr_arbiter_recv;
    logic rd_output_port_0;
    logic we_output_port_0;
    // Output port 1 signals
    logic we_output_port_1;

    // Instantiate DUT
    router_controller #(
        .AURORA_DATA_WIDTH(AURORA_DATA_WIDTH),
        .ADDR_WIDTH(ADDR_WIDTH),
        .NUMBER_PACKET(NUMBER_PACKET),
        .RECOGNIZE_ROUTER_WIDTH(RECOGNIZE_ROUTER_WIDTH)
    ) dut (
        .*
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk = ~clk;
    end
    //reset generation
    initial begin 
        rst_n = 0;
        #(CLK_PERIOD*2);
        rst_n = 1;
    end

    // Test stimulus
    initial begin
        //controller & arbiter
        router_start_req = 0;
        router_scr_addr = 0;
        router_dst_addr = 0;
        read_gnt = 0;
        write_gnt = 0; 
        //input port 0
        empty_input_port_0 = 1;
        ready_encap_dfx = 0;
        //input port 1
        empty_input_port_1 = 1;
        //crossbar
        data_port1_before = 64'b0010001000100010001000100010001000100010001000100010001_10_01111_01;
        #10;
        router_start_req = 1;
        router_scr_addr = 10'h6;
        router_dst_addr = 10'hA;
        read_req = 1;
        #10;

    end

    // Monitor changes
    always @(posedge clk) begin
        if (router_done)
            $display("Time=%0t: Router completed operation", $time);
        if (control_crossbar != 2'b00)
            $display("Time=%0t: Crossbar control changed to %b", $time, control_crossbar);
    end

endmodule