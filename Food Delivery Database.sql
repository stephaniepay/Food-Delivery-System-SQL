--CREATE TABLES

CREATE TABLE Customer (
    Customer_ID NUMBER(6) NOT NULL,
    Customer_Name VARCHAR(20) NOT NULL,
    Customer_Email VARCHAR(30),
    Customer_ContactNo NUMBER(16) NOT NULL,
    Customer_Address VARCHAR(100) NOT NULL,
    Customer_Member_Point NUMBER(5) NOT NULL,
    PRIMARY KEY (Customer_ID)
);

SELECT * FROM Customer;
ALTER TABLE Customer
MODIFY (Customer_Name VARCHAR(30));

CREATE TABLE Rider (
    Rider_ID CHAR(5) NOT NULL,
    Rider_Name VARCHAR(15) NOT NULL,
    Rider_Vehicle_Type VARCHAR(20) NOT NULL,
    Rider_VehicleNo VARCHAR(7) NOT NULL UNIQUE,
    PRIMARY KEY (Rider_ID)
);

SELECT * FROM Rider;
ALTER TABLE Rider
MODIFY (Rider_VehicleNo VARCHAR(8));

CREATE TABLE Merchant (
    Merchant_ID CHAR(5) NOT NULL,
    Merchant_Name VARCHAR(30) NOT NULL,
    Merchant_ContactNo NUMBER(16) NOT NULL,
    Merchant_Address VARCHAR(100) NOT NULL,
    Merchant_Email VARCHAR(30),
    PRIMARY KEY (Merchant_ID)
);

SELECT * FROM Merchant;

CREATE TABLE Food (
    Food_ID CHAR(5) NOT NULL,
    Food_Name VARCHAR(30) NOT NULL,
    Food_Description VARCHAR(80) NOT NULL,
    Food_Price NUMBER(6,2) NOT NULL,
    Food_Category VARCHAR(20) NOT NULL,
    Merchant_ID CHAR(5) NOT NULL,
    PRIMARY KEY (Food_ID),
    FOREIGN KEY (Merchant_ID) REFERENCES Merchant(Merchant_ID)
);
    
SELECT * FROM Food;

CREATE TABLE Orders (
    Order_ID CHAR(7) NOT NULL,
    Delivery_Type VARCHAR(30) NOT NULL,
    Delivery_Fee NUMBER(2) NOT NULL,
    Order_Price NUMBER(8,2) NOT NULL,
    Delivery_Address VARCHAR(100) NOT NULL,
    Order_DateTime TIMESTAMP NOT NULL,
    Delivery_DateTime TIMESTAMP NOT NULL,
    Customer_ID NUMBER(6) NOT NULL,
    Rider_ID CHAR(5) NOT NULL,
    PRIMARY KEY (Order_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Rider_ID) REFERENCES Rider(Rider_ID)
);

SELECT * FROM Orders;

SELECT * FROM Food;


CREATE TABLE FoodOrder (
    Food_ID CHAR(5) NOT NULL,
    Order_ID CHAR(7) NOT NULL,
    FoodOrder_Quantity NUMBER(2) NOT NULL,
    PRIMARY KEY (Food_ID, Order_ID),
    FOREIGN KEY (Food_ID) REFERENCES Food(Food_ID),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID)
);

SELECT * FROM FoodOrder;

CREATE TABLE Voucher (
    Voucher_Code CHAR(5) NOT NULL,
    Voucher_Description VARCHAR(30) NOT NULL,
    Discount NUMBER(3,2) NOT NULL,
    Customer_ID NUMBER(6) NOT NULL,
    Voucher_Status VARCHAR(12) DEFAULT 'NOT APPLIED',
    PRIMARY KEY (Voucher_Code),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);

SELECT * FROM Voucher;

CREATE TABLE Payment (
    Payment_ID CHAR(7) NOT NULL,
    Payment_Amount NUMBER(8,2) NOT NULL,
    Payment_Type VARCHAR(20) NOT NULL,
    Payment_DateTime TIMESTAMP NOT NULL,
    Order_ID CHAR(7) NOT NULL,
    Voucher_Code CHAR(5),
    PRIMARY KEY (Payment_ID),
    FOREIGN KEY (Voucher_Code) REFERENCES Voucher(Voucher_Code)
);

SELECT * FROM Payment;

CREATE TABLE Review (
    Review_ID NUMBER(4) NOT NULL,
    Ratings NUMBER(1) CHECK (Ratings BETWEEN 0 AND 5),
    Comments VARCHAR(200),
    Order_ID CHAR(7) NOT NULL,
    PRIMARY KEY (Review_ID),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID)
);

SELECT * FROM review;


--INSERT VALUES
DELETE FROM food;

INSERT INTO Merchant VALUES ('M0001', 'McDonalds', 60380514150, 'Persiaran Bestari House# 1, 63000 Cyberjaya, Selangor.', 'mcdmalaysia@gmail.com'); 
INSERT INTO Merchant VALUES ('M0002', 'Takeout', 60380506970, 'American Street House# 12, 47500 Sunway, Selangor.', 'takeoutmalaysia@gmail.com');
INSERT INTO Merchant VALUES ('M0003', 'Jing Ping Restaurant', 60387768018, 'Bay of Bengal, Jalan 2 House# 44, 43900 Sepang, Selangor.', 'mrping@gmail.com');
INSERT INTO Merchant VALUES ('M0004', 'Mimimoo Char Kway Teow', 60194772667, 'No. 84, Kampung Bukit Tinggi, Jln Bukit Tinggi, 28750 Bentong, Pahang.', 'mimimoocharkwayteow@gmail.com');
INSERT INTO Merchant VALUES ('M0005', 'BopBop Bubble Tea', 60679486259, 'Jalan BBN 12/1, LK-2G-3A STAR VALLEY, Bandar Baru Nilai, 71800 Nilai, Negeri Sembilan.', 'bopbopbubbletea@gmail.com');
INSERT INTO Merchant VALUES ('M0006', 'The Alley', 60126999395, 'GF-4, Tower 2 @ PFCC, Jalan Puteri 1?2, Bandar Puteri Puchong, 47100 Puchong, Selangor.', 'alley12bubbletea@gmail.com');
INSERT INTO Merchant VALUES ('M0007', 'KFC', 60135568345, 'LG10 AEON Taman Equine Shopping Centre Seri Kembangan, 43300 Selangor.', 'KFCMALAYSIA@gmail.com');
INSERT INTO Merchant VALUES ('M0008', 'Dominos Pizza', 60184538790, 'Bukit Jalil, 7, Jalan Jalil Jaya 7, Jalil Link, 57000 Kuala Lumpur.', 'dominospizza@gmail.com');
INSERT INTO Merchant VALUES ('M0009', 'Sukishi', 60380678890, '1, Jalan Radin Tengah, Sri Petaling, 57000 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur.', 'sukishi@gmail.com');
INSERT INTO Merchant VALUES ('M0010', 'Feilo Heng Hokkien Mee', 60129217338, 'Lorong Madrasah Raja Puan Zainab, Bandar Kota Bharu, 15300 Kota Bharu, Kelantan.', 'feiloheng@gmail.com');
INSERT INTO Merchant VALUES ('M0011', 'Warakuya', 60380710001, '2, Jalan PJU 5/10, Kota Damansara, 47810 Petaling Jaya, Selangor.', 'warakuya@gmail.com');
INSERT INTO Merchant VALUES ('M0012', 'Sushi King', 60380678890, '10, Jalan Medan Ipoh 1D, Medan Ipoh Bistari, 31400 Ipoh, Perak.', 'sushiking@gmail.com');
INSERT INTO Merchant VALUES ('M0013', 'Ticket To Korea', 60166596501, 'Lot L1-R-9, De Garden, 3, Persiaran Medan Ipoh, Taman Ipoh, 31400 Ipoh, Perak.', 'tickettokorea@gmail.com');
INSERT INTO Merchant VALUES ('M0014', 'The Owls Cafe', 60179777581, 'Calvary Convention Centre, 1, Jalan Jalil Perkasa 1, Bukit Jalil, 57100 Kuala Lumpur.', 'owls.owls@gmail.com');



