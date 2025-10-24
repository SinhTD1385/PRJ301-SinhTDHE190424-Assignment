CREATE DATABASE Ass_System_Manage_LeaveApplication;
USE Ass_System_Manage_LeaveApplication;
GO

-- 1. Divisions
CREATE TABLE Divisions (
    DivisionID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(50) NOT NULL UNIQUE
);
GO

-- 2. Roles
CREATE TABLE Roles (
    RoleID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(50) NOT NULL UNIQUE
);
GO

-- 3. Employees (Nhân viên)
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    FullName NVARCHAR(100) NOT NULL,
    Gender NVARCHAR(10) CHECK (Gender IN ('Male','Female','Other')),
    BirthDate DATE NULL,
    Email VARCHAR(100) NULL UNIQUE,
    Phone VARCHAR(20) NULL,
    DivisionID INT NOT NULL,
    ManagerID INT NULL,

    FOREIGN KEY (DivisionID) REFERENCES Divisions(DivisionID),
    FOREIGN KEY (ManagerID) REFERENCES Employees(EmployeeID)
);
GO

-- 4. Users (Tài khoản đăng nhập)
CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    Username VARCHAR(50) NOT NULL UNIQUE,
    PasswordHash VARCHAR(255) NOT NULL,
    EmployeeID INT NOT NULL UNIQUE,

    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);
GO

-- 5. UserRoles (Liên kết User - Role)
CREATE TABLE UserRoles (
    UserID INT NOT NULL,
    RoleID INT NOT NULL,
    PRIMARY KEY (UserID, RoleID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (RoleID) REFERENCES Roles(RoleID)
);
GO

-- 6. Requests (Đơn nghỉ phép)
CREATE TABLE Requests (
    RequestID INT PRIMARY KEY IDENTITY(1,1),
    CreatedByUserID INT NOT NULL,
    FromDate DATE NOT NULL,
    ToDate DATE NOT NULL,
    Reason NVARCHAR(MAX) NOT NULL,
    Status VARCHAR(20) NOT NULL CHECK (Status IN ('Inprogress', 'Approved', 'Rejected')),
    ProcessedByUserID INT NULL,
    ProcessingDate DATETIME NULL,
    ProcessingReason NVARCHAR(255) NULL,
    
    FOREIGN KEY (CreatedByUserID) REFERENCES Users(UserID),
    FOREIGN KEY (ProcessedByUserID) REFERENCES Users(UserID),
    CHECK (ToDate >= FromDate)
);
GO

INSERT INTO Divisions (Name) VALUES (N'IT'), (N'HR');
INSERT INTO Roles (Name) VALUES (N'Employee'), (N'Manager'), (N'Admin');

-- Employees
INSERT INTO Employees (FullName, Gender, BirthDate, Email, Phone, DivisionID, ManagerID)
VALUES 
(N'Nguyễn Văn A', 'Male', '1990-05-20', 'a@company.com', '0901000001', 1, NULL),
(N'Trần Thị B', 'Female', '1995-07-10', 'b@company.com', '0902000002', 1, 1);

-- Users (1-1 mapping)
INSERT INTO Users (Username, PasswordHash, EmployeeID)
VALUES ('admin', '123', 1),
       ('user1', '123', 2);

-- Roles
INSERT INTO UserRoles (UserID, RoleID)
VALUES (1, 3), -- Admin
       (2, 1); -- Employee

-- Requests
INSERT INTO Requests (CreatedByUserID, FromDate, ToDate, Reason, Status)
VALUES (2, '2025-10-25', '2025-10-27', N'Nghỉ phép du lịch', 'Inprogress');
