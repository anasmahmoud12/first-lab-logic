entity full_adder is 
    port (
x,y,cin:in bit ;
sum,cout :out bit  
 );
end full_adder;

architecture ar_full_adder of full_adder is 
    component haf_adder

 port (
        x:in bit ;
        y:in bit ;
        sum,cout:out bit 
    );
end component;
signal as,bc:bit ;
begin
    haf:haf_adder port map(x=>x,y=>y,sum=>as,cout=>bc);
    sum <=as xor cin ;
    cout<= bc or (x and cin) or (y and cin) ;
end ar_full_adder;



