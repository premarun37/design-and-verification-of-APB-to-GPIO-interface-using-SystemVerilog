class Monitor;

  virtual apb_if vif;

  function new(virtual apb_if vif);
    this.vif = vif;
  endfunction

  task run();
    $display("[%0t] MON: Started", $time);

    forever begin
      @(posedge vif.PCLK);

      if (vif.PSEL && vif.PENABLE) begin
        if (vif.PWRITE)
          $display("[%0t] MON: WRITE Addr=0x%0h Data=0x%0h",
                   $time, vif.PADDR, vif.PWDATA);
        else
          $display("[%0t] MON: READ Addr=0x%0h Data=0x%0h",
                   $time, vif.PADDR, vif.PRDATA);
      end
    end
  endtask

endclass