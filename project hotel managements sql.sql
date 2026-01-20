-- Question - 1] The accounts team wants to check payments made via UPI to measure digital 
select * from payments 
where PaymentMethod = 'UPI';

-- Question - 2] List all unique first names of customers for a duplicate check.
select  distinct firstname
from customers;

-- Delete all rooms with Capacity = 1. 
set sql_safe_updates = 0;
delete from rooms where capacity = 1;


-- Question - 4] Display each customer’s name and phone number together using CONCAT. 
SELECT 
  CONCAT(firstname, lastname, phone) AS customercontact
FROM customers;


-- Question - 5] The booking office wants to see bookings where RoomID = 10 to check utilization 

select * from bookings 
where roomid = 10;

-- Question - 6] Identify rooms whose Capacity is greater than the average Capacity of all rooms. 
select * from rooms 
where capacity >( select 
avg(capacity) from rooms);


-- Question - 7] Create a VIEW StaffContact showing Staff FirstName, LastName, Role, and phone
 create  VIEW StaffContact as 
 select 
 firstname,
 lastname,
 Role,
 phone
 from staff;
 
 select * from StaffContact;
 
 -- Question - 8] The receptionist wants to offer Suite rooms under ₹7000 to business travelers. 
select * from rooms
where RoomType = 'suite' 
and PricePerNight <7000;
 
-- Question - 9] The admin wants to see email addresses sorted by LastName from the Customers 

select email from customers
order by lastname desc;

-- Question - 10] Show staff full names combined into one column. 
select concat(firstname,lastname) as fullname 
from staff;

-- Question - 11] Dsplay all payment details in one line using CONCAT_WS. 
select concat_ws(" ",PaymentID,
BookingID,
PaymentDate,
PaymentMethod,
Amount)
as payment_details
 from payments;

-- Question - 12] The hotel wants to display the 2 most expensive rooms for VIP guests. 
select * from rooms 
order by PricePerNight desc
limit 2;

-- Question - 13] Show each BookingID with its CheckIn and CheckOut dates combined. 
select BookingID,
concat_ws('to',CheckInDate,CheckOutDate) as dates_combined
from bookings;

-- Question - 14] Finance wants to calculate the average Amount per PaymentMethod. 
select PaymentMethod,
avg(Amount) as Avg_amount
from payments
group by PaymentMethod;


-- Question - 15] The analytics team wants to find the city where average CustomerID is greater than50
select  city,
 avg(customerID) as avg_customerID
from customers 
group by city
having avg(CustomerID)>50;

-- Question - 16] Find bookings where TotalAmount exceeds the average TotalAmount. (Bookings subquery)

select * from bookings
where TotalAmount > (
select avg(TotalAmount) from bookings);

-- Question - 17] Display the last 2 added rooms from the Rooms table. 
select * from rooms
order by RoomID desc
limit 2;

-- Question - 18] The cashier wants a report of payments where Amount < ₹1500 for small transactions.
SELECT *
FROM Payments
WHERE Amount < 15000;


-- Question - 19] Management wants to list all customers who have made more than 5 bookings. 

select CustomerID,count(BookingID) as total_booking
from bookings 
group by CustomerID
having count(BookingID) >5;



-- Question - 20] Identify customers who live in the same city. (Customers self join) 








-- Question - 21] Show the total revenue handled by each StaffID. 
SELECT 
StaffID,
SUM(TotalAmount) AS Total_Revenue
FROM bookings
group by StaffID;

-- Question - 22] The manager wants to see all customers from Mumbai to check city-wise marketing campaigns.
select * from customers
where City = 'mumbai';



-- Question - 23] Display the 3 lowest booking amounts. 
select *  from bookings
order by TotalAmount asc 
limit 3;


-- Question - 24] Insert 5 new room records with type, price, and capacity into the Rooms table. 
INSERT INTO Rooms (RoomType, PricePerNight, Capacity)
VALUES
('Single', 2000, 1),
('Double', 3500, 2),
('Deluxe', 5500, 3),
('Suite', 8500, 4),
('Family', 6500, 5);

select * from rooms;


-- Question - 25] Show all unique CustomerIDs from bookings. 

