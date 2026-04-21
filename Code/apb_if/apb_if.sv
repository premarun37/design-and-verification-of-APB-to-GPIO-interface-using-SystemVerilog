interface apb_if(input logic PCLK, input logic PRESETn);

  logic [7:0] PADDR;
  logic [7:0] PWDATA;
  logic [7:0] PRDATA;

  logic PSEL, PENABLE, PWRITE, PREADY;

  initial begin
    PADDR   = 0;
    PWDATA  = 0;
    PSEL    = 0;
    PENABLE = 0;
    PWRITE  = 0;
    PREADY  = 1;
  end

  task apb_write(input [7:0] addr, input [7:0] data);
    @(posedge PCLK);
    PSEL = 1; PWRITE = 1; PADDR = addr; PWDATA = data;

    @(posedge PCLK);
    PENABLE = 1;

    @(posedge PCLK);
    PSEL = 0; PENABLE = 0; PWRITE = 0;

    $display("[%0t] APB WRITE: Addr=0x%0h Data=0x%0h", $time, addr, data);
  endtask

  task apb_read(input [7:0] addr);
    @(posedge PCLK);
    PSEL = 1; PWRITE = 0; PADDR = addr;

    @(posedge PCLK);
    PENABLE = 1;

    @(posedge PCLK);
    @(posedge PCLK); // ensure stable PRDATA

    $display("[%0t] APB READ: Addr=0x%0h Data=0x%0h", $time, addr, PRDATA);

    PSEL = 0; PENABLE = 0;
  endtask

endinterface
