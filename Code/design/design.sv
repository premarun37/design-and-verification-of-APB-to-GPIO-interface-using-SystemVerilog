module dut(apb_if bus, input logic PCLK, input logic PRESETn);

  logic [7:0] gpio_out;
  logic [7:0] gpio_in = 8'hA5;

  always_ff @(posedge PCLK or negedge PRESETn) begin
    if (!PRESETn)
      gpio_out <= 8'b0;
    else if (bus.PSEL && bus.PWRITE && bus.PENABLE)
      gpio_out <= bus.PWDATA;
  end

  // APB read (no tri-state)
  assign bus.PRDATA = (bus.PSEL && !bus.PWRITE) ? gpio_in : 8'h00;

endmodule
