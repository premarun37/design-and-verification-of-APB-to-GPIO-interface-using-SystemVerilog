class Driver;

  mailbox #(Transaction) gen2drv;
  mailbox #(Transaction) drv2mon;
  virtual apb_if vif;

  function new(mailbox #(Transaction) g2d,
               mailbox #(Transaction) d2m,
               virtual apb_if vif);
    this.gen2drv = g2d;
    this.drv2mon = d2m;
    this.vif     = vif;
  endfunction

  task run();
    Transaction tr;

    $display("[%0t] DRV: Started", $time);

    forever begin
      gen2drv.get(tr);
      tr.display("DRV");

      if (tr.rw == 0)
        vif.apb_write(tr.addr, tr.data);
      else
        vif.apb_read(tr.addr);

      drv2mon.put(tr);
    end
  endtask

endclass