SELECT DISTINCT CustomerID
FROM Bookings;

-- Question - 26] Create a trigger to automatically delete a payment when its corresponding booking is deleted. 

DELIMITER //
CREATE TRIGGER delete_payment_after_booking_delete
AFTER DELETE ON Bookings
FOR EACH ROW
BEGIN
DELETE FROM Payments
WHERE BookingID = OLD.BookingID;
END//

DELIMITER ;

-- Question - 27] The marketing team wants to update the FirstName of CustomerID = 30 to 'Rahul'. 

UPDATE Customers
SET FirstName = 'Rahul'
WHERE CustomerID = 30;


-- Question - 28] List all bookings ordered by CheckInDate. 
select * from bookings
order by CheckInDate;



-- Question - 29] Show all rooms where capacity is greater than 2. 
select * from rooms
where Capacity >2;


-- Question - 30] List staff emails ordered by their roles. 
select email from staff
order by Role;


-- Question - 31] Display each customer’s full name and city using CONCAT_WS. 
SELECT 
CONCAT_WS(' ', FirstName, LastName) AS Full_Name,
City
FROM Customers;


-- Question - 32] Show the first 4 customers’ full names only. 
SELECT FirstName, LastName  AS Full_Name
FROM Customers
LIMIT 4;


-- Question - 33] Show each staff’s role with their full name. 
select role , concat(firstname,lastname) as full_name
from staff;

-- Question - 34] Management wants to find the average StaffID per role. 
SELECT 
Role,
AVG(StaffID) AS Avg_StaffID
FROM Staff
GROUP BY Role;

-- Question - 35] List all bookings handled by StaffID = 2. 
select * from bookings
where StaffID = 2;

-- Question - 36] Display the first 3 staff alphabetically by their first names. 
select * from staff 
order by firstname asc
limit 3;

-- Question - 37] The front desk manager wants to see customers where FirstName = 'Amit' AND City = 'Nagpur' for personal attention. 

select * from customers 
where firstname = 'Amit' and city =  'Nagpur';


-- Question - 38] Show all unique payment methods in descending order. 
select  distinct PaymentMethod from payments 
order by PaymentMethod desc; 

-- Question - 39] Insert 5 staff members into the Staff table with their role, phone, and email. 
INSERT INTO Staff (Role, Phone, Email)
VALUES
('Manager', '9876543210', 'manager1@hotel.com'),
('Receptionist', '9123456780', 'reception1@hotel.com'),
('Cashier', '9988776655', 'cashier1@hotel.com'),
('Housekeeping', '9012345678', 'housekeep1@hotel.com'),
('Security', '9090909090', 'security1@hotel.com');

select * from staff;
-- Question - 40] The hotel manager wants to review bookings where CheckInDate is after '2024 01-01' to analyze recent occupancy. 

select * from bookings 
where CheckInDate  > '2024-01-01';


-- Question - 41] List all customers whose FirstName is 'Rahul' for a loyalty program. 

select * from customers 
where firstname = 'Rahul';

-- Question - 42] Show all unique room types offered by the hotel. 

select distinct roomtype
from rooms;

-- Question - 43] Identify customers who spent more than 50,000 in total. 
SELECT 
  CustomerID,
  SUM(TotalAmount) AS Total_Spent
FROM Bookings
GROUP BY CustomerID
HAVING SUM(TotalAmount) > 50000;

-- Question - 44] Delete all customers from the city 'TestCity'. 
set sql_safe_updates=0;
delete  from customers
where city = 'TestCity';

-- Question - 45] Find rooms that have the same PricePerNight. (Rooms self join) 





-- Question - 46] The manager wants to see staff whose Email ends with '@tcs.in' for corporate tie ups
select * from staff 
where Email like '@tcs.in';


-- Question - 47] The analytics team wants to list all cities where maximum CustomerID is more than 100

SELECT City, MAX(CustomerID) AS Max_CustomerID
FROM Customers
GROUP BY City
HAVING MAX(CustomerID) > 100;

-- Question - 48] Show all unique capacities in descending order. 

select distinct Capacity from rooms
order by Capacity desc;

-- Question - 49] List staff working as Managers. 
SELECT *
FROM Staff
WHERE Role = 'Manager';

