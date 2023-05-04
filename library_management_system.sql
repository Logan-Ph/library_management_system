create database library_management_system;
use library_management_system;

create table Items(
	itemID  CHAR(50) primary key,
    title CHAR(50),
    genre CHAR(50),
    category CHAR(50)
);

create table Copies(
	itemID CHAR(50),
    copyID CHAR(50) unique not null,
    primary key(itemID, copyID),
    FOREIGN KEY (itemID) REFERENCES Items(itemID)
);

create table Authors(
	authorID   CHAR(50),
	name     CHAR(50),
	gender CHAR(50),
	PRIMARY KEY (authorID)
);

create table Own (
	authorID CHAR(50),
    itemID CHAR(50),
    PRIMARY KEY (authorID, itemID),
	FOREIGN KEY (authorID) REFERENCES Authors(authorID),
	FOREIGN KEY (itemID) REFERENCES Items(itemID)
);

create table Publishers(
	name CHAR(50),
    phone_number INT,
    adress CHAR(50),
    primary key (name)
);

create table Library_users(
	userID CHAR(50),
    name CHAR(50) not null,
    phone_number INT not null,
    gender CHAR(50) not null,
    adress CHAR(50) not null,
    primary key (userID)
);

create index Library_users_userID_idx on Library_users (userID);
create index Library_users_name_idx on Library_users (name);
create index Library_users_phone_number_idx on Library_users (phone_number);
create index Library_users_gender_idx on Library_users (gender);
create index Library_users_adress_idx on Library_users (adress);


create table Teachers(
	teacherID CHAR(50) unique not null,
    name CHAR(50) not null ,
	phone_number INT not null,
    adress CHAR(50) not null,
    gender CHAR(50) not null,
	userID CHAR(50) unique not null,
    primary key (teacherID,userID),
	foreign key (userID) references Library_users (userID),
	foreign key (name) references Library_users (name),
	foreign key (phone_number) references Library_users (phone_number),
	foreign key (gender) references Library_users (gender),
	foreign key (adress) references Library_users (adress)
);

create table Students(
	studentID CHAR(50) unique not null,
    name CHAR(50) not null ,
	phone_number INT not null,
    adress CHAR(50) not null,
    gender CHAR(50) not null,
	userID CHAR(50) unique not null,
    primary key (studentID,userID),
	foreign key (userID) references Library_users (userID),
	foreign key (name) references Library_users (name),
	foreign key (phone_number) references Library_users (phone_number),
	foreign key (gender) references Library_users (gender),
	foreign key (adress) references Library_users (adress)
);

create table Library_staff(
	staffID CHAR(50) unique not null,
    name CHAR(50) not null ,
	phone_number INT not null,
    adress CHAR(50) not null,
    gender CHAR(50) not null,
	userID CHAR(50) unique not null,
    position CHAR(50),
    primary key (staffID,userID),
	foreign key (userID) references Library_users (userID),
	foreign key (name) references Library_users (name),
	foreign key (phone_number) references Library_users (phone_number),
	foreign key (gender) references Library_users (gender),
	foreign key (adress) references Library_users (adress)
);


create table Assist(
	staffID CHAR(50),
    userID CHAR(50),
    time DATETIME NOT NULL,
    primary key (time,userID,staffID),
    foreign key (userID) references Library_users (userID),
    foreign key (staffID) references Library_staff (staffID)
);


create table Publish (
	itemID char(50),
    authorID char(50),
    publication_date date not null,
    publisher_name char(50),
    primary key (itemID,authorID,publisher_name),
    foreign key (itemID) references Own(itemID),
	foreign key (authorID) references Own(authorID),
    foreign key (publisher_name) references Publishers(name)
);


create table Transactions(
	transactionID CHAR(50),
	userID CHAR(50),
    copyID CHAR(50),
    itemID CHAR(50),
    PRIMARY KEY (transactionID,copyID ,userID,itemID),
	FOREIGN KEY (copyID) REFERENCES Copies(copyID),
	FOREIGN KEY (itemID) REFERENCES Items(itemID),
	FOREIGN KEY (userID) REFERENCES Library_users(userID)
);

