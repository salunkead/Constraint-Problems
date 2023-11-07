/* Q.6 write a constraint for 4 bit dynamic array.the size of array should be in between 15 to 20.there should be even numbers in odd loactions and odd numbers in even loactions*/
class test;
  rand bit [3:0]arr[];
  rand int size;
  function void post_randomize;
    $display("arr=%p",arr);
  endfunction
  constraint sz{size inside {[15:20]};}
  constraint depth{arr.size==size;}
  constraint even_odd{
    foreach(arr[i])
    {
      if(i%2==0)
        (arr[i]%2!=0);
      else
        (arr[i]%2==0);
    }
  }
endclass
module top;
  test t;
  initial
    begin
      t=new;
      repeat(5) void'(t.randomize);
    end
endmodule
