-- MySQL dump 10.13  Distrib 8.0.36, for macos14 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Appointments`
--

DROP TABLE IF EXISTS `Appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Appointments` (
  `AppointmentID` int NOT NULL,
  `DoctorID` int NOT NULL,
  `TestName` varchar(45) NOT NULL,
  `BookingName` varchar(45) NOT NULL,
  `Attended` char(1) NOT NULL,
  `Customers_CustomerID` int unsigned NOT NULL,
  PRIMARY KEY (`AppointmentID`,`Customers_CustomerID`),
  KEY `fk_Appointments_Customers1_idx` (`Customers_CustomerID`),
  CONSTRAINT `fk_Appointments_Customers1` FOREIGN KEY (`Customers_CustomerID`) REFERENCES `Customers` (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Appointments`
--

LOCK TABLES `Appointments` WRITE;
/*!40000 ALTER TABLE `Appointments` DISABLE KEYS */;
INSERT INTO `Appointments` VALUES (1,101,'Blood Test','John Doe','Y',1),(2,102,'X-Ray','Jane Smith','N',2),(3,103,'Ultrasound','Michael Johnson','Y',3),(4,104,'MRI','Emily Brown','N',4);
/*!40000 ALTER TABLE `Appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cart`
--

DROP TABLE IF EXISTS `Cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cart` (
  `idCart` int NOT NULL,
  `ItemID` varchar(45) NOT NULL,
  `Quantity` int NOT NULL,
  `PromoCode` char(5) DEFAULT NULL,
  `TotalPrice` varchar(45) NOT NULL,
  PRIMARY KEY (`idCart`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cart`
--

LOCK TABLES `Cart` WRITE;
/*!40000 ALTER TABLE `Cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Contract`
--

DROP TABLE IF EXISTS `Contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Contract` (
  `Agency` varchar(25) NOT NULL,
  `Duration` varchar(25) NOT NULL,
  PRIMARY KEY (`Agency`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Contract`
--

LOCK TABLES `Contract` WRITE;
/*!40000 ALTER TABLE `Contract` DISABLE KEYS */;
/*!40000 ALTER TABLE `Contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CreditCard`
--

DROP TABLE IF EXISTS `CreditCard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CreditCard` (
  `Number` int NOT NULL,
  `CVV` char(3) NOT NULL,
  `ExpDate` date NOT NULL,
  PRIMARY KEY (`Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CreditCard`
--

LOCK TABLES `CreditCard` WRITE;
/*!40000 ALTER TABLE `CreditCard` DISABLE KEYS */;
/*!40000 ALTER TABLE `CreditCard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customers`
--

DROP TABLE IF EXISTS `Customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customers` (
  `CustomerID` int unsigned NOT NULL,
  `FN` varchar(45) NOT NULL,
  `LN` varchar(45) NOT NULL,
  `DOB` date NOT NULL,
  `Gender` varchar(45) NOT NULL,
  `Age` varchar(45) DEFAULT NULL,
  `Email` varchar(45) NOT NULL,
  `InsuranceID` varchar(45) NOT NULL,
  `Allergies` varchar(45) DEFAULT NULL,
  `BonusPoints` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customers`
--

LOCK TABLES `Customers` WRITE;
/*!40000 ALTER TABLE `Customers` DISABLE KEYS */;
INSERT INTO `Customers` VALUES (1,'John','Doe','1990-05-15','Male','31','john.doe@example.com','ABC123','Peanuts','100'),(2,'Jane','Smith','1985-09-20','Female','36','jane.smith@example.com','DEF456','None','50'),(3,'Michael','Johnson','1982-07-10','Male','39','michael.johnson@example.com','GHI789','Lactose','75'),(4,'Emily','Brown','1995-03-25','Female','26','emily.brown@example.com','JKL012','Shellfish','120');
/*!40000 ALTER TABLE `Customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Department`
--

DROP TABLE IF EXISTS `Department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Department` (
  `idDepartment` int NOT NULL,
  `Title` varchar(45) NOT NULL,
  `ManagerID` int NOT NULL,
  `EmployeeRole_WorkHistory_Pk` int NOT NULL,
  `EmployeeRole_WorkHistory_RoleID` int unsigned NOT NULL,
  PRIMARY KEY (`ManagerID`,`idDepartment`),
  KEY `fk_Department_EmployeeRole1_idx` (`EmployeeRole_WorkHistory_Pk`,`EmployeeRole_WorkHistory_RoleID`),
  CONSTRAINT `fk_Department_EmployeeRole1` FOREIGN KEY (`EmployeeRole_WorkHistory_Pk`, `EmployeeRole_WorkHistory_RoleID`) REFERENCES `EmployeeRole` (`WorkHistory_Pk`, `WorkHistory_RoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Department`
--

LOCK TABLES `Department` WRITE;
/*!40000 ALTER TABLE `Department` DISABLE KEYS */;
INSERT INTO `Department` VALUES (1,'Marketing',101,101,201),(2,'Sales',102,102,202),(3,'Finance',103,103,203),(4,'HR',104,104,204);
/*!40000 ALTER TABLE `Department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Distributor`
--

DROP TABLE IF EXISTS `Distributor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Distributor` (
  `idDistributor` int NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Address` varchar(45) NOT NULL,
  `productid` varchar(45) NOT NULL,
  PRIMARY KEY (`idDistributor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Distributor`
--

LOCK TABLES `Distributor` WRITE;
/*!40000 ALTER TABLE `Distributor` DISABLE KEYS */;
INSERT INTO `Distributor` VALUES (1,'Pfizer','123 Main Street, New York','1'),(2,'Johnson & Johnson','456 Elm Street, Los Angeles','2'),(3,'Colgate-Palmolive','789 Oak Avenue, Chicago','3'),(4,'Procter & Gamble','101 Pine Street, Houston','4');
/*!40000 ALTER TABLE `Distributor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DOctor`
--

DROP TABLE IF EXISTS `DOctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DOctor` (
  `idDOctor` int NOT NULL,
  `FN` varchar(45) NOT NULL,
  `LN` varchar(45) NOT NULL,
  `DOB` date DEFAULT NULL,
  `Gender` char(1) NOT NULL,
  `Age` varchar(8) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Speciality` varchar(45) NOT NULL,
  PRIMARY KEY (`idDOctor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DOctor`
--

LOCK TABLES `DOctor` WRITE;
/*!40000 ALTER TABLE `DOctor` DISABLE KEYS */;
INSERT INTO `DOctor` VALUES (101,'John','Smith','1980-01-15','M','41','john.smith@example.com','Cardiology'),(102,'Jane','Johnson','1975-06-20','F','46','jane.johnson@example.com','Orthopedics'),(103,'Michael','Williams','1982-09-10','M','39','michael.williams@example.com','Pediatrics'),(104,'Emily','Brown','1978-03-25','F','43','emily.brown@example.com','Dermatology');
/*!40000 ALTER TABLE `DOctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DOctor_has_Hospital`
--

DROP TABLE IF EXISTS `DOctor_has_Hospital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DOctor_has_Hospital` (
  `DOctor_idDOctor` int NOT NULL,
  `Hospital_idHospital` int NOT NULL,
  PRIMARY KEY (`DOctor_idDOctor`,`Hospital_idHospital`),
  KEY `fk_DOctor_has_Hospital_Hospital1_idx` (`Hospital_idHospital`),
  KEY `fk_DOctor_has_Hospital_DOctor1_idx` (`DOctor_idDOctor`),
  CONSTRAINT `fk_DOctor_has_Hospital_DOctor1` FOREIGN KEY (`DOctor_idDOctor`) REFERENCES `DOctor` (`idDOctor`),
  CONSTRAINT `fk_DOctor_has_Hospital_Hospital1` FOREIGN KEY (`Hospital_idHospital`) REFERENCES `Hospital` (`idHospital`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DOctor_has_Hospital`
--

LOCK TABLES `DOctor_has_Hospital` WRITE;
/*!40000 ALTER TABLE `DOctor_has_Hospital` DISABLE KEYS */;
/*!40000 ALTER TABLE `DOctor_has_Hospital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DoctorCheck`
--

DROP TABLE IF EXISTS `DoctorCheck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DoctorCheck` (
  `DateOfCheck` date NOT NULL,
  `Customers_CustomerID` int unsigned NOT NULL,
  `DOctor_idDOctor` int NOT NULL,
  KEY `fk_DoctorCheck_Customers1_idx` (`Customers_CustomerID`),
  KEY `fk_DoctorCheck_DOctor1_idx` (`DOctor_idDOctor`),
  CONSTRAINT `fk_DoctorCheck_Customers1` FOREIGN KEY (`Customers_CustomerID`) REFERENCES `Customers` (`CustomerID`),
  CONSTRAINT `fk_DoctorCheck_DOctor1` FOREIGN KEY (`DOctor_idDOctor`) REFERENCES `DOctor` (`idDOctor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DoctorCheck`
--

LOCK TABLES `DoctorCheck` WRITE;
/*!40000 ALTER TABLE `DoctorCheck` DISABLE KEYS */;
/*!40000 ALTER TABLE `DoctorCheck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employee` (
  `idEmployee` int NOT NULL,
  `FN` varchar(45) NOT NULL,
  `LN` varchar(45) NOT NULL,
  `DOB` date NOT NULL,
  `Gender` char(1) DEFAULT NULL,
  `Age` tinyint DEFAULT NULL,
  `Email` varchar(45) NOT NULL,
  `Manager` varchar(45) NOT NULL,
  `HireDate` date NOT NULL,
  `Salary` int NOT NULL,
  `Transaction_idTransaction` int NOT NULL,
  `WorkHistory_Pk` int NOT NULL,
  `WorkHistory_RoleID` int unsigned NOT NULL,
  PRIMARY KEY (`idEmployee`,`WorkHistory_Pk`,`WorkHistory_RoleID`),
  KEY `fk_Employee_Transaction1_idx` (`Transaction_idTransaction`),
  KEY `fk_Employee_WorkHistory1_idx` (`WorkHistory_Pk`,`WorkHistory_RoleID`),
  CONSTRAINT `fk_Employee_Transaction1` FOREIGN KEY (`Transaction_idTransaction`) REFERENCES `Transaction` (`idTransaction`),
  CONSTRAINT `fk_Employee_WorkHistory1` FOREIGN KEY (`WorkHistory_Pk`, `WorkHistory_RoleID`) REFERENCES `WorkHistory` (`Pk`, `RoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
INSERT INTO `Employee` VALUES (1,'John','Doe','1990-05-15','M',31,'john.doe@example.com','Manager','2020-01-01',50000,1,101,201),(2,'Jane','Smith','1985-09-20','F',36,'jane.smith@example.com','Supervisor','2018-03-15',60000,2,102,202),(3,'Michael','Johnson','1982-07-10','M',39,'michael.johnson@example.com','Manager','2019-06-20',55000,3,103,203),(4,'Emily','Brown','1995-03-25','F',26,'emily.brown@example.com','Supervisor','2021-02-10',52000,4,104,204);
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee_has_EmployeeRole`
--

DROP TABLE IF EXISTS `Employee_has_EmployeeRole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employee_has_EmployeeRole` (
  `Employee_idEmployee` int NOT NULL,
  `EmployeeRole_RoleID` int NOT NULL,
  PRIMARY KEY (`Employee_idEmployee`,`EmployeeRole_RoleID`),
  KEY `fk_Employee_has_EmployeeRole_Employee1_idx` (`Employee_idEmployee`),
  CONSTRAINT `fk_Employee_has_EmployeeRole_Employee1` FOREIGN KEY (`Employee_idEmployee`) REFERENCES `Employee` (`idEmployee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee_has_EmployeeRole`
--

LOCK TABLES `Employee_has_EmployeeRole` WRITE;
/*!40000 ALTER TABLE `Employee_has_EmployeeRole` DISABLE KEYS */;
INSERT INTO `Employee_has_EmployeeRole` VALUES (1,201),(2,202),(3,203),(4,204);
/*!40000 ALTER TABLE `Employee_has_EmployeeRole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EmployeeRole`
--

DROP TABLE IF EXISTS `EmployeeRole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EmployeeRole` (
  `Title` varchar(45) NOT NULL,
  `WorkHistory_Pk` int NOT NULL,
  `WorkHistory_RoleID` int unsigned NOT NULL,
  PRIMARY KEY (`WorkHistory_Pk`,`WorkHistory_RoleID`),
  KEY `fk_EmployeeRole_WorkHistory1_idx` (`WorkHistory_Pk`,`WorkHistory_RoleID`),
  CONSTRAINT `fk_EmployeeRole_WorkHistory1` FOREIGN KEY (`WorkHistory_Pk`, `WorkHistory_RoleID`) REFERENCES `WorkHistory` (`Pk`, `RoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EmployeeRole`
--

LOCK TABLES `EmployeeRole` WRITE;
/*!40000 ALTER TABLE `EmployeeRole` DISABLE KEYS */;
INSERT INTO `EmployeeRole` VALUES ('Manager',101,201),('Sales Representative',102,202),('Accountant',103,203),('HR Specialist',104,204);
/*!40000 ALTER TABLE `EmployeeRole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FullTime`
--

DROP TABLE IF EXISTS `FullTime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FullTime` (
  `HiringManager` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FullTime`
--

LOCK TABLES `FullTime` WRITE;
/*!40000 ALTER TABLE `FullTime` DISABLE KEYS */;
/*!40000 ALTER TABLE `FullTime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HealthRecords`
--

DROP TABLE IF EXISTS `HealthRecords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HealthRecords` (
  `Weight` mediumint NOT NULL,
  `Height` mediumint NOT NULL,
  `BloodGroup` varchar(45) NOT NULL,
  `Details` varchar(45) NOT NULL,
  `Customers_CustomerID` int unsigned NOT NULL,
  PRIMARY KEY (`Customers_CustomerID`),
  CONSTRAINT `fk_HealthRecords_Customers1` FOREIGN KEY (`Customers_CustomerID`) REFERENCES `Customers` (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HealthRecords`
--

LOCK TABLES `HealthRecords` WRITE;
/*!40000 ALTER TABLE `HealthRecords` DISABLE KEYS */;
/*!40000 ALTER TABLE `HealthRecords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Hospital`
--

DROP TABLE IF EXISTS `Hospital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Hospital` (
  `idHospital` int NOT NULL,
  `Address` varchar(45) NOT NULL,
  `DoctorID` int NOT NULL,
  PRIMARY KEY (`idHospital`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Hospital`
--

LOCK TABLES `Hospital` WRITE;
/*!40000 ALTER TABLE `Hospital` DISABLE KEYS */;
INSERT INTO `Hospital` VALUES (1,'123 Main St',101),(2,'456 Oak Ave',102),(3,'789 Elm Blvd',103),(4,'321 Pine Rd',104);
/*!40000 ALTER TABLE `Hospital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `InPerson`
--

DROP TABLE IF EXISTS `InPerson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `InPerson` (
  `AppointmentTime` datetime(3) NOT NULL,
  `Appointments_AppointmentID` int NOT NULL,
  PRIMARY KEY (`AppointmentTime`),
  KEY `fk_InPerson_Appointments1_idx` (`Appointments_AppointmentID`),
  CONSTRAINT `fk_InPerson_Appointments1` FOREIGN KEY (`Appointments_AppointmentID`) REFERENCES `Appointments` (`AppointmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InPerson`
--

LOCK TABLES `InPerson` WRITE;
/*!40000 ALTER TABLE `InPerson` DISABLE KEYS */;
/*!40000 ALTER TABLE `InPerson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Insurance`
--

DROP TABLE IF EXISTS `Insurance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Insurance` (
  `idInsurance` int NOT NULL,
  `InsuranceCompany` varchar(45) NOT NULL,
  `PolicyName` varchar(45) NOT NULL,
  `PolicyStartdate` date NOT NULL,
  `PolicyEndDate` date NOT NULL,
  `CoverageDetails` varchar(45) DEFAULT NULL,
  `CopayAmount` mediumint NOT NULL,
  `Deductible` mediumint NOT NULL,
  `Customers_CustomerID` int unsigned NOT NULL,
  PRIMARY KEY (`idInsurance`,`Customers_CustomerID`),
  KEY `fk_Insurance_Customers1_idx` (`Customers_CustomerID`),
  CONSTRAINT `fk_Insurance_Customers1` FOREIGN KEY (`Customers_CustomerID`) REFERENCES `Customers` (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Insurance`
--

LOCK TABLES `Insurance` WRITE;
/*!40000 ALTER TABLE `Insurance` DISABLE KEYS */;
INSERT INTO `Insurance` VALUES (1,'ABC Insurance','HealthPlus','2020-01-01','2021-12-31','Medical, Dental, Vision',30,500,1),(2,'XYZ Insurance','CareFirst','2019-03-15','2022-03-14','Medical, Prescription Drugs',20,1000,2),(3,'DEF Insurance','Wellness Plan','2021-06-20','2022-06-19','Preventive Care',10,200,3),(4,'GHI Insurance','FamilyCare','2020-02-10','2023-02-09','Family Coverage',40,800,4);
/*!40000 ALTER TABLE `Insurance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Location`
--

DROP TABLE IF EXISTS `Location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Location` (
  `idLocation` int NOT NULL,
  `Address` varchar(45) NOT NULL,
  `State` varchar(45) NOT NULL,
  `City` varchar(45) NOT NULL,
  `ZIP` varchar(45) NOT NULL,
  `Phonenumber` varchar(45) NOT NULL,
  `HoursAvailability` varchar(45) NOT NULL,
  `Manager` varchar(45) NOT NULL,
  `SquareFootage` int NOT NULL,
  `InStore_Timings` varchar(50) NOT NULL,
  PRIMARY KEY (`idLocation`,`InStore_Timings`),
  KEY `fk_Location_InStore1_idx` (`InStore_Timings`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Location`
--

LOCK TABLES `Location` WRITE;
/*!40000 ALTER TABLE `Location` DISABLE KEYS */;
INSERT INTO `Location` VALUES (1,'123 Main St','California','Los Angeles','90001','123-456-7890','Mon-Sun: 9AM-9PM','John Smith',5000,'9AM-9PM'),(2,'456 Oak Ave','New York','New York City','10001','987-654-3210','Mon-Fri: 10AM-8PM, Sat-Sun: 11AM-7PM','Jane Doe',6000,'10AM-8PM'),(3,'789 Elm Blvd','Texas','Houston','77001','555-123-4567','Mon-Sat: 8AM-10PM, Sun: 9AM-9PM','Michael Johnson',7000,'8AM-10PM'),(4,'321 Pine Rd','Florida','Miami','33001','999-888-7777','Mon-Fri: 9AM-7PM, Sat-Sun: 10AM-6PM','Emily Brown',5500,'9AM-7PM');
/*!40000 ALTER TABLE `Location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Location_has_Product`
--

DROP TABLE IF EXISTS `Location_has_Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Location_has_Product` (
  `Location_idLocation` int NOT NULL,
  `Product_idProduct` int NOT NULL,
  PRIMARY KEY (`Location_idLocation`,`Product_idProduct`),
  KEY `fk_Location_has_Product_Product1_idx` (`Product_idProduct`),
  KEY `fk_Location_has_Product_Location1_idx` (`Location_idLocation`),
  CONSTRAINT `fk_Location_has_Product_Location1` FOREIGN KEY (`Location_idLocation`) REFERENCES `Location` (`idLocation`),
  CONSTRAINT `fk_Location_has_Product_Product1` FOREIGN KEY (`Product_idProduct`) REFERENCES `Product` (`idProduct`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Location_has_Product`
--

LOCK TABLES `Location_has_Product` WRITE;
/*!40000 ALTER TABLE `Location_has_Product` DISABLE KEYS */;
/*!40000 ALTER TABLE `Location_has_Product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Manufacturer`
--

DROP TABLE IF EXISTS `Manufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Manufacturer` (
  `idManufacturer` int NOT NULL,
  `CompanyID` varchar(45) NOT NULL,
  `Address` varchar(45) NOT NULL,
  PRIMARY KEY (`idManufacturer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Manufacturer`
--

LOCK TABLES `Manufacturer` WRITE;
/*!40000 ALTER TABLE `Manufacturer` DISABLE KEYS */;
INSERT INTO `Manufacturer` VALUES (1,'ABC123','123 Main St'),(2,'DEF456','456 Oak Ave'),(3,'GHI789','789 Elm Blvd'),(4,'JKL012','321 Pine Rd');
/*!40000 ALTER TABLE `Manufacturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Manufacturer_has_Distributor`
--

DROP TABLE IF EXISTS `Manufacturer_has_Distributor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Manufacturer_has_Distributor` (
  `Manufacturer_idManufacturer` int NOT NULL,
  `Distributor_idDistributor` int NOT NULL,
  PRIMARY KEY (`Manufacturer_idManufacturer`,`Distributor_idDistributor`),
  KEY `fk_Manufacturer_has_Distributor_Distributor1_idx` (`Distributor_idDistributor`),
  KEY `fk_Manufacturer_has_Distributor_Manufacturer1_idx` (`Manufacturer_idManufacturer`),
  CONSTRAINT `fk_Manufacturer_has_Distributor_Distributor1` FOREIGN KEY (`Distributor_idDistributor`) REFERENCES `Distributor` (`idDistributor`),
  CONSTRAINT `fk_Manufacturer_has_Distributor_Manufacturer1` FOREIGN KEY (`Manufacturer_idManufacturer`) REFERENCES `Manufacturer` (`idManufacturer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Manufacturer_has_Distributor`
--

LOCK TABLES `Manufacturer_has_Distributor` WRITE;
/*!40000 ALTER TABLE `Manufacturer_has_Distributor` DISABLE KEYS */;
/*!40000 ALTER TABLE `Manufacturer_has_Distributor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `marketing`
--

DROP TABLE IF EXISTS `marketing`;
/*!50001 DROP VIEW IF EXISTS `marketing`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `marketing` AS SELECT 
 1 AS `FN`,
 1 AS `LN`,
 1 AS `DOB`,
 1 AS `Gender`,
 1 AS `Age`,
 1 AS `Email`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Online`
--

DROP TABLE IF EXISTS `Online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Online` (
  `SessionID` int NOT NULL,
  `Username` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `Location_idLocation` int NOT NULL,
  `Location_InStore_Timings` varchar(50) NOT NULL,
  `Cart_idCart` int NOT NULL,
  PRIMARY KEY (`SessionID`,`Location_idLocation`,`Location_InStore_Timings`,`Cart_idCart`),
  UNIQUE KEY `Username_UNIQUE` (`Username`),
  KEY `fk_Online_Location1_idx` (`Location_idLocation`,`Location_InStore_Timings`),
  KEY `fk_Online_Cart1_idx` (`Cart_idCart`),
  CONSTRAINT `fk_Online_Cart1` FOREIGN KEY (`Cart_idCart`) REFERENCES `Cart` (`idCart`),
  CONSTRAINT `fk_Online_Location1` FOREIGN KEY (`Location_idLocation`, `Location_InStore_Timings`) REFERENCES `Location` (`idLocation`, `InStore_Timings`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Online`
--

LOCK TABLES `Online` WRITE;
/*!40000 ALTER TABLE `Online` DISABLE KEYS */;
/*!40000 ALTER TABLE `Online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PartTime`
--

DROP TABLE IF EXISTS `PartTime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PartTime` (
  `ShiftDays` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PartTime`
--

LOCK TABLES `PartTime` WRITE;
/*!40000 ALTER TABLE `PartTime` DISABLE KEYS */;
/*!40000 ALTER TABLE `PartTime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PayPal`
--

DROP TABLE IF EXISTS `PayPal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PayPal` (
  `Number` int NOT NULL,
  `EmailD` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PayPal`
--

LOCK TABLES `PayPal` WRITE;
/*!40000 ALTER TABLE `PayPal` DISABLE KEYS */;
/*!40000 ALTER TABLE `PayPal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Prescription`
--

DROP TABLE IF EXISTS `Prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Prescription` (
  `idPrescription` int NOT NULL,
  `PatientID` int NOT NULL,
  `Physician` varchar(45) NOT NULL,
  `MedicationName` varchar(100) NOT NULL,
  `Dosage` varchar(45) NOT NULL,
  `City` varchar(45) NOT NULL,
  `PhoneNumber` varchar(45) NOT NULL,
  `HoursAvailability` varchar(45) NOT NULL,
  `Manager` varchar(45) NOT NULL,
  `SquareFootage` mediumint NOT NULL,
  `PharmacyLocation` varchar(45) NOT NULL,
  `Transaction_idTransaction` int NOT NULL,
  KEY `fk_Prescription_Transaction1_idx` (`Transaction_idTransaction`),
  CONSTRAINT `fk_Prescription_Transaction1` FOREIGN KEY (`Transaction_idTransaction`) REFERENCES `Transaction` (`idTransaction`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Prescription`
--

LOCK TABLES `Prescription` WRITE;
/*!40000 ALTER TABLE `Prescription` DISABLE KEYS */;
INSERT INTO `Prescription` VALUES (1,101,'Dr. Smith','Ibuprofen','200mg','New York','123-456-7890','9AM-5PM','John Doe',1500,'Times Square',1),(2,102,'Dr. Johnson','Amoxicillin','500mg','Los Angeles','987-654-3210','8AM-6PM','Jane Smith',1200,'Hollywood',2),(3,103,'Dr. Garcia','Lipitor','20mg','Chicago','555-123-4567','10AM-4PM','Alex Kim',2000,'Downtown',3),(4,104,'Dr. Patel','Zyrtec','10mg','Houston','777-888-9999','7AM-8PM','Sarah Lee',1800,'Midtown',4);
/*!40000 ALTER TABLE `Prescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Product` (
  `idProduct` int NOT NULL,
  `ProductName` varchar(45) NOT NULL,
  `Description` varchar(45) NOT NULL,
  `Category` varchar(45) NOT NULL,
  `Price` int NOT NULL,
  `InStock` int NOT NULL,
  `Distributor_idDistributor` int NOT NULL,
  PRIMARY KEY (`idProduct`),
  KEY `fk_Product_Distributor1_idx` (`Distributor_idDistributor`),
  CONSTRAINT `fk_Product_Distributor1` FOREIGN KEY (`Distributor_idDistributor`) REFERENCES `Distributor` (`idDistributor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
INSERT INTO `Product` VALUES (1,'Advil','Pain relief medication - 100 tablets','Medication',10,200,1),(2,'Band-Aid','Assorted adhesive bandages - 50 count','First Aid',5,300,2),(3,'Toothpaste','Fluoride toothpaste - 6 oz','Personal Care',3,400,3),(4,'Shampoo','Moisturizing shampoo - 12 oz','Personal Care',8,150,4),(5,'rosewater','cleans face','beauty',25,100,1);
/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product_has_Transaction`
--

DROP TABLE IF EXISTS `Product_has_Transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Product_has_Transaction` (
  `Product_idProduct` int NOT NULL,
  `Transaction_idTransaction` int NOT NULL,
  PRIMARY KEY (`Product_idProduct`,`Transaction_idTransaction`),
  KEY `fk_Product_has_Transaction_Transaction1_idx` (`Transaction_idTransaction`),
  KEY `fk_Product_has_Transaction_Product1_idx` (`Product_idProduct`),
  CONSTRAINT `fk_Product_has_Transaction_Product1` FOREIGN KEY (`Product_idProduct`) REFERENCES `Product` (`idProduct`),
  CONSTRAINT `fk_Product_has_Transaction_Transaction1` FOREIGN KEY (`Transaction_idTransaction`) REFERENCES `Transaction` (`idTransaction`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product_has_Transaction`
--

LOCK TABLES `Product_has_Transaction` WRITE;
/*!40000 ALTER TABLE `Product_has_Transaction` DISABLE KEYS */;
INSERT INTO `Product_has_Transaction` VALUES (1,1),(2,2),(3,3),(4,4);
/*!40000 ALTER TABLE `Product_has_Transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductManufacturerDistributor`
--

DROP TABLE IF EXISTS `ProductManufacturerDistributor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ProductManufacturerDistributor` (
  `ManufacturerID` int NOT NULL,
  `DistributorID` varchar(45) NOT NULL,
  `ProductID` varchar(45) NOT NULL,
  PRIMARY KEY (`ManufacturerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductManufacturerDistributor`
--

LOCK TABLES `ProductManufacturerDistributor` WRITE;
/*!40000 ALTER TABLE `ProductManufacturerDistributor` DISABLE KEYS */;
INSERT INTO `ProductManufacturerDistributor` VALUES (1,'Pfizer','1'),(2,'Johnson & Johnson','2'),(3,'Colgate-Palmolive','3'),(4,'Procter & Gamble','4');
/*!40000 ALTER TABLE `ProductManufacturerDistributor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `regularcustomers`
--

DROP TABLE IF EXISTS `regularcustomers`;
/*!50001 DROP VIEW IF EXISTS `regularcustomers`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `regularcustomers` AS SELECT 
 1 AS `fn`,
 1 AS `ln`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Savings`
--

DROP TABLE IF EXISTS `Savings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Savings` (
  `CustomerID` int NOT NULL,
  `Totalpoints` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Savings`
--

LOCK TABLES `Savings` WRITE;
/*!40000 ALTER TABLE `Savings` DISABLE KEYS */;
/*!40000 ALTER TABLE `Savings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Transaction`
--

DROP TABLE IF EXISTS `Transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Transaction` (
  `idTransaction` int NOT NULL,
  `DateOfPurchase` datetime NOT NULL,
  `ProductID` int NOT NULL,
  `Quantity` int NOT NULL,
  `TotalAmount` int NOT NULL,
  `BonusPoints` int DEFAULT NULL,
  `PaymentMethod` varchar(30) NOT NULL,
  `PrescriptionID` int NOT NULL,
  `Customers_CustomerID` int unsigned NOT NULL,
  `Location_idLocation` int NOT NULL,
  PRIMARY KEY (`idTransaction`),
  KEY `fk_Transaction_Customers1_idx` (`Customers_CustomerID`),
  KEY `fk_Transaction_Location1_idx` (`Location_idLocation`),
  CONSTRAINT `fk_Transaction_Customers1` FOREIGN KEY (`Customers_CustomerID`) REFERENCES `Customers` (`CustomerID`),
  CONSTRAINT `fk_Transaction_Location1` FOREIGN KEY (`Location_idLocation`) REFERENCES `Location` (`idLocation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Transaction`
--

LOCK TABLES `Transaction` WRITE;
/*!40000 ALTER TABLE `Transaction` DISABLE KEYS */;
INSERT INTO `Transaction` VALUES (1,'2022-04-23 10:15:00',101,2,200,10,'Credit Card',123,1,1),(2,'2022-04-23 11:30:00',102,1,150,5,'Cash',124,2,2),(3,'2022-04-24 09:45:00',103,3,300,15,'Debit Card',125,3,1),(4,'2022-04-24 12:00:00',104,1,100,0,'Cash',126,4,3);
/*!40000 ALTER TABLE `Transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Virtual`
--

DROP TABLE IF EXISTS `Virtual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Virtual` (
  `MeetingID` int NOT NULL,
  `Link` varchar(45) DEFAULT NULL,
  `Appointments_AppointmentID` int NOT NULL,
  PRIMARY KEY (`MeetingID`),
  KEY `fk_Virtual_Appointments1_idx` (`Appointments_AppointmentID`),
  CONSTRAINT `fk_Virtual_Appointments1` FOREIGN KEY (`Appointments_AppointmentID`) REFERENCES `Appointments` (`AppointmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Virtual`
--

LOCK TABLES `Virtual` WRITE;
/*!40000 ALTER TABLE `Virtual` DISABLE KEYS */;
/*!40000 ALTER TABLE `Virtual` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WorkHistory`
--

DROP TABLE IF EXISTS `WorkHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WorkHistory` (
  `ShiftStart` datetime NOT NULL,
  `ShiftEnd` datetime DEFAULT NULL,
  `DateToday` date DEFAULT NULL,
  `RoleID` int unsigned NOT NULL,
  `DepartmentID` int NOT NULL,
  `Pk` int NOT NULL,
  PRIMARY KEY (`Pk`,`RoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WorkHistory`
--

LOCK TABLES `WorkHistory` WRITE;
/*!40000 ALTER TABLE `WorkHistory` DISABLE KEYS */;
INSERT INTO `WorkHistory` VALUES ('2022-04-25 08:00:00','2022-04-25 16:00:00','2022-04-25',201,301,101),('2022-04-25 09:00:00','2022-04-25 17:00:00','2022-04-25',202,302,102),('2022-04-25 10:00:00','2022-04-25 18:00:00','2022-04-25',203,303,103),('2022-04-25 11:00:00','2022-04-25 19:00:00','2022-04-25',204,304,104);
/*!40000 ALTER TABLE `WorkHistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `marketing`
--

/*!50001 DROP VIEW IF EXISTS `marketing`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `marketing` AS select `e`.`FN` AS `FN`,`e`.`LN` AS `LN`,`e`.`DOB` AS `DOB`,`e`.`Gender` AS `Gender`,`e`.`Age` AS `Age`,`e`.`Email` AS `Email` from (`employee` `e` join `department` `d` on((`d`.`EmployeeRole_WorkHistory_RoleID` = `e`.`WorkHistory_RoleID`))) where (`d`.`Title` = 'Marketing') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `regularcustomers`
--

/*!50001 DROP VIEW IF EXISTS `regularcustomers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `regularcustomers` AS select `c`.`FN` AS `fn`,`c`.`LN` AS `ln` from (`customers` `c` join `transaction` `t` on((`c`.`CustomerID` = `t`.`Customers_CustomerID`))) group by `c`.`CustomerID`,`c`.`FN`,`c`.`LN` having (count(`t`.`Customers_CustomerID`) = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-24 22:18:03