-- Question - 50] Display each payment’s ID, Method, Amount in one line. 
 SELECT CONCAT_WS('  ', PaymentID, PaymentMethod, Amount) AS Payment_Details
FROM Payments;

-- Question - 51] Show the first 4 payments only. 
select * from payments 
limit 4;

-- Question - 52] The hotel manager wants to review rooms where PricePerNight is between ₹2000 and ₹4000 to offer discounts.
select * from rooms 
where  PricePerNight between 2000 and 4000;
 
 -- Question - 53] List all bookings ordered by CheckInDate. 

SELECT *
FROM Bookings
ORDER BY CheckInDate ;

-- Question - 54] Display all unique CustomerIDs from bookings. 
select distinct customerID from bookings;

-- Question - 55] The hotel manager wants to add new customer details. Insert 5 records with full details into the Customers table. 
INSERT INTO Customers (FirstName, LastName, City, Phone, Email)
VALUES
('Rahul', 'Sharma', 'Pune', '9876543210', 'rahul.sharma@email.com'),
('Neha', 'Verma', 'Mumbai', '9123456780', 'neha.verma@email.com'),
('Amit', 'Patel', 'Nagpur', '9988776655', 'amit.patel@email.com'),
('Pooja', 'Singh', 'Bhopal', '9012345678', 'pooja.singh@email.com'),
('Rohit', 'Kumar', 'Indore', '9090909090', 'rohit.kumar@email.com');

select * from customers;

-- Question - 56] Show the last 2 staff hired. 
select* from staff
order by staffID desc
limit 2;

-- Question - 57] Identify rooms with PricePerNight higher than the maximum PricePerNight of rooms with Capacity = 2. (Rooms subquery) 

select * from rooms 
where PricePerNight >(
select max(PricePerNight)
from rooms 
where Capacity = 2);

-- Question - 58] The HR team wants to see staff whose Role is not 'Chef' for role reallocation. 
select * from staff 
where role <> 'Chef';

-- Question - 59] Show all unique cities in descending order from the Customers table. 

select distinct City from customers
order by City desc;

-- Question - 60] Display the phone number of the Waiter only. 

select phone from staff 
where role = 'Waiter';

-- Question - 61] Display the last 2 bookings in the table. 
select * from bookings
order by BookingID desc
limit 2;

-- Question - 62] The marketing team wants to see customers living in Delhi or Chennai for targeted promotions. 
select * from customers 
where City = 'Delhi' or 'Chennai';

-- Question - 63] Show all rooms where RoomType != 'Family' to plan renovations. 
select * from rooms
where RoomType <> 'Family';

-- Question - 64] List staff emails ordered by their roles. 
select Role ,email  from staff 
order by Role;

-- Question - 65] Display all unique payment methods. 
 select distinct PaymentMethod from payments;
 
 -- Question - 66] The receptionist wants a list of customers whose Phone starts with '98' for mobile offers.

select * from customers 
where phone like '98%';


-- Question - 67] Show the 3 cheapest rooms available for budget travelers. 

SELECT *
FROM Rooms
ORDER BY PricePerNight ASC
LIMIT 3;

-- Question - 68] Display the last 2 payments. 
select * from payments 
order by Amount desc
limit 2;

-- Question - 69] Management wants to know which unique cities customers come from. 
select distinct city
from customers;

-- Question - 70] List all bookings where TotalAmount > 5000. 
select * from bookings 
where TotalAmount>5000;

-- Question - 71] Display each staff’s Role with their Email in one column. 
select concat(Role,' ', Email) as Role_email from staff;

-- Question - 72] Show the first 4 staff full names. 
select concat(firstname, lastname) as full_name from staff 
limit 4;

-- -- Question - 73] Find bookings where TotalAmount is greater than all bookings made by CustomerID = 10. (Bookings subquery) 
select * from bookings
where TotalAmount >(
select max(TotalAmount)
from bookings
where CustomerID = 10);

-- Question - 74] List rooms with capacity >= 3 for family bookings. 
select * from rooms 
where Capacity >= 3;

-- Question - 75] Display the RoomType and Price of only Suite rooms. 
select RoomType , PricePerNight from rooms
where RoomType = 'Suite';


