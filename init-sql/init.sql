/*
 Navicat Premium Data Transfer

 Source Server         : Local MySQL
 Source Server Type    : MySQL
 Source Server Version : 50735
 Source Host           : localhost:3306
 Source Schema         : book_manager

 Target Server Type    : MySQL
 Target Server Version : 50735
 File Encoding         : 65001

 Date: 21/11/2021 19:28:39
*/
CREATE DATABASE IF NOT EXISTS book_manager CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE book_manager;
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for book_info
-- ----------------------------
DROP TABLE IF EXISTS `book_info`;
CREATE TABLE `book_info`  (
  `bookId` int(11) NOT NULL AUTO_INCREMENT,
  `bookName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bookAuthor` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bookPrice` decimal(10, 2) NOT NULL,
  `bookTypeId` int(11) NOT NULL,
  `bookDesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Book description',
  `isBorrowed` tinyint(4) NOT NULL COMMENT '1 means borrowed, 0 means returned',
  `bookImg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Book cover image',
  PRIMARY KEY (`bookId`) USING BTREE,
  INDEX `fk_book_info_book_type_1`(`bookTypeId`) USING BTREE,
  CONSTRAINT `book_info_ibfk_1` FOREIGN KEY (`bookTypeId`) REFERENCES `book_type` (`bookTypeId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 71 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book_info
-- ----------------------------
INSERT INTO `book_info` VALUES (1, 'Java Programming', 'Geng Xiangyi', 55.50, 1, 'A practical Java tutorial suitable for both university teaching and self-learning. Java is an excellent programming language with features like object-oriented, platform-independent, secure, stable, and multi-threaded.', 0, 'http://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/img/202111112241065.jpg');
INSERT INTO `book_info` VALUES (2, 'Dream of the Red Chamber', 'Cao Xueqin', 36.00, 3, 'An encyclopedic novel depicting 18th century Chinese feudal society through the tragic love story of Jia Baoyu and Lin Daiyu.', 0, 'http://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/img/202111112140064.jpg');
INSERT INTO `book_info` VALUES (4, 'Journey to the West', 'Wu Cheng\'en', 60.00, 3, 'A classic Chinese novel about the adventures of Sun Wukong and his companions on their journey to obtain Buddhist scriptures.', 0, 'http://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/img/202111112242308.jpg');
INSERT INTO `book_info` VALUES (5, 'Water Margin', 'Shi Nai\'an', 50.60, 3, 'China\'s first novel about peasant uprisings, describing the stories of 108 outlaws during the Song Dynasty.', 0, 'https://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/BookManager/pictures/1637228386001水浒传.jpg');
INSERT INTO `book_info` VALUES (12, 'Romance of the Three Kingdoms', 'Luo Guanzhong', 42.00, 3, 'A historical novel set in the turbulent years towards the end of the Han Dynasty and the Three Kingdoms period.', 0, 'http://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/img/202111112143793.jpg');
INSERT INTO `book_info` VALUES (13, 'The Three-Body Problem', 'Liu Cixin', 92.00, 4, 'A science fiction trilogy about humanity\'s first contact with an alien civilization.', 0, 'http://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/img/202111112143943.jpg');
INSERT INTO `book_info` VALUES (14, 'Demi-Gods and Semi-Devils', 'Jin Yong', 58.00, 6, 'A wuxia novel about the complex relationships between warriors from different kingdoms during the Song Dynasty.', 0, 'http://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/img/202111112143125.jpg');
INSERT INTO `book_info` VALUES (27, 'Ming Dynasty Stories', 'Dangnian Mingyue', 399.00, 2, 'A popular history book about the Ming Dynasty written in modern language.', 0, 'https://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/BookManager/pictures/1637228686000明朝那些事儿.jpg');
INSERT INTO `book_info` VALUES (28, 'Dune', 'Frank Herbert', 394.90, 4, 'A science fiction masterpiece about politics, religion, and ecology on the desert planet Arrakis.', 0, 'https://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/BookManager/pictures/1637228758971沙丘.jpg');
INSERT INTO `book_info` VALUES (30, 'C Primer Plus', 'Stephen Prata', 90.50, 1, 'A comprehensive tutorial for learning C programming language, updated for C11 standard.', 0, 'https://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/BookManager/pictures/1637224588022C.jpg');
INSERT INTO `book_info` VALUES (31, 'Computer Networking: A Top-Down Approach', 'James F. Kurose', 73.40, 1, 'A popular textbook explaining computer networking principles using a top-down approach.', 0, 'https://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/BookManager/pictures/1637230839418计算机网络.jpg');
INSERT INTO `book_info` VALUES (32, 'Fortress Besieged', 'Qian Zhongshu', 30.20, 3, 'A satirical novel about Chinese intellectual life in the 1930s and 1940s.', 0, 'https://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/BookManager/pictures/1637228900554围城.jpg');
INSERT INTO `book_info` VALUES (33, 'Ordinary World', 'Lu Yao', 101.80, 3, 'An epic novel about the lives of ordinary people in rural China during the reform era.', 0, 'https://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/BookManager/pictures/1637228780984平凡的世界.jpg');
INSERT INTO `book_info` VALUES (34, 'Harry Potter', 'J.K. Rowling', 648.00, 6, 'The magical adventures of a young wizard and his friends at Hogwarts School of Witchcraft and Wizardry.', 0, 'https://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/BookManager/pictures/1637228304016哈利波特.jpg');
INSERT INTO `book_info` VALUES (36, 'New Concept English 1', 'Alexander', 41.85, 7, 'A complete English learning system with new teaching concepts and interesting content.', 0, 'https://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/BookManager/pictures/1637228199551新概念英语1.jpg');
INSERT INTO `book_info` VALUES (37, 'New Concept English 2', 'Alexander', 47.25, 7, 'A complete English learning system with new teaching concepts and interesting content.', 0, 'https://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/BookManager/pictures/1637228195386新概念英语2.jpg');
INSERT INTO `book_info` VALUES (38, 'New Concept English 3', 'Alexander', 46.50, 7, 'A complete English learning system with new teaching concepts and interesting content.', 0, 'https://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/BookManager/pictures/1637228191325新概念英语3.jpg');
INSERT INTO `book_info` VALUES (39, 'New Concept English 4', 'Alexander', 45.50, 7, 'A complete English learning system with new teaching concepts and interesting content.', 0, 'https://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/BookManager/pictures/1637228187117新概念英语4.jpg');
INSERT INTO `book_info` VALUES (40, 'Data Structures', 'Yan Weimin', 39.80, 1, 'A classic computer science textbook on data structures.', 0, 'https://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/BookManager/pictures/1637227911889数据结构.jpg');
INSERT INTO `book_info` VALUES (41, 'Database System Concepts', 'Wang Shan, Sa Shixuan', 42.00, 1, 'A fundamental textbook on database systems.', 0, 'https://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/BookManager/pictures/1637227861672数据库.jpg');
INSERT INTO `book_info` VALUES (43, 'Flowers for Algernon', 'Daniel Keyes', 36.00, 4, 'A science fiction story about a mentally disabled man who undergoes an experimental procedure to increase his intelligence.', 0, 'https://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/BookManager/pictures/1637335107095献给阿尔吉侬的花束.jpg');
INSERT INTO `book_info` VALUES (44, 'Foundation', 'Isaac Asimov', 36.50, 4, 'The first book in the Foundation series, depicting the fall of the Galactic Empire and efforts to preserve knowledge.', 0, 'https://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/BookManager/pictures/1637335181577银河帝国.jpg');
INSERT INTO `book_info` VALUES (45, 'The Historical Trends of Chinese Politics', 'Qian Mu', 12.00, 2, 'An analysis of Chinese political systems through five major dynasties: Han, Tang, Song, Ming, and Qing.', 0, 'https://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/BookManager/pictures/1637229238833中国历代政治得失.jpg');
INSERT INTO `book_info` VALUES (46, '1587, A Year of No Significance', 'Ray Huang', 18.00, 2, 'A microhistory examining the Ming Dynasty during a seemingly insignificant year that revealed systemic problems.', 0, 'https://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/BookManager/pictures/1637229292783万历十五年.jpg');
INSERT INTO `book_info` VALUES (47, 'Red Star Over China', 'Edgar Snow', 43.00, 2, 'A journalist\'s account of the Chinese Communist Party during its early years.', 0, 'https://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/BookManager/pictures/1637229348394红星.jpg');
INSERT INTO `book_info` VALUES (48, 'The Deer and the Cauldron', 'Jin Yong', 96.00, 6, 'A martial arts novel about a street-smart protagonist who becomes involved in palace intrigues.', 0, 'https://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/BookManager/pictures/1637229559975鹿鼎记.jpg');
INSERT INTO `book_info` VALUES (49, 'The Kite Runner', 'Khaled Hosseini', 29.00, 6, 'A story of friendship and redemption set against the backdrop of Afghanistan\'s turbulent history.', 0, 'https://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/BookManager/pictures/1637229535609追风筝的人.jpg');
INSERT INTO `book_info` VALUES (50, 'White Deer Plain', 'Chen Zhongshi', 39.00, 3, 'A novel depicting the conflicts between two families in rural Shaanxi during China\'s 20th century transformations.', 0, 'https://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/BookManager/pictures/1637229617573白鹿原.jpg');
INSERT INTO `book_info` VALUES (51, 'Fall of Giants', 'Ken Follett', 35.50, 6, 'The first book in the Century Trilogy, following five families through World War I and the Russian Revolution.', 0, 'https://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/BookManager/pictures/1637229745368巨人的陨落.jpg');
INSERT INTO `book_info` VALUES (52, 'Journey Under the Midnight Sun', 'Keigo Higashino', 29.80, 6, 'A mystery novel spanning nearly twenty years about a detective investigating a murder case.', 0, 'https://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/BookManager/pictures/1637229775159白夜行.jpg');
INSERT INTO `book_info` VALUES (53, 'New Thinking of English Grammar', 'Zhang Mansheng', 39.00, 7, 'A new approach to understanding English grammar with practical explanations.', 0, 'https://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/BookManager/pictures/1637229921309语法新思维.jpg');
INSERT INTO `book_info` VALUES (56, 'Professional JavaScript for Web Developers', 'Nicholas C. Zakas', 99.00, 1, 'A comprehensive guide to JavaScript programming for web development.', 0, 'https://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/BookManager/pictures/1637334053325javascript.jpg');
INSERT INTO `book_info` VALUES (57, 'To Live', 'Yu Hua', 20.00, 3, 'A novel about a man\'s suffering through China\'s turbulent 20th century history.', 0, 'https://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/BookManager/pictures/1637334100418活着.jpg');
INSERT INTO `book_info` VALUES (58, 'Competitive Programming', 'Takuya Akiba', 79.00, 1, 'A guide to algorithms and problem-solving techniques for programming competitions.', 0, 'https://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/BookManager/pictures/1637334263096挑战.jpg');
INSERT INTO `book_info` VALUES (59, 'Sapiens: A Brief History of Humankind', 'Yuval Noah Harari', 68.00, 2, 'An exploration of the history of Homo sapiens from the Stone Age to the 21st century.', 0, 'https://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/BookManager/pictures/1637334357792人类简史.jpg');
INSERT INTO `book_info` VALUES (61, 'China: A Macro History', 'Ray Huang', 19.00, 2, 'An interpretation of Chinese history focusing on its management systems and technological development.', 0, 'https://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/BookManager/pictures/1637334601318大理市.jpg');
INSERT INTO `book_info` VALUES (62, 'Crisis and Reconstruction', 'Li Biyan', 79.80, 2, 'A study of the Tang Dynasty\'s provincial system after the An Lushan Rebellion.', 0, 'https://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/BookManager/pictures/1637334747447危机与重构.jpg');
INSERT INTO `book_info` VALUES (63, 'The Smiling, Proud Wanderer', 'Jin Yong', 76.80, 6, 'A wuxia novel about martial arts sects competing for dominance.', 0, 'https://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/BookManager/pictures/1637335240088笑傲江湖.jpg');
INSERT INTO `book_info` VALUES (64, 'Aristocratic Politics in Eastern Jin', 'Tian Yuqing', 49.00, 2, 'An examination of the co-governance by imperial power and aristocratic families during the Eastern Jin Dynasty.', 0, 'https://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/BookManager/pictures/1637335543310东晋.jpg');
INSERT INTO `book_info` VALUES (65, 'China\'s Economic Transformation', 'Wu Xiaobo', 32.00, 2, 'A chronicle of China\'s economic reform from 1978 to 2008.', 0, 'https://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/BookManager/pictures/1637335658056激荡.jpg');
INSERT INTO `book_info` VALUES (66, 'One Hundred Years of Solitude', 'Gabriel García Márquez', 39.50, 3, 'A magical realism novel about the Buendía family over several generations.', 0, 'https://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/BookManager/pictures/1637335801222百年孤独.jpg');
INSERT INTO `book_info` VALUES (67, 'The Long Night', 'Zi Jinchen', 42.00, 6, 'A crime novel about a prosecutor fighting against corruption.', 0, 'https://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/BookManager/pictures/1637336029232长夜难明.jpg');
INSERT INTO `book_info` VALUES (68, 'The Count of Monte Cristo', 'Alexandre Dumas', 43.90, 6, 'A classic tale of betrayal and revenge set in early 19th century France.', 0, 'https://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/BookManager/pictures/1637336102114基督山伯爵.jpg');
INSERT INTO `book_info` VALUES (69, 'The Complete Sherlock Holmes', 'Arthur Conan Doyle', 53.00, 6, 'The complete collection of stories about the famous detective Sherlock Holmes and his companion Dr. Watson.', 0, 'https://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/BookManager/pictures/1637336151137福尔摩斯.jpg');

-- ----------------------------
-- Table structure for book_type
-- ----------------------------
DROP TABLE IF EXISTS `book_type`;
CREATE TABLE `book_type`  (
  `bookTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `bookTypeName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bookTypeDesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Book type description',
  PRIMARY KEY (`bookTypeId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book_type
-- ----------------------------
INSERT INTO `book_type` VALUES (1, 'Computer Science', 'Computer related');
INSERT INTO `book_type` VALUES (2, 'History', 'History related');
INSERT INTO `book_type` VALUES (3, 'Literature', 'Literature related');
INSERT INTO `book_type` VALUES (4, 'Science Fiction', 'Sci-fi related');
INSERT INTO `book_type` VALUES (6, 'Novel', 'Novel related');
INSERT INTO `book_type` VALUES (7, 'Foreign Language', 'Foreign language related');

-- ----------------------------
-- Table structure for borrow
-- ----------------------------
DROP TABLE IF EXISTS `borrow`;
CREATE TABLE `borrow`  (
  `borrowId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `bookId` int(11) NOT NULL,
  `borrowTime` datetime NOT NULL,
  `returnTime` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`borrowId`) USING BTREE,
  INDEX `fk_borrow_user_1`(`userId`) USING BTREE,
  INDEX `fk_borrow_book_info_1`(`bookId`) USING BTREE,
  CONSTRAINT `borrow_ibfk_1` FOREIGN KEY (`bookId`) REFERENCES `book_info` (`bookId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `borrow_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of borrow
-- ----------------------------
INSERT INTO `borrow` VALUES (26, 11, 2, '2021-11-18 14:24:06', '2021-11-18 16:07:03');
INSERT INTO `borrow` VALUES (27, 11, 1, '2021-11-18 15:01:31', '2021-11-18 16:07:06');
INSERT INTO `borrow` VALUES (28, 11, 4, '2021-11-18 15:22:05', '2021-11-18 16:07:08');
INSERT INTO `borrow` VALUES (30, 14, 2, '2021-11-18 16:52:05', '2021-11-19 20:55:10');
INSERT INTO `borrow` VALUES (32, 14, 4, '2021-11-18 16:52:17', '2021-11-18 16:52:41');
INSERT INTO `borrow` VALUES (38, 14, 1, '2021-11-19 22:19:43', '2021-11-19 22:19:48');
INSERT INTO `borrow` VALUES (39, 14, 1, '2021-11-19 22:46:14', '2021-11-19 22:46:18');
INSERT INTO `borrow` VALUES (40, 14, 1, '2021-11-19 22:57:21', '2021-11-19 22:57:26');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userPassword` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `isAdmin` tinyint(4) NOT NULL COMMENT '1 for admin, 0 for regular user',
  PRIMARY KEY (`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'admin', 1);
INSERT INTO `user` VALUES (2, 'Li Ming', '123456', 0);
INSERT INTO `user` VALUES (11, 'zhang', '123', 0);
INSERT INTO `user` VALUES (13, 'zhao', 'abc', 1);
INSERT INTO `user` VALUES (14, 'wangpeng', '123456', 0);

SET FOREIGN_KEY_CHECKS = 1;