create table Fines (
	fine_amount INT,
    payment_status  CHAR(50),
	userID   CHAR(50),
	transactionID CHAR(50),
    type_of_payment CHAR(50),
	PRIMARY KEY (transactionID,userID),
	FOREIGN KEY (userID) REFERENCES Library_users(userID),
	FOREIGN KEY (transactionID ) REFERENCES Transactions(transactionID )
);

create table Returning_transactions(
	transactionID CHAR(50),
	return_date DATETIME NOT NULL,
	PRIMARY KEY (transactionID),
	FOREIGN KEY (transactionID ) REFERENCES Transactions(transactionID )
);

create table Borrowing_transactions(
	transactionID CHAR(50),
    borrow_date DATETIME NOT NULL,
	due_date DATETIME NOT NULL,
	PRIMARY KEY (transactionID),
	FOREIGN KEY (transactionID ) REFERENCES Transactions(transactionID )
);

insert into Items values 
	('i1',	'Romeo and Juliet',	'Drama', 'Book'),
	('i2',	'Hamlet',	'Drama',	'Book'),
	('i3',	'Macbeth',	'Drama',	'Book'),
	('i4',	'Othello',	'Drama',	'Book'),
	('i5',	'Pride and Prejudice',	'Romance',	'Book'),
	('i6',	'Sense and Sensibility',	'Romance',	'Book'),
	('i7',	'Emma',	'Romance',	'Book'),
	('i8',	'1984',	'Political Satire',	'Book'),
	('i9',	'Animal Farm',	'Political Satire',	'Book'),
	('i10',	'Homage to Catalonia',	'History',	'Book'),
	('i11',	'The Old Man and the Sea',	'Modernist Fiction',	'Book'),
	('i12',	'For Whom the Bell Tolls',	'Modernist Fiction',	'Book'),
	('i13',	'A Farewell to Arms',	'Modernist Fiction',	'Book'),
	('i14',	'Harry Potter and the Philosopher Stone',	'Fantasy Fiction',	'Book'),
	('i15',	'Harry Potter and the Deathly Hallows',	'Fantasy Fiction',	'Book'),
	('i16',	'The Casual Vacancy',	'Fantasy Fiction',	'Book'),
	('i17',	'One Hundred Years of Solitude',	'Magical Realism',	'Book'),
	('i18',	'Love in the Time of Cholera',	'Magical Realism',	'Book'),
	('i19',	'Chronicle of a Death Foretold',	'Literary Fiction',	'Book'),
	('i20',	'To Kill a Mockingbird',	'Bildungsroman',	'Book'),
	('i21',	'Go Set a Watchman',	'YA Fiction',	'Book'),
	('i22',	'The Great Gatsby',	'Literary Fiction',	'Book'),
	('i23',	'Tender Is the Night',	'Literary Fiction',	'Book'),
	('i24',	'This Side of Paradise',	'Literary Fiction',	'Book'),
	('i25',	'Beloved',	'Historical Fiction',	'Book'),
	('i26',	'The Bluest Eye',	'Literary Fiction',	'Book'),
	('i27',	'Song of Solomon',	'Literary Fiction',	'Book'),
	('i28',	'The Lord of the Rings trilogy',	'High Fantasy',	'Book'),
	('i29',	'The Hobbit',	'High Fantasy',	'Book');

insert into Copies values
('i1', 'c1'),
('i1', 'c2'),
('i2', 'c3'),
('i2', 'c4'),
('i3', 'c5'),
('i3', 'c6'),
('i4', 'c7'),
('i4', 'c8'),
('i5', 'c9'),
('i5', 'c10'),
('i6', 'c11'),
('i6', 'c12'),
('i7', 'c13'),
('i7', 'c14'),
('i8', 'c15'),
('i8', 'c16'),
('i9',  'c17'),
('i9',	'c18'),
('i10',	'c19'),
('i10',	'c20'),
('i11',	'c21'),
('i11',	'c22'),
('i12',	'c23'),
('i12',	'c24'),
('i13',	'c25'),
('i13',	'c26'),
('i14',	'c27'),
('i14',	'c28'),
('i15',	'c29'),
('i15',	'c30'),
('i16',	'c31'),
('i16',	'c32'),
('i17',	'c33'),
('i17',	'c34'),
('i18',	'c35'),
('i18',	'c36'),
('i19',	'c37'),
('i19',	'c38'),
('i20', 'c39'),
('i20', 'c40'),
('i21', 'c41'),
('i21',	'c42'),
('i22',	'c43'),
('i22',	'c44'),
('i23',	'c45'),
('i23',	'c46'),
('i24',	'c47'),
('i24',	'c48'),
('i25',	'c49'),
('i25',	'c50'),
('i26',	'c51'),
('i26',	'c52'),
('i27',	'c53'),
('i27',	'c54'),
('i28',	'c55'),
('i28',	'c56'),
('i29',	'c57'),
('i29',	'c58');

