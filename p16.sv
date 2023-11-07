///we can do this with two methods 1.by passing arguments 2.by using rand_mode
/*
Q.16 randomize below variables 
class randvar;
rand bit[7:0]var1,var2,var3,var4;
endclass

1. randomize all variables 
2. randomize only var2
3. randomize var1 and var4
4. randomize var1,var3 and var4
*/
class randvar;
  rand bit [7:0]var1,var2,var3,var4;
  function void post_randomize;
    $display("var1=%d var2=%d var3=%d var4=%d",var1,var2,var3,var4);
  endfunction
endclass 

module test;
  randvar r;
  initial
    begin
      r=new;
      ////////1.randomize all variables
      r.randomize;
      ////////////2. randomize only var2
      r.randomize(var2);
      ///////3. randomize var1 and var4
      r.randomize(var1,var4);
      /////////4. randomize var1 var3 and var4
      r.randomize(var1,var3,var4);
      
    end
endmodule

