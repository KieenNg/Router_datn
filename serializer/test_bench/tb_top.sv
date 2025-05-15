`include "data_defs.v"
module Execute_test_top;
	parameter simulation_cycle = `CLK_PERIOD;

	reg     SysClock;
	reg     rst_n;
	Execute_io top_io(SysClock);

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
        .clk(SysClock),
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

	Execute_test #(.TEST_NAME("arith_logic"),.NUM_PACKETS(10)) test(top_io, DUT_probe);   		
	
	initial
	begin
		SysClock = 0;
		forever 
		begin
			#(simulation_cycle/2)
			SysClock = ~SysClock;
		end
	end
    initial
	begin
		rst_n = 0;
        #(simulation_cycle*2)
        rst_n = 1;
	end
endmodule