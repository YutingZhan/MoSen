% SL = Sensor Triggered List
SL = load('L_sensor_list.txt');
% TS = Trajectory based on sensors
TS = load('Loc_Real.txt');
% TE = Trajectory with Error
%TE = load('Loc_Gen.txt');

a = SL(:,1);
b = TS(:,1);

% Timestamp 
lia = ismember(b,a);
timestamp = find(lia == 1);

Location_list = TS(timestamp,:);

