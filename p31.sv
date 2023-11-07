//constraint to generate first five even and odd numbers factorial
class test;
  rand int even[5],odd[5];
  function void post_randomize;
    $display("even=%p",even);
    $display("factorial of first 5 even no. is %0d",even.product());
    $display("odd=%p",odd);
    $display("factorial of first 5 odd no. is %0d",odd.product());
  endfunction
  constraint EVEN{
    foreach(even[i]){
      even[i]==2*i+2;
    }
  }
  constraint ODD{
    foreach(odd[i]){
      odd[i]==2*i+1;
    }
  }
endclass
module top;
  test t;
  initial
    begin
      t=new;
      repeat(1)
        begin
          t.randomize;
        end
    end
endmodule