insert into Authors values
	('au1',	'William Shakespeare',	'male'),
	('au2',	'Jane Austen',	'female'),
	('au3',	'George Orwell',	'male'),
	('au4',	'Ernest Hemingway',	'male'),
	('au5',	'J.K. Rowling', 'male'),
	('au6',	'Gabriel Garcia Marquez',	'male'),
	('au7',	'Harper Lee',	'female'),
	('au8',	'F. Scott Fitzgerald',	'male'),
	('au9',	'Toni Morrison',	'female'),
	('au10', 'J.R.R. Tolkien',	'male');
    
insert into Own values 
	('au1',	'i1'),
	('au1',	'i2'),
	('au1',	'i3'),
	('au1',	'i4'),
	('au2',	'i5'),
	('au2',	'i6'),
	('au2',	'i7'),
	('au3',	'i8'),
	('au3',	'i9'),
	('au3',	'i10'),
	('au4',	'i11'),
	('au4',	'i12'),
	('au4',	'i13'),
	('au5',	'i14'),
	('au5',	'i15'),
	('au5',	'i16'),
	('au6',	'i17'),
	('au6',	'i18'),
	('au6',	'i19'),
	('au7',	'i20'),
	('au7',	'i21'),
	('au8',	'i22'),
	('au8',	'i23'),
	('au8',	'i24'),
	('au9',	'i25'),
	('au9',	'i26'),
	('au9',	'i27'),
	('au10','i28'),
	('au10','i29');
    
insert into Publishers values
	('Kim Dong Publishing House',	19005715,	'55 Quang Trung St'),
	('Ho Chi Minh City General Publishing House',	02838256,	'62 Nguyen Thi Minh Khai St'),
	('Tre Publishing House',	19005715,	'161B Ly Chinh Thang St'),
	('Ha Noi Publishing House',	02438252,	'4 Tong Duy Tan St'),
	('Vietnam Women Publishing House',24397107,	'39 Hang Chuoi St');

insert into Library_users values
	('u1',	'Christopher Wright',	'123456',	'Male',	'Q7 Ho Chi Minh City'),
	('u2',	'Kevin Lee',	'234764',	'Male',	'Q3 Ho Chi Minh City'),
	('u3',	'Rachel Singh',	'886450',	'Female',	'Q1 Ho CHi Minh City'),
	('u4',	'Elizabeth Patel',	'630724',	'Female',	'Tan Binh Ho Chi Minh City'),
	('u5',	'Jonathan Davis',	'330126',	'Male',	'Thu Duc City'),
	('u6',	'Emily Parke',	'635981',	'Female',	'Q8 Ho Chi Minh City'),
	('u7',	'Brandon Rodriguez',	'165983',	'Male',	'Q1 Ho Chi Minh City'),
	('u8',	'Alexandra Kim',	'657804',	'Female',	'Q1 Ho Chi Minh City'),
	('u9',	'David Chen',	'392580',	'Male',	'Q4 Ho Chi Minh City'),
	('u10',	'Samantha Patel',	'971360',	'Female',	'Q7 Ho Chi Minh City'),
	('u11',	'Harry Maguire',	'901232',	'Male',	'55 Bui Vien St'),
	('u12',	'Phat Nguyen',	'891732',	'Male',	'195 Nguyen Thi Minh Khai St'),
	('u13',	'Elon Musk',	'372836',	'Male',	'62 Cao Thang St'),
	('u14',	'Harry Benson',	'128930',	'Male',	'14 Tran Duy Hung St'),
	('u15',	'Jeff Bezos',	'213782',	'Male',	'72 Hang Xanh St');
    
