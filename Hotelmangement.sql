use HotelMangament;

create table Customers(
   CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(20)
);
INSERT INTO Customers(CustomerID, FirstName, LastName, Email, Phone)
VALUES
	(1, 'Ha', 'Long', 'halong@email.com', '090-7503-157'),
    (2, 'Vu', 'Thanh', 'vuthanh@email.com', '090-7503-158'),
    (3, 'Do', 'Thuong', 'dothuong@email.com', '090-7503-159'),
    (4, 'Tran', 'Van ', 'tranvan@email.com', '090-7503-160'),
    (5, 'Nguyen', 'Thi ', 'nguyenthi@email.com', '090-7503-161'),
    (6, 'Le', 'Quoc C', 'lequocc@email.com', '090-7503-162'),
    (7, 'Nguyen', 'Van', 'nguyenvan@email.com', '090-7503-163'),
    (8, 'Tran', 'Thi ', 'tranthi@email.com', '090-7503-164'),
    (9, 'Le', 'Quang ', 'lequang@email.com', '090-7503-165'),
    (10, 'Pham', 'Dinh ', 'phamdinh@email.com', '090-7503-166');



create table Rooms(
	roomID int primary key not null,
    roomNumber int,
    roomType varchar(20),
    price int,
    isOccupied BIT
);
INSERT INTO Rooms (roomID, roomNumber, roomType, price, isOccupied)
VALUES
    (101, 101, 'Standard', 100, 0),
    (102, 102, 'Standard', 100, 0),
    (103, 103, 'Standard', 100, 0),
    
    (104, 104, 'Deluxe', 150, 0),
	(105, 105, 'Deluxe', 150, 0),
	(106, 106, 'Deluxe', 150, 0),
    
	(107, 107, 'Suite', 200, 0),
    (108, 108, 'Suite', 200, 0),
    
	(109, 109, 'Luxury', 300, 0),
	(110, 110, 'Luxury', 300, 0);
    

CREATE TABLE Booking (
    bookingID INT PRIMARY KEY NOT NULL,
    customerID INT,
    roomID INT,
    checkInDate DATE,
    checkOutDate DATE,
    FOREIGN KEY (customerID) REFERENCES Customers(customerID),
    FOREIGN KEY (roomID) REFERENCES Rooms(roomID)
);
INSERT INTO Booking (bookingID, customerID, roomID, checkInDate, checkOutDate)
VALUES
    (1001, 1, 101, '2023-10-10', '2023-10-15'),
    (1002, 1, 102, '2023-10-10', '2023-10-15'),
    (1003, 1, 103, '2023-11-05', '2023-11-10'),
    (1004, 2, 104, '2023-12-20', '2023-12-25'),
    (1005, 2, 105, '2023-12-20', '2023-12-25'),
	(1006, 3, 106, '2023-11-15', '2023-11-20'),
    (1007, 3, 107, '2023-11-15', '2023-11-20'),
	(1008, 4, 108, '2023-12-10', '2023-12-15'),
    (1009, 4, 109, '2023-12-10', '2023-12-15');
  
create table Service(
serviceID int primary key not null ,
service_name varchar(40),
description varchar(50), 
price int
);

insert into Service(serviceID, service_name, description , price) 
values
	(1, 'Restaurant', 'Fine dining experience', 50),
    (2, 'Spa', 'Relaxing spa treatments', 80),
    (3, 'Room Service', 'In-room dining', 25);

create table Reservations(
reservationID int primary key not null,
customerID int,
 roomType varchar(20), 
 reservationDate date,
 foreign key (customerID) references Customers(CustomerID)
 
);

INSERT INTO Reservations (reservationID, customerID, roomType, reservationDate)
VALUES
      (1, 1, 'Standard', '2023-10-05'),
	(2, 2, 'Deluxe', '2023-10-15'),
    (3, 3, 'Suite', '2023-10-01'),
    (4, 4, 'Luxury', '2023-10-15');


    

create table CustomerServices(
CustomerServicesID int primary key not null,
customerID int,
serviceID int,
reservationDate date,
foreign key (customerID) references Customers(customerID),
foreign key (serviceID) references Service(serviceID)
);


INSERT INTO CustomerServices (CustomerServicesID, customerID, serviceID, reservationDate)
VALUES
    (1, 1, 1, '2023-09-10'), 
    (2, 2, 2, '2023-09-15'),  
    (3, 3, 3, '2023-09-20'),  
    (4, 4, 1, '2023-09-25');  
create table  Employee(
	EmployeeID INT PRIMARY KEY not null,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Role varchar (10)
    );
    
insert into Employee(EmployeeID ,FirstName ,LastName ,Role )
values
(2201,"Nguyen","Nhat","staff"),
(2202,"Nguyen","Huy","staff"),
(2203,"Nguyen","Phuong","staff"),
(2204,"Nguyen","Phuc","manager");    


CREATE TABLE Payment (
   paymentID INT PRIMARY KEY NOT NULL,
   payment_date DATE,
   paymentMethod VARCHAR(20),  
   transactionID VARCHAR(50), 
   paymentStatus VARCHAR(20),  
   customerID INT,
   employeeID INT,
   FOREIGN KEY (customerID) REFERENCES Customers(CustomerID),
   FOREIGN KEY (employeeID) REFERENCES Employee(EmployeeID)
);


INSERT INTO Payment (paymentID, payment_date, paymentMethod, transactionID, paymentStatus, customerID, employeeID)
VALUES
   (1, '2023-10-01', 'cash', 'TXN123456', 'paid', 1, 2201),
   (2, '2023-10-15', 'credit card', 'TXN789012', 'paid', 2, 2202),
   (3, '2023-11-01', 'debit card', 'TXN345678', 'pending', 3, 2203),
   (4, '2023-11-15', 'cash', 'TXN567890', 'paid', 4, 2204);

   


CREATE TABLE CustomerPayment (
   customerPaymentID INT PRIMARY KEY NOT NULL,
   paymentID INT,
   FOREIGN KEY (paymentID) REFERENCES Payment(paymentID)
);




INSERT INTO CustomerPayment (customerPaymentID, paymentID)
VALUES

   (1, 1),  
   (2, 2),  
   (3, 3),  
   (4, 4); 
   
   ----------------------------------------------------------------------------------------------------------------------- 