-- Question - 76] The cashier wants to see payments with Amount between ₹2000 and ₹7000 for mid-range billing checks.

select * from payments
where Amount between 2000 and 7000;

-- Question - 77] Insert 5 booking records into the Bookings table with all details. 
INSERT INTO Bookings (CustomerID, RoomID, BookingDate, CheckInDate, CheckOutDate, TotalAmount)
VALUES
(1, 101, '2025-01-01', '2025-01-05', '2025-01-07', 4500),
(2, 102, '2025-01-02', '2025-01-06', '2025-01-08', 6000),
(3, 103, '2025-01-03', '2025-01-10', '2025-01-12', 5200),
(4, 104, '2025-01-04', '2025-01-15', '2025-01-18', 8000),
(5, 105, '2025-01-05', '2025-01-20', '2025-01-22', 3000);



-- Question - 78] Display the 3 lowest payments made by customers. 
select * from payments
order by amount asc
limit 3;

-- Question - 79] Show each booking’s BookingID with TotalAmount using CONCAT. 
select concat(BookingID, TotalAmount) from bookings;

-- Question - 80] Show all unique RoomIDs in descending order. 
select distinct RoomID from rooms
order by RoomID desc;

-- Question - 81] Display each room’s RoomType and Price using CONCAT_WS. 
 SELECT CONCAT_WS('  ', RoomType, PricePerNight) AS Room_Details
FROM Rooms;

-- Question - 82] The admin wants to delete all bookings handled by StaffID = 3. 
DELETE FROM Bookings
WHERE StaffID = 3;

-- Question - 83] Show customers whose FirstName length > 5 characters for a name-pattern study 

select * from customers 
where length(FirstName)>5; 

-- Question - 84] Show all unique roles available in the hotel. 

select distinct Role from staff;

-- Question - 85] List all rooms where capacity is greater than 2. 
select * from rooms 
where Capacity >2;

-- Question - 86] Display each payment’s ID with Amount using CONCAT. 

SELECT CONCAT('PaymentID: ', PaymentID, ' - Amount: ₹', Amount) AS Payment_Details
FROM Payments;

-- Question - 87] List all Card payments from the Payments table. 
select * from payments 
where PaymentMethod =  'card';

-- Question - 88] Delete all customers whose Email ends with '@test.com' as invalid. 
set sql_safe_updates=0;
delete  from  customers
where Email like '%@test.com';

-- Question - 89] The hotel manager wants to review bookings where CheckOutDate before '2023 12-31' to measure old occupancy. 

SELECT *
FROM Bookings
WHERE CheckOutDate < '2023-12-31';

-- Question - 90] The front office manager needs to list rooms with capacity = 2 for couples. 

select RoomType, PricePerNight from rooms
where Capacity = 2;

-- Question - 91] Show all unique capacities in descending order. 
select distinct Capacity from rooms
order by Capacity desc;

-- Question - 92] The operations team wants to find the minimum TotalAmount in bookings. 

select min(TotalAmount) as Total_Amount from bookings;

-- Question - 93] Display all rooms by capacity in ascending order. 
 select * from rooms
  order by Capacity asc;
  
  -- Question - 94] Show each booking’s BookingID with TotalAmount using CONCAT. 

SELECT CONCAT('BookingID: ', BookingID, ' - TotalAmount: ₹', TotalAmount) AS Booking_Details
FROM Bookings;

-- Question - 95] The operations head wants to see rooms with Capacity = 4 AND PricePerNight > ₹6000 for premium family packages. 

select * from rooms 
where Capacity = 4 and PricePerNight > 6000 ;

-- Question - 96] Show staff full names combined into one column. 
select concat(FirstName,LastName) as full_name
from staff;

-- Question - 97] The accounts team wants to see bookings where the TotalAmount is greater than ₹10,000 to track high-value customers. 

SELECT *
FROM Bookings
WHERE TotalAmount > 10000;

-- Question - 98] Show all unique payment methods in descending order. 

select distinct PaymentMethod from payments
order by PaymentMethod desc;

-- Question - 99] List staff members who share the same Role. (Staff self join) 










