%% Sensor?location
%x = 1:5;
%y = 1:5;
%[X,Y] = meshgrid(x,y);
%SL = [X(:),Y(:)];

SL = load('sensor.txt');
%plot the map
figure;
scatter(SL(:,1),SL(:,2));

%% Sensor activities
% How many people
x = 2;
% How many activities
y = 1000;
%Sensor act
Sa = zeros(y,x);
for i=1:y
    Sa(i,:) = randperm(size(SL,1),x);
end

%% Generate people's loaction using Sensor state
%absolute error of localization
EL = 0.5;
%real location
PR1 = SL(Sa(:,1),:);
PR2 = SL(Sa(:,2),:);

%include error / generated error
[PG1(:,1), PG1(:,2)] = circle_err(PR1(:,1), PR1(:,2), EL, size(PR1,1));
[PG2(:,1), PG2(:,2)] = circle_err(PR2(:,1), PR2(:,2), EL, size(PR2,1));

%%visulization
figure
hold on
set(gca,'linewidth',1,'fontsize',10,'fontname','Times');
set(gcf,'color','w');
view(45,45);
axis([-1 max(PR1(:,1))+2, 1 size(PR1,1), -1 max(PR1(:,1))+2]);

for i = 1 : size(PG1,1)-1
    plot3(PG1(i:i+1,1), [i:i+1]', PG1(i:i+1,2),'r');
    plot3(PG2(i:i+1,1), [i:i+1]', PG2(i:i+1,2),'b');
    %pause(0.5);
end

%% classification
PS1= zeros(size(PG1,1),size(Sa,2));
PS2= zeros(size(PG2,1),size(Sa,2));

PS1(:,1) = dis_cal(PG1, SL, Sa(:,1));
PS1(:,2) = dis_cal(PG1, SL, Sa(:,2));

PS2(:,1) = dis_cal(PG2, SL, Sa(:,1));
PS2(:,2) = dis_cal(PG2, SL, Sa(:,2));

[M,I] = min(PS1');
PC1 = Sa(sub2ind(size(Sa),1:size(Sa,1),I))';

[M,I] = min(PS2');
PC2 = Sa(sub2ind(size(Sa),1:size(Sa,1),I))';

PC = [PC1, PC2];

Compare = [Sa, PC];

compare1 = find(Compare(:,1)==Compare(:,3));
compare2 = find(Compare(:,2)==Compare(:,4));

xlswrite('Compare_5person.xls', Compare)
xlswrite('Compare_5person_1.xls', compare1)
xlswrite('Compare_5person_2.xls', compare2)

