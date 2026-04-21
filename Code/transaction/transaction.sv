class Transaction;

  rand bit [7:0] addr;
  rand bit [7:0] data;
  rand bit rw; // 0 = write, 1 = read

  constraint rw_c { rw dist {0 := 50, 1 := 50}; }

  function void display(string tag = "TXN");
    $display("[%0t] %s: addr=0x%0h data=0x%0h rw=%0d",
             $time, tag, addr, data, rw);
  endfunction

endclass
