-- Insert into Users
INSERT INTO Users (username, password_hash, role, email, phone)
VALUES 
('jdoe', 'hashed_pw_1', 'member', 'jdoe@email.com', '123-456-7890'),
('asmith', 'hashed_pw_2', 'employee', 'asmith@email.com', '987-654-3210'),
('admin1', 'hashed_pw_3', 'manager', 'admin1@email.com', '555-555-5555');

-- Insert into Members
INSERT INTO Members (member_id, membership_type, start_date, end_date, billing_info, renewal_date)
VALUES 
(1, 'VIP', '2024-01-01', '2025-01-01', 'Visa ending in 1234', '2025-01-01');

-- Insert into Employees
INSERT INTO Employees (employee_id, position, hire_date)
VALUES 
(2, 'Trainer', '2023-06-15');

-- Insert into Classes
INSERT INTO Classes (name, description, schedule_time, instructor_id, max_capacity, is_vip_only)
VALUES 
('Yoga Flow', 'Morning yoga for flexibility and relaxation', '2025-03-30 08:00:00', 2, 20, 0);

-- Insert into Class_Attendance
INSERT INTO Class_Attendance (class_id, member_id)
VALUES 
(1, 1);

-- Insert into Memberships
INSERT INTO Memberships (member_id, membership_type, start_date, end_date, status)
VALUES 
(1, 'VIP', '2024-01-01', '2025-01-01', 'Active');

-- Insert into Billing
INSERT INTO Billing (member_id, amount, billing_date, payment_method, payment_status)
VALUES 
(1, 99.99, '2025-03-01', 'Credit Card', 'Paid');

-- Insert into Notifications
INSERT INTO Notifications (member_id, type, message)
VALUES 
(1, 'class_reminder', 'Don’t forget your Yoga Flow class at 8:00 AM!');

-- Insert into Reports
INSERT INTO Reports (generated_by, report_type, file_path)
VALUES 
(3, 'Monthly Billing Summary', '/reports/march_billing.pdf');
