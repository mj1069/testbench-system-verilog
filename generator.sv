class generator;
  
  transaction tr;
  mailbox #(transaction) mbxgd;
  event done; 
  event drvnext; 
  event sconext; 
 
   int count = 0;
  
  function new( mailbox #(transaction) mbxgd);
    this.mbxgd = mbxgd;   
    tr =new();
  endfunction
  
    task run();
    
    repeat(count) begin
      assert(tr.randomize) else $error("Randomization Failed");
      mbxgd.put(tr.copy);
      tr.display("GEN");
      @(drvnext);
      @(sconext);
    end
    -> done;
  endtask
  
   
endclass
