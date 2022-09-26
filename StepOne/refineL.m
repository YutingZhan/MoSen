function [termT, xq, yq] = refineL(time1, time2, dist, pathT, Sesor_loc)
    
    if dist > 0
        
        deltaT = (time2 - time1) / dist;

        Xm = Sesor_loc(pathT,2);
        Ym = Sesor_loc(pathT,3);
        termX = [Xm(1); Xm(1:length(Xm)-1)];
        termY = [Ym(1); Ym(1:length(Ym)-1)];
        Dm = sqrt((Xm-termX).^2 + (Ym-termY).^2);
        Tm = Dm .* deltaT;
        for i = 2:length(Tm)
            Tm(i) = Tm(i-1) + Tm(i);
        end
        termT = 1 : (time2-time1 - 1);
        xq = interp1(Tm,Xm,termT);
        yq = interp1(Tm,Ym,termT);

        termT = time1 + termT;
    else
        termT = 1 : (time2-time1 - 1);
        termT = time1 + termT;
        Xm = Sesor_loc(pathT,2);
        Ym = Sesor_loc(pathT,3);
        xq = ones(1,length(termT)) * Xm;
        yq = ones(1,length(termT)) * Ym;
    end
end