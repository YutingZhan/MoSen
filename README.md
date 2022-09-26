# MoSen

Simulation Environment: MATLAB

##### Real Trajectory: 

Based on the sensor activation versus time, we assume *the real trajectory* is defined by the optimal paths between adjacent sensor activities. 

##### Detected Trajectory:

The *detected trajectory* is synthesized under the real trajectory and the different localization resolutions. 

<img src="architecture2.jpg" width="400"/>

## Step One | Visualization of Multi-Occupancy Trajectories

Run "0_local_main_1.m"

---

#### Input:
##### 1. 01_floorplan.jpg: the floorplan of the target smart home;
##### 2. 02_sensor_loc.txt: the proposed sensor layout in the target smart home, i.e., the (x, y) readings of each sensor;
##### 3. 03_path.txt: the list of all bridge connections among sensor nodes;
##### 4. 04_trajectory_data.txt: multi-Occupancy trajectories; column 1 - 4 represents the triggered sensors by residents 1 - 4; '0' represents in the current key timestamp, the resident keep same location as the last key timestamp.

-------

#### Output:
##### path.gif: visualization of trajectory_data.txt with the specified floorplan and sensor layout

<img src="path.gif" width="400"/>

## Step Two | Simulate the localization error and identification classification

Run "0_local_main_2.m"

---

#### Input:
##### 1. 01_sensor_loc.txt: the proposed sensor layout in the target smart home, i.e., the (x, y) readings of each sensor;
##### 2. 02_sensor_loc.txt: 
##### 3. 03_path.txt: the list of all bridge connections among sensor nodes;
##### 4. 04_trajectory_data.txt: multi-resident trajectories

-------

#### Output:
##### path.gif: visualization of trajectory_data.txt with the specified floorplan and sensor layout
