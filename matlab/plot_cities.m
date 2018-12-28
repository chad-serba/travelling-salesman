function plot_cities( sale )

figure;
hold on;
axis([-sale.mapSize(1) sale.mapSize(1) -sale.mapSize(2) sale.mapSize(2)]);
for jj = 1:sale.numCity
   
    plot(sale.cities(jj,1), sale.cities(jj,2), '*k')
        
    
end


end

