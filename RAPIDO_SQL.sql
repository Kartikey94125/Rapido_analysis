CREATE DATABASE RAPIDO;
USE RAPIDO;
SELECT*FROM rapidobooking;

#1 To view  the success booking status
CREATE VIEW Successfulbooking AS
SELECT * FROM rapidobooking 
WHERE booking_status="success";

SELECT*FROM successfulbooking;

#2 To view the no of rows in table
SELECT COUNT(*) FROM rapidobooking;

#3 To find the avg of each vehicle

CREATE VIEW RIDE_DISTANCE_FOR_VEHICLE AS
SELECT vehicle_type, AVG(ride_distance) 
FROM rapidobooking 
GROUP BY vehicle_type;

SELECT * FROM RIDE_DISTANCE_FOR_VEHICLE;

#3 GET THE TOTAL NO OF CANCELED BY CUSTOMER
CREATE VIEW CANCEL_BY_CUSTOMER AS
SELECT  COUNT(*) FROM RAPIDOBOOKING 
WHERE BOOKING_STATUS="Canceled by CUSTOMER"; 
SELECT * FROM CANCEL_BY_CUSTOMER;

SELECT * FROM RAPIDOBOOKING;
#4 list top 5 customers who have booked the highest rides

CREATE VIEW  top_5_customer AS
SELECT  Customer_id ,COUNT(booking_id )AS total_rides
FROM rapidobooking
GROUP BY CUSTOMER_ID
ORDER BY total_rides DESC LIMIT 5;
SELECT * FROM top_5_customer;

#5 Get the number of rides canceled by the driver due to personal and car related issue

 CREATE VIEW cancelled_by_driver AS
 SELECT COUNT(*) FROM RAPIDOBOOKING 
 WHERE CANCELED_RIDES_BY_DRIVER= "personal & car related issue";

SELECT * FROM cancelled_by_driver;

 #6 Find the maximum and minimum driver rating for prime sedan
 Create View Max_min_driver_rating AS
 Select max(Driver_ratings) as max_rating,min(Driver_ratings)as min_rating
 From rapidobooking where vehicle_type="Prime sedan";
 
 SELECT * FROM MAX_MIN_DRIVER_RATING;
 
  #7 Retrieve all rides where payment is made using UPI
  Create view upi_payment AS
  SELECT * FROM rapidobooking
  WHERE payment_method="UPI";
  
  SELECT * FROM upi_payment;
  
  
 #8 Find the average customer rating per vehicle type 
 Create view AVG_CUSTOMER_Rating AS 
  SELECT Vehicle_type,avg(Customer_rating) from Rapidobooking
  GROUP BY VEHICLE_TYPE;
   
   SELECT * FROM AVG_customer_rating;
 
 #9 Calculate the total booking value of rides completed successfully
 
  Create view Total_success_value AS 
   SELECT SUM(Booking_value) AS Total_success_value 
   FROM rapidobooking 
   WHERE BOOKING_STATUS="Success";
   
   SELECT * FROM TOTAL_SUCCESS_VALUE;
   
   # 10 List  the incomplete rides along with reason
      CREATE VIEW INCOMPELTE_RIDES_WITH_REASON AS
    SELECT 
    BOOKING_ID, INcomplete_rides_reason FROM  rapidobooking
    WHERE
    incomplete_rides = 'yes';
    
    SELECT * FROM INCOMPELTE_RIDES_WITH_REASON ;
   
    
   
   
 
 