INSERT INTO Rider VALUES ('R0001', 'Ali', 'Motorolla Scooty', 'BBE 3344');
INSERT INTO Rider VALUES ('R0002', 'Joseph', 'Myvi', 'BLQ 8978');
INSERT INTO Rider VALUES ('R0003', 'Ethan', 'Proton Saga', 'PTF 5629');
INSERT INTO Rider VALUES ('R0004', 'Ahmad', 'Honda Hero', 'PRD 8919');
INSERT INTO Rider VALUES ('R0005', 'Meimei', 'Honda Civic', 'JKE 3691');
INSERT INTO Rider VALUES ('R0006', 'Kai Wen', 'Myvi', 'WWE 5434');
INSERT INTO Rider VALUES ('R0007', 'Xing Jin', 'Yamaha NMAX', 'WJU 4190');
INSERT INTO Rider VALUES ('R0008', 'Lululoon', 'Suzuki Vstorm', 'AGD 1929');
INSERT INTO Rider VALUES ('R0009', 'Lim', 'Axia', 'AQS 4556');
INSERT INTO Rider VALUES ('R0010', 'Wong Ting', 'Axia', 'KLE 1278');
INSERT INTO Rider VALUES ('R0011', 'Mun Yee', 'Myvi', 'TRD 9967');

--2
DELETE FROM Voucher;
--1
DELETE FROM Payment;
--5
DELETE FROM Customer;
--3
DELETE FROM FoodOrder;
--4
DELETE FROM Orders;


INSERT INTO Customer VALUES (100001, 'Stephanie Pay', 'stephaniepay@gmail.com', 60169778123, 'Kuala Lumpur KLCC 100th floor, 56000 Kuala Lumpur.', 0);
INSERT INTO Customer VALUES (100002, 'Haneta Divya', 'hanetadivya@gmail.com', 60175678981, '25, linkinpark@putrajaya, 43000 Putrajaya.', 0);
INSERT INTO Customer VALUES (100003, 'Aminul Abir', 'aminulabir112@gmail.com', 60184856983, 'Persiaran Bestari TheArc@cyberjaya, 63000 Cyberjaya, Selangor.', 0);
INSERT INTO Customer VALUES (100004, 'Ornesha Noorani', 'orneshanoorani2003@gmail.com', 60149733684, '368, back street Cameron Highlands Dr.Hasan Villa, 39000 Pahang.', 0);
INSERT INTO Customer VALUES (100005, 'Mohammad Tawhid', 'hazibiriyani@gmail.com', 60125432871, 'No.25, Taman Indah Villa, Jalan 5 Bandar Sunway, 47500 Subang Jaya, Selangor.', 0);
INSERT INTO Customer VALUES (100006, 'Madiha Misbah', 'madihacute04@hotmail.com', 601187564469, '33 Beachview, Jalan 7 house-number 68, 71000 Port Dickson, Negeri Sembilan.', 0);
INSERT INTO Customer VALUES (100007, 'Jackson Wang', 'jackson.wang99@gmail.com', 60135698231, '45-1, Jalan Puteri 12/20 Bandar Puteri, 47100 Puchong, Selangor.', 0);
INSERT INTO Customer VALUES (100008, 'Rose Depp', 'd3ppros3@yahoo.com', 60125479563, 'No.4, Jalan SL 6/7, Bandar Sungai Long, 43200 Kajang, Selangor.', 0);
INSERT INTO Customer VALUES (100009, 'Li Ting', 'liting@gmail.com', 60129872345, '60, Jalan Ahmad Shah, Pusat Komersil Temerloh, 28000 Temerloh, Pahang.', 0);
INSERT INTO Customer VALUES (100010, 'Juni Tan', 'juni@gmail.com', 60167783321, 'Lot 44, Seksyen 17, Bandar Kota Bharu, 15050 Kota Bharu, Kelantan.', 0);
INSERT INTO Customer VALUES (100011, 'Liew Kuan Yun', 'kyliew@gmail.com', 60166548899, 'Jalan Stadium SS 7/15, Ss 7, 47301 Petaling Jaya, Selangor.', 0);
INSERT INTO Customer VALUES (100012, 'Teressa Yaw', 'teressa@hotmail.com', 60138833446, 'No.4, Taman Subang Permai, 47500 Subang Jaya, Selangor', 0);
INSERT INTO Customer VALUES (100013, 'Natalie Lee', 'natalielee95@gmail.com', 60163395678, '22, Jalan Datuk Onn Jaafar, Taman Jubilee, 30300 Ipoh, Perak.', 0);
INSERT INTO Customer VALUES (100014, 'Nicole Lee', 'nicolelee@yahoo.com', 60165205214, '22, Jalan Datuk Onn Jaafar, Taman Jubilee, 30300 Ipoh, Perak.', 0);
INSERT INTO Customer VALUES (100015, 'Nicholas', 'nickk32@gmail.com', 60149090014, 'No.4 Jalan Persinggahan, 20400 Kuala Terengganu, Terengganu.', 0);
--INSERT INTO Customer VALUES (100016, 'Peter', 'Yap', 'peterpan@hotmail.com', 60167799456, '36 Jalan Lapangan Terbang Subang, Saujana, 40150 Shah Alam, Selangor.', 66);
--INSERT INTO Customer VALUES (100017, 'Omar', 'Ahmad', 'omaromar@gmail.com', 60121256985, '95, Jalan Bunga Dalia, Taman, 31700 Malim Nawar, Perak.', 2);
--INSERT INTO Customer VALUES (100018, 'Yong Jing', 'Chong', 'chongyongjing@gmail.com', 60171244980, '5, Jalan Conlay, Kuala Lumpur, 50450 Kuala Lumpur.', 45);
--INSERT INTO Customer VALUES (100019, 'Syamimi', 'Zafira', 'syamimizfr@hotmail.com', 60122000634, '56, Jalan Nelayan 19/15, Seksyen 19, 40300 Shah Alam, Selangor.', 2);