insert into Teachers (teacherID,userID,name,gender,adress,phone_number) values
	('t1',	'u6',	'Emily Parke',	'Female',	'Q8 Ho Chi Minh City',	'635981'),
	('t2',	'u7',	'Brandon Rodriguez',	'Male',	'Q1 Ho Chi Minh City','165983'),
	('t3',	'u8',	'Alexandra Kim',	'Female','Q1 Ho Chi Minh City',	'657804'),
	('t4',	'u9',	'David Chen',	'Male',	'Q4 Ho Chi Minh City'	,'392580'),
	('t5',	'u10',	'Samantha Patel',	'Female',	'Q7 Ho Chi Minh City',	'971360')
;

insert into Students (studentID,userID,name,gender,adress,phone_number) values
	('s1',	'u1',	'Christopher Wright',	'Male',	'Q7 Ho Chi Minh City',	'123456'),
	('s2',	'u2',	'Kevin Lee',	'Male',	'Q3 Ho Chi Minh City',	'234764'),
	('s3',	'u3',	'Rachel Singh',	'Female',	'Q1 Ho CHi Minh City',	'886450'),
	('s4',	'u4',	'Elizabeth Patel',	'Female',	'Tan Binh Ho Chi Minh City',	'630724'),
	('s5',	'u5',	'Jonathan Davis',	'Male',	'Thu Duc City',	'330126');
    
insert into Library_staff (staffID,userID,name,phone_number,position,gender,adress) values
	('st1',	'u11',	'Harry Maguire',	'901232',	'manager',	'Male',	'55 Bui Vien St'),
	('st2',	'u12',	'Phat Nguyen',	'891732',	'librarian',	'Male',	'195 Nguyen Thi Minh Khai St'),
	('st3',	'u13',	'Elon Musk',	'372836',	'librarian',	'Male',	'62 Cao Thang St'),
	('st4',	'u14',	'Harry Benson',	'128930',	'library assistance',	'Male',	'14 Tran Duy Hung St'),
	('st5',	'u15',	'Jeff Bezos',	'213782',	'Digital Services Librarian',	'Male',	'72 Hang Xanh St');
    
insert into Assist (staffID, userID, time)
VALUES 
    ('st2', 'u8', '2022-01-15 12:34:00'),
    ('st3', 'u9', '2021-10-20 10:26:00'),
    ('st4', 'u10', '2022-02-05 14:45:00'),
    ('st5', 'u11', '2021-12-03 16:57:00'),
    ('st2', 'u12', '2022-03-07 09:18:00'),
    ('st3', 'u13', '2021-11-25 11:08:00');
    
INSERT INTO Publish (itemID, authorID, publisher_name, publication_date)
VALUES 
    ('i1', 'au1', 'Kim Dong Publishing House', '1983-05-17'),
    ('i2', 'au1', 'Ho Chi Minh City General Publishing House', '1974-09-02'),
    ('i3', 'au1', 'Tre Publishing House', '1987-06-26'),
    ('i4', 'au1', 'Ha Noi Publishing House', '1979-11-12'),
    ('i5', 'au2', 'Vietnam Women Publishing House', '1991-04-09'),
    ('i6', 'au2', 'Kim Dong Publishing House', '1985-07-21'),
    ('i7', 'au2', 'Ho Chi Minh City General Publishing House', '1977-03-18'),
    ('i8', 'au3', 'Tre Publishing House', '1998-08-06'),
    ('i9', 'au3', 'Ha Noi Publishing House', '1989-12-31'),
    ('i10', 'au3', 'Vietnam Women Publishing House', '1972-02-15'),
    ('i11', 'au4', 'Kim Dong Publishing House', '1996-10-28'),
    ('i12', 'au4', 'Ho Chi Minh City General Publishing House', '1981-01-24'),
    ('i13', 'au4', 'Tre Publishing House', '1975-05-08'),
    ('i14', 'au5', 'Ha Noi Publishing House', '1995-08-14'),
    ('i15', 'au5', 'Vietnam Women Publishing House', '1976-12-07'),
    ('i16', 'au5', 'Kim Dong Publishing House', '1988-06-02'),
    ('i17', 'au6', 'Ho Chi Minh City General Publishing House', '1993-11-19'),
    ('i18', 'au6', 'Tre Publishing House', '1973-03-22'),
    ('i19', 'au6', 'Ha Noi Publishing House', '1984-09-11'),
    ('i20', 'au7', 'Vietnam Women Publishing House', '1978-04-13'),
    ('i21', 'au7', 'Kim Dong Publishing House', '1992-07-26'),
    ('i22', 'au8', 'Ho Chi Minh City General Publishing House', '1980-02-07'),
    ('i23', 'au8', 'Tre Publishing House', '1971-10-04'),
    ('i24', 'au8', 'Ha Noi Publishing House', '1997-01-18'),
    ('i25', 'au9', 'Vietnam Women Publishing House', '1986-05-29'),
    ('i26', 'au9', 'Kim Dong Publishing House', '1972-08-23'),
    ('i27', 'au9', 'Ho Chi Minh City General Publishing House', '1990-12-16'),
    ('i28', 'au10', 'Tre Publishing House', '1979-03-07'),
    ('i29', 'au10', 'Ha Noi Publishing House', '1982-06-11');
    
