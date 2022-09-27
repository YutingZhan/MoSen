# MoSen

Smart home solutions increasingly rely on various sensors for behavioral analytics and activity recognition to provide context-aware applications and personalized care. Optimizing the sensor network is one of the most critical approaches to ensuring classification accuracy and system efficiency. However, the trade-off between the cost and performance is often a challenge in real deployments, particularly for multiple-occupancy smart homes or care homes. In this work, using actual indoor activity and mobility traces, floor plans, and synthetic multi-occupancy behavior models, we evaluate several multi-occupancy household scenarios with 2-5 residents. We explore and quantify the trade-offs between the cost of sensor deployments and expected labeling accuracy in different scenarios. The evaluation across different scenarios shows that the performance of the desired context-aware task is affected by different localization resolutions, the number of residents, the number of sensors, and varying sensor deployments.

---

##### Simulation Environment: MATLAB

---

##### Real Trajectory: 

Based on the sensor activation versus time, we assume *the real trajectory* is defined by the optimal paths between adjacent sensor activities. 

##### Detected Trajectory:

The *detected trajectory* is synthesized under the real trajectory and the different localization resolutions. 

<img src="architecture2.jpg" width="400"/>

---

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

<img src="path.gif" width="600"/>

---

## Step Two | Simulate the localization error (detected trajectory) and labeling classification

a_location_list.txt: by mapping the sensor id and corresponding sensor locations, then we would have (x, y) readings of the trajectories instead of the sensor id. 

---
Run "two_main.m": to simulate the localization error, compare the detected trajectories and real trajectories, and do the labeling classification, record and calculate the labeling accuracy

---

#### Input:
##### 1. a_location_list.txt: real trajectories of multiple residents;
##### 2. b_sensor_list.txt: sensor trigger list of multiple residents;
##### 3. rc: parameter in circle_err.m; define the localization resolution of each sensor;

-------

#### Output:
##### the labeling accuracy

---

## Step Three | Visualization of the (detected) trajectories & Final analysis and design insights

<img src="trajectory2.gif" width="600"/>

For the analysis details, please refer to the results section in the paper.