select * from customer;

INSERT INTO Food VALUES ('F0001', 'Big Mac', 'Smoked BBQ burger', 21.90, 'Western Food', 'M0001');
INSERT INTO Food VALUES ('F0002', 'Crispy Chicken', 'Crispy and juicy fried chicken', 14.99, 'Western Food' , 'M0007');
INSERT INTO Food VALUES ('F0003', 'Dhaka Pizza', 'Cheesy delicious pizza', 22.50, 'Western Food', 'M0002');
INSERT INTO Food VALUES ('F0004', 'Double Gourmet', 'Thickest and spiciest burger', 25.90, 'Western Food', 'M0002');
INSERT INTO Food VALUES ('F0005', 'Shawarma', 'Real Arab Shawarma', 13.00, 'Arab Food', 'M0003');
INSERT INTO Food VALUES ('F0006', 'Chinese Dine', 'Fried rice with meat', 8.99, 'Chinese Food' , 'M0003');
INSERT INTO Food VALUES ('F0007', 'Char Kway Teow', 'Hokkien stir-fried noodles', 6.50, 'Chinese Food' , 'M0004');
INSERT INTO Food VALUES ('F0008', 'Fruit Basket Tea', 'A combination of fruits, green tea and grapefruit jelly', 11.99, 'Beverage' , 'M0005');
INSERT INTO Food VALUES ('F0009', 'The Alley Milk Tea', 'Signature brown sugar deerioca series', 13.99, 'Beverage' , 'M0006');
INSERT INTO Food VALUES ('F0010', 'BopBop Popcorn Chicken', 'Tiny crispy fried chicken with cheese', 10.45, 'Western Food' , 'M0007');
INSERT INTO Food VALUES ('F0011', 'Crispier Fries', 'Perfect french fries in golden brown', 5.7, 'Western Food' , 'M0007');
INSERT INTO Food VALUES ('F0012', 'Classified Chicken', 'Shredded chicken, mushrooms and onions', 21.90, 'Western Food' , 'M0008');
INSERT INTO Food VALUES ('F0013', 'Zero Chicken Burger', 'Coated in 11 herbs and spices, halal meat-free patty', 11.99, 'Western Food' , 'M0008');
INSERT INTO Food VALUES ('F0014', 'Vegie Quattro', '4 vegetable flavours in 1 Spaghetti Bolognese', 14, 'Western Food' , 'M0001');
INSERT INTO Food VALUES ('F0015', 'Nameko Cawanmushi', 'Japanese egg custard dish', 7.90, 'Japanese Food' , 'M0012');
INSERT INTO Food VALUES ('F0016', 'Salmon Mentai Roll', 'Sushi with generous portion of mentai', 13.20, 'Japanese Food' , 'M0012');
INSERT INTO Food VALUES ('F0017', 'Shoyu Ramen', 'Ramen noodles with soysauce based soup', 15.49, 'Japanese Food' , 'M0011');
INSERT INTO Food VALUES ('F0018', 'Curry Udon', 'Udon or ramen noodles with chicken curry', 17.49, 'Japanese Food' , 'M0011');
INSERT INTO Food VALUES ('F0019', 'Tori Karaage Don', 'Fried chicken and onion on rice', 12.49, 'Japanese Food' , 'M0009');
INSERT INTO Food VALUES ('F0020', 'Tamago Mentai Sushi', 'Omelette roasted with cod roe', 5.99, 'Japanese Food' , 'M0012');
INSERT INTO Food VALUES ('F0021', 'Hokkien Mee', 'Hokkien famous thick yellow noodles braised in thick dark soy sauce', 7.50, 'Chinese Food' , 'M0010');
INSERT INTO Food VALUES ('F0022', 'Bibimbap Beef', 'Korean warm white rice topped with kimchi, beef and gochujang, soy sauce', 16.90, 'Korean Food' , 'M0013');
INSERT INTO Food VALUES ('F0023', 'Rebecca Waffle', 'Sweet sweet yummy waffle topped with ice-cream and berries', 21.90, 'Dessert' , 'M0014');


INSERT INTO Orders VALUES ('OD00001', 'Normal', 0, 165.46, 'Kuala Lumpur KLCC 100th floor, 56000 Kuala Lumpur.', timestamp '2020-12-17 17:25:23', timestamp '2020-12-17 17:56:56', 100001, 'R0001');
INSERT INTO Orders VALUES ('OD00002', 'Normal', 0, 89.94, '25, linkinpark@putrajaya, 43000 Putrajaya.', timestamp '2020-12-25 11:15:11', timestamp '2020-12-25 11:45:44', 100002, 'R0007');
INSERT INTO Orders VALUES ('OD00003', 'Normal', 0, 91.2, 'Persiaran Bestari TheArc@cyberjaya, 63000 Cyberjaya, Selangor.', timestamp '2020-12-25 12:52:13', timestamp '2020-12-25 13:28:37', 100003, 'R0002');
INSERT INTO Orders VALUES ('OD00004', 'Fast', 0, 26, '368, Back Street Cameron Highlands Dr.Hasan Villa, 39000 Pahang.', timestamp '2020-12-25 15:19:04', timestamp '2020-12-25 15:33:49', 100004, 'R0003');
INSERT INTO Orders VALUES ('OD00005', 'Normal', 0, 82.67, 'No.25, Taman Indah Villa, Jalan 5 Bandar Sunway, 47500 Subang Jaya, Selangor.', timestamp '2020-12-25 18:33:54', timestamp '2020-12-25 19:03:01', 100005, 'R0006');
INSERT INTO Orders VALUES ('OD00006', 'Fast', 0, 97.93, '45-1, Jalan Puteri 12/20 Bandar Puteri, 47100 Puchong, Selangor.', timestamp '2020-12-31 11:28:34', timestamp '2020-12-31 11:45:57', 100007, 'R0002');

