function show_ac(C,Sesor_loc)
    for i=1:size(C,1)
        
        h=text(4.5,4.5,num2str(C(i,1)),'FontSize',16);
        
        a = 100 * log10(i+10);
        a = floor(a);
        
        if (C(i,2) > 0)
            scatter(Sesor_loc(C(i,2), 2),Sesor_loc(C(i,2), 3), a, 'd');
        end
        if (C(i,3) > 0)
            scatter(Sesor_loc(C(i,3), 2),Sesor_loc(C(i,3), 3), a, 'k');
        end
        
        delete(h);
        pause(0.01);

    end
end