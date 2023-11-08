//write constraint to generate this array {5, -10, 15, -20, 25, -30, 35, -40, 45, -50}
class test;
  rand int a[10];
  function void post_randomize;
  $display("a=%p",a);
  endfunction
  constraint c2{
    foreach(a[i]){
      if(i%2!=0){
        a[i]==-((i+1)*5);
      }
        else{
          a[i]==(i+1)*5;
        }
    }
  }
endclass

module top;
  test t;
  initial
    begin
      t=new;
      t.randomize;
    end
endmodule
