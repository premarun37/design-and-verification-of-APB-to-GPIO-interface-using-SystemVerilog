class Generator;

  mailbox #(Transaction) gen2drv;
  event done;
  int num_tx = 6;

  function new(mailbox #(Transaction) mbox, event done_e);
    this.gen2drv = mbox;
    this.done    = done_e;
  endfunction

  task run();
    Transaction tr;

    $display("[%0t] GEN: Generating %0d transactions", $time, num_tx);

    for (int i = 0; i < num_tx; i++) begin
      tr = new();
      assert(tr.randomize());
      tr.display("GEN");
      gen2drv.put(tr);
    end

    -> done;
    $display("[%0t] GEN: Done", $time);
  endtask

endclass
