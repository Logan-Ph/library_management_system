-- Percentage of gender
SELECT COUNT(userID) as number_of_gender, gender
FROM Library_users
GROUP BY gender;
-- ------------------------------------------------------



-- ------------------------------------------------------
-- Percentage of favorite kinds of books
SELECT count(tran.itemID) * 100.0 / (sum(count(*)) over()) as percentage_of_genre, item.genre
FROM Items AS item RIGHT JOIN transactions AS tran
ON tran.itemID = item.itemID
GROUP BY item.genre;

SELECT count(tran.itemID) as number_of_genre, item.genre
FROM Items AS item RIGHT JOIN transactions AS tran
ON tran.itemID = item.itemID
GROUP BY item.genre;
-- ------------------------------------------------------



-- ------------------------------------------------------
-- Amount of copies based on genre
select count(copy.copyID) as amount_of_copy, item.genre
from Copies as copy cross join items as item
on item.itemID = copy.itemID
group by item.itemID;
-- ------------------------------------------------------



-- ------------------------------------------------------
-- Amount of authors
select * from Authors order by authorID DESC;
-- ------------------------------------------------------



-- ------------------------------------------------------
-- Report of  assistant works. 
select assist.time as assist_time, library_users.name as user_name, Library_staff.name as tutor_name 
from assist cross join library_users cross join Library_staff
on library_users.userID = assist.userID and assist.staffID = Library_staff.staffID;
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
SELECT distinct transactions.transactionID, Items.genre, library_users.gender
FROM Items cross JOIN transactions right join library_users
ON transactions.itemID = Items.itemID and library_users.userID is not null and library_users.gender = "male"; -- for male

SELECT distinct transactions.transactionID, Items.genre, library_users.gender
FROM Items cross JOIN transactions right join library_users
ON transactions.itemID = Items.itemID and library_users.userID is not null and library_users.gender = "female"; -- for female
-- ------------------------------------------------------



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
group by type_of_payment;
-- ------------------------------------------------------


-- ------------------------------------------------------
-- Amount of transaction.
SELECT 
    DATE_FORMAT(b.borrow_date, '%m') AS month, 
    COUNT(DISTINCT b.transactionID) AS total_transactions
FROM borrowing_transactions b
GROUP BY month
HAVING total_transactions > 0
ORDER BY month;


SELECT 
    DATE_FORMAT(rt.return_date, '%m') AS month, 
    COUNT(DISTINCT rt.transactionID) AS total_transactions
FROM returnning_transactions rt
GROUP BY month
HAVING total_transactions > 0
ORDER BY month;
