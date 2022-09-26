clear
clc
%% map allocation
wid = 17; %m
hei = 8; %m

floorplan = rgb2gray(imread('FloorPlan1.jpg'));

figure;
imshow(floorplan);
hold on;

%ImgA = axes('Visible','on','NextPlot','add');
xlim([0,size(floorplan,2)]);
ylim([0,size(floorplan,1)]);
  %xlim([0,17]);
  %ylim([0,8]);
  %h = image(xlim,flip(ylim),floorplan); 
  %h = image(floorplan); 
  %imshow(floorplan,[],'Parent',ImgA);
  %uistack(h,'bottom');

wid = size(floorplan,2) / wid;
hei = size(floorplan,1) / hei;

Sesor_loc = load('sensor_loc.txt');

Sesor_loc(:,2) = Sesor_loc(:,2) .* wid;
Sesor_loc(:,3) = Sesor_loc(:,3) .* hei;
Sesor_loc(:,3) = size(floorplan,1) - Sesor_loc(:,3);

%PloA = axes('Visible','on','NextPlot','add');
scatter(Sesor_loc(:,2),Sesor_loc(:,3));

% for i=1:size(Sesor_loc,1)
%     text(Sesor_loc(i,2)-0.15,Sesor_loc(i,3)-0.2,num2str(Sesor_loc(i,1)),'FontSize',12);
% end

Path = load('path.txt');

for i=1:size(Path, 1)
    j = Path(i,2);
    k = Path(i,3);
    plot([Sesor_loc(j,2),Sesor_loc(k,2)], [Sesor_loc(j,3),Sesor_loc(k,3)]);
end


%% load real sensor
C = load('sensor_list_zero.txt'); 

% add outdoor point
Sesor_loc = [Sesor_loc; [size(Sesor_loc,1) + 1,5,20]];
Path = [Path; [size(Path,1)+1, size(Sesor_loc,1),32]];
index = find(C == 0);
C(index) = size(Sesor_loc,1);

% multi person
C_f = [C(:,1), Sesor_loc(C(:,2),2:3), Sesor_loc(C(:,3),2:3), Sesor_loc(C(:,4),2:3), Sesor_loc(C(:,5),2:3)];

%find activity alteration
C2 = [C(2:size(C,1),2:size(C,2)); C(size(C,1),2:size(C,2))];
C2 = C(:,2:size(C,2)) - C2;

[row, column] = find(C2(:,:) ~= 0);
index = sort(row);
index = unique(index);