-- Question - 100] Show customer first name, last name, and TotalAmount of their bookings using JOIN between Customers and Bookings. 

select firstname , lastname, TotalAmount 
from bookings join customers using (CustomerID);


-- Question - 101] Display the first 4 bookings only. 
select * from bookings
order by BookingID asc
limit 4;


-- Question - 102] Show all unique staff first names. 

select distinct firstname from staff;


-- Question - 103] Insert 5 new room records with type, price, and capacity into the Rooms table. 

INSERT INTO Rooms (RoomType, PricePernight, Capacity)
VALUES
('Single', 1500, 1),
('Double', 2500, 2),
('Deluxe', 4000, 3),
('Suite', 6000, 4),
('Family', 5000, 5);

select * from rooms;


-- Question - 104] Display each customer’s full name and city using CONCAT_WS. 
select concat(firstname, lastname, city) as Full_name_city from customers;


-- Question - 105] Show all unique cities in descending order from the Customers table. 

select distinct city from customers 
order by city desc;


-- Question - 106] The analytics team wants to list all cities where maximum CustomerID is more than 100.

select city from customers 
group by City
having max(CustomerID) >100;

-- Question - 107] The HR team wants to see staff whose FirstName is 'Priya' for employee recognition. 
select * from staff
where FirstName = 'Priya';

-- Question - 108] Display the last 2 staff members from the Staff table. 

select * from staff
order by StaffID desc
limit 2;

-- Question - 109] Create a VIEW BookingSummary showing BookingID, CustomerID, RoomID, and TotalAmount. 

select BookingID, CustomerID, RoomID, TotalAmount from bookings;

-- Question - 110] Show all unique RoomIDs in descending order. 

select distinct RoomID from rooms
order by RoomID desc;

-- Question - 111] Display each staff’s role with their full name. 

select Role ,concat(FirstName, LastName) as full_name from staff;


-- Question - 112] The receptionist wants to offer Suite rooms under ₹7000 to business travelers. 

select * from rooms 
where RoomType = 'Suite' and PricePerNight <7000;


-- Question - 113] Display the first 3 staff alphabetically by their first names. 

select * from staff
order by FirstName Asc
limit 3;

-- Question - 114] List all bookings ordered by CheckInDate. 

select *  from bookings
order by CheckInDate;

-- Question - 115] Show all unique StaffIDs from the bookings. 

select distinct StaffID from bookings;


-- Question - 116] Display the first 4 customers’ full names only. 
  
  select concat(FirstName, LastName) as Full_name from customers
  order  by CustomerID asc
  limit 4;
  
  -- Question - 117] Show all unique room types offered by the hotel. 
select distinct RoomType from rooms;

-- Question - 118] Display the phone number of the Waiter only. 

select Phone from staff
where  Role = 'Waiter';

-- Question - 119] Show all bookings where TotalAmount > 5000. 
select * from bookings
where TotalAmount>5000;

-- Question - 120] The HR team wants to update Role = 'Senior Manager' where StaffID = 12. 
UPDATE Staff
SET Role = 'Senior Manager'
WHERE StaffID = 12;

-- Question - 121] List all staff working as Managers. 
select * from staff
where Role = 'Managers';

-- Question - 122] Show the last 2 registered customers for follow-up. 
select * from customers
order by CustomerID desc
limit 2;

-- Question - 123] Display each booking’s BookingID with TotalAmount using CONCAT. 
select concat(BookingID, TotalAmount);


-- Question - 124] Insert 5 staff members into the Staff table with their role, phone, and email. 
INSERT INTO Staff (Role, Phone, Email)
VALUES
('Manager', '9876543210', 'amit.sharma@email.com'),
( 'Receptionist', '9123456780', 'priya.verma@email.com'),
( 'Housekeeping', '9988776655', 'rahul.mehta@email.com'),
( 'Accountant', '9090909090', 'neha.singh@email.com'),
( 'Security', '9012345678', 'vikram.patel@email.com');

select * from staff;

-- Question - 125] Display the RoomType and Price of only Suite rooms. 
select Roomtype , PricePerNight from rooms
where RoomType = 'Suite';

-- Question - 126] The admin wants to delete all payments linked to BookingID = 15. 
Delete payments from payments
where BookingID = 15;


