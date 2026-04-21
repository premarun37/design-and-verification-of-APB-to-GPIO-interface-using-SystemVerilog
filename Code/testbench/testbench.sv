`include "apb_if.sv"
`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "design.sv"

module tb;

  logic PCLK = 0;
  logic PRESETn;

  // Clock generation
  always #5 PCLK = ~PCLK;

  // Reset generation
  initial begin
    PRESETn = 0;
    repeat (3) @(posedge PCLK);
    PRESETn = 1;
  end

  // Interface
  apb_if bus(PCLK, PRESETn);

  // DUT
  dut u_dut (.bus(bus), .PCLK(PCLK), .PRESETn(PRESETn));

  // Mailboxes
  mailbox #(Transaction) gen2drv;
  mailbox #(Transaction) drv2mon;

  // Components
  Generator gen;
  Driver drv;
  Monitor mon;

  event done;

  initial begin
    $dumpfile("apb_gpio.vcd");
    $dumpvars(0, tb);
  end

  initial begin
    $display("======================================");
    $display("   APB GPIO TESTBENCH STARTED         ");
    $display("======================================");

    gen2drv = new();
    drv2mon = new();

    gen = new(gen2drv, done);
    drv = new(gen2drv, drv2mon, bus);
    mon = new(bus);

    fork
      gen.run();
      drv.run();
      mon.run();
    join_none

    @done;
    repeat (5) @(posedge PCLK);

    $display("======================================");
    $display("   TEST COMPLETED SUCCESSFULLY        ");
    $display("======================================");

    #10 $finish;
  end

endmodule
