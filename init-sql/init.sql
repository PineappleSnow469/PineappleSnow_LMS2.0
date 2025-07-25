/*
 Database Initialization Script for SQL Server Container
 Updated Date: 2024-01-01
*/

-- Create database
CREATE DATABASE book_manager;
GO

USE book_manager;
GO

-- ----------------------------
-- Table structure for book_type
-- ----------------------------
IF OBJECT_ID('book_type', 'U') IS NOT NULL
    DROP TABLE book_type;
GO

CREATE TABLE book_type (
    bookTypeId INT IDENTITY(1,1) NOT NULL,
    bookTypeName NVARCHAR(20) NOT NULL,
    bookTypeDesc NVARCHAR(255) NOT NULL, -- Book type description
    PRIMARY KEY (bookTypeId)
);
GO

-- ----------------------------
-- Records of book_type
-- ----------------------------
INSERT INTO book_type (bookTypeName, bookTypeDesc) VALUES 
('Computer Science', 'Computer related'),
('History', 'History related'),
('Literature', 'Literature related'),
('Science Fiction', 'Sci-fi related'),
('Novel', 'Novel related'),
('Foreign Language', 'Foreign language related');
GO

-- ----------------------------
-- Table structure for book_info
-- ----------------------------
IF OBJECT_ID('book_info', 'U') IS NOT NULL
    DROP TABLE book_info;
GO

CREATE TABLE book_info (
    bookId INT IDENTITY(1,1) NOT NULL,
    bookName NVARCHAR(50) NOT NULL,
    bookAuthor NVARCHAR(50) NOT NULL,
    bookPrice DECIMAL(10, 2) NOT NULL,
    bookTypeId INT NOT NULL,
    bookDesc NVARCHAR(255) NOT NULL, -- Book description
    isBorrowed TINYINT NOT NULL, -- 1 means borrowed, 0 means returned
    bookImg NVARCHAR(255) NULL, -- Book cover image
    PRIMARY KEY (bookId),
    CONSTRAINT fk_book_info_book_type FOREIGN KEY (bookTypeId) REFERENCES book_type(bookTypeId)
);
GO

-- Create index
CREATE INDEX idx_book_info_book_type ON book_info(bookTypeId);
GO

-- ----------------------------
-- Records of book_info
-- ----------------------------
INSERT INTO book_info (bookName, bookAuthor, bookPrice, bookTypeId, bookDesc, isBorrowed, bookImg) VALUES 
('Java Programming', 'Geng Xiangyi', 55.50, 1, 'A practical Java tutorial suitable for both university teaching and self-learning. Java is an excellent programming language with features like object-oriented, platform-independent, secure, stable, and multi-threaded.', 0, 'http://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/img/202411112241065.jpg'),
('Dream of the Red Chamber', 'Cao Xueqin', 36.00, 3, 'An encyclopedic novel depicting 18th century Chinese feudal society through the tragic love story of Jia Baoyu and Lin Daiyu.', 0, 'http://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/img/202411112140064.jpg'),
('Journey to the West', 'Wu Cheng''en', 60.00, 3, 'A classic Chinese novel about the adventures of Sun Wukong and his companions on their journey to obtain Buddhist scriptures.', 0, 'http://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/img/202411112242308.jpg'),
('Water Margin', 'Shi Nai''an', 50.60, 3, 'China''s first novel about peasant uprisings, describing the stories of 108 outlaws during the Song Dynasty.', 0, 'https://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/BookManager/pictures/2024228386001水浒传.jpg'),
('Romance of the Three Kingdoms', 'Luo Guanzhong', 42.00, 3, 'A historical novel set in the turbulent years towards the end of the Han Dynasty and the Three Kingdoms period.', 0, 'http://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/img/202411112143793.jpg'),
('The Three-Body Problem', 'Liu Cixin', 92.00, 4, 'A science fiction trilogy about humanity''s first contact with an alien civilization.', 0, 'http://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/img/202411112143943.jpg'),
('Demi-Gods and Semi-Devils', 'Jin Yong', 58.00, 6, 'A wuxia novel about the complex relationships between warriors from different kingdoms during the Song Dynasty.', 0, 'http://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/img/202411112143125.jpg'),
('Ming Dynasty Stories', 'Dangnian Mingyue', 399.00, 2, 'A popular history book about the Ming Dynasty written in modern language.', 0, 'https://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/BookManager/pictures/2024228686000明朝那些事儿.jpg'),
('Dune', 'Frank Herbert', 394.90, 4, 'A science fiction masterpiece about politics, religion, and ecology on the desert planet Arrakis.', 0, 'https://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/BookManager/pictures/2024228758971沙丘.jpg'),
('C Primer Plus', 'Stephen Prata', 90.50, 1, 'A comprehensive tutorial for learning C programming language, updated for C11 standard.', 0, 'https://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/BookManager/pictures/2024224588022C.jpg');
GO

-- ----------------------------
-- Table structure for user
-- ----------------------------
IF OBJECT_ID('user', 'U') IS NOT NULL
    DROP TABLE [user];
GO

CREATE TABLE [user] (
    userId INT IDENTITY(1,1) NOT NULL,
    userName NVARCHAR(20) NOT NULL,
    userPassword NVARCHAR(20) NOT NULL,
    isAdmin TINYINT NOT NULL, -- 1 for admin, 0 for regular user
    PRIMARY KEY (userId)
);
GO

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO [user] (userName, userPassword, isAdmin) VALUES 
('admin', 'admin', 1),      -- userId = 1
('Li Ming', '123456', 0),   -- userId = 2
('zhang', '123', 0),        -- userId = 3
('zhao', 'abc', 1),         -- userId = 4
('wangpeng', '123456', 0);  -- userId = 5
GO

-- ----------------------------
-- Table structure for borrow
-- ----------------------------
IF OBJECT_ID('borrow', 'U') IS NOT NULL
    DROP TABLE borrow;
GO

CREATE TABLE borrow (
    borrowId INT IDENTITY(1,1) NOT NULL,
    userId INT NOT NULL,
    bookId INT NOT NULL,
    borrowTime DATETIME NOT NULL,
    returnTime DATETIME NULL,
    PRIMARY KEY (borrowId),
    CONSTRAINT fk_borrow_user FOREIGN KEY (userId) REFERENCES [user](userId),
    CONSTRAINT fk_borrow_book_info FOREIGN KEY (bookId) REFERENCES book_info(bookId)
);
GO

-- Create indexes
CREATE INDEX idx_borrow_user ON borrow(userId);
CREATE INDEX idx_borrow_book ON borrow(bookId);
GO

-- ----------------------------
-- Records of borrow (updated to use valid userIds)
-- ----------------------------
INSERT INTO borrow (userId, bookId, borrowTime, returnTime) VALUES 
(2, 2, '2024-01-18 14:24:06', '2024-01-18 16:07:03'),  -- Li Ming
(2, 1, '2024-01-18 15:01:31', '2024-01-18 16:07:06'),  -- Li Ming
(2, 4, '2024-01-18 15:22:05', '2024-01-18 16:07:08'),  -- Li Ming
(5, 2, '2024-01-18 16:52:05', '2024-01-19 20:55:10'),  -- wangpeng
(5, 4, '2024-01-18 16:52:17', '2024-01-18 16:52:41'),  -- wangpeng
(5, 1, '2024-01-19 22:19:43', '2024-01-19 22:19:48'),  -- wangpeng
(5, 1, '2024-01-19 22:46:14', '2024-01-19 22:46:18'),  -- wangpeng
(5, 1, '2024-01-19 22:57:21', '2024-01-19 22:57:26');  -- wangpeng
GO