function plot_route( sale )


figure;
hold on;
axis([-sale.mapSize(1) sale.mapSize(1) -sale.mapSize(2) sale.mapSize(2)]);
for jj = 1:sale.numCity
   
    plot(sale.cities(jj,1), sale.cities(jj,2), '*--k', 'LineWidth', 1.25)
    
         
    
end

for ii = 1:sale.numCity
    
    indx1 = sale.bestOrder{end}(ii);
    indx2 = sale.bestOrder{end}(ii+1);
    plot([sale.cities(indx1,1) sale.cities(indx2,1)], ...
         [sale.cities(indx1,2) sale.cities(indx2,2)], '*--k', 'LineWidth', 1.25)

    if( ii == 1)
        plot(sale.cities(indx1,1), sale.cities(indx1,2), 'or', 'MarkerSize', 12)
    end  


end