-- Question - 127] Display all unique capacities in descending order. 
select distinct Capacity from rooms
order by Capacity desc;

-- Question - 128] Show the first 4 rooms sorted alphabetically by RoomType. 

select * from rooms 
order by RoomType asc
limit 4;

-- Question - 129] The cashier wants a report of payments where Amount < ₹15000 for small transaction 
select * from payments 
where Amount <15000;

-- Question - 130] Show each booking’s BookingID with TotalAmount using CONCAT. 
select concat(BookingID,'         ',  TotalAmount) from bookings;

-- Question - 131] Display the last 2 added rooms from the Rooms table. 
select * from rooms
order by RoomID desc
limit 2;
 
 
 -- Question - 132] List all customers whose FirstName = 'Amit' AND City = 'Nagpur' for personal attention 
 select * from customers
 where FirstName = 'Amit' and city = 'Nagpur';
 
 -- Question - 133] Insert 5 new customer details into the Customers table. 
INSERT INTO Customers (FirstName, LastName, Email, Phone, City)
VALUES
('Rohit', 'Sharma', 'rohit.sharma@email.com', '9876543210', 'Mumbai'),
('Anjali', 'Verma', 'anjali.verma@email.com', '9123456789', 'Delhi'),
('Suresh', 'Patel', 'suresh.patel@email.com', '9988776655', 'Ahmedabad'),
('Kavita', 'Singh', 'kavita.singh@email.com', '9090909090', 'Bhopal'),
('Aman', 'Gupta', 'aman.gupta@email.com', '9012345678', 'Pune');

select * from customers;

-- Question - 134] Show staff full names combined into one column. 
SELECT CONCAT(FirstName, ' ', LastName) AS FullName
FROM Staff;

-- Question - 135] Show all room details separated by commas using CONCAT_WS. 
select concat_ws(', ',RoomID, RoomType, PricePerNight, Capacity)
from rooms;

-- Question - 136] Display each customer’s name and phone number together using CONCAT. 
select concat(FirstName,'   ', LastName,'   ', phone)
from customers;

-- Question - 137] Display all payment details in one line using CONCAT_WS. 
select concat_ws(', ', PaymentID, BookingID, PaymentDate, PaymentMethod, Amount) as payment_details
from payments;

-- Question - 138] Show the last 2 bookings in the table. 
select * from bookings
order by BookingID desc
limit 2;

-- Question - 139] List all payments ordered by PaymentDate. 
select PaymentDate, Amount from payments;

-- Question - 140] Show the 2 highest payments received. 
select Amount from payments
order by Amount desc
limit 2;

-- Question - 141] The marketing team wants to check customers whose FirstName is 'Rahul' for a Loyalty programe
select * from customers
where FirstName = 'Rahul';

-- Question - 142] Display each PaymentID with its method using CONCAT. 
select concat(PaymentID, '      ', PaymentMethod) as Payment_details
from payments;

-- Question - 143] The operations team wants to list all PaymentMethods used more than 5 times. 
select PaymentMethod, count(*) as Total_uses
from payments
group by PaymentMethod
having count(*) > 5;

-- Question - 144] Show the 2 most expensive rooms for VIP guests. 
select * from rooms
order by PricePerNight desc;


-- Question - 145] Show each room’s RoomType and Price using CONCAT_WS. 
select concat_ws(RoomType, '    ', PricePerNight) from rooms;

-- Question - 146] Display the first 3 staff alphabetically by their first names. 
select * from staff 
order by FirstName Asc
limit 3;

-- Question - 147] List all bookings handled by StaffID = 2. 
select * from bookings
where StaffID = 2;

-- Question - 148] The analytics team wants to find the city where average CustomerID is greater than 50. 
select city from customers
group by City
having avg(CustomerID) > 50;

-- Question - 149] The hotel wants to display the 2 most expensive rooms for VIP guests. 
select * from rooms 
order by PricePerNight desc
limit 2;

-- Question - 150] Show all unique first names of customers for a duplicate check. 
select distinct FirstName from customers;

-- Question - 151] Show all unique roles in descending order. 
select distinct Role from staff
order by Role desc;

