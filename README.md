# Data-Mining - Rome Public Transport
A comprehensive analysis of urban mobility patterns using GPS location data from public transport vehicles, specifically focusing on taxis in the metropolitan city of Rome, Italy. The aim was to extract valuable insights to identify and address issues within the urban road network. Worked on a big dataset.

# Preface
The analysis of results from urban mobility simulations can provide very valuable information for identifying and addressing problems in an urban road network. Public transport vehicles such as buses and taxis are often equipped with GPS location devices, and the location data is submitted to a central server for analysis.

The metropolitan city of Rome, Italy collected location data from 320 taxi drivers operating in the center of Rome. Data was collected during the period from February 1, 2014, until March 2, 2014. An extract of the dataset can be found in taxi.csv.

# Dataset Description
The dataset taxi.csv contains the following attributes:

ID: A unique numeric ID for each taxi driver.
Date and Time: Timestamps in the format Y:m:d H:m:s.msec+tz, where msec represents microseconds and tz is the time zone adjustment. The format may need to be adjusted for compatibility with R.
Latitude: The latitude coordinate of the taxi's location.
Longitude: The longitude coordinate of the taxi's location.
For a further description of this dataset, visit IEEE DataPort.

# Purpose of the Task
The purpose of this task is to:

Perform a general analysis of the dataset.
Learn to work with large datasets.
Obtain general information on the behavior of some taxi drivers.
Analyze and interpret results.
Prepare for future projects based on this dataset.

# Analysis Tasks
(a) Plot Location Points
Objective: Create a 2D plot using all latitude and longitude value pairs in the dataset.
Invalid Points, Noise, and Outliers: Define and justify what is considered invalid, noise, and outlier points. Indicate these points clearly in the plot.
Plot Requirement: The plot should be informative and clearly explain the rationale used for identifying invalid points, noise points, and outliers.
Action: Remove invalid points, outliers, and noise points before proceeding with the subsequent tasks.
(b) Compute Location Values
Objective: Compute the minimum, maximum, and mean location values (latitude and longitude).
(c) Analyze Taxi Driver Activity
Objective: Determine the most active, least active, and average activity of the taxi drivers in terms of time driven.
Explanation: Explain the rationale behind the approach and interpret the results.

# Plot Location Points
lot the location points for the specific taxi ID.
Compare Location Values: Compare the mean, min, and max location values of the specific taxi ID with the global values.
Compare Activity: Compare the total time driven by the specific taxi ID with the global mean, min, and max values.

# Results and Insights
The analysis provided insights into urban mobility patterns in Rome.
Identified peak traffic times and areas of high congestion.
Detected inefficiencies in the taxi network.
Highlighted key routes for potential infrastructure improvements or traffic management interventions.

# Conclusion
This project demonstrated the value of using GPS data from public transport vehicles to gain insights into urban mobility patterns. The findings can help city planners and transportation authorities make data-driven decisions to enhance the efficiency and sustainability of Rome's urban road network.
