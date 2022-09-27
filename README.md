# MoSen

Simulation Environment: MATLAB

##### Real Trajectory: 

Based on the sensor activation versus time, we assume *the real trajectory* is defined by the optimal paths between adjacent sensor activities. 

##### Detected Trajectory:

The *detected trajectory* is synthesized under the real trajectory and the different localization resolutions. 

<img src="architecture2.jpg" width="400"/>

## Step One | Visualization of multi-Occupancy (real) trajectories

Run "one_main.m": apply the target smart home floorplan and proposed sensor layout, visualize the real trajectory in the multi-person scenarios.

---

#### Input:
##### 1. a_floorplan.jpg: the floorplan of the target smart home;
##### 2. b_sensor_loc.txt: the proposed sensor layout in the target smart home, i.e., the (x, y) readings of each sensor;
##### 3. c_path.txt: the list of all bridge connections among sensor nodes;
##### 4. d_trajectory_data.txt: multi-Occupancy trajectories; column 1 - 4 represents the triggered sensors by residents 1 - 4; '0' represents in the current key timestamp, the resident keep same location as the last key timestamp.

-------

#### Output:
##### path.gif: visualization of trajectory_data.txt with the specified floorplan and sensor layout

<img src="path.gif" width="400"/>

## Step Two | Simulate the localization error (detected trajectory) and labeling classification

a_location_list.txt: map the sensor id and corresponding sensor locations, then we would have (x, y) readings of the trajectories instead of the sensor id. 

---
Run "0_local_main_2.m": to simulate the localization error, compare the detected trajectories and real trajectories, and do the labeling classification, record and calculate the labeling accuracy

---

#### Input:
##### 1. a_location_list.txt: real trajectories of multiple residents;
##### 2. b_sensor_list.txt: sensor trigger list of multiple residents;
##### 3. rc: parameter in circle_err.m; define the localization resolution of each sensor;

-------

#### Output:
##### the labeling accuracy

## Step Three | Visualization of the (detected) trajectories & Final analysis and design insights

<img src="trajectory.gif" width="400"/>

For the analysis details, please refer to the results section in the paper.