INSERT INTO Transactions (transactionID, userID, itemID, copyID) 
VALUES 
('t01', 'u1', 'i3', 'c6'),
('t02', 'u3', 'i5', 'c9'),
('t03', 'u2', 'i12', 'c23'),
('t04', 'u4', 'i8', 'c16'),
('t05', 'u8', 'i9', 'c18'),
('t06', 'u9', 'i10', 'c20'),
('t07', 'u1', 'i2', 'c3'),
('t08', 'u8', 'i14', 'c27'),
('t09', 'u7', 'i16', 'c32'),
('t10', 'u3', 'i11', 'c21'),
('t11', 'u3', 'i22', 'c44'),
('t12', 'u4', 'i28', 'c56'),
('t13', 'u2', 'i10', 'c19'),
('t14', 'u9', 'i19', 'c38'),
('t15', 'u1', 'i3', 'c6'),
('t16', 'u3', 'i5', 'c9'),
('t17', 'u2', 'i12', 'c23'),
('t18', 'u4', 'i8', 'c16'),
('t19', 'u8', 'i9', 'c18'),
('t20', 'u9', 'i10', 'c20'),
('t21', 'u1', 'i2', 'c3'),
('t22', 'u8', 'i14', 'c27'),
('t23', 'u7', 'i16', 'c32'),
('t24', 'u3', 'i11', 'c21');

INSERT INTO Fines (transactionID, userID, fine_amount, payment_status, type_of_payment) 
VALUES 
('t15', 'u1', 100, 'paid', 'visa'),
('t16', 'u3', 100, 'paid', 'visa'),
('t17', 'u2', 100, 'paid', 'visa'),
('t18', 'u4', 100, 'paid', 'cash'),
('t19', 'u8', 100, 'paid', 'visa'),
('t11', 'u3', 100, 'not paid', null),
('t12', 'u4', 100, 'not paid', null),
('t13', 'u2', 100, 'not paid', null),
('t14', 'u9', 100, 'not paid', null);
    
INSERT INTO returning_transactions (transactionID, return_date)
VALUES
('t15', '2022-02-03 14:23:00'),
('t16', '2022-02-05 22:10:00'),
('t17', '2022-03-10 08:15:00'),
('t18', '2022-03-12 12:45:00'),
('t19', '2022-04-20 20:45:00'),
('t20', '2022-04-30 01:05:00'),
('t21', '2022-05-19 12:35:00'),
('t22', '2022-05-20 16:30:00'),
('t23', '2022-06-25 06:47:00'),
('t24', '2022-08-01 18:12:00');

INSERT INTO borrowing_transactions (transactionID, borrow_date, due_date)
VALUES
('t01', '2022-01-02 14:23:00', '2022-02-02 14:23:00'),
('t02', '2022-01-04 22:10:00', '2022-02-04 22:10:00'),
('t03', '2022-02-08 22:10:00', '2022-03-08 08:15:00'),
('t04', '2022-02-12 12:45:00', '2022-03-12 12:45:00'),
('t05', '2022-03-17 20:45:00', '2022-04-17 20:45:00'),
('t06', '2022-04-17 20:45:00', '2022-04-22 01:05:00'),
('t07', '2022-04-25 12:35:00', '2022-05-25 12:35:00'),
('t08', '2022-04-29 16:30:00', '2022-05-29 16:30:00'),
('t09', '2022-05-31 06:47:00', '2022-06-30 06:47:00'),
('t10', '2022-07-04 18:12:00', '2022-08-04 18:12:00'),
('t11', '2022-08-04 18:12:00', '2022-10-20 21:25:00'),
('t12', '2022-08-11 18:12:00', '2022-09-11 09:20:00'),
('t13', '2022-10-20 21:15:00', '2022-11-27 15:22:00'),
('t14', '2022-12-01 03:55:00', '2022-12-31 03:55:00');

