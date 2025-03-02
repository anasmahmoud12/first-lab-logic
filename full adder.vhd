
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder is 
    port (
x,y,cin:in std_logic ;
sum,cout :out std_logic 
 );
end full_adder;

architecture ar_full_adder of full_adder is 
    component half_adder

 port (
        x:in std_logic;
        y:in std_logic ;
        sum,cout:out std_logic
    );
end component;
signal as,bc:std_logic ;
begin
    haf:half_adder port map(x=>x,y=>y,sum=>as,cout=>bc);
    sum <=as xor cin ;
    cout<= bc or (x and cin) or (y and cin) ;
end ar_full_adder;

