function dist = dis_cal(PG, SL, Sa)
   
    term1 = PG - SL(Sa,:);
    term2 = term1.^2;
    term3 = sum(term2')';
    dist = sqrt(term3);
    
end