INSERT INTO Orders VALUES ('OD00007', 'Normal', 0, 87.6, '60, Jalan Ahmad Shah, Pusat Komersil Temerloh, 28000 Temerloh, Pahang.', timestamp '2021-01-05 12:11:06', timestamp '2021-01-05 13:44:08', 100009, 'R0003');

INSERT INTO Orders VALUES ('OD00008', 'Fast', 0, 74.2, 'Kuala Lumpur KLCC 100th floor, 56000 Kuala Lumpur.', timestamp '2021-01-16 14:08:06', timestamp '2021-01-16 14:33:37', 100001, 'R0006');
INSERT INTO Orders VALUES ('OD00009', 'Normal', 0, 39.5, 'No.4, Taman Subang Permai, 47500 Subang Jaya, Selangor', timestamp '2021-01-16 15:48:10', timestamp '2021-01-16 16:17:10', 100012, 'R0001');

INSERT INTO Orders VALUES ('OD00010', 'Fast', 0, 55.3, '22, Jalan Datuk Onn Jaafar, Taman Jubilee, 30300 Ipoh, Perak.', timestamp '2021-01-16 19:41:16', timestamp '2021-01-16 19:51:22', 100013, 'R0008');
INSERT INTO Orders VALUES ('OD00011', 'Normal', 0, 77.68, 'Kuala Lumpur KLCC 100th floor, 56000 Kuala Lumpur.', timestamp '2021-01-30 09:05:34', timestamp '2021-01-30 09:32:10', 100001, 'R0001');

INSERT INTO Orders VALUES ('OD00012', 'Fast', 0, 41.19, 'No.4 Jalan Persinggahan, 20400 Kuala Terengganu, Terengganu.', timestamp '2021-02-01 13:08:06', timestamp '2021-02-01 13:18:14', 100015, 'R0011');
INSERT INTO Orders VALUES ('OD00013', 'Normal', 0, 11.99, 'Kuala Lumpur KLCC 100th floor, 56000 Kuala Lumpur.', timestamp '2021-02-02 08:52:03', timestamp '2021-02-02 09:19:43', 100001, 'R0005');
INSERT INTO Orders VALUES ('OD00014', 'Fast', 0, 55.96, 'Kuala Lumpur KLCC 100th floor, 56000 Kuala Lumpur.', timestamp '2021-02-06 08:11:14', timestamp '2021-02-06 08:35:20', 100001, 'R0002');
INSERT INTO Orders VALUES ('OD00015', 'Normal', 0, 78.5, 'linkinpark@putrajaya, 43000 Putrajaya.', timestamp '2021-02-06 12:35:06', timestamp '2021-02-06 13:00:32', 100002, 'R0001');
--INSERT INTO Orders VALUES ('OD00016',   'Fast',  7,  0,  '368, back street Cameron Highlands Dr.Hasan Villa, 39000 Pahang.',     timestamp '2021-02-06 16:51:54', timestamp '2021-02-06 17:04:17', 100002, 'R0004');
--INSERT INTO Orders VALUES ('OD00017', 'Normal',  7,  0,  'Kuala Lumpur KLCC 100th floor, 56000 Kuala Lumpur.',                   timestamp '2021-02-06  16:55:22', timestamp '2021-02-06 16:27:50', 100001, 'R0002');
--INSERT INTO Orders VALUES ('OD00014', 'Normal',  7,  0,  'Lot 44, Seksyen 17, Bandar Kota Bharu, 15050 Kota Bharu, Kelantan.',     timestamp '2021-02-06 08:11:14', timestamp '2021-02-06 08:35:20', 100010, 'R0010');
select * from orders;

INSERT INTO FoodOrder VALUES ('F0001', 'OD00001', 5);
INSERT INTO FoodOrder VALUES ('F0009', 'OD00001', 4);
INSERT INTO FoodOrder VALUES ('F0002', 'OD00002', 6);
INSERT INTO FoodOrder VALUES ('F0003', 'OD00003', 3);
INSERT INTO FoodOrder VALUES ('F0015', 'OD00003', 3);
INSERT INTO FoodOrder VALUES ('F0007', 'OD00004', 4);
INSERT INTO FoodOrder VALUES ('F0006', 'OD00005', 3);
INSERT INTO FoodOrder VALUES ('F0022', 'OD00005', 2);
INSERT INTO FoodOrder VALUES ('F0001', 'OD00005', 1);
INSERT INTO FoodOrder VALUES ('F0009', 'OD00006', 7);
INSERT INTO FoodOrder VALUES ('F0001', 'OD00007', 4);
INSERT INTO FoodOrder VALUES ('F0023', 'OD00008', 2);
INSERT INTO FoodOrder VALUES ('F0015', 'OD00008', 1);
INSERT INTO FoodOrder VALUES ('F0003', 'OD00008', 1);
INSERT INTO FoodOrder VALUES ('F0015', 'OD00009', 5);
INSERT INTO FoodOrder VALUES ('F0015', 'OD00010', 7);
INSERT INTO FoodOrder VALUES ('F0020', 'OD00011', 2);
INSERT INTO FoodOrder VALUES ('F0012', 'OD00011', 3);
INSERT INTO FoodOrder VALUES ('F0015', 'OD00012', 3);
INSERT INTO FoodOrder VALUES ('F0018', 'OD00012', 1);
INSERT INTO FoodOrder VALUES ('F0008', 'OD00013', 1);
INSERT INTO FoodOrder VALUES ('F0009', 'OD00014', 4);
INSERT INTO FoodOrder VALUES ('F0015', 'OD00015', 2);
INSERT INTO FoodOrder VALUES ('F0010', 'OD00015', 6);


INSERT INTO Voucher VALUES ('DKDIS', 'First order discount', 0.10, 100005, DEFAULT);
INSERT INTO Voucher VALUES ('MBVCD', 'Link Maybank account', 0.20, 100003, DEFAULT);
INSERT INTO Voucher VALUES ('JXDES', 'Link Maybank account', 0.20, 100002, DEFAULT);
INSERT INTO Voucher VALUES ('DERFV', 'Limited CNY Promotion', 0.25, 100001, DEFAULT);

