//write a constraint for the wr_rd signal ensure that a read can be followed by another read,but not a write followed by another write.
//additionally,ensure that four consecutive reads should not happen

///Solution
class test;
  rand bit wr_rd;
  bit q[$],ref_v,flag;
  function void post_randomize;
    bit q1[$:2]={0,0,0};
    if(wr_rd)
      $display("write op : %b",wr_rd);
    else
      $display("read op : %b",wr_rd);
    q.push_back(wr_rd);
    if(q.size==3 && q==q1)
      begin
        flag=1'b1;
        q.delete;
      end
    else
      begin
        flag=1'b0;
      end
    ref_v=wr_rd;
  endfunction
  
  constraint cons{
    if(ref_v)
      wr_rd==1'b0;
    if(!ref_v)
      wr_rd==1'b0 || wr_rd==1'b1;
    if(flag)
      wr_rd==1'b1;
  }
endclass

module top;
  test t;
  initial
    begin
      t=new;
      repeat(20)t.randomize;
    end
endmodule