-- Question - 152] Identify rooms whose Capacity is greater than the average Capacity of all rooms. (Rooms subquery) 
select * from rooms 
where Capacity >
(select avg(capacity) from rooms);

-- Question - 153] Display all rooms by capacity in ascending order. 
 select * from rooms
 order by  Capacity asc;
 
 -- Question - 154] Display the first 4 payments only. 
select * from payments
order by PaymentID asc
limit 4;

-- Question - 155] Show each payment’s ID, Method, Amount in one line. 
select concat(PaymentID,'  ',PaymentMethod,'  ',Amount) from payments;

-- Question - 156] List all bookings where TotalAmount > 5000. 
select * from bookings
where TotalAmount > 5000;

-- Question - 157] Find all customers whose CustomerID is greater than the average CustomerID. rooms. (Rooms subquery) 
select * from customers
where CustomerID >(select avg(CustomerID) from rooms);

-- Question - 153] Display all rooms by capacity in ascending order. 
select * from rooms
order by Capacity asc;

-- Question - 154] Display the first 4 payments only. 
select * from payments
order by PaymentID asc
limit 4;

-- Question - 155] Show each payment’s ID, Method, Amount in one line. 
select concat(PaymentID, ' ', PaymentMethod, ' ', Amount) from payments;

-- Question - 156] List all bookings where TotalAmount > 5000. 
select * from bookings 
where TotalAmount > 5000;

-- Question - 157] Find all customers whose CustomerID is greater than the average CustomerID. (Customers subquery) 

select * from customers 
where CustomerID>(
select avg(customerID) from customers);

-- Question - 158] The HR manager wants to see staff whose Role is not 'Chef' for role reallocation 
select * from staff
where Role <> 'chef';

-- Question - 159] The accounts team wants to check bookings where TotalAmount is greater than 10000.
select * from bookings
where TotalAmount > 10000;

-- Question - 160] Display each staff’s role with their full name. 
select concat(FirstName, LastName) as full_name,
Role from staff;

-- Question - 161] List staff members who share the same Role. (Staff self join) 
SELECT 
  s1.StaffID,
  CONCAT_WS(' ', s1.FirstName, s1.LastName) AS StaffName,
  s1.Role
FROM Staff s1
JOIN Staff s2
  ON s1.Role = s2.Role
 AND s1.StaffID <> s2.StaffID
ORDER BY s1.Role;

-- Question - 162] Show Customer Name and Payment Amount by joining Customers, Bookings, and Payments. 
select concat(FirstName, ' ' , LastName, Amount) 
from customers join bookings using(CustomerID);

-- Question - 163] Display all bookings where TotalAmount > 5000. 
select * from bookings 
where TotalAmount>5000;

-- Question - 164] The front desk wants to see customers whose Phone starts with '98'. 
select * from customers 
where Phone like'98%';

-- Question - 165] Identify customers who live in the same city. (Customers self join) 



-- Question - 166] The operations manager wants to check bookings with CheckOutDate before '2023-12-31'. 
select * from bookings
where CheckOutDate = '2023-12-31';

-- Question - 167] Display all unique StaffIDs from the bookings. 
select distinct StaffID from bookings;

-- Question - 168] Create a VIEW OnlinePayments showing all payments made by PaymentMethod = 'Online'.
select * from payments
where PaymentMethod = 'Online';

-- Question - 169] Display all unique payment methods in descending order. 
select distinct PaymentMethod from payments
order by PaymentMethod desc;

-- Question - 170] Display each payment’s ID with Amount using CONCAT. 
select concat(PaymentID, '     ', Amount) from payments;

-- Question - 171] Show all unique RoomIDs in descending order. 
select distinct RoomID from rooms
order by RoomID desc;

-- Question - 172] The analytics team wants to list all cities where maximum CustomerID is more than 100. 

 select City  from customers
group by City
having max(CustomerID) >100;

-- Question - 173] List staff emails ordered by their roles. 
select Email , Role from staff 
order by Role;

-- Question - 174] Find bookings where TotalAmount exceeds the average TotalAmount. (Bookings subquery) 
SELECT *
FROM Bookings
WHERE TotalAmount > (
    SELECT AVG(TotalAmount)
    FROM Bookings
);