SELECT * FROM viewpayment;

INSERT INTO Payment VALUES ('PY00001', 0, 'Cash on delivery', timestamp '2020-12-17 17:56:56', 'OD00001', NULL); 
INSERT INTO Payment VALUES ('PY00002', 0, 'Cash on delivery', timestamp '2020-12-25 11:45:44', 'OD00002', 'JXDES');
INSERT INTO Payment VALUES ('PY00003', 0, 'Online Banking', timestamp '2020-12-25 12:53:13', 'OD00003', 'MBVCD');
INSERT INTO Payment VALUES ('PY00004', 0, 'Credit Card', timestamp '2020-12-25 15:20:04', 'OD00004', NULL);
INSERT INTO Payment VALUES ('PY00005', 0, 'Cash on delivery', timestamp '2020-12-25 19:03:01', 'OD00005', 'DKDIS');
INSERT INTO Payment VALUES ('PY00006', 0, 'Cash on delivery', timestamp '2020-12-31 11:45:57', 'OD00006', NULL);
INSERT INTO Payment VALUES ('PY00007', 0, 'Credit Card', timestamp '2021-01-05 12:12:06', 'OD00007', NULL);
INSERT INTO Payment VALUES ('PY00008', 0, 'Online Banking', timestamp '2021-01-16 14:09:06', 'OD00008', NULL);
INSERT INTO Payment VALUES ('PY00009', 0, 'Cash on delivery', timestamp '2021-01-16 16:17:10', 'OD00009', NULL);
INSERT INTO Payment VALUES ('PY00010', 0, 'Cash on delivery', timestamp '2021-01-16 19:51:22', 'OD00010', NULL);
INSERT INTO Payment VALUES ('PY00011', 0, 'Online Banking', timestamp '2021-01-30 09:06:34', 'OD00011', NULL);
INSERT INTO Payment VALUES ('PY00012', 0, 'Credit Card', timestamp '2021-02-01 13:09:06', 'OD00012', NULL);
INSERT INTO Payment VALUES ('PY00013', 0, 'Cash on delivery', timestamp '2021-02-02 09:19:43', 'OD00013', NULL);
INSERT INTO Payment VALUES ('PY00014', 0, 'Online Banking', timestamp '2021-02-06 08:12:14', 'OD00014', 'DERFV');
INSERT INTO Payment VALUES ('PY00015', 0, 'Credit Card', timestamp '2021-02-06 12:36:06', 'OD00015', NULL);


DELETE FROM REVIEW;
INSERT INTO Review VALUES (1000, 5, 'Best burger in town!!', 'OD00001');
INSERT INTO Review VALUES (1001, 4, 'Good but could be more crispy', 'OD00002');
INSERT INTO Review VALUES (1002, 5, 'So cheesy and yummy pizza. Loved it!', 'OD00003');
INSERT INTO Review VALUES (1003, 4, 'Very fast delivery, cheap and yummy meal', 'OD00004');
INSERT INTO Review VALUES (1004, 5, 'The best chinese fried rice i would recommend', 'OD00005');
INSERT INTO Review VALUES (1005, 3, 'Nothing special about it', 'OD00007');
INSERT INTO Review VALUES (1006, 1, 'Dhaka pizza taste bad, highly not recommended', 'OD00008');
INSERT INTO Review VALUES (1007, 4, 'Dominos is the best', 'OD00011');
INSERT INTO Review VALUES (1008, 5, 'Best japanese food!', 'OD00012');
INSERT INTO Review VALUES (1009, 4, 'Love the crunchy BopBop Chicken!', 'OD00015');

SELECT * FROM REVIEW;


--AGGREGATE FUNCTION 1
SELECT TRUNC(Order_DateTime) AS Dates,
SUM(P.Payment_Amount) AS Total_Sales
FROM Orders O, Payment P
WHERE O.Order_ID = P.Order_ID
GROUP BY TRUNC(Order_DateTime)
ORDER BY Dates ASC;

select * from orders;

--AGGREGATE FUNCTION 2
SELECT MAX(FoodOrder.Food_ID) AS Food_ID, Food.Food_Name, SUM(FoodOrder.FoodOrder_Quantity) AS Total_Quantity_Ordered
FROM FoodOrder INNER JOIN Food
ON FoodOrder.Food_ID = Food.Food_ID
GROUP BY Food.Food_Name
ORDER BY SUM(FoodOrder.FoodOrder_Quantity) DESC
FETCH NEXT 5 ROWS ONLY;


--AGGREGATE FUNCTION 3
SELECT CASE WHEN customer_address LIKE '%Selangor%'  THEN 'SGR'
            WHEN customer_address LIKE '%Kuala Lumpur%' THEN 'KL'
            WHEN customer_address LIKE '%Putrajaya%' THEN 'PJY'
            WHEN customer_address LIKE '%Pahang%'  THEN 'PHG'
            WHEN customer_address LIKE '%Kelantan%' THEN 'KTN'
            WHEN customer_address LIKE '%Perak%'  THEN 'PRK'
            WHEN customer_address LIKE '%Negeri Sembilan%' THEN 'NSN'
            WHEN customer_address LIKE '%Terengganu%'  THEN 'TRG'
            ELSE NULL END AS State,
            COUNT(*) AS CustomerCount
FROM customer
GROUP BY CASE WHEN customer_address LIKE '%Selangor%'  THEN 'SGR'
              WHEN customer_address LIKE '%Kuala Lumpur%' THEN 'KL'
              WHEN customer_address LIKE '%Putrajaya%' THEN 'PJY'
              WHEN customer_address LIKE '%Pahang%'  THEN 'PHG'
              WHEN customer_address LIKE '%Kelantan%' THEN 'KTN'
              WHEN customer_address LIKE '%Perak%'  THEN 'PRK'
              WHEN customer_address LIKE '%Negeri Sembilan%' THEN 'NSN'
              WHEN customer_address LIKE '%Terengganu%'  THEN 'TRG'
              ELSE NULL END;


--AGGREGATE FUNCTION 4
SELECT Food.Food_Category AS FoodCategories,
Min(Food_Price) AS LowestPrice,
Max(Food_Price) AS HighestPrice,
ROUND(Avg(Food_Price),2) AS AveragePrice
FROM Food
GROUP BY Food.Food_Category;


--GROUP BY & HAVING 1
SELECT o.Rider_ID, r.rider_name, 
       COUNT(o.Order_ID) AS TotalDelivery
