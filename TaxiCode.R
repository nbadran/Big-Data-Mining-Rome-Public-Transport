# 1 Read the dataset
taxi_data <- read.csv("taxi.csv")


# ---------------------------------------------------------------------------------------------------------------------------


# Explore the structure of the dataset
head(taxi_data)
summary(taxi_data)
str(taxi_data)
dim(taxi_data)


# ---------------------------------------------------------------------------------------------------------------------------


# 2 Convert the Date.and,Time column to a proper format that R can understand
taxi_data$Date.and.Time <- as.POSIXct(taxi_data$Date.and.Time, format = "%Y-%m-%d %H:%M:%S", tz = "UTC")


# ---------------------------------------------------------------------------------------------------------------------------

# 3 Identify invalid data points
invalid_data <- taxi_data$Longitude > 15 | taxi_data$Latitude > 50

# 4 Remove invalid data points
taxi_data_filtered <- taxi_data[!invalid_data, ]

#---- OR ----

#  A Define the latitude and longitude ranges for Rome
rome_latitude_range <- c(41, 43)
rome_longitude_range <- c(11.5, 13)

# Identify invalid data points outside Rome's latitude and longitude ranges
invalid_data <- taxi_data$Latitude < rome_latitude_range[1] | 
  taxi_data$Latitude > rome_latitude_range[2] |
  taxi_data$Longitude < rome_longitude_range[1] | 
  taxi_data$Longitude > rome_longitude_range[2]

# Remove invalid data points
taxi_data_filtered <- taxi_data[!invalid_data, ]


# Plot latitude vs longitude with invalid data removed
plot(taxi_data_filtered$Longitude, taxi_data_filtered$Latitude,
     xlab = "Longitude", ylab = "Latitude",
     main = "2D Scatter Plot of Taxi Location Points (Invalid Data Removed)",
     pch = 16, col = "lightgreen")


# ---------------------------------------------------------------------------------------------------------------------------


# B Compute the minimum, maximum, and mean location values.
min_longitude <- min(taxi_data_filtered$Longitude)
max_longitude <- max(taxi_data_filtered$Longitude)
mean_longitude <- mean(taxi_data_filtered$Longitude)

# Print the results
cat("Longitude - Min:", min_longitude, ", Max:", max_longitude, ", Mean:", mean_longitude, "\n")
cat("Latitude - Min:", min_latitude, ", Max:", max_latitude, ", Mean:", mean_latitude, "\n")


# ---------------------------------------------------------------------------------------------------------------------------


# C  Obtain the most active, least active, and average activity of the taxi drivers (most time driven, least
#    time driven, and mean time driven).
time_per_driver <- aggregate(as.numeric(as.POSIXct(taxi_data$Date.and.Time)), 
                             by = list(taxi_data$DriveNo), 
                             FUN = function(x) sum(diff(x)))

# Least Active

least_active_driver <- time_per_driver[which.min(time_per_driver$x), ]
# Extract information for the least active driver
least_active_data <- taxi_data[taxi_data$DriveNo == least_active_driver$Group.1, ]

# Print information about the least active driver
cat("Least Active Driver Information:\n")
cat("Driver Number:", least_active_driver$Group.1, "\n")
cat("Total Time Driven (seconds):", least_active_driver$x, "\n")
cat("Number of Records:", nrow(least_active_data), "\n")

# Most Active

most_active_driver <- time_per_driver[which.max(time_per_driver$x), ]
# Extract information for the most active driver
most_active_data <- taxi_data[taxi_data$DriveNo == most_active_driver$Group.1, ]

# Print information about the most active driver
cat("\nMost Active Driver Information:\n")
cat("Driver Number:", most_active_driver$Group.1, "\n")
cat("Total Time Driven (seconds):", most_active_driver$x, "\n")
cat("Number of Records:", nrow(most_active_data), "\n")

# Average

# Calculate the average time driven by each driver
average_time_per_driver <- mean(time_per_driver$x)

# Print the average time driven by each driver
cat("Average Time Driven by Each Driver (seconds):", average_time_per_driver, "\n")


# ---------------------------------------------------------------------------------------------------------------------------


# D
# i Filter data for TaxiID 273 and plot location points ------------------------------------------
taxi_273 <- taxi_data_filtered[taxi_data_filtered$DriveNo == 273, ]