-- ------------------------------------------------------
-- Percentage of gender
SELECT GENDER, COUNT(GENDER) * 100.0 / (SUM(COUNT(*)) OVER()) AS PERCENTAGE_OF_GENDER
FROM LIBRARY_USERS
WHERE GENDER IS NOT NULL
GROUP BY GENDER
ORDER BY 2 DESC;
-- ------------------------------------------------------



-- ------------------------------------------------------
-- Percentage of favorite kinds of books
SELECT count(tran.itemID) * 100.0 / (sum(count(*)) over()) as percentage_of_genre, item.genre
FROM Items AS item RIGHT JOIN transactions AS tran
ON tran.itemID = item.itemID
GROUP BY item.genre;
-- ------------------------------------------------------



-- ------------------------------------------------------
-- Amount of copies based on genre
select count(copy.copyID) as amount_of_copy, item.genre
from Copies as copy join items as item
on item.itemID = copy.itemID
group by item.genre;
-- ------------------------------------------------------



-- ------------------------------------------------------
-- Amount of authors
select * from Authors order by authorID DESC;
-- ------------------------------------------------------



-- ------------------------------------------------------
-- Report of  assistant works. 
select assist.time as assist_time, library_users.name as user_name, Library_staff.name as tutor_name 
from assist join library_users join Library_staff 
on library_users.userID = assist.userID and assist.staffID = Library_staff.staffID and library_users.userID <> library_staff.userID;
-- ------------------------------------------------------



-- ------------------------------------------------------
-- Percentage of Fine-payment status.
select count(distinct paid.transactionID) as number_paid, count(distinct not_paid.transactionID) as number_not_paid
from fines paid, fines not_paid
where paid.payment_status = "paid" and  not_paid.payment_status = "not paid"
and paid.transactionID <> not_paid.transactionID;
-- ------------------------------------------------------



-- ------------------------------------------------------
-- Percentage of favorite kinds of books based on gender. 
SELECT Items.genre, count(items.genre) * 100.0 / (sum(count(*)) over()) as number_of_genre
FROM transactions
JOIN library_users on library_users.userID = transactions.userID and library_users.gender = 'male'
join items
ON transactions.itemID = items.itemID
group by items.genre; -- for male

SELECT Items.genre, count(items.genre) * 100.0 / (sum(count(*)) over()) as number_of_genre
FROM transactions
JOIN library_users on library_users.userID = transactions.userID and library_users.gender = 'Female'
join items
ON transactions.itemID = items.itemID
group by items.genre; -- for female



-- ------------------------------------------------------
-- Blacklist 
select fines.fine_amount as amount, library_users.userID as userID, library_users.name as user_name, library_users.phone_number as phone_number, library_users.gender as gender,library_users.adress as adress 
from fines cross join library_users
on fines.userID = library_users.userID
where fines.payment_status = "not paid";
-- ------------------------------------------------------



-- ------------------------------------------------------
-- Report types of payment( cash, banking, card,...) -> Add 1 more attribute on Fines entity and 1 data column on Fines Table. 
select count(type_of_payment) as number, type_of_payment
from fines 
where type_of_payment is not null
group by type_of_payment;
-- ------------------------------------------------------



-- ------------------------------------------------------
-- Amount of transaction.
SELECT 
    TO_CHAR(br.borrow_date, 'Month') AS "month", 
    COUNT(DISTINCT br.transactionID) AS total_transactions
FROM borrowing_transactions br
GROUP BY TO_CHAR(br.borrow_date, 'Month');


SELECT 
    TO_CHAR(rt.return_date, 'Month') AS "month", 
    COUNT(DISTINCT rt.transactionID) AS total_transactions
FROM returning_transactions rt
GROUP BY TO_CHAR(rt.return_date, 'Month')
ORDER BY TO_CHAR(rt.return_date, 'Month');
-- ------------------------------------------------------