FROM Orders o, rider r
where r.rider_id = o.rider_id
GROUP BY o.Rider_ID, r.rider_name
HAVING COUNT(o.Order_ID) > 2
order by rider_id;

--GROUP BY & HAVING 2
SELECT O.Customer_ID AS CustomerID,
C.Customer_Name AS CustomerName,
COUNT(O.Customer_ID) AS TotalOrders
FROM Orders O, Customer C
WHERE O.Customer_ID = C.Customer_ID
GROUP BY O.Customer_ID, C.Customer_Name
HAVING COUNT(O.Customer_ID)>1
ORDER BY TotalOrders DESC;


--VIEW
CREATE VIEW viewOrder AS SELECT * FROM Orders;
SELECT * FROM viewOrder;


CREATE VIEW viewPayment AS SELECT * FROM Payment;
SELECT * FROM viewPayment;


create or replace view orderSupply AS
SELECT m.Merchant_ID, m.Merchant_Name, f.food_ID, f.food_name, fo.order_id, fo.foodorder_quantity
FROM food f, merchant m, foodorder fo
WHERE m.merchant_id = f.merchant_id AND fo.food_id = f.food_id 
order by fo.Order_id ASC;

SELECT * FROM orderSupply;


--TRIGGER 1
DROP TRIGGER trgDeliveryFee;
SELECT * FROM Orders;
CREATE OR REPLACE TRIGGER trgDeliveryFee
Instead of insert ON viewOrder
DECLARE Delivery_Fee NUMBER(2);
BEGIN
 IF :new.Delivery_Type = 'Normal' THEN
    Delivery_Fee :=7;
 ELSIF :new.Delivery_Type = 'Fast' THEN
    Delivery_Fee :=10;
 ELSE
    RAISE_APPLICATION_ERROR(-20001, 'Delivery Type "' || :NEW.Delivery_Type || '" is invalid.');
 END IF;
 
 INSERT INTO Orders VALUES (:NEW.Order_ID, :NEW.Delivery_Type, Delivery_Fee, :NEW.Order_Price, :NEW.Delivery_Address,
                            :NEW.Order_DateTime, :NEW.Delivery_DateTime, :NEW.Customer_ID, :NEW.Rider_ID);

END;


--TEST TO EXECUTE
DELETE FROM Orders WHERE Order_ID = 'OD00016';
SELECT * FROM ORDERS;
SELECT * FROM foodorder;
INSERT INTO viewOrder VALUES ('OD00016',   'Fast',  0,  104,  '25, linkinpark@putrajaya, 43000 Putrajaya.', timestamp '2021-02-08 16:51:54', timestamp '2021-02-08 17:04:17', 100002, 'R0004');
INSERT INTO viewOrder VALUES ('OD00017', 'Normal',  0,  23.7,  'Lot 44, Seksyen 17, Bandar Kota Bharu, 15050 Kota Bharu, Kelantan.', timestamp '2021-02-08  16:55:22', timestamp '2021-02-08 17:27:50', 100010, 'R0010');
INSERT INTO FoodOrder VALUES ('F0005', 'OD00016', 8);
INSERT INTO FoodOrder VALUES ('F0015', 'OD00017', 3);
DELETE FROM FoodOrder WHERE Order_ID = 'OD00016';


SELECT * FROM vieworder;

--TO EXECUTE
delete from customer;
DELETE FROM Orders;
DELETE FROM PAYMENT;
DELETE FROM FOODORDER;
delete from voucher;
INSERT INTO viewOrder VALUES ('OD00001', 'Normal', 0, 165.46, 'Kuala Lumpur KLCC 100th floor, 56000 Kuala Lumpur.', timestamp '2020-12-17 17:22:23', timestamp '2020-12-17 17:56:56', 100001, 'R0001');
INSERT INTO viewOrder VALUES ('OD00002', 'Normal', 0, 89.94, '25, linkinpark@putrajaya, 43000 Putrajaya.', timestamp '2020-12-25 11:15:25', timestamp '2020-12-25 11:45:44', 100002, 'R0007');
INSERT INTO viewOrder VALUES ('OD00003', 'Normal', 0, 91.2, 'Persiaran Bestari TheArc@cyberjaya, 63000 Cyberjaya, Selangor.', timestamp '2020-12-25 12:52:13', timestamp '2020-12-25 13:28:37', 100003, 'R0002');
INSERT INTO viewOrder VALUES ('OD00004', 'Fast', 0, 26, '368, Back Street Cameron Highlands Dr.Hasan Villa, 39000 Pahang.', timestamp '2020-12-25 15:19:04', timestamp '2020-12-25 15:33:49', 100004, 'R0003');
INSERT INTO viewOrder VALUES ('OD00005', 'Normal', 0, 82.67, 'No.25, Taman Indah Villa, Jalan 5 Bandar Sunway, 47500 Subang Jaya, Selangor.', timestamp '2020-12-25 18:33:07', timestamp '2020-12-25 19:03:01', 100005, 'R0006');
INSERT INTO viewOrder VALUES ('OD00006', 'Fast', 0, 97.93, '45-1, Jalan Puteri 12/20 Bandar Puteri, 47100 Puchong, Selangor.', timestamp '2020-12-31 11:33:34', timestamp '2020-12-31 11:45:57', 100007, 'R0002');

INSERT INTO viewOrder VALUES ('OD00007', 'Normal', 0, 87.6, '60, Jalan Ahmad Shah, Pusat Komersil Temerloh, 28000 Temerloh, Pahang.', timestamp '2021-01-05 12:11:06', timestamp '2021-01-05 13:44:08', 100009, 'R0003');

INSERT INTO viewOrder VALUES ('OD00008', 'Fast', 0, 74.2, 'Kuala Lumpur KLCC 100th floor, 56000 Kuala Lumpur.',timestamp '2021-01-16 14:08:06', timestamp '2021-01-16 14:33:37', 100001, 'R0006');
INSERT INTO viewOrder VALUES ('OD00009', 'Normal', 0, 39.5, 'No.4, Taman Subang Permai, 47500 Subang Jaya, Selangor', timestamp '2021-01-16 16:05:34', timestamp '2021-01-16 16:17:10', 100012, 'R0001');

INSERT INTO viewOrder VALUES ('OD00010', 'Fast', 0, 55.3, '22, Jalan Datuk Onn Jaafar, Taman Jubilee, 30300 Ipoh, Perak.', timestamp '2021-01-16 18:40:06', timestamp '2021-01-16 19:51:22', 100013, 'R0008');
INSERT INTO viewOrder VALUES ('OD00011', 'Normal', 0, 77.68, 'Kuala Lumpur KLCC 100th floor, 56000 Kuala Lumpur.', timestamp '2021-01-30 09:05:34', timestamp '2021-01-30 09:32:10', 100001, 'R0001');

