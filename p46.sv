///Write constraint for consecutive write and read to the same address
//Ex-wr=1 and addr=249
//   wr=0 and addr=249
//   wr=1 and addr=31
//   wr=0 and addr=31
class test;
  rand bit[7:0]addr;
  rand bit wr;
  bit wr_ref;
  int txn;
  function void pre_randomize;
    if(wr_ref)
      addr.rand_mode(0);
    else
      addr.rand_mode(1);
  endfunction
  function void post_randomize;
    $display("wr=%b and addr=%0d",wr,addr);
    wr_ref=wr;
    txn++;
  endfunction
  constraint c{if(txn%2==0)
  {
    wr==1;
  }
    else{
      wr==0;
    }
    }
endclass

module top;
  test t;
  initial
    begin
      t=new;
      repeat(20)
        begin
          t.randomize;
        end
    end
endmodule
