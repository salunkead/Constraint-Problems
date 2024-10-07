//constraint to generate pattern 0,9,1,99,2,999,3,9999,4,99999 so on

//Solution

class test;
  rand longint a[];
  function void post_randomize;
    $display("a=%p",a);
  endfunction
  
  constraint c1{
    a.size==22;
    foreach(a[i]){
      if(i==0)
        a[i]==0;
      else{
        if(i%2!=0){
          a[i]==10**(i-a[i-1])-1;
        }
          else{
            a[i]==a[i-2]+1;
          }
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