INSERT INTO viewOrder VALUES ('OD00012', 'Fast', 0, 41.19, 'No.4 Jalan Persinggahan, 20400 Kuala Terengganu, Terengganu.', timestamp '2021-02-01 13:08:06', timestamp '2021-02-01 13:18:14', 100015, 'R0011');
INSERT INTO viewOrder VALUES ('OD00013', 'Normal', 0, 11.99, 'Kuala Lumpur KLCC 100th floor, 56000 Kuala Lumpur.', timestamp '2021-02-02  08:54:06', timestamp '2021-02-02 09:19:43', 100001, 'R0005');
INSERT INTO viewOrder VALUES ('OD00014', 'Fast', 0, 55.96, 'Kuala Lumpur KLCC 100th floor, 56000 Kuala Lumpur.', timestamp '2021-02-06 08:11:14', timestamp '2021-02-06 08:35:20', 100001, 'R0002');
INSERT INTO viewOrder VALUES ('OD00015', 'Normal', 0, 78.5, 'Persiaran Bestari TheArc@cyberjaya, 63000 Cyberjaya, Selangor.', timestamp '2021-02-06 12:35:06', timestamp '2021-02-06 13:00:32', 100003, 'R0001');


--FUNCTION
CREATE OR REPLACE FUNCTION getTotalPrice(x VARCHAR)
RETURN NUMBER
AS
 TotalPrice NUMBER(8,2);
BEGIN
 SELECT SUM(b.FoodOrder_Quantity * c.Food_Price)
 INTO TotalPrice
 FROM FoodOrder b, Food c
 WHERE x = b.Order_ID AND b.Food_ID = c.Food_ID;

 RETURN TotalPrice;
END;

SELECT getTotalPrice('OD00001')
FROM dual;

select * from foodorder;

SELECT * FROM Payment;


--STORED PROCEDURE 1 (CUSTOMER MEMBER POINT)
CREATE OR REPLACE PROCEDURE setCustomerMemberPoint(getCustomerID NUMBER, getpaymentID CHAR, getOrderID CHAR)
AS
 getPaymentAmount NUMBER := 0;
BEGIN
    SELECT P.Payment_Amount INTO getPaymentAmount 
    FROM Payment P, Orders O
    WHERE O.Customer_ID = getCustomerID AND P.Payment_ID = getpaymentID AND O.ORDER_ID = getOrderID;
    
    UPDATE Customer   
    SET Customer_Member_Point = CASE WHEN getPaymentAmount BETWEEN 50 AND 100
                                THEN Customer_Member_Point + 3 
                                WHEN getPaymentAmount > 100
                                THEN Customer_Member_Point + 5
                                WHEN getPaymentAmount < 50
                                THEN Customer_Member_Point + 2
                                END
    WHERE Customer_id = getCustomerID; 
END;

select * from VOUCHER;


--STORED PROCEDURE 2 (PAYMENT AMOUNT)
CREATE OR REPLACE PROCEDURE setPaymentAmount(getOrder_ID CHAR, 
                                       getdisct NUMBER,
                                       getdelfee NUMBER)
AS 
 BEGIN
    UPDATE Payment
    SET Payment_Amount = getTotalPrice(getOrder_ID) * (1-getdisct) + getdelFee
    WHERE order_id = getOrder_ID;
 END;
 

--STORED PROCEDURE 3 (VOUCHER STATUS)
CREATE OR REPLACE PROCEDURE setVoucherStatus(getVoucherCode CHAR, getCustomerID NUMBER)
AS 
BEGIN
    UPDATE Voucher
	SET Voucher_Status = 'APPLIED'
	WHERE Voucher_Code = getVoucherCode
    AND getvouchercode IN (select voucher_code from voucher where Customer_ID = getCustomerID)
    AND voucher_status = 'NOT APPLIED';
    
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
	DBMS_OUTPUT.PUT_LINE ('Invalid Voucher Code.');
END;


--TRIGGER 2
CREATE OR REPLACE TRIGGER trgPayment
INSTEAD OF INSERT ON viewPayment FOR EACH ROW
DECLARE voucherCode CHAR(5) := ''; 
        disct NUMBER(3,2) := 0; 
        delFee NUMBER(2) := 0; 
        cusID NUMBER(6) := 0;
        checkvoucher NUMBER(1);
        customerID NUMBER(6);
BEGIN  
    Insert into Payment
    Values (:NEW.Payment_ID, :NEW.Payment_Amount, :NEW.Payment_Type, 
            :NEW.Payment_DateTime, :NEW.Order_ID, :NEW.Voucher_Code);
            
    SELECT Delivery_Fee INTO delFee
    FROM Orders WHERE Order_ID = :NEW.Order_ID;
    
    SELECT Voucher_Code INTO voucherCode
    FROM viewPayment WHERE payment_id = :NEW.payment_id;
    
    SELECT CASE WHEN EXISTS (SELECT Voucher_Code FROM Voucher WHERE voucherCode = :NEW.Voucher_Code) 
    THEN 1
    ELSE 0
    
    END INTO checkvoucher FROM DUAL;
    
    IF checkvoucher = 1
    THEN
    SELECT v.Customer_ID INTO cusID
    FROM voucher v, Orders o
    WHERE v.customer_id = o.customer_id AND o.order_ID = :NEW.Order_ID;
    
    SELECT Discount INTO disct
    FROM Voucher WHERE Voucher_Code = :NEW.Voucher_Code;
    
    setPaymentAmount(:NEW.order_id, disct, delFee);
    setVoucherStatus(:NEW.Voucher_Code, cusID);
    ELSE
    setPaymentAmount (:NEW.order_id, 0, delFee);
    
    END IF;
    
    select Customer_ID INTO customerID
    FROM Orders WHERE Order_ID = :NEW.order_id;
    
    setCustomerMemberPoint(customerID, :NEW.payment_id, :NEW.order_id);
END;

SELECT * FROM Payment;
SELECT * FROM orders;
select * from voucher;


