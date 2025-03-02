

entity ribble_adder is port(
    x,y:in bit_vector(3 downto 0);
    cin :in bit ;
    sum:out bit_vector (3 downto 0);
    cout:out bit );
end ribble_adder;

architecture ar_ribble_adder of ribble_adder is 
    component full_adder
    port (
        x,y,cin:in bit ;
        sum,cout :out bit  
         );
end component;
         signal c :bit_vector(2 downto 0);

         begin 
            f0 : full_adder port map (x=>x(0),y=>y(0),cin=>cin, sum=>sum(0),cout =>c(0));
            f1 : full_adder port map (x=>x(1),y=>y(1),cin=>c(0), sum=>sum(1),cout =>c(1));
            f2 : full_adder port map (x=>x(2),y=>y(2),cin=>c(1), sum=>sum(2),cout =>c(2));
            f3 : full_adder port map (x=>x(3),y=>y(3),cin=>c(2), sum=>sum(3),cout=>open);

         end ar_ribble_adder;
