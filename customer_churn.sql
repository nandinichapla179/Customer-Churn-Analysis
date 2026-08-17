-- MySQL Dump for database: customer_churn
-- Generated from SQLite database: customer_churn.db

SET FOREIGN_KEY_CHECKS=0;
CREATE DATABASE IF NOT EXISTS `customer_churn`;
USE `customer_churn`;

-- Table structure for table `db_customer`
DROP TABLE IF EXISTS `db_customer`;
CREATE TABLE `db_customer` (
  `customerid` VARCHAR(50) NOT NULL,
  `name` VARCHAR(100) DEFAULT NULL,
  `country` VARCHAR(100) DEFAULT NULL,
  `state` VARCHAR(100) DEFAULT NULL,
  `gender` VARCHAR(20) DEFAULT NULL,
  `dob` DATETIME DEFAULT NULL,
  `interests` VARCHAR(255) DEFAULT NULL,
  `pincode` INT DEFAULT NULL,
  PRIMARY KEY (`customerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table `db_customer`
INSERT INTO `db_customer` (`customerid`, `name`, `country`, `state`, `gender`, `dob`, `interests`, `pincode`) VALUES
  ('0002-ORFBO', 'keshav', 'India', 'Maharashtra', 'Male', '1982-04-12 00:00:00', 'travel', NULL),
  ('0003-MKNFE', 'raghav', 'India', 'Karnataka', 'Male', '1995-11-23 00:00:00', NULL, NULL),
  ('0004-TLHLJ', 'lalita', 'India', 'Delhi', 'Female', '1978-02-15 00:00:00', 'movie', NULL),
  ('0011-IGKFF', 'mohan', 'India', 'Nagaland', 'Male', '2001-08-30 00:00:00', NULL, NULL),
  ('0013-EXCHZ', 'mira', 'India', 'Delhi', 'Female', '1990-05-05 00:00:00', 'drama', NULL),
  ('0013-MHZWF', 'durga', NULL, 'Delhi', 'Women', '1988-12-10 00:00:00', NULL, NULL),
  ('0013-SMEOE', 'mina', 'India', 'Meghalaya', 'Female', '1976-09-21 00:00:00', NULL, NULL),
  ('0014-BMAQU', 'madan', 'India', 'Rajasthan', 'Male', '1999-03-14 00:00:00', NULL, NULL),
  ('0015-UOCOJ', 'maya', NULL, 'Kathmandu', 'Women', '1985-07-07 00:00:00', NULL, NULL),
  ('0016-QLJIS', 'arjun', 'Nepal', 'Kathmandu', 'Male', '1993-10-29 00:00:00', NULL, NULL),
  ('0017-DINOC', 'shiva', 'India', 'Maharashtra', 'Men', '1997-01-22 00:00:00', NULL, NULL),
  ('0017-IUDMW', 'rangadevi', 'India', 'Karnataka', 'Female', '1981-06-18 00:00:00', NULL, NULL),
  ('0018-NYROU', 'chitra', NULL, 'Telangana', 'Female', '2004-12-01 00:00:00', NULL, NULL),
  ('0019-EFAEP', 'raju', 'India', 'Meghalaya', 'Female', '1992-04-25 00:00:00', NULL, NULL),
  ('0019-GFNTW', 'Madhav', 'India', 'Uttar Pradesh', 'Men', '1979-11-11 00:00:00', NULL, NULL),
  ('0020-INWCK', 'parvati', 'India', 'Delhi', 'Female', '1986-02-28 00:00:00', 'job', NULL),
  ('0020-JDNXP', 'rikim', 'India', 'Meghalaya', 'Female', '1994-08-19 00:00:00', NULL, NULL),
  ('0021-IKXGC', 'vishakha', 'India', 'Rajasthan', 'Female', '2000-09-02 00:00:00', NULL, NULL),
  ('0022-TCJCI', 'raghvendra', 'India', 'Telangana', 'Male', '1983-12-30 00:00:00', NULL, NULL),
  ('0023-HGHWL', 'rishabh', 'India', 'Uttar Pradesh', 'Men', '1991-05-14 00:00:00', NULL, NULL),
  ('0023-UYUPN', 'sudevi', 'India', 'Maharashtra', 'Women', '1977-10-06 00:00:00', NULL, NULL);

-- Table structure for table `db_subscription`
DROP TABLE IF EXISTS `db_subscription`;
CREATE TABLE `db_subscription` (
  `customerid` VARCHAR(50) NOT NULL,
  `subscription_start_date` DATE DEFAULT NULL,
  `subscription_type` VARCHAR(50) DEFAULT NULL,
  `renewal_date` DATE DEFAULT NULL,
  `plan_type` VARCHAR(50) DEFAULT NULL,
  `contract_type` VARCHAR(50) DEFAULT NULL,
  `cancellation_date` DATE DEFAULT NULL,
  `cancellation_reason` VARCHAR(255) DEFAULT NULL,
  `monthly_charges` DECIMAL(10, 2) DEFAULT NULL,
  `cltv` INT DEFAULT NULL,
  `churn_score` INT DEFAULT NULL,
  PRIMARY KEY (`customerid`),
  CONSTRAINT `fk_subscription_customer` FOREIGN KEY (`customerid`) REFERENCES `db_customer` (`customerid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table `db_subscription`
INSERT INTO `db_subscription` (`customerid`, `subscription_start_date`, `subscription_type`, `renewal_date`, `plan_type`, `contract_type`, `cancellation_date`, `cancellation_reason`, `monthly_charges`, `cltv`, `churn_score`) VALUES
  ('0002-ORFBO', '2021-03-15', 'Refferal', '2025-03-15', 'Standard', 'Annual', NULL, NULL, 13.99, 627, 12),
  ('0003-MKNFE', '2020-08-01', 'Paid', '2024-08-01', 'Premium', 'Annual', '2024-09-10', 'Switched to competitor', 12.99, 1150, 91),
  ('0004-TLHLJ', '2022-11-20', 'Organic', '2025-11-20', 'Basic', 'Monthly', NULL, NULL, 6.99, 210, 34),
  ('0011-IGKFF', '2019-05-10', 'Paid', '2025-05-10', 'Premium', 'Annual', NULL, NULL, 22.99, 1725, 8),
  ('0013-EXCHZ', '2023-01-05', 'Refferal', '2024-01-05', 'Standard', 'Monthly', '2024-02-28', 'Too expensive', 13.99, 195, 88),
  ('0013-MHZWF', '2022-06-18', 'Paid', '2025-06-18', 'Standard', 'Annual', NULL, NULL, 17.99, 720, 22),
  ('0013-SMEOE', '2021-09-30', 'Refferal', '2024-09-30', 'Basic', 'Monthly', '2024-11-15', 'Not enough content', 8.99, 230, 79),
  ('0014-BMAQU', '2020-02-14', 'Organic', '2025-02-14', 'Premium', 'Annual', NULL, NULL, 22.99, 1840, 5),
  ('0015-UOCOJ', '2023-07-22', 'Organic', '2024-07-22', 'Standard', 'Monthly', NULL, NULL, 13.99, 240, 34),
  ('0016-QLJIS', '2022-04-03', 'Organic', '2025-04-03', 'Basic', 'Annual', NULL, NULL, 6.99, 335, 41),
  ('0017-DINOC', '2021-12-01', 'Organic', '2025-12-01', 'Premium', 'Annual', NULL, NULL, 22.99, 1610, 14),
  ('0017-IUDMW', '2023-03-17', 'Refferal', '2024-03-17', 'Standard', 'Monthly', '2024-05-01', 'Poor streaming quality', 7.99, 270, 83),
  ('0018-NYROU', '2020-10-09', 'Organic', '2025-10-09', 'Standard', 'Annual', NULL, NULL, 13.99, 980, 19),
  ('0019-EFAEP', '2022-08-25', 'Refferal', '2024-08-25', 'Basic', 'Monthly', '2024-10-31', 'Switched to competitor', 12.99, 160, 76),
  ('0019-GFNTW', '2019-11-11', 'Paid', '2025-11-11', 'Premium', 'Annual', NULL, NULL, 92.99, 2185, 3),
  ('0020-INWCK', '2023-05-06', 'Organic', '2025-05-06', 'Standard', 'Monthly', NULL, NULL, 13.99, 640, 58),
  ('0020-JDNXP', '2022-01-19', 'Organic', '2024-01-19', 'Premium', 'Annual', NULL, NULL, 20.99, 550, 62),
  ('0021-IKXGC', '2021-07-07', 'Paid', '2025-07-07', 'Standard', 'Annual', NULL, NULL, 13.99, 840, 27),
  ('0022-TCJCI', '2023-09-14', 'Refferal', '2024-09-14', 'Basic', 'Monthly', '2024-09-14', 'Forgot to cancel trial', 16.99, 42, 99),
  ('0023-HGHWL', '2020-06-23', 'Organic', '2025-06-23', 'Premium', 'Annual', NULL, NULL, 22.99, 1955, 7),
  ('0023-UYUPN', '2022-12-31', 'Paid', '2025-12-31', 'Standard', 'Monthly', NULL, NULL, 13.99, 790, 47);

-- Table structure for table `db_support`
DROP TABLE IF EXISTS `db_support`;
CREATE TABLE `db_support` (
  `id` INT AUTO_INCREMENT,
  `customerid` VARCHAR(50) NOT NULL,
  `complaint_date` DATETIME DEFAULT NULL,
  `escalations` VARCHAR(10) DEFAULT NULL,
  `csat_score` INT DEFAULT NULL,
  `col_1` DOUBLE DEFAULT NULL,
  `comment` TEXT DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_support_customer` FOREIGN KEY (`customerid`) REFERENCES `db_customer` (`customerid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table `db_support`
INSERT INTO `db_support` (`customerid`, `complaint_date`, `escalations`, `csat_score`, `col_1`, `comment`) VALUES
  ('0003-MKNFE', '2024-08-28 00:00:00', 'N', 60, NULL, 'service issue'),
  ('0003-MKNFE', '2024-08-28 00:00:00', 'Y', 10, NULL, 'demaned refund'),
  ('0013-EXCHZ', '2024-01-20 00:00:00', 'Y', 20, NULL, NULL),
  ('0013-MHZWF', '2025-03-18 00:00:00', 'N', 90, NULL, 'guidance to renew'),
  ('0013-SMEOE', '2024-11-01 00:00:00', 'N', 30, NULL, NULL),
  ('0017-IUDMW', '2024-04-10 00:00:00', 'Y', 25, NULL, NULL),
  ('0019-EFAEP', '2024-09-27 00:00:00', 'Y', 30, NULL, NULL),
  ('0022-TCJCI', '2024-09-13 00:00:00', 'Y', 10, NULL, NULL),
  ('0022-TCJCI', '2024-09-14 00:00:00', 'N', 90, NULL, 'received refund');

SET FOREIGN_KEY_CHECKS=1;

select * from customer_churn; 