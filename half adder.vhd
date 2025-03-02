library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity half_adder is 
    port (
        x:in std_logic ;
        y:in std_logic ;
        sum,cout:out std_logic 
    );
end half_adder;

architecture ar_half_adder of half_adder is 
    begin 
        cout<=x and y;
        sum<=x xor y ;
    end ar_half_adder;
