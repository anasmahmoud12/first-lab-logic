

entity half_adder is 
    port (
        x:in bit ;
        y:in bit ;
        sum,cout:out bit 
    );
end half_adder;

architecture ar_half_adder of half_adder is 
    begin 
        cout<=x and y;
        sum<=x xor y ;
    end ar_half_adder;