-- Question - 175] Show all rooms where PricePerNight > ₹5000 for premium customer recomendations.

select * from rooms
where PricePerNight >5000;


-- Question - 176] Show all unique capacities in descending order. 
select distinct Capacity from rooms
order by Capacity desc;

-- Question - 177] Display the first 4 rooms sorted alphabetically by RoomType. 
select * from rooms
order by RoomType asc
limit 4;


-- Question - 178] Show all unique staff first names. 
select distinct FirstName from staff;

-- Question - 179] Identify rooms with PricePerNight higher than the maximum PricePerNight of rooms with Capacity = 2. (Rooms subquery)
select * from rooms
where PricePerNight > (
select max(PricePerNight)
from rooms
where Capacity = 2);

-- Question - 180] Show all unique cities in descending order from the Customers table. 
select distinct City from customers
order by City desc;

-- Question - 181] List all bookings where TotalAmount > 5000. 
select * from bookings
where TotalAmount >5000;

-- Question - 182] Show PaymentID, Customer Name, and BookingID for payments made using 'Credit Card'. 

 
 
 
 
 
 
 -- Question - 183] Display each booking’s BookingID with TotalAmount using CONCAT. 
SELECT 
    CONCAT('BookingID: ', BookingID, ' | TotalAmount: ', TotalAmount) AS Booking_Details from bookings;
    
    -- Question - 184] Show all bookings handled by StaffID = 2. 
select * from bookings
where StaffID = 2;

-- Question - 185] Display the last 2 added rooms from the Rooms table. 
select * from rooms
order by RoomID desc
limit 2;

-- Question - 186] List all rooms where capacity is greater than 2. 
select * from rooms 
where Capacity > 2;

-- Question - 187] Display the last 2 staff members from the Staff table. 
select * from staff
order by StaffID desc
limit 2;

-- Question - 188] Show all unique roles available in the hotel. 
select distinct Role from staff;

-- Question - 189] Display the last 2 payments. 
select * from payments
order by PaymentID desc
limit 2;

-- Question - 190] The manager wants to see bookings where CustomerID IN (2,4,6,8) to track repeat guests
select * from bookings
where CustomerID  in (2,4,6,8);

-- Question - 191] Show all unique first names of customers for a duplicate check. 
select distinct FirstName from customers ;

-- Question - 192] Display all bookings where TotalAmount > 5000. 
select * from bookings 
where TotalAmount >5000;

-- Question - 193] The admin wants to delete all payments where Amount < 1000. 
set sql_safe_updates =0;
delete from payments
where Amount < 1000;

-- Question - 194] Display all unique RoomIDs in descending order. 
select distinct RoomID from rooms
order by RoomID desc;

-- Question - 195] List customers who made more than 5 bookings. 



-- Question - 196] Display all rooms by capacity in ascending order. 
select * from rooms 
order by Capacity asc;

-- Question - 197] Show each booking’s BookingID with TotalAmount using CONCAT. 
select concat(BookingID,'   |   ',TotalAmount) from bookings; 

-- Question - 198] List all staff working as Managers. 
select * from staff
where Role = 'Managers';

-- Question - 199] Show customers whose FirstName length > 5 characters for a name-pattern study
select * from customers
where length(FirstName) >5;

-- Question - 200] Display all unique capacities in descending order. 
select distinct Capacity from rooms
order by Capacity desc;

-- Question - 201] List staff members who share the same Role. (Staff self join) 





-- Question - 202] Show PaymentID, Customer Name, and BookingID for payments made using 'Credit Card'






-- Question - 203] Display the first 4 payments only. 
select * from payments
order by PaymentID asc 
limit 4;

-- Question - 204] Show each payment’s ID, Method, Amount in one line. 
select concat(PaymentID, '     |    ', PaymentMethod) from payments;


-- Question - 205] Create a VIEW HighValueBookings showing all bookings with TotalAmount > 20000.
select * from bookings 
where TotalAmount >20000;

-- Question - 206] Create a trigger to automatically delete a payment when its corresponding booking is deleted.








-- Question - 208] Create a trigger to automatically update TotalAmount in Bookings when a payment is inserted in Payments.
 







 