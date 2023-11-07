//write constraint such that x should be equal to sum of y and z and y should double of z
class t;
  rand int x,y,z;
  function void post_randomize;
    $display("x=%0d y=%0d z=%0d",x,y,z);
  endfunction
  constraint c{
    x inside{[1:200]};
  y inside{[1:200]};
  z inside{[1:200]};	  
     }
     constraint c1{(x==y+z && y==2*z);}
endclass
module test;
  t t1;
  initial 
	  begin
		  t1=new();
		  repeat(10)t1.randomize();
	  end
endmodule