for i = 1 : length(index)
    
    j = index(i);
    time1 = C(j,1);
    time2 = C(j+1,1);
    if (time2 > time1 + 1)
       pos1 = C(j,2);
       pos2 = C(j+1,2);
       [dist,pathT] = dispath(Sesor_loc,Path,pos1,pos2);
       [tq1, xq1, yq1] = refineL(time1, time2, dist, pathT, Sesor_loc);
       
       pos1 = C(j,3);
       pos2 = C(j+1,3);
       [dist,pathT] = dispath(Sesor_loc,Path,pos1,pos2);
       [tq2, xq2, yq2] = refineL(time1, time2, dist, pathT, Sesor_loc);
       
       pos1 = C(j,4);
       pos2 = C(j+1,4);
       [dist,pathT] = dispath(Sesor_loc,Path,pos1,pos2);
       [tq3, xq3, yq3] = refineL(time1, time2, dist, pathT, Sesor_loc);
       
       pos1 = C(j,5);
       pos2 = C(j+1,5);
       [dist,pathT] = dispath(Sesor_loc,Path,pos1,pos2);
       [tq4, xq4, yq4] = refineL(time1, time2, dist, pathT, Sesor_loc);
       
       C_f = [C_f;[tq1',xq1',yq1', xq2', yq2', xq3', yq3', xq4', yq4']];
       
     end
end

C_f = sortrows(C_f,1);

% figure;
% hold on;
% xlim([0,13]);
% ylim([0,8]);
% h = image(xlim,flip(ylim),floorplan); 
% uistack(h,'bottom');

for i = 1 : size(C_f,1)-1
    a = log10(i+10);
    hour = floor(C_f(i,1) / 3600);
    min = floor(mod(C_f(i,1),3600) / 60);
    sec = mod(mod(C_f(i,1),3600), 60);
%     h0=text(6.0,7.5,num2str(C_f(i,1)),'FontSize',16);
    h0 = text(7.0,8.5,['Time  ',num2str(hour,'%02d'),' : ',num2str(min,'%02d'),' : ',num2str(sec,'%02d')],'FontSize',16);
    
    h1 = plot(C_f(i:i+1,2),C_f(i:i+1,3),'Color', [246/255, 83/255, 20/255],'LineWidth',a);
    h2 = plot(C_f(i:i+1,4)-0.05,C_f(i:i+1,5)-0.1,'Color', [124/255, 187/255, 0/255],'LineWidth',a);
    h3 = plot(C_f(i:i+1,6)+0.05,C_f(i:i+1,7)+0.1, 'Color', [0/255, 161/255, 241/255],'LineWidth',a);
    h4 = plot(C_f(i:i+1,8)+0.1,C_f(i:i+1,9)-0.2, 'Color', [255/255, 187/255, 0/255],'LineWidth',a);
%     h4 = scatter(C_f(i+1,2),C_f(i+1,3), 100, 'd');
%     h5 = scatter(C_f(i+1,4),C_f(i+1,5), 100, 'k');
%     h6 = scatter(C_f(i+1,6),C_f(i+1,7), 100, 'd');
    h5 = text(C_f(i+1,2),C_f(i+1,3)+0.1, 'A', 'FontSize', 12, 'Color', [246/255, 83/255, 20/255]);
    h6 = text(C_f(i+1,4),C_f(i+1,5), 'B', 'FontSize', 12, 'Color', [124/255, 187/255, 0/255]);
    h7 = text(C_f(i+1,6),C_f(i+1,7)+0.2, 'C', 'FontSize', 12, 'Color', [0/255, 161/255, 241/255]);
    h8 = text(C_f(i+1,8),C_f(i+1,9)-0.1, 'D', 'FontSize', 12, 'Color', [255/255, 187/255, 0/255]);
    %plot gif
    frame=getframe(gcf);
    imind=frame2im(frame);
    [imind,cm] = rgb2ind(imind,256);
    if i==1
         imwrite(imind,cm,'path.gif','gif', 'Loopcount',inf,'DelayTime',0.00001);
    else
         imwrite(imind,cm,'path.gif','gif','WriteMode','append','DelayTime',0.00001);
    end
    
% %     pause(0.0001);
    delete(h0);
    delete(h5);
    delete(h6);
    delete(h7);
    delete(h8);
%     if mod(i,100) == 0
%         delete(h1);
%         delete(h2);
%     end
    
end



% for i = 1 : size(C,1)-1
%     pos1 = C(i,2);
%     pos2 = C(i+1,2);
%     time1 = C(i,1);
%     time2 = C(i+1,1);
%     
%     if (pos1 ~= pos2 && time2 > time1 + 1)
%         [dist,pathT] = dispath(Sesor_loc,Path,pos1,pos2);
%         [xq, yq] = refineL(time1, time2, dist, pathT, Sesor_loc);
%     end
%     
% end
% 
% pos1 = 1;
% pos2 = 10;
% time1 = 15;
% time2 = 30;
% [dist,pathT] = dispath(Sesor_loc,Path,pos1,pos2);
% 
% deltaT = (time2 - time1) / dist;
% 
% if (time2 > time1 + 1)
%     Xm = Sesor_loc(pathT,2);
%     Ym = Sesor_loc(pathT,3);
%     termX = [Xm(1);Xm(1:length(Xm)-1)];
%     termY = [Ym(1);Ym(1:length(Ym)-1)];
%     Dm = sqrt((Xm-termX).^2 + (Ym-termY).^2);
%     Tm = Dm .* deltaT;
%     for i = 2:length(Tm)
%         Tm(i) = Tm(i-1) + Tm(i);
%     end
%     termT = 1 :(time2-time1);
%     xq = interp1(Tm,Xm,termT);
%     yq = interp1(Tm,Ym,termT);
% end