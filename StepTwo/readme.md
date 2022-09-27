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
