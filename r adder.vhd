library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ribble_adder is port(
    x,y:in std_logic_vector(3 downto 0);
    cin :in std_logic ;
    sum:out std_logic_vector(3 downto 0);
    cout:out std_logic );
end ribble_adder;

architecture ar_ribble_adder of ribble_adder is 
    component full_adder
    port (
        x,y,cin:in std_logic ;
        sum,cout :out std_logic 
         );
end component;
         signal c :std_logic_vector(2 downto 0);

         begin 
            f0 : full_adder port map (x=>x(0),y=>y(0),cin=>cin, sum=>sum(0),cout =>c(0));
            f1 : full_adder port map (x=>x(1),y=>y(1),cin=>c(0), sum=>sum(1),cout =>c(1));
            f2 : full_adder port map (x=>x(2),y=>y(2),cin=>c(1), sum=>sum(2),cout =>c(2));
            f3 : full_adder port map (x=>x(3),y=>y(3),cin=>c(2), sum=>sum(3),cout=>cout);

         end ar_ribble_adder;
