DROP TABLE IF EXISTS FeePayments;

CREATE TABLE FeePayments (
    payment_id INT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    amount DECIMAL(10,2) CHECK (amount > 0),
    payment_date DATE
);

START TRANSACTION;
INSERT INTO FeePayments (payment_id, student_name, amount, payment_date) VALUES
(1, 'Ashish', 5000.00, '2024-06-01'),
(2, 'Smaran', 4500.00, '2024-06-02'),
(3, 'Vaibhav', 5500.00, '2024-06-03');
COMMIT;

SELECT * FROM FeePayments;

START TRANSACTION;
INSERT INTO FeePayments (payment_id, student_name, amount, payment_date) VALUES
(4, 'Kiran', 4800.00, '2024-06-04');
INSERT INTO FeePayments (payment_id, student_name, amount, payment_date) VALUES
(1, 'Ashish', -5000.00, '2024-06-05');
ROLLBACK;

SELECT * FROM FeePayments;

START TRANSACTION;
INSERT INTO FeePayments (payment_id, student_name, amount, payment_date) VALUES
(5, 'Neha', 5000.00, '2024-06-06');
INSERT INTO FeePayments (payment_id, student_name, amount, payment_date) VALUES
(6, NULL, 4500.00, '2024-06-07');
ROLLBACK;

SELECT * FROM FeePayments;

START TRANSACTION;
INSERT INTO FeePayments (payment_id, student_name, amount, payment_date) VALUES
(7, 'Rohit', 5200.00, '2024-06-08');
INSERT INTO FeePayments (payment_id, student_name, amount, payment_date) VALUES
(2, 'Smaran', 4500.00, '2024-06-09');
ROLLBACK;

SELECT * FROM FeePayments;
