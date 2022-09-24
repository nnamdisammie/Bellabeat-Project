use bellabeat;

#Getting the counts of calories, steps and intensities for each hour of the day
select RIGHT(hc.ActivityHour, 11) AS Hours,
SUM(Calories) AS Calories,
 SUM(TotalIntensity) AS Intensity,
 SUM(StepTotal) AS StepTotal
FROM hourlycalories_merged hc
JOIN hourlyintensities_merged hi
ON hc.Id = hi.Id and hc.ActivityHour = hi.ActivityHour
JOIN hourlysteps_merged hs 
ON hs.Id = hi.Id and hs.ActivityHour = hi.ActivityHour
GROUP BY Hours;

#Getting the distance covered for the users
SELECT ROUND(SUM(veryactivedistance), 2) AS VeryActiveDistance,
ROUND(SUM(ModeratelyActiveDistance), 2) AS ModeratelyActiveDistance,
ROUND(SUM(LightActiveDistance), 2) AS LightActiveDistance,
ROUND(SUM(SedentaryActiveDistance), 2) AS SedentaryActiveDistance
FROM dailyactivity_merged;

#Getting the active miinutes for the users
SELECT ROUND(SUM(VeryActiveMinutes), 2) AS VeryActiveMinutes,
ROUND(SUM(FairlyActiveMinutes), 2) AS FairlyActiveMinutes,
ROUND(SUM(LightlyActiveMinutes), 2) AS LightlyActiveMinutes,
ROUND(SUM(SedentaryMinutes), 2) AS SedentaryMinutes
FROM dailyactivity_merged;

#Getting the total number of users
SELECT COUNT(DISTINCT Id)
FROM dailyactivity_merged;

#getting the number of days of active users
WITH Total_Number AS
(SELECT Id,
count(*) AS Number_of_days
FROM dailyactivity_merged
GROUP BY 1
)
SELECT Number_of_days, COUNT(*)
FROM Total_Number
GROUP BY 1;

#caluclating for the total steps and calories for each users
SELECT Id,
 SUM(TotalSteps) AS TotalSteps,
 SUM(Calories) AS Calories
FROM dailyactivity_merged
GROUP BY 1;
 