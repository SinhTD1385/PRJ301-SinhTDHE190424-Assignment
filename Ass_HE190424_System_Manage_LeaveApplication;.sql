CREATE DATABASE Ass_HE190424_System_Manage_LeaveApplication;

USE Ass_HE190424_System_Manage_LeaveApplication;
GO

-- 2. Bảng Divisions (Phòng ban)
CREATE TABLE Divisions (
    DivisionID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(50) NOT NULL UNIQUE
);
GO

-- 3. Bảng Roles (Vai trò/Quyền hạn)
CREATE TABLE Roles (
    RoleID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(50) NOT NULL UNIQUE 
);
GO

-- 4. Bảng Users (Nhân viên/Tài khoản)
CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    FullName NVARCHAR(100) NOT NULL,
    Username VARCHAR(50) NOT NULL UNIQUE,
    PasswordHash VARCHAR(255) NOT NULL, -- Lưu mật khẩu đã hash
    DivisionID INT NOT NULL,
    ManagerID INT NULL, -- ManagerID có thể là NULL (ví dụ: Mr A - Division Leader)
    
    -- Khóa ngoại đến Divisions
    FOREIGN KEY (DivisionID) REFERENCES Divisions(DivisionID),
    
    -- Khóa ngoại đến chính Users (Self-Referencing FK) cho cấu trúc phân cấp
    FOREIGN KEY (ManagerID) REFERENCES Users(UserID)
);
GO

-- 5. Bảng UserRoles (Liên kết User và Role)
CREATE TABLE UserRoles (
    UserID INT NOT NULL,
    RoleID INT NOT NULL,
    
    PRIMARY KEY (UserID, RoleID),
    
    -- Khóa ngoại
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (RoleID) REFERENCES Roles(RoleID)
);
GO

-- 6. Bảng Requests (Đơn xin nghỉ phép)
CREATE TABLE Requests (
    RequestID INT PRIMARY KEY IDENTITY(1,1),
    CreatedByUserID INT NOT NULL,
    FromDate DATE NOT NULL,
    ToDate DATE NOT NULL,
    Reason NVARCHAR(MAX) NOT NULL,
    Status VARCHAR(20) NOT NULL CHECK (Status IN ('Inprogress', 'Approved', 'Rejected')), -- Trạng thái
    ProcessedByUserID INT NULL, -- Người đã xử lý (chỉ set khi Approved/Rejected)
    ProcessingDate DATETIME NULL,
    ProcessingReason NVARCHAR(255) NULL, -- Lý do duyệt/từ chối
    
    -- Khóa ngoại
    FOREIGN KEY (CreatedByUserID) REFERENCES Users(UserID),
    FOREIGN KEY (ProcessedByUserID) REFERENCES Users(UserID)
);
GO