SELECT * FROM payment;
select * from customer;
select * from voucher;
select * from orders;
select * from voucher;
INSERT INTO viewPayment VALUES ('PY00001', 0, 'Cash on delivery', timestamp '2020-12-17 17:56:56', 'OD00001', NULL); 
INSERT INTO viewPayment VALUES ('PY00002', 0, 'Cash on delivery', timestamp '2020-12-25 11:45:44', 'OD00002', 'JXDES');
INSERT INTO viewPayment VALUES ('PY00003', 0, 'Online Banking', timestamp '2020-12-25 12:53:13', 'OD00003', 'MBVCD');
INSERT INTO viewPayment VALUES ('PY00004', 0, 'Credit Card', timestamp '2020-12-25 15:20:04', 'OD00004', NULL);
INSERT INTO viewPayment VALUES ('PY00005', 0, 'Cash on delivery', timestamp '2020-12-25 19:03:01', 'OD00005', 'DKDIS');
INSERT INTO viewPayment VALUES ('PY00006', 0, 'Cash on delivery', timestamp '2020-12-31 11:45:57', 'OD00006', NULL);
INSERT INTO viewPayment VALUES ('PY00007', 0, 'Credit Card', timestamp '2021-01-05 12:12:06', 'OD00007', NULL);
INSERT INTO viewPayment VALUES ('PY00008', 0, 'Online Banking', timestamp '2021-01-16 14:09:06', 'OD00008', NULL);
INSERT INTO viewPayment VALUES ('PY00009', 0, 'Cash on delivery', timestamp '2021-01-16 16:17:10', 'OD00009', NULL);
INSERT INTO viewPayment VALUES ('PY00010', 0, 'Cash on delivery', timestamp '2021-01-16 19:51:22', 'OD00010', NULL);
INSERT INTO viewPayment VALUES ('PY00011', 0, 'Online Banking', timestamp '2021-01-30 09:06:34', 'OD00011', NULL);
INSERT INTO viewPayment VALUES ('PY00012', 0, 'Credit Card', timestamp '2021-02-01 13:09:06', 'OD00012', NULL);
INSERT INTO viewPayment VALUES ('PY00013', 0, 'Cash on delivery', timestamp '2021-02-02 09:19:43', 'OD00013', NULL);
INSERT INTO viewPayment VALUES ('PY00014', 0, 'Online Banking', timestamp '2021-02-06 08:12:14', 'OD00014', 'DERFV');
INSERT INTO viewPayment VALUES ('PY00015', 0, 'Credit Card', timestamp '2021-02-06 12:36:06', 'OD00015', NULL);


INSERT INTO viewPayment VALUES ('PY00017', 0, 'Credit Card', timestamp '2021-02-08 16:55:22', 'OD00017', NULL);
INSERT INTO viewPayment VALUES ('PY00016', 0, 'Credit Card', timestamp '2021-02-08 16:51:54', 'OD00016', NULL);

DELETE FROM Orders WHERE Order_ID = 'OD00016';
DELETE FROM Orders WHERE Order_ID = 'OD00017';
INSERT INTO viewOrder VALUES ('OD00016',   'Fast',  0,  0,  '368, back street Cameron Highlands Dr.Hasan Villa, 39000 Pahang.', timestamp '2021-02-08 16:51:54', timestamp '2021-02-08 17:04:17', 100001, 'R0004');
INSERT INTO viewOrder VALUES ('OD00017', 'Normal',  0,  0,  'Lot 44, Seksyen 17, Bandar Kota Bharu, 15050 Kota Bharu, Kelantan.', timestamp '2021-02-08  16:55:22', timestamp '2021-02-08 17:27:50', 100010, 'R0010');


--SUBQUERY 
SELECT Order_ID, SUM(TotalPrice) AS OrderPrice, Delivery_Fee, SUM(TotalPrice + Delivery_Fee) AS TotalPrice
FROM (SELECT
      a.Order_ID, a.Delivery_Fee, b.Food_ID, b.FoodOrder_Quantity, c.Food_Price, 
      (b.FoodOrder_Quantity * c.Food_Price) AS TotalPrice
      FROM
      Orders a, FoodOrder b, Food c
      WHERE
      a.Order_ID = b.Order_ID AND b.Food_ID = c.Food_ID)
GROUP BY Order_ID, Delivery_Fee
ORDER BY Order_ID ASC;

select * from customer;


--ADDITIONAL QUERY 1 (AUTO INCREMENT)
CREATE SEQUENCE CustomerSeq
START WITH     100015
INCREMENT BY   1;

CREATE OR REPLACE TRIGGER trgCustomerSeq
BEFORE INSERT ON Customer FOR EACH ROW
BEGIN
    :NEW.Customer_ID := CustomerSeq.nextval; 
END;

SELECT * FROM CUSTOMER;
INSERT INTO Customer VALUES (CustomerSeq.nextval, 'Lily Yu', 'LILY@gmail.com', 60167676549, '10, Taman Bukit Indah,47160 Puchong Selangor.', 0);


--ADDITIONAL QUERY 2 (TOP CUSTOMER)
SELECT C.Customer_ID, C.Customer_Name, 
       COUNT(O.Order_ID) AS Total_Orders, C.Customer_Member_Point, 
RANK() OVER(ORDER BY C.Customer_Member_Point DESC) AS Customer_Rank
FROM Customer C, Orders O
WHERE O.Customer_ID = C.Customer_ID
GROUP BY C.Customer_ID, C.Customer_Name, C.Customer_Member_Point 
FETCH NEXT 3 ROWS ONLY;


--ADDTIONAL QUERY 3 (COUNT NUMBER OF ROWS) 
SELECT fo.order_id, fo.food_id, ROW_NUMBER() OVER(PARTITION BY fo.order_id 
        ORDER BY fo.food_id) AS Row_Number, f.food_name, fo.foodorder_quantity 
FROM foodorder fo, food f, orders o  
where fo.food_id = f.food_id and fo.order_id = o.order_id 
GROUP BY  fo.order_id, fo.food_id, f.food_name, fo.foodorder_quantity;


--ADDITIONAL QUERY 4 (MONTHLY GROWTH)
SELECT EXTRACT(YEAR FROM payment_DateTime) AS Year, EXTRACT(MONTH FROM payment_DateTime) AS Month,
SUM(Payment_Amount) AS TotalSales, 
ROUND( (100 * (SUM(Payment_Amount) - LAG(SUM(Payment_Amount),1) OVER(ORDER BY EXTRACT(YEAR FROM payment_DateTime)))/
LAG(SUM(Payment_Amount),1) OVER(ORDER BY EXTRACT(YEAR FROM Payment_DateTime))),2) || '%'
AS Growth
FROM Payment
GROUP BY EXTRACT(month FROM payment_DateTime),
EXTRACT(year FROM payment_DateTime);


