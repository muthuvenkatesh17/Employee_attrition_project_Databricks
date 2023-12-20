-- Databricks notebook source
select * From employee_attrition

-- COMMAND ----------

-- DBTITLE 1,TOTAL EMPLOYEE COUNT
Select sum(EmployeeCount) From employee_attrition

-- COMMAND ----------

-- DBTITLE 1,FIND OUT ATTRITION EDITION 
select sum(EmployeeCount), attrition From employee_attrition 
group by 2

-- COMMAND ----------

-- DBTITLE 1,AGE ATTRITION --Lets Analysis Which Age group Attrition is High (18-24,25-31,32-38,39-45,46-52,52+)
select sum(EmployeeCount),
CASE 
  WHEN age BETWEEN 20 AND 25 THEN '20-25' 
  WHEN age BETWEEN 26 AND 32 THEN '26-32' 
  WHEN age BETWEEN 33 AND 40 THEN '33-40' 
  ELSE '40+'
END AS age_group
 
From employee_attrition
where attrition='Yes'
group by 2

-- COMMAND ----------

-- DBTITLE 1,INSIGHT NUMBER 1
# Most of the people leaving the company in the age group of 26-32

-- COMMAND ----------

-- DBTITLE 1,Find out ATTRITION DEPARTMENT 
select sum(EmployeeCount),department From employee_attrition 
where attrition="Yes"
group by Department

-- COMMAND ----------

-- DBTITLE 1,Attrition by Education (1-below college, 2-College, 3-Bachelor, 4-Master ,5-Doctor)
select sum(EmployeeCount),
case 
when education=1 then 'Below college'
when education=2 then 'College'
when education=3 then 'Bachelor'
when education=4 then 'Master'
else 'Doctor'
end ed_group
From employee_attrition 
where attrition="Yes"
group by 2

-- COMMAND ----------

-- DBTITLE 1,Attriton by Environment Satisfaction (1-Low,2-High,3-Medium,4-Highly Satisfied)
select sum(EmployeeCount),
EnvironmentSatisfaction 
From employee_attrition 
where attrition="Yes"
group by 2

-- COMMAND ----------

-- DBTITLE 1,Attriton by Job Satisfaction (1-Low,2-High,3-Medium,4-Highly Satisfied)
select sum(EmployeeCount),
JobSatisfaction 
From employee_attrition 
where attrition="Yes"
group by 2

-- COMMAND ----------

-- DBTITLE 1,Attrition by Business Travel
select sum(EmployeeCount),
BusinessTravel
From employee_attrition 
where attrition="Yes"
group by 2

-- COMMAND ----------

-- DBTITLE 1,Overall Insights From Given Data 
#INSIGHTS

1) Employee age between 26-32 are Leaving from the organization 
2) More people from Research and Department are Leaving from the organization
3) 41.77% of people who having a Bachelor degree have left the organization 
4) 72 people left the organization due to the poor Environment location
5) People who travels rarely left the organization  

