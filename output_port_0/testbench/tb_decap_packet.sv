module tb_decap_packet;

    // Parameters
    parameter DATA_WIDTH = 1024;
    parameter ADDR_WIDTH = 10;
    parameter DATA_DFX_WIDTH = DATA_WIDTH + ADDR_WIDTH;
    parameter AURORA_DATA_WIDTH = 64;
    parameter CLK_PERIOD = 10; // 100MHz clock

    // Signals
    logic clk;
    logic rst_n;
    logic [AURORA_DATA_WIDTH-1:0] data_in_dfx = 64'b0;
    logic rd_output_port_0;
    logic [DATA_DFX_WIDTH-1:0] data_dfx_recv;
    logic valid_dfx_data;
    logic done_decap_pkt;

    // Instantiate DUT
    decap_packet #(
        .DATA_WIDTH(DATA_WIDTH),
        .ADDR_WIDTH(ADDR_WIDTH),
        .DATA_DFX_WIDTH(DATA_DFX_WIDTH),
        .AURORA_DATA_WIDTH(AURORA_DATA_WIDTH)
    ) dut (
        .*
    );

    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk = ~clk;
    end

    initial begin
        rst_n = 0;
        #(CLK_PERIOD*2);
        rst_n = 1;
    end

    initial begin
        rd_output_port_0 = 1;
        #(CLK_PERIOD*3);
        rd_output_port_0 = 0;
        data_in_dfx = 64'h11111111_22222222;
        #(CLK_PERIOD);
        data_in_dfx = 64'h33333333_44444444;
        #(CLK_PERIOD);
        data_in_dfx = 64'h55555555_66666666;
        #(CLK_PERIOD);
        data_in_dfx = 64'h77777777_88888888;
        #(CLK_PERIOD);
        data_in_dfx = 64'h99999999_AAAAAAAA;
        #(CLK_PERIOD);
        data_in_dfx = 64'hBBBBBBBB_CCCCCCCC;
        #(CLK_PERIOD);
        data_in_dfx = 64'hDDDDDDDD_EEEEEEEE;
        #(CLK_PERIOD);
        data_in_dfx = 64'hFFFFFFFF_00000000;
        #(CLK_PERIOD);
        data_in_dfx = 64'h00000000_11111111;
        #(CLK_PERIOD);
        data_in_dfx = 64'h22222222_33333333;
        #(CLK_PERIOD);
        data_in_dfx = 64'h44444444_55555555;
        #(CLK_PERIOD);
        data_in_dfx = 64'h66666666_77777777;
        #(CLK_PERIOD);
        data_in_dfx = 64'h88888888_99999999;
        #(CLK_PERIOD);
        data_in_dfx = 64'hAAAAAAAA_BBBBBBBB;
        #(CLK_PERIOD);
        data_in_dfx = 64'hCCCCCCCC_DDDDDDDD;
        #(CLK_PERIOD);
        data_in_dfx = 64'hEEEEEEEE_FFFFFFFF;
        #(CLK_PERIOD);
        data_in_dfx = 64'h00000000_11111111;
        #(CLK_PERIOD);
        data_in_dfx = 64'h22222222_33333333;
        #(CLK_PERIOD);
        data_in_dfx = 64'h44444444_55555555;
        #(CLK_PERIOD);
        /////
        data_in_dfx = 64'h11111111_22222222;
        #(CLK_PERIOD);
        data_in_dfx = 64'h33333333_44444444;
        #(CLK_PERIOD);
        data_in_dfx = 64'h55555555_66666666;
        #(CLK_PERIOD);
        data_in_dfx = 64'h77777777_88888888;
        #(CLK_PERIOD);
        data_in_dfx = 64'h99999999_AAAAAAAA;
        #(CLK_PERIOD);
        data_in_dfx = 64'hBBBBBBBB_CCCCCCCC;
        #(CLK_PERIOD);
        data_in_dfx = 64'hDDDDDDDD_EEEEEEEE;
        #(CLK_PERIOD);
        data_in_dfx = 64'hFFFFFFFF_00000000;
        #(CLK_PERIOD);
        data_in_dfx = 64'h00000000_11111111;
        #(CLK_PERIOD);
        data_in_dfx = 64'h22222222_33333333;
        #(CLK_PERIOD);
        data_in_dfx = 64'h44444444_55555555;
        #(CLK_PERIOD);
        data_in_dfx = 64'h66666666_77777777;
        #(CLK_PERIOD);
        data_in_dfx = 64'h88888888_99999999;
        #(CLK_PERIOD);
        data_in_dfx = 64'hAAAAAAAA_BBBBBBBB;
        #(CLK_PERIOD);
        data_in_dfx = 64'hCCCCCCCC_DDDDDDDD;
        #(CLK_PERIOD);
        data_in_dfx = 64'hEEEEEEEE_FFFFFFFF;
        #(CLK_PERIOD);
        data_in_dfx = 64'h00000000_11111111;
        #(CLK_PERIOD);
        data_in_dfx = 64'h22222222_33333333;
        #(CLK_PERIOD);
        data_in_dfx = 64'h44444444_55555555;
        #(CLK_PERIOD);
        #(CLK_PERIOD*10);        
        // Finish simulation

    end
endmodule