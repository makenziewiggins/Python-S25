-- 1. Users Table
CREATE TABLE Users (
    user_id INT PRIMARY KEY IDENTITY(1,1),
    username VARCHAR(50) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    role VARCHAR(20) CHECK (role IN ('manager', 'employee', 'member')),
    email VARCHAR(100),
    phone VARCHAR(20),
    is_active BIT DEFAULT 1,
    created_at DATETIME DEFAULT GETDATE()
);

-- 2. Members Table
CREATE TABLE Members (
    member_id INT PRIMARY KEY,
    membership_type VARCHAR(10) CHECK (membership_type IN ('standard', 'VIP')),
    start_date DATE,
    end_date DATE,
    billing_info VARCHAR(255),
    renewal_date DATE,
    FOREIGN KEY (member_id) REFERENCES Users(user_id)
);

-- 3. Employees Table
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    position VARCHAR(50),
    hire_date DATE,
    FOREIGN KEY (employee_id) REFERENCES Users(user_id)
);

-- 4. Classes Table
CREATE TABLE Classes (
    class_id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(100),
    description TEXT,
    schedule_time DATETIME,
    instructor_id INT,
    max_capacity INT,
    is_vip_only BIT DEFAULT 0,
    FOREIGN KEY (instructor_id) REFERENCES Employees(employee_id)
);

-- 5. Class_Attendance Table
CREATE TABLE Class_Attendance (
    attendance_id INT PRIMARY KEY IDENTITY(1,1),
    class_id INT,
    member_id INT,
    attended_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (class_id) REFERENCES Classes(class_id),
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);

-- 6. Memberships Table
CREATE TABLE Memberships (
    membership_id INT PRIMARY KEY IDENTITY(1,1),
    member_id INT,
    membership_type VARCHAR(10) CHECK (membership_type IN ('standard', 'VIP')),
    start_date DATE,
    end_date DATE,
    status VARCHAR(10) CHECK (status IN ('Active', 'Expired')),
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);

-- 7. Billing Table
CREATE TABLE Billing (
    billing_id INT PRIMARY KEY IDENTITY(1,1),
    member_id INT,
    amount DECIMAL(10,2),
    billing_date DATE,
    payment_method VARCHAR(50),
    payment_status VARCHAR(20),
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);

-- 8. Notifications Table
CREATE TABLE Notifications (
    notification_id INT PRIMARY KEY IDENTITY(1,1),
    member_id INT,
    type VARCHAR(50), -- e.g. 'class_reminder', 'renewal_alert', 'vip_promo'
    message TEXT,
    sent_at DATETIME DEFAULT GETDATE(),
    read_status BIT DEFAULT 0,
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);

-- 9. Reports Table (Optional)
CREATE TABLE Reports (
    report_id INT PRIMARY KEY IDENTITY(1,1),
    generated_by INT,
    report_type VARCHAR(50),
    file_path VARCHAR(255),
    generated_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (generated_by) REFERENCES Users(user_id)
);