plot(taxi_273$Longitude, taxi_273$Latitude, xlab = "Longitude", ylab = "Latitude", main = "Location Points for TaxiID 273")

# ii Compute mean, min, and max location values for TaxiID 273 ------------------------------------------
mean_lat_273 <- mean(taxi_273$Latitude)
min_lat_273 <- min(taxi_273$Latitude)
max_lat_273 <- max(taxi_273$Latitude)

mean_lon_273 <- mean(taxi_273$Longitude)
min_lon_273 <- min(taxi_273$Longitude)
max_lon_273 <- max(taxi_273$Longitude)

# Print statistics for TaxiID 273 and global statistics
cat("TaxiID 273 Statistics:\n")
cat("Mean Latitude:", mean_lat_273, "\n")
cat("Min Latitude:", min_lat_273, "\n")
cat("Max Latitude:", max_lat_273, "\n")
cat("Mean Longitude:", mean_lon_273, "\n")
cat("Min Longitude:", min_lon_273, "\n")
cat("Max Longitude:", max_lon_273, "\n")

cat("\nGlobal Statistics:\n")
cat("Mean Latitude:", mean_latitude, "\n")
cat("Min Latitude:", min_latitude, "\n")
cat("Max Latitude:", max_latitude, "\n")
cat("Mean Longitude:", mean_longitude, "\n")
cat("Min Longitude:", min_longitude, "\n")
cat("Max Longitude:", max_longitude, "\n")

# iii Compute total time driven by TaxiID 273 ------------------------------------------
total_time_273 <- sum(time_diff_per_driver[273])

# Compute global mean, min, and max values of time driven
mean_time_global <- mean(time_diff_per_driver)
min_time_global <- min(time_diff_per_driver)
max_time_global <- max(time_diff_per_driver)

# Print total time driven by TaxiID 273 and global statistics
cat("Total Time Driven by TaxiID 273:", total_time_273, "seconds\n")
cat("Global Mean Time Driven:", mean_time_global, "seconds\n")
cat("Global Min Time Driven:", min_time_global, "seconds\n")
cat("Global Max Time Driven:", max_time_global, "seconds\n")


names(time_per_driver) <- c("Driver", "TotalTimeDriven")

# Now, you can access the total time driven for each driver
time_diff_per_driver <- time_per_driver$TotalTimeDriven

# Calculate total time driven for driver 273
total_time_273 <- sum(time_diff_per_driver[time_per_driver$Driver == 273])
# iv Compute distance traveled by TaxiID 273 ------------------------------------------
R <- 6371000  # Radius of the Earth in meters
d_lon <- diff(taxi_273$Longitude)
d_lat <- diff(taxi_273$Latitude)
a <- (sin(d_lat/2))^2 + cos(taxi_273$Latitude[-length(taxi_273$Latitude)]) * cos(taxi_273$Latitude[-1]) * (sin(d_lon/2))^2
c <- 2 * atan2(sqrt(a), sqrt(1-a))
distance_273 <- R * sum(c)

# ---------------------------------------------------------------------------------------------------------------------------
# Assuming the dataset is named taxi_data
# Subset the data for driver number 352
driver_352_data <- subset(taxi_data, DriveNo == 352)

# Convert the Date.and.Time column to POSIXct format
driver_352_data$Date.and.Time <- as.POSIXct(driver_352_data$Date.and.Time)

# Calculate the time differences between consecutive rows
time_diff <- diff(driver_352_data$Date.and.Time)

# Sum up all the time differences to get the total time driven
total_time_driven_seconds <- sum(as.numeric(time_diff), na.rm = TRUE)

# Convert total time driven to seconds
total_time_seconds <- total_time_driven_seconds %% 60

# Print the total time driven
cat("Total time driven by driver 352:\n")
cat("Seconds:", total_time_seconds, "\n")

#--- Check total time for all drivers

# Calculate total time driven for each driver
time_per_driver <- aggregate(as.numeric(as.POSIXct(taxi_data$Date.and.Time)), 
                             by = list(taxi_data$DriveNo), 
                             FUN = function(x) sum(diff(x)))

# Print total time driven for each driver
cat("Driver Number\tTotal Time Driven (seconds)\n")
for (i in 1:nrow(time_per_driver)) {
  cat(time_per_driver[i, "Group.1"], "\t\t", time_per_driver[i, "x"], "\n")
}
