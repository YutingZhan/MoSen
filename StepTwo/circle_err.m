function [x, y] = circle_err(x1, y1, rc, L)
    a = 2*pi*rand(1, L);
    r = sqrt(rand(1,L));
    x = (rc*r').*cos(a')+x1;
    y = (rc*r').*sin(a')+y1;
end