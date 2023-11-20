CREATE DATABASE  IF NOT EXISTS `virtual_classroom` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `virtual_classroom`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: virtual_classroom
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `audits`
--

DROP TABLE IF EXISTS `audits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audits` (
  `id_log` int NOT NULL AUTO_INCREMENT,
  `entity` varchar(50) NOT NULL,
  `entity_id` int NOT NULL,
  `reg_action` varchar(10) DEFAULT NULL,
  `action_dt` datetime DEFAULT NULL,
  `action_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audits`
--

LOCK TABLES `audits` WRITE;
/*!40000 ALTER TABLE `audits` DISABLE KEYS */;
/*!40000 ALTER TABLE `audits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certifications`
--

DROP TABLE IF EXISTS `certifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `certifications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `course_id` int NOT NULL,
  `img_href` varchar(300) DEFAULT NULL,
  `exp_timedate` datetime DEFAULT NULL,
  `status` enum('planning','planned','in-course','finished') DEFAULT 'planning',
  `observations` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `certifications_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  CONSTRAINT `certifications_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certifications`
--

LOCK TABLES `certifications` WRITE;
/*!40000 ALTER TABLE `certifications` DISABLE KEYS */;
INSERT INTO `certifications` VALUES (1,1,2,NULL,'2023-10-10 00:00:00','finished',NULL),(2,3,1,NULL,'2023-09-09 00:00:00','finished',NULL),(3,1,2,NULL,'2023-08-15 00:00:00','finished',NULL);
/*!40000 ALTER TABLE `certifications` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_insert_certification_aud` AFTER INSERT ON `certifications` FOR EACH ROW BEGIN
	INSERT INTO audits (id_log, entity, entity_id, reg_action, action_dt, action_by)
    VALUES (NULL, 'certification', NEW.id, 'insert', CURRENT_TIMESTAMP(), USER());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_update_certification_aud` AFTER UPDATE ON `certifications` FOR EACH ROW BEGIN
	INSERT INTO audits (id_log, entity, entity_id, reg_action, action_dt, action_by)
    VALUES (NULL, 'certification', NEW.id, 'update', CURRENT_TIMESTAMP(), USER());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_delete_certification_aud` BEFORE DELETE ON `certifications` FOR EACH ROW BEGIN
	INSERT INTO audits (id_log, entity, entity_id, reg_action, action_dt, action_by)
    VALUES (NULL, 'certification', OLD.id, 'delete', CURRENT_TIMESTAMP(), USER());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `code` varchar(3) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `currency` varchar(32) DEFAULT NULL,
  `capital` varchar(50) DEFAULT NULL,
  `continent` varchar(20) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES ('AD','Andorra','376','EUR','Andorra la Vella','Europe'),('AE','United Arab Emirates','971','AED','Abu Dhabi','Asia'),('AF','Afghanistan','93','AFN','Kabul','Asia'),('AG','Antigua and Barbuda','1268','XCD','Saint John\'s','North America'),('AI','Anguilla','1264','XCD','The Valley','North America'),('AL','Albania','355','ALL','Tirana','Europe'),('AM','Armenia','374','AMD','Yerevan','Asia'),('AO','Angola','244','AOA','Luanda','Africa'),('AQ','Antarctica','672',NULL,NULL,'Antarctica'),('AR','Argentina','54','ARS','Buenos Aires','South America'),('AS','American Samoa','1684','USD','Pago Pago','Oceania'),('AT','Austria','43','EUR','Vienna','Europe'),('AU','Australia','61','AUD','Canberra','Oceania'),('AW','Aruba','297','AWG','Oranjestad','North America'),('AX','Åland','358','EUR','Mariehamn','Europe'),('AZ','Azerbaijan','994','AZN','Baku','Asia'),('BA','Bosnia and Herzegovina','387','BAM','Sarajevo','Europe'),('BB','Barbados','1246','BBD','Bridgetown','North America'),('BD','Bangladesh','880','BDT','Dhaka','Asia'),('BE','Belgium','32','EUR','Brussels','Europe'),('BF','Burkina Faso','226','XOF','Ouagadougou','Africa'),('BG','Bulgaria','359','BGN','Sofia','Europe'),('BH','Bahrain','973','BHD','Manama','Asia'),('BI','Burundi','257','BIF','Bujumbura','Africa'),('BJ','Benin','229','XOF','Porto-Novo','Africa'),('BL','Saint Barthélemy','590','EUR','Gustavia','North America'),('BM','Bermuda','1441','BMD','Hamilton','North America'),('BN','Brunei','673','BND','Bandar Seri Begawan','Asia'),('BO','Bolivia','591','BOB,BOV','Sucre','South America'),('BQ','Bonaire','5997','USD','Kralendijk','North America'),('BR','Brazil','55','BRL','Brasília','South America'),('BS','Bahamas','1242','BSD','Nassau','North America'),('BT','Bhutan','975','BTN,INR','Thimphu','Asia'),('BV','Bouvet Island','47','NOK',NULL,'Antarctica'),('BW','Botswana','267','BWP','Gaborone','Africa'),('BY','Belarus','375','BYN','Minsk','Europe'),('BZ','Belize','501','BZD','Belmopan','North America'),('CA','Canada','1','CAD','Ottawa','North America'),('CC','Cocos [Keeling] Islands','61','AUD','West Island','Asia'),('CD','Democratic Republic of the Congo','243','CDF','Kinshasa','Africa'),('CF','Central African Republic','236','XAF','Bangui','Africa'),('CG','Republic of the Congo','242','XAF','Brazzaville','Africa'),('CH','Switzerland','41','CHE,CHF,CHW','Bern','Europe'),('CI','Ivory Coast','225','XOF','Yamoussoukro','Africa'),('CK','Cook Islands','682','NZD','Avarua','Oceania'),('CL','Chile','56','CLF,CLP','Santiago','South America'),('CM','Cameroon','237','XAF','Yaoundé','Africa'),('CN','China','86','CNY','Beijing','Asia'),('CO','Colombia','57','COP','Bogotá','South America'),('CR','Costa Rica','506','CRC','San José','North America'),('CU','Cuba','53','CUC,CUP','Havana','North America'),('CV','Cape Verde','238','CVE','Praia','Africa'),('CW','Curacao','5999','ANG','Willemstad','North America'),('CX','Christmas Island','61','AUD','Flying Fish Cove','Asia'),('CY','Cyprus','357','EUR','Nicosia','Europe'),('CZ','Czech Republic','420','CZK','Prague','Europe'),('DE','Germany','49','EUR','Berlin','Europe'),('DJ','Djibouti','253','DJF','Djibouti','Africa'),('DK','Denmark','45','DKK','Copenhagen','Europe'),('DM','Dominica','1767','XCD','Roseau','North America'),('DO','Dominican Republic','1809,1829,1849','DOP','Santo Domingo','North America'),('DZ','Algeria','213','DZD','Algiers','Africa'),('EC','Ecuador','593','USD','Quito','South America'),('EE','Estonia','372','EUR','Tallinn','Europe'),('EG','Egypt','20','EGP','Cairo','Africa'),('EH','Western Sahara','212','MAD,DZD,MRU','El Aaiún','Africa'),('ER','Eritrea','291','ERN','Asmara','Africa'),('ES','Spain','34','EUR','Madrid','Europe'),('ET','Ethiopia','251','ETB','Addis Ababa','Africa'),('FI','Finland','358','EUR','Helsinki','Europe'),('FJ','Fiji','679','FJD','Suva','Oceania'),('FK','Falkland Islands','500','FKP','Stanley','South America'),('FM','Micronesia','691','USD','Palikir','Oceania'),('FO','Faroe Islands','298','DKK','Tórshavn','Europe'),('FR','France','33','EUR','Paris','Europe'),('GA','Gabon','241','XAF','Libreville','Africa'),('GB','United Kingdom','44','GBP','London','Europe'),('GD','Grenada','1473','XCD','St. George\'s','North America'),('GE','Georgia','995','GEL','Tbilisi','Asia'),('GF','French Guiana','594','EUR','Cayenne','South America'),('GG','Guernsey','44','GBP','St. Peter Port','Europe'),('GH','Ghana','233','GHS','Accra','Africa'),('GI','Gibraltar','350','GIP','Gibraltar','Europe'),('GL','Greenland','299','DKK','Nuuk','North America'),('GM','Gambia','220','GMD','Banjul','Africa'),('GN','Guinea','224','GNF','Conakry','Africa'),('GP','Guadeloupe','590','EUR','Basse-Terre','North America'),('GQ','Equatorial Guinea','240','XAF','Malabo','Africa'),('GR','Greece','30','EUR','Athens','Europe'),('GS','South Georgia and the South Sandwich Islands','500','GBP','King Edward Point','Antarctica'),('GT','Guatemala','502','GTQ','Guatemala City','North America'),('GU','Guam','1671','USD','Hagåtña','Oceania'),('GW','Guinea-Bissau','245','XOF','Bissau','Africa'),('GY','Guyana','592','GYD','Georgetown','South America'),('HK','Hong Kong','852','HKD','City of Victoria','Asia'),('HM','Heard Island and McDonald Islands','61','AUD',NULL,'Antarctica'),('HN','Honduras','504','HNL','Tegucigalpa','North America'),('HR','Croatia','385','HRK','Zagreb','Europe'),('HT','Haiti','509','HTG,USD','Port-au-Prince','North America'),('HU','Hungary','36','HUF','Budapest','Europe'),('ID','Indonesia','62','IDR','Jakarta','Asia'),('IE','Ireland','353','EUR','Dublin','Europe'),('IL','Israel','972','ILS','Jerusalem','Asia'),('IM','Isle of Man','44','GBP','Douglas','Europe'),('IN','India','91','INR','New Delhi','Asia'),('IO','British Indian Ocean Territory','246','USD','Diego Garcia','Asia'),('IQ','Iraq','964','IQD','Baghdad','Asia'),('IR','Iran','98','IRR','Tehran','Asia'),('IS','Iceland','354','ISK','Reykjavik','Europe'),('IT','Italy','39','EUR','Rome','Europe'),('JE','Jersey','44','GBP','Saint Helier','Europe'),('JM','Jamaica','1876','JMD','Kingston','North America'),('JO','Jordan','962','JOD','Amman','Asia'),('JP','Japan','81','JPY','Tokyo','Asia'),('KE','Kenya','254','KES','Nairobi','Africa'),('KG','Kyrgyzstan','996','KGS','Bishkek','Asia'),('KH','Cambodia','855','KHR','Phnom Penh','Asia'),('KI','Kiribati','686','AUD','South Tarawa','Oceania'),('KM','Comoros','269','KMF','Moroni','Africa'),('KN','Saint Kitts and Nevis','1869','XCD','Basseterre','North America'),('KP','North Korea','850','KPW','Pyongyang','Asia'),('KR','South Korea','82','KRW','Seoul','Asia'),('KW','Kuwait','965','KWD','Kuwait City','Asia'),('KY','Cayman Islands','1345','KYD','George Town','North America'),('KZ','Kazakhstan','76,77','KZT','Astana','Asia'),('LA','Laos','856','LAK','Vientiane','Asia'),('LB','Lebanon','961','LBP','Beirut','Asia'),('LC','Saint Lucia','1758','XCD','Castries','North America'),('LI','Liechtenstein','423','CHF','Vaduz','Europe'),('LK','Sri Lanka','94','LKR','Colombo','Asia'),('LR','Liberia','231','LRD','Monrovia','Africa'),('LS','Lesotho','266','LSL,ZAR','Maseru','Africa'),('LT','Lithuania','370','EUR','Vilnius','Europe'),('LU','Luxembourg','352','EUR','Luxembourg','Europe'),('LV','Latvia','371','EUR','Riga','Europe'),('LY','Libya','218','LYD','Tripoli','Africa'),('MA','Morocco','212','MAD','Rabat','Africa'),('MC','Monaco','377','EUR','Monaco','Europe'),('MD','Moldova','373','MDL','Chișinău','Europe'),('ME','Montenegro','382','EUR','Podgorica','Europe'),('MF','Saint Martin','590','EUR','Marigot','North America'),('MG','Madagascar','261','MGA','Antananarivo','Africa'),('MH','Marshall Islands','692','USD','Majuro','Oceania'),('MK','North Macedonia','389','MKD','Skopje','Europe'),('ML','Mali','223','XOF','Bamako','Africa'),('MM','Myanmar [Burma]','95','MMK','Naypyidaw','Asia'),('MN','Mongolia','976','MNT','Ulan Bator','Asia'),('MO','Macao','853','MOP',NULL,'Asia'),('MP','Northern Mariana Islands','1670','USD','Saipan','Oceania'),('MQ','Martinique','596','EUR','Fort-de-France','North America'),('MR','Mauritania','222','MRU','Nouakchott','Africa'),('MS','Montserrat','1664','XCD','Plymouth','North America'),('MT','Malta','356','EUR','Valletta','Europe'),('MU','Mauritius','230','MUR','Port Louis','Africa'),('MV','Maldives','960','MVR','Malé','Asia'),('MW','Malawi','265','MWK','Lilongwe','Africa'),('MX','Mexico','52','MXN','Mexico City','North America'),('MY','Malaysia','60','MYR','Kuala Lumpur','Asia'),('MZ','Mozambique','258','MZN','Maputo','Africa'),('NA','Namibia','264','NAD,ZAR','Windhoek','Africa'),('NC','New Caledonia','687','XPF','Nouméa','Oceania'),('NE','Niger','227','XOF','Niamey','Africa'),('NF','Norfolk Island','672','AUD','Kingston','Oceania'),('NG','Nigeria','234','NGN','Abuja','Africa'),('NI','Nicaragua','505','NIO','Managua','North America'),('NL','Netherlands','31','EUR','Amsterdam','Europe'),('NO','Norway','47','NOK','Oslo','Europe'),('NP','Nepal','977','NPR','Kathmandu','Asia'),('NR','Nauru','674','AUD','Yaren','Oceania'),('NU','Niue','683','NZD','Alofi','Oceania'),('NZ','New Zealand','64','NZD','Wellington','Oceania'),('OM','Oman','968','OMR','Muscat','Asia'),('PA','Panama','507','PAB,USD','Panama City','North America'),('PE','Peru','51','PEN','Lima','South America'),('PF','French Polynesia','689','XPF','Papeetē','Oceania'),('PG','Papua New Guinea','675','PGK','Port Moresby','Oceania'),('PH','Philippines','63','PHP','Manila','Asia'),('PK','Pakistan','92','PKR','Islamabad','Asia'),('PL','Poland','48','PLN','Warsaw','Europe'),('PM','Saint Pierre and Miquelon','508','EUR','Saint-Pierre','North America'),('PN','Pitcairn Islands','64','NZD','Adamstown','Oceania'),('PR','Puerto Rico','1787,1939','USD','San Juan','North America'),('PS','Palestine','970','ILS','Ramallah','Asia'),('PT','Portugal','351','EUR','Lisbon','Europe'),('PW','Palau','680','USD','Ngerulmud','Oceania'),('PY','Paraguay','595','PYG','Asunción','South America'),('QA','Qatar','974','QAR','Doha','Asia'),('RE','Réunion','262','EUR','Saint-Denis','Africa'),('RO','Romania','40','RON','Bucharest','Europe'),('RS','Serbia','381','RSD','Belgrade','Europe'),('RU','Russia','7','RUB','Moscow','Europe'),('RW','Rwanda','250','RWF','Kigali','Africa'),('SA','Saudi Arabia','966','SAR','Riyadh','Asia'),('SB','Solomon Islands','677','SBD','Honiara','Oceania'),('SC','Seychelles','248','SCR','Victoria','Africa'),('SD','Sudan','249','SDG','Khartoum','Africa'),('SE','Sweden','46','SEK','Stockholm','Europe'),('SG','Singapore','65','SGD','Singapore','Asia'),('SH','Saint Helena','290','SHP','Jamestown','Africa'),('SI','Slovenia','386','EUR','Ljubljana','Europe'),('SJ','Svalbard and Jan Mayen','4779','NOK','Longyearbyen','Europe'),('SK','Slovakia','421','EUR','Bratislava','Europe'),('SL','Sierra Leone','232','SLL','Freetown','Africa'),('SM','San Marino','378','EUR','City of San Marino','Europe'),('SN','Senegal','221','XOF','Dakar','Africa'),('SO','Somalia','252','SOS','Mogadishu','Africa'),('SR','Suriname','597','SRD','Paramaribo','South America'),('SS','South Sudan','211','SSP','Juba','Africa'),('ST','São Tomé and Príncipe','239','STN','São Tomé','Africa'),('SV','El Salvador','503','SVC,USD','San Salvador','North America'),('SX','Sint Maarten','1721','ANG','Philipsburg','North America'),('SY','Syria','963','SYP','Damascus','Asia'),('SZ','Swaziland','268','SZL','Lobamba','Africa'),('TC','Turks and Caicos Islands','1649','USD','Cockburn Town','North America'),('TD','Chad','235','XAF','N\'Djamena','Africa'),('TF','French Southern Territories','262','EUR','Port-aux-Français','Antarctica'),('TG','Togo','228','XOF','Lomé','Africa'),('TH','Thailand','66','THB','Bangkok','Asia'),('TJ','Tajikistan','992','TJS','Dushanbe','Asia'),('TK','Tokelau','690','NZD','Fakaofo','Oceania'),('TL','East Timor','670','USD','Dili','Oceania'),('TM','Turkmenistan','993','TMT','Ashgabat','Asia'),('TN','Tunisia','216','TND','Tunis','Africa'),('TO','Tonga','676','TOP','Nuku\'alofa','Oceania'),('TR','Turkey','90','TRY','Ankara','Asia'),('TT','Trinidad and Tobago','1868','TTD','Port of Spain','North America'),('TV','Tuvalu','688','AUD','Funafuti','Oceania'),('TW','Taiwan','886','TWD','Taipei','Asia'),('TZ','Tanzania','255','TZS','Dodoma','Africa'),('UA','Ukraine','380','UAH','Kyiv','Europe'),('UG','Uganda','256','UGX','Kampala','Africa'),('UM','U.S. Minor Outlying Islands','1','USD',NULL,'Oceania'),('US','United States','1','USD,USN,USS','Washington D.C.','North America'),('UY','Uruguay','598','UYI,UYU','Montevideo','South America'),('UZ','Uzbekistan','998','UZS','Tashkent','Asia'),('VA','Vatican City','39066,379','EUR','Vatican City','Europe'),('VC','Saint Vincent and the Grenadines','1784','XCD','Kingstown','North America'),('VE','Venezuela','58','VES','Caracas','South America'),('VG','British Virgin Islands','1284','USD','Road Town','North America'),('VI','U.S. Virgin Islands','1340','USD','Charlotte Amalie','North America'),('VN','Vietnam','84','VND','Hanoi','Asia'),('VU','Vanuatu','678','VUV','Port Vila','Oceania'),('WF','Wallis and Futuna','681','XPF','Mata-Utu','Oceania'),('WS','Samoa','685','WST','Apia','Oceania'),('XK','Kosovo','377,381,383,386','EUR','Pristina','Europe'),('YE','Yemen','967','YER','Sana\'a','Asia'),('YT','Mayotte','262','EUR','Mamoudzou','Africa'),('ZA','South Africa','27','ZAR','Pretoria','Africa'),('ZM','Zambia','260','ZMK','Lusaka','Africa'),('ZW','Zimbabwe','263','USD,ZAR,BWP,GBP,AUD,CNY,INR,JPY','Harare','Africa');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries_subdivisions`
--

DROP TABLE IF EXISTS `countries_subdivisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries_subdivisions` (
  `country_code` varchar(3) NOT NULL,
  `code` varchar(3) NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` varchar(50) NOT NULL,
  KEY `country_code` (`country_code`),
  KEY `countries_subdivisions_index` (`code`),
  CONSTRAINT `countries_subdivisions_ibfk_1` FOREIGN KEY (`country_code`) REFERENCES `countries` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries_subdivisions`
--

LOCK TABLES `countries_subdivisions` WRITE;
/*!40000 ALTER TABLE `countries_subdivisions` DISABLE KEYS */;
INSERT INTO `countries_subdivisions` VALUES ('MG','F','Fianarantsoa','Province'),('MG','T','Antananarivo','Province'),('MG','U','Toliara','Province'),('MG','D','Antsiranana','Province'),('MG','M','Mahajanga','Province'),('MG','A','Toamasina','Province'),('ST','P','Pr�ncipe','Province'),('ST','S','São Tomé','Province'),('FJ','5','Lau','Province'),('FJ','6','Lomaiviti','Province'),('FJ','12','Rewa','Province'),('FJ','R','Rotuma','Dependency'),('FJ','1','Ba','Province'),('FJ','4','Kadavu','Province'),('FJ','8','Nadroga and Navosa','Province'),('FJ','13','Serua','Province'),('FJ','2','Bua','Province'),('FJ','3','Cakaudrove','Province'),('FJ','9','Naitasiri','Province'),('FJ','11','Ra','Province'),('FJ','7','Macuata','Province'),('FJ','14','Tailevu','Province'),('FJ','10','Namosi','Province'),('SO','GE','Gedo','Region'),('SO','SD','Shabeellaha Dhexe','Region'),('SO','SH','Shabeellaha Hoose','Region'),('SO','SO','Sool','Region'),('SO','BK','Bakool','Region'),('SO','BY','Bay','Region'),('SO','HI','Hiiraan','Region'),('SO','MU','Mudug','Region'),('SO','JH','Jubbada Hoose','Region'),('SO','SA','Sanaag','Region'),('SO','NU','Nugaal','Region'),('SO','WO','Woqooyi Galbeed','Region'),('SO','BR','Bari','Region'),('SO','TO','Togdheer','Region'),('SO','AW','Awdal','Region'),('SO','JD','Jubbada Dhexe','Region'),('SO','GA','Galguduud','Region'),('SO','BN','Banaadir','Region'),('CY','2','Lemesos','District'),('CY','3','Larnaka','District'),('CY','4','Ammochostos','District'),('CY','6','Keryneia','District'),('CY','1','Lefkosia','District'),('CY','5','Pafos','District'),('MR','6','Trarza','Region'),('MR','5','Brakna','Region'),('MR','8','Dakhlet Nou�dhibou','Region'),('MR','2','Hodh el Gharbi','Region'),('MR','13','Nouakchott Ouest','region'),('MR','3','Assaba','Region'),('MR','7','Adrar','Region'),('MR','9','Tagant','Region'),('MR','11','Tiris Zemmour','Region'),('MR','4','Gorgol','Region'),('MR','14','Nouakchott Nord','region'),('MR','12','Inchiri','Region'),('MR','1','Hodh ech Chargui','Region'),('MR','10','Guidimaka','Region'),('MR','15','Nouakchott Sud','region'),('SE','M','Sk�ne l_n','County'),('SE','H','Kalmar l_n','County'),('SE','C','Uppsala l_n','County'),('SE','F','J_nk_pings l_n','County'),('SE','O','V_stra G_talands l_n','County'),('SE','AB','Stockholms l_n','County'),('SE','G','Kronoborgs l_n','County'),('SE','N','Hallands l_n','County'),('SE','AC','V_sterbottens l_n','County'),('SE','I','Gotlands l_n','County'),('SE','S','V_rmlands l_n','County'),('SE','E','�sterg_tlands l_n','County'),('SE','T','�rebro l_n','County'),('SE','D','S_dermanlands l_n','County'),('SE','BD','Norrbottens l_n','County'),('SE','Y','V_sternorrlands l_n','County'),('SE','U','V_stmanlands l_n','County'),('SE','K','Blekinge l_n','County'),('SE','Z','J_mtlands l_n','County'),('SE','X','G_vleborgs l_n','County'),('SE','W','Dalarnes l_n','County'),('BB','2','Saint Andrew','Parish'),('BB','7','Saint Lucy','Parish'),('BB','1','Christ Church','Parish'),('BB','9','Saint Peter','Parish'),('BB','3','Saint George','Parish'),('BB','4','Saint James','Parish'),('BB','5','Saint John','Parish'),('BB','11','Saint Thomas','Parish'),('BB','8','Saint Michael','Parish'),('BB','6','Saint Joseph','Parish'),('BB','10','Saint Philip','Parish'),('SK','PV','Pre_ovsk_ kraj','Region'),('SK','NI','Nitriansky kraj','Region'),('SK','TC','Trenciansky kraj','Region'),('SK','ZI','_ilinsk_ kraj','Region'),('SK','KI','Ko_ick_ kraj','Region'),('SK','BL','Bratislavsk_ kraj','Region'),('SK','BC','Banskobystrick_ kraj','Region'),('SK','TA','Trnavsk_ kraj','Region'),('GA','2','Haut-Ogoou_','Province'),('GA','8','Ogoou_-Maritime','Province'),('GA','4','Ngouni_','Province'),('GA','5','Nyanga','Province'),('GA','1','Estuaire','Province'),('GA','6','Ogoou_-Ivindo','Province'),('GA','7','Ogoou_-Lolo','Province'),('GA','3','Moyen-Ogoou_','Province'),('GA','9','Woleu-Ntem','Province'),('NZ','MBH','Marlborough','region'),('NZ','NTL','Northland','Region'),('NZ','CAN','Canterbury','Region'),('NZ','WKO','Waikato','Region'),('NZ','MWT','Manawatu-Wanganui','Region'),('NZ','OTA','Otago','Region'),('NZ','HKB','Hawkes\'s Bay','Region'),('NZ','WGN','Wellington','Region'),('NZ','STL','Southland','Region'),('NZ','NSN','	Nelson','region'),('NZ','GIS','Gisborne','region'),('NZ','CIT','Chatham Islands Territory','Special Island Authorithy'),('NZ','WTC','West Coast','Region'),('NZ','TAS','	Tasman','Region'),('NZ','AUK','Auckland','region'),('NZ','BOP','Bay of Plenty','Region'),('NZ','TKI','Taranaki','Region'),('DK','85','Sj_lland','Region'),('DK','84','Hovedstaden','Region'),('DK','83','Syddanmark','Region'),('DK','81','Nordjylland','Region'),('DK','82','Midtjylland','Region'),('PY','11','Central','Department'),('PY','10','Alto Paran�','Department'),('PY','12','�eembuc�','Department'),('PY','15','Presidente Hayes','Department'),('PY','1','Concepci�n','Department'),('PY','3','Cordillera','Department'),('PY','7','Itap�a','Department'),('PY','19','Boquer�n','Department'),('PY','16','Alto Paraguay','Department'),('PY','ASU','Asunci�n','Capital'),('PY','13','Amambay','Department'),('PY','14','Canindey�','Department'),('PY','9','Paraguar�','Department'),('PY','8','Misiones','Department'),('PY','2','San Pedro','Department'),('PY','4','Guair�','Department'),('PY','5','Caaguaz�','Department'),('PY','6','Caazap�','Department'),('IL','M','Al Awsat','District'),('IL','TA','Tel-Aviv','District'),('IL','D','Al Janubi','District'),('IL','Z','Ash Shamali','District'),('IL','HA','H_efa','District'),('IL','JM','Yerushalayim','District'),('LU','CL','Clervaux','canton'),('LU','ME','Mersch','canton'),('LU','RM','Remich','canton'),('LU','LU','Luxembourg','canton'),('LU','DI','Diekirch','canton'),('LU','GR','Gr_ivemaacher','canton'),('LU','WI','Wiltz','canton'),('LU','CA','Capellen','canton'),('LU','RD','Redange','canton'),('LU','VD','Vianden','canton'),('LU','EC','Echternach','canton'),('LU','ES','Esch-sur-Alzette','canton'),('RO','AG','Arges','Departments'),('RO','CV','Covasna','Departments'),('RO','CS','Caras-Severin','Departments'),('RO','BN','Bistrita-Nasaud','Departments'),('RO','CJ','Cluj','Departments'),('RO','IS','Iasi','Departments'),('RO','BZ','Buzau','Departments'),('RO','CL','Calarasi','Departments'),('RO','CT','Constarta','Departments'),('RO','BV','Brasov','Departments'),('RO','BT','Botosani','Departments'),('RO','GJ','Gorj','Departments'),('RO','DJ','Dolj','Departments'),('RO','MM','Maramures','Departments'),('RO','NT','Neamt','Departments'),('RO','IL','Ialomita','Departments'),('RO','AB','Alba','Departments'),('RO','BR','Braila','Departments'),('RO','GL','Galati','Departments'),('RO','AR','Arad','Departments'),('RO','DB','D�mbovita','Departments'),('RO','B','Bucuresti','Municipality'),('RO','HD','Hunedoara','Departments'),('RO','BC','Bacau','Departments'),('RO','HR','Harghita','Departments'),('RO','MH','Mehedinti','Departments'),('RO','BH','Bihor','Departments'),('RO','SV','Suceava','Departments'),('RO','VL','V�lcea','Departments'),('RO','SB','Sibiu','Departments'),('RO','GR','Giurgiu','Departments'),('RO','TL','Tulcea','Departments'),('RO','SM','Satu Mare','Departments'),('RO','MS','Mures','Departments'),('RO','TM','Timis','Departments'),('RO','IF','Ilfov','Departments'),('RO','TR','Teleorman','Departments'),('RO','VN','Vrancea','Departments'),('RO','SJ','Salaj','Departments'),('RO','OT','Olt','Departments'),('RO','PH','Prahova','Departments'),('RO','VS','Vaslui','Departments'),('IS','1','H_fu_borgarsv__i','Region'),('IS','4','Vestfir_ir','Region'),('IS','3','Vesturland','Region'),('IS','8','Su_urland','Region'),('IS','5','Nor_urland vestra','Region'),('IS','2','Su_urnes','Region'),('IS','7','Austurland','Region'),('IS','6','Nor_urland eystra','Region'),('ES','CO','Córdoba','Province'),('ES','SE','Sevilla','Province'),('ES','BA','Badajoz','Province'),('ES','TO','Toledo','Province'),('ES','A','Alicante / Alacant','Province'),('ES','C','A Coruña  [La Coruña]','Province'),('ES','T','Tarragona  [Tarragona]','Province'),('ES','CC','Cáceres','Province'),('ES','LE','León','Province'),('ES','CS','Castellón / Castelló','Province'),('ES','AL','Almería','Province'),('ES','AV','Ávila','Province'),('ES','CU','Cuenca','Province'),('ES','BU','Burgos','Province'),('ES','CR','Ciudad Real','Province'),('ES','TF','Santa Cruz de Tenerife','Province'),('ES','SG','Segovia','Province'),('ES','HU','Huesca','Province'),('ES','GU','Guadalajara','Province'),('ES','AB','Albacete','Province'),('ES','SO','Soria','Province'),('ES','GR','Granada','Province'),('ES','J','Ja_n','Province'),('ES','S','Cantabria','Province'),('ES','CE','Ceuta','Autonomous city in North Africa'),('ES','O','Asturias','Province'),('ES','PM','Balears  [Baleares]','Province'),('ES','V','Valencia / València','Province'),('ES','BI','Biskaia','Province'),('ES','SS','Gipuzkoa','Province'),('ES','MA','Málaga','Province'),('ES','LU','Lugo  [Lugo]','Province'),('ES','B','Barcelona  [Barcelona]','Province'),('ES','NA','Navarra / Nafarroa','Province'),('ES','VI','Álava / Araba','Province'),('ES','OR','Ourense  [Orense]','Province'),('ES','SA','Salamanca','Province'),('ES','TE','Teruel','Province'),('ES','H','Huelva','Province'),('ES','ZA','Zamora','Province'),('ES','LO','La Rioja','Province'),('ES','P','Palencia','Province'),('ES','Z','Zaragoza','Province'),('ES','MU','Murcia','Province'),('ES','ML','Melilla','Autonomous city in North Africa'),('ES','CA','Cádiz','Province'),('ES','GI','Girona  [Gerona]','Province'),('ES','PO','Pontevedra  [Pontevedra]','Province'),('ES','GC','Las Palmas','Province'),('ES','L','Lleida  [L_rida]','Province'),('ES','M','Madrid','Province'),('ES','VA','Valladolid','Province'),('CG','9','Niari','Department'),('CG','5','Kouilou','Department'),('CG','14','Plateaux','Department'),('CG','12','Pool','Department'),('CG','11','Bouenza','Department'),('CG','16','Pointe-Noire','Department'),('CG','7','Likouala','Department'),('CG','BZV','Brazzaville','Department'),('CG','15','Cuvette-Ouest','Department'),('CG','13','Sangha','Department'),('CG','2','L_koumou','Department'),('CG','8','Cuvette','Department'),('BY','HO','Homyel\'skaya voblasts\' (be) - Gomel\'skaya oblast\' (ru)','Oblast'),('BY','HR','Hrodzenskaya voblasts\' (be) - Grodnenskaya oblast\' (ru)','Oblast'),('BY','BR','Bresckaja voblasc (be) - Brestskaja oblast\' (ru)','Oblast'),('BY','MA','Mahilyowskaya voblasts\' (be) - Mogilevskaya oblast\' (ru)','Oblast'),('BY','MI','Minskaya voblasts\' (be) - Minskaya oblast\' (ru)','Oblast'),('BY','HM','Horad Minsk','City'),('BY','VI','Vitsyebskaya voblasts\' (be) - Vitebskaya oblast\' (ru)','Oblast'),('BS','MI','Moore\'s Island','District'),('BS','EX','Exuma','District'),('BS','NO','North Abaco','District'),('BS','NE','North Eleuthera','District'),('BS','BI','Bimini','District'),('BS','BP','Black Point','District'),('BS','CE','Central Eleuthera','District'),('BS','GC','Grand Cay','District'),('BS','HT','Hope Town','District'),('BS','MG','Mayaguana','District'),('BS','CK','Crooked Island and Long Cay','District'),('BS','SW','Spanish Wells','District'),('BS','SO','South Abaco','District'),('BS','RI','Ragged Island','District'),('BS','NS','North Andros','District'),('BS','NP','New Providence','Island'),('BS','AK','Acklins','District'),('BS','WG','West Grand Bahama','District'),('BS','CO','Central Abaco','District'),('BS','CI','Cat Island','District'),('BS','SS','San Salvador','District'),('BS','IN','Inagua','District'),('BS','CS','Central Andros','District'),('BS','LI','Long Island','District'),('BS','EG','East Grand Bahama','District'),('BS','RC','Rum Cay','District'),('BS','HI','Harbour Island','District'),('BS','FP','City of Freeport','District'),('BS','SA','South Andros','District'),('BS','MC','Mangrove Cay','District'),('BS','BY','Berry Islands','District'),('BS','SE','South Eleuthera','District'),('TN','52','Monastir','Governorate'),('TN','13','Ben Arous','Governorate'),('TN','12','L\'Ariana','Governorate'),('TN','51','Sousse','Governorate'),('TN','11','Tunis','Governorate'),('TN','32','Jendouba','Governorate'),('TN','23','Bizerte','Governorate'),('TN','34','Siliana','Governorate'),('TN','31','B_ja','Governorate'),('TN','53','Mahdia','Governorate'),('TN','82','M_denine','Governorate'),('TN','42','Kasserine','Governorate'),('TN','14','La Manouba','Governorate'),('TN','22','Zaghouan','Governorate'),('TN','43','Sidi Bouzid','Governorate'),('TN','61','Sfax','Governorate'),('TN','41','Kairouan','Governorate'),('TN','73','	K_bili','Governorate'),('TN','83','Tataouine','Governorate'),('TN','21','Nabeul','Governorate'),('TN','72','Tozeur','Governorate'),('TN','33','Le Kef','Governorate'),('TN','81','Gab�s','Governorate'),('TN','71','Gafsa','Governorate'),('MN','69','Bayanhongor','Province'),('MN','67','Bulgan','Province'),('MN','35','Orhon','Province'),('MN','46','Uvs','Province'),('MN','39','Hentiy','Province'),('MN','1','Ulaanbaatar','Capital city'),('MN','49','Selenge','Province'),('MN','55','�v_rhangay','Province'),('MN','57','Dzavhan','Province'),('MN','51','S�hbaatar','Province'),('MN','37','Darhan uul','Province'),('MN','61','Dornod','Province'),('MN','63','Dornogovi','Province'),('MN','53','�mn_govi','Province'),('MN','43','Hovd','Province'),('MN','47','T_v','Province'),('MN','41','H_vag_l','Province'),('MN','59','Dundgovi','Province'),('MN','71','Bayan-�lgiy','Province'),('MN','64','Govi-S�mber','Province'),('MN','73','Arhangay','Province'),('MN','65','Govi-Altay','Province'),('SB','CH','Choiseul','Province'),('SB','CT','Capital Territory (Honiara)','Capital territory'),('SB','CE','Central','Province'),('SB','IS','Isabel','Province'),('SB','ML','Malaita','Province'),('SB','GU','Guadalcanal','Province'),('SB','WE','Western','Province'),('SB','MK','Makira-Ulawa','Province'),('SB','TE','Temotu','Province'),('SB','RB','Rennell and Bellona','Province'),('CD','KC','Kasa� Central','Province'),('CD','MA','Maniema','Province'),('CD','BC','Kongo Central','Province'),('CD','LO','Lomami','Province'),('CD','KG','Kwango','Province'),('CD','KS','Kasa�','Province'),('CD','NK','Nord-Kivu','Province'),('CD','EQ','�quateur','Province'),('CD','NU','Nord-Ubangi','Province'),('CD','HK','Haut-Katanga','Province'),('CD','KN','Kinshasa','City'),('CD','BU','Bas-U_l_','Province'),('CD','IT','Ituri','Province'),('CD','KE','Kasa� Oriental','Province'),('CD','KL','Kwilu','Province'),('CD','MN','Mai-Ndombe','Province'),('CD','MO','Mongala','Province'),('CD','HU','Haut-U_l_','Province'),('CD','LU','Lualaba','Province'),('CD','TO','Tshopo','Province'),('CD','HL','Haut-Lomami','Province'),('CD','SA','Sankuru','Province'),('CD','SK','Sud-Kivu','Province'),('CD','SU','Sud-Ubangi','Province'),('CD','TA','Tanganyika','Province'),('CD','TU','Tshuapa','Province'),('SM','8','Montegiardino','Municipality'),('SM','7','San Marino','Municipality'),('SM','2','Chiesanuova','Municipality'),('SM','4','Faetano','Municipality'),('SM','6','Borgo Maggiore','Municipality'),('SM','5','Fiorentino','Municipality'),('SM','9','Serravalle','Municipality'),('SM','3','Domagnano','Municipality'),('SM','1','Acquaviva','Municipality'),('GD','4','Saint John','Parish'),('GD','6','Saint Patrick','Parish'),('GD','1','Saint Andrew','Parish'),('GD','10','Southern Grenadine Islands','Dependency'),('GD','2','Saint David','Parish'),('GD','5','Saint Mark','Parish'),('GD','3','Saint George','Parish'),('PE','LIM','Lima','Region'),('PE','ARE','Arequipa','Region'),('PE','AMA','Amazonas','Region'),('PE','CAJ','Cajamarca','Region'),('PE','CUS','Cuzco [Cusco]','Region'),('PE','HUV','Huancavelica','Region'),('PE','LAL','La Libertad','Region'),('PE','HUC','Hu�nuco','Region'),('PE','LAM','Lambayeque','Region'),('PE','AYA','Ayacucho','Region'),('PE','ANC','Ancash','Region'),('PE','APU','Apur�mac','Region'),('PE','CAL','El Callao','Region'),('PE','PUN','Puno','Region'),('PE','MOQ','Moquegua','Region'),('PE','LOR','Loreto','Region'),('PE','TAC','Tacna','Region'),('PE','JUN','Jun�n','Region'),('PE','PAS','Pasco','Region'),('PE','UCA','Ucayali','Region'),('PE','MDD','Madre de Dios','Region'),('PE','ICA','Ica','Region'),('PE','PIU','Piura','Region'),('PE','LMA','Lima hatun llaqta','Municipality'),('PE','TUM','Tumbes','Region'),('PE','SAM','San Mart�n','Region'),('DZ','4','Oum el Bouaghi','Province'),('DZ','16','Alger','Province'),('DZ','35','Boumerd�s','Province'),('DZ','6','B_ja�a','Province'),('DZ','14','Tiaret','Province'),('DZ','45','Naama','Province'),('DZ','40','Khenchela','Province'),('DZ','7','Biskra','Province'),('DZ','32','El Bayadh','Province'),('DZ','13','Tlemcen','Province'),('DZ','5','Batna','Province'),('DZ','48','Relizane','Province'),('DZ','23','Annaba','Province'),('DZ','37','Tindouf','Province'),('DZ','42','Tipaza','Province'),('DZ','15','Tizi Ouzou','Province'),('DZ','11','Tamanrasset','Province'),('DZ','44','A�n Defla','Province'),('DZ','27','Mostaganem','Province'),('DZ','17','Djelfa','Province'),('DZ','43','Mila','Province'),('DZ','2','Chlef','Province'),('DZ','1','Adrar','Province'),('DZ','19','S_tif','Province'),('DZ','8','B_char','Province'),('DZ','18','Jijel','Province'),('DZ','36','El Tarf','Province'),('DZ','34','Bordj Bou Arr_ridj','Province'),('DZ','30','Ouargla','Province'),('DZ','22','Sidi Bel Abb�s','Province'),('DZ','10','Bouira','Province'),('DZ','38','Tissemsilt','Province'),('DZ','12','T_bessa','Province'),('DZ','47','Gharda�a','Province'),('DZ','31','Oran','Province'),('DZ','21','Skikda','Province'),('DZ','28','M\'sila','Province'),('DZ','24','Guelma','Province'),('DZ','46','A�n T_mouchent','Province'),('DZ','3','Laghouat','Province'),('DZ','25','Constantine','Province'),('DZ','9','Blida','Province'),('DZ','20','Sa�da','Province'),('DZ','29','Mascara','Province'),('DZ','26','M_d_a','Province'),('DZ','33','Illizi','Province'),('DZ','39','El Oued','Province'),('DZ','41','Souk Ahras','Province'),('TD','EO','Ennedi-Ouest','Region'),('TD','BA','Batha','Region'),('TD','LO','Logone-Occidental','Region'),('TD','BO','Burku','Region'),('TD','CB','Chari-Baguirmi','Region'),('TD','HL','Hadjer Lamis','Region'),('TD','EE','Ennedi-Est','Region'),('TD','LC','Lac','Region'),('TD','GR','Gu_ra','Region'),('TD','KA','Kanem','Region'),('TD','BG','Ba?r al Ghazal','Region'),('TD','MA','Mandoul','Region'),('TD','MC','Moyen-Chari','Region'),('TD','TI','Tibasti','Region'),('TD','MO','Mayo-Kebbi-Ouest','Region'),('TD','SA','Salamat','Region'),('TD','OD','Ouadda�','Region'),('TD','TA','Tandjil_','Region'),('TD','ND','Ville de Ndjamena','Region'),('TD','WF','Wadi Fira','Region'),('TD','SI','Sila','Region'),('TD','ME','Mayo-Kebbi-Est','Region'),('TD','LR','Logone-Oriental','Region'),('AU','NSW','New South Wales','State'),('AU','ACT','Australian Capital Territory','Territory'),('AU','VIC','Victoria','State'),('AU','NT','Northern Territory','Territory'),('AU','SA','South Australia','State'),('AU','TAS','Tasmania','State'),('AU','WA','Western Australia','State'),('AU','QLD','Queensland','State'),('AL','11','Tirana','County'),('AL','12','Vlorë','County'),('AL','8','Lezhë','County'),('AL','7','Kukës','County'),('AL','5','Gjirokastër','County'),('AL','9','Dibër','County'),('AL','3','Elbasan','County'),('AL','4','Fier','County'),('AL','6','Korçë','County'),('AL','1','Berat','County'),('AL','10','Shkodër','County'),('AL','2','Durrës','County'),('MZ','N','Nampula','Province'),('MZ','S','Sofala','Province'),('MZ','G','Gaza','Province'),('MZ','MPM','Maputo','City'),('MZ','T','Tete','Province'),('MZ','P','Cabo Delgado','Province'),('MZ','Q','Zamb_zia','Province'),('MZ','L','Maputo','Province'),('MZ','A','Niaosa','Province'),('MZ','B','Manica','Province'),('MZ','I','Inhambane','Province'),('NL','NH','Noord-Holland','Province'),('NL','GR','Groningen','Province'),('NL','ZH','Zuid-Holland','Province'),('NL','UT','Utrecht','Province'),('NL','FL','Flevoland','Province'),('NL','NB','Noord-Brabant','Province'),('NL','LI','Limburg','Province'),('NL','DR','Drenthe','Province'),('NL','FR','Frysl�n','Province'),('NL','ZE','Zeeland','Province'),('NL','GE','Gelderland','Province'),('NL','OV','Overijssel','Province'),('LK','21','Kandy','District'),('LK','13','Kalutara','District'),('LK','11','Colombo','District'),('LK','82','Monaragala','District'),('LK','91','Ratnapura','District'),('LK','45','Mullaittivu','District'),('LK','51','Batticaloa','District'),('LK','41','Jaffna','District'),('LK','53','Trincomalee','District'),('LK','44','Vavuniya','District'),('LK','43','Mannar','District'),('LK','5','N_?genahira pa?ata','Province'),('LK','33','Hambantota','District'),('LK','12','Gampaha','District'),('LK','71','Anuradhapura','District'),('LK','7','Uturum_?da pa?ata','Province'),('LK','2','Madhyama pa?ata','Province'),('LK','81','Badulla','District'),('LK','9','Sabaragamuva pa?ata','Province'),('LK','3','Daku?u pa?ata','Province'),('LK','23','Nuwara Eliya','District'),('LK','42','Kilinochchi','District'),('LK','62','Puttalam','District'),('LK','32','Matara','District'),('LK','31','Galle','District'),('LK','52','Ampara','District'),('LK','4','Uturu pa?ata','Province'),('LK','1','Basnahira pa?ata','Province'),('LK','72','Polonnaruwa','District'),('LK','8','Uva pa?ata','Province'),('LK','6','Vayamba pa?ata','Province'),('LK','61','Kurunegala','District'),('LK','22','Matale','District'),('LK','92','Kegalla','District'),('LT','1','Akmene','District municipality'),('LT','3','Alytus','District municipality'),('LT','20','Klaipedos miestas','City municipality'),('LT','11','Joni_kis','District municipality'),('LT','7','Druskininkai','Municipality'),('LT','5','Bir_tono','Municipality'),('LT','15','Kauno miestas','City municipality'),('LT','8','Elektr_nai','Municipality'),('LT','6','Bir_ai','District municipality'),('LT','25','Marijampole','District municipality'),('LT','23','Kupi_kis','District municipality'),('LT','2','Alytaus miestas','City municipality'),('LT','19','Kelme','District municipality'),('LT','18','Kedainiai','District municipality'),('LT','35','Plunge','District municipality'),('LT','10','Jonava','District municipality'),('LT','41','_akiai','District municipality'),('LT','22','Kretinga','District municipality'),('LT','21','Klaipeda','District municipality'),('LT','33','Paneve_ys','District municipality'),('LT','4','Anyk_ciai','District municipality'),('LT','30','Pakruojis','District municipality'),('LT','26','Ma_eikiai','District municipality'),('LT','28','Neringa','Municipality'),('LT','37','Radvili_kis','District municipality'),('LT','9','Ignalina','District municipality'),('LT','13','Kai_iadorys','District municipality'),('LT','38','Raseiniai','District municipality'),('LT','40','Roki_kis','District municipality'),('LT','51','Tel_iai','District municipality'),('LT','16','Kaunas','District municipality'),('LT','12','Jurbarkas','District municipality'),('LT','36','Prienai','District municipality'),('LT','27','Moletai','District municipality'),('LT','31','Palangos miestas','City municipality'),('LT','32','Paneve_io miestas','City municipality'),('LT','29','Pag_giai','Municipality'),('LT','43','_iauliu miestas','City municipality'),('LT','57','Vilniaus miestas','City municipality'),('LT','49','_vencionys','District municipality'),('LT','58','Vilnius','District municipality'),('LT','48','Skuodas','District municipality'),('LT','34','Pasvalys','District municipality'),('LT','24','Lazdijai','District municipality'),('LT','45','_ilale','District municipality'),('LT','56','Vilkavi_kis','District municipality'),('LT','TA','Taurages apskritis','County'),('LT','44','_iauliai','District municipality'),('LT','MR','Marijampoles apskritis','County'),('LT','50','Taurage','District municipality'),('LT','42','_alcininkai','District municipality'),('LT','60','Zarasai','District municipality'),('LT','47','_irvintos','District municipality'),('LT','17','Kazlu Rudos','Municipality'),('LT','VL','Vilniaus Apskritis','County'),('LT','14','Kalvarijos','Municipality'),('LT','52','Trakai','District municipality'),('LT','UT','Utenos Apskritis','County'),('LT','39','Rietavo','Municipality'),('LT','59','Visaginas','Municipality'),('LT','PN','Paneve_io apskritis','County'),('LT','TE','Tel_iu Apskritis','County'),('LT','55','Varena','District municipality'),('LT','SA','_iauliu Apskritis','County'),('LT','46','_ilute','District municipality'),('LT','KU','Kauno Apskritis','County'),('LT','53','Ukmerge','District municipality'),('LT','KL','Klaipedos apskritis','County'),('LT','54','Utena','District municipality'),('LT','AL','Alytaus Apskritis','County'),('BW','CH','Chobe','District'),('BW','FR','Francistown','City'),('BW','NW','North West','District'),('BW','NE','North East','District'),('BW','KG','Kgalagadi','District'),('BW','GA','Gaborone','City'),('BW','CE','Central','District'),('BW','LO','Lobatse','Town'),('BW','KW','Kweneng','District'),('BW','JW','Jwaneng','Town'),('BW','ST','Sowa Town','Town'),('BW','GH','Ghanzi','District'),('BW','KL','Kgatleng','District'),('BW','SE','South East','District'),('BW','SO','Southern','District'),('BW','SP','Selibe Phikwe','Town'),('UM','67','Johnston Atoll (ISO reserved code = JT)','Islands/Groups of Islands'),('UM','76','Navassa Island (ISO reserved code = NV)','Islands/Groups of Islands'),('UM','71','Midway Islands (ISO reserved code = I)','Islands/Groups of Islands'),('UM','84','Howland Island','Islands/Groups of Islands'),('UM','89','Kingman Reef','Islands/Groups of Islands'),('UM','79','Wake Island (ISO reserved code = WK)','Islands/Groups of Islands'),('UM','81','Baker Island','Islands/Groups of Islands'),('UM','95','Palmyra Atoll','Islands/Groups of Islands'),('UM','86','Jarvis Island','Islands/Groups of Islands'),('PW','100','Kayangel','State'),('PW','226','Ngchesar','State'),('PW','4','Airai','State'),('PW','10','Angaur','State'),('PW','212','Melekeok','State'),('PW','214','Ngaraard','State'),('PW','350','Peleliu','State'),('PW','370','Sonsorol','State'),('PW','50','Hatohobei','State'),('PW','218','Ngarchelong','State'),('PW','224','Ngatpang','State'),('PW','222','Ngardmau','State'),('PW','228','Ngiwal','State'),('PW','2','Aimeliik','State'),('PW','227','Ngeremlengui','State'),('PW','150','Koror','State'),('YE','AD','�Adan','Governorate'),('YE','SN','San?a\'','Governorate'),('YE','DA','	A? ?ali�','Governorate'),('YE','HU','Al ?udaydah','Governorate'),('YE','AM','�Amran','Governorate'),('YE','DH','Dhamar','Governorate'),('YE','RA','Raymah','Governorate'),('YE','SD','Sa\'dah','Governorate'),('YE','IB','Ibb','Governorate'),('YE','SU','Arkhabil Suqutr�','governorate'),('YE','MW','Al Ma?wit','Governorate'),('YE','AB','Abyan','Governorate'),('YE','BA','Al Bay?a�','Governorate'),('YE','MR','Al Mahrah','Governorate'),('YE','SH','Shabwah','Governorate'),('YE','HJ','?ajjah','Governorate'),('YE','MA','Ma�rib','Governorate'),('YE','JA','Al Jawf','Governorate'),('YE','HD','?a?ramawt','Governorate'),('YE','SA','Amanat al �Asimah [city]','Municipality'),('YE','LA','Lahij','Governorate'),('YE','TA','Ta\'izz','Governorate'),('JO','AQ','	Al �Aqabah','Governorate'),('JO','AJ','	�Ajlun','Governorate'),('JO','IR','Irbid','Governorate'),('JO','MD','Madaba','Governorate'),('JO','AM','Al �A�simah','Governorate'),('JO','BA','Al Balqa�','Governorate'),('JO','AZ','Az Zarqa�','Governorate'),('JO','MA','AI Mafraq','Governorate'),('JO','MN','Ma�an','Governorate'),('JO','JA','Jarash','Governorate'),('JO','AT','At Tafilah','Governorate'),('JO','KA','AI Karak','Governorate'),('BD','20','Habiganj','District'),('BD','3','Bogra','District'),('BD','23','Jhenaidah','District'),('BD','36','Madaripur','District'),('BD','7','Bhola','District'),('BD','14','Dinajpur','District'),('BD','16','Feni','District'),('BD','11','Cox\'s Bazar','District'),('BD','29','Khagrachhari','District'),('BD','5','Bagerhat','District'),('BD','18','Gazipur','District'),('BD','31','Lakshmipur','District'),('BD','12','Chuadanga','District'),('BD','39','Meherpur','District'),('BD','25','Jhalakathi','District'),('BD','34','Mymensingh','District'),('BD','2','Barguna','District'),('BD','47','Noakhali','District'),('BD','28','Kurigram','District'),('BD','38','Moulvibazar','District'),('BD','6','Barisal','District'),('BD','21','Jamalpur','District'),('BD','42','Narsingdi','District'),('BD','1','Bandarban','District'),('BD','24','Joypurhat','District'),('BD','53','Rajbari','District'),('BD','46','Nilphamari','District'),('BD','8','Comilla','District'),('BD','58','Satkhira','District'),('BD','50','Pirojpur','District'),('BD','43','Narail','District'),('BD','15','Faridpur','District'),('BD','4','Brahmanbaria','District'),('BD','30','Kushtia','District'),('BD','26','Kishoreganj','District'),('BD','45','Chapai Nawabganj','District'),('BD','56','Rangamati','District'),('BD','61','Sunamganj','District'),('BD','63','Tangail','District'),('BD','40','Narayanganj','District'),('BD','10','Chittagong','District'),('BD','44','Natore','District'),('BD','54','Rajshahi','District'),('BD','13','Dhaka','District'),('BD','9','Chandpur','District'),('BD','17','Gopalganj','District'),('BD','55','Rangpur','District'),('BD','22','Jessore','District'),('BD','48','Naogaon','District'),('BD','19','Gaibandha','District'),('BD','32','Lalmonirhat','District'),('BD','51','Patuakhali','District'),('BD','62','Shariatpur','District'),('BD','27','Khulna','District'),('BD','33','Manikganj','District'),('BD','35','Munshiganj','District'),('BD','60','Sylhet','District'),('BD','37','Magura','District'),('BD','41','Netrakona','District'),('BD','59','Sirajganj','District'),('BD','52','Panchagarh','District'),('BD','64','Thakurgaon','District'),('BD','49','Pabna','District'),('BD','57','Sherpur','District'),('SG','5','South West','District'),('SG','3','North West','District'),('SG','4','South East','District'),('SG','1','Central Singapore','District'),('SG','2','North East','District'),('RS','3','Severnobanatski okrug','District'),('RS','0','Beograd','City'),('RS','4','Ju_nobanatski okrug','District'),('RS','16','Zlatiborski okrug','District'),('RS','15','Zajecarski okrug','District'),('RS','2','Srednjebanatski okrug','District'),('RS','5','Zapadnobacki okrug','District'),('RS','8','Macvanski okrug','District'),('RS','7','Sremski okrug','District'),('RS','6','Ju_nobacki okrug','District'),('RS','KM','Kosovo-Metohija','Autonomous province'),('RS','12','_umadijski okrug','District'),('RS','10','Podunavski okrug','District'),('RS','27','Prizrenski okrug','District'),('RS','13','Pomoravski okrug','District'),('RS','22','Pirotski okrug','District'),('RS','19','Rasinski okrug','District'),('RS','28','Kosovsko-Mitrovacki okrug','District'),('RS','14','Borski okrug','District'),('RS','23','Jablanicki okrug','District'),('RS','24','Pcinjski okrug','District'),('RS','17','Moravicki okrug','District'),('RS','1','Severnobacki okrug','District'),('RS','VO','Vojvodina','Autonomous province'),('RS','20','Ni_avski okrug','District'),('RS','11','Branicevski okrug','District'),('RS','25','Kosovski okrug','District'),('RS','9','Kolubarski okrug','District'),('RS','21','Toplicki okrug','District'),('RS','18','Ra_ki okrug','District'),('RS','29','Kosovsko-Pomoravski okrug','District'),('RS','26','Pecki okrug','District'),('US','AL','Alabama','State'),('US','KY','Kentucky','State'),('US','AR','Arkansas','State'),('US','AZ','Arizona','State'),('US','AS','American Samoa (see also separate entry under AS)','Outlying area'),('US','MI','Michigan','State'),('US','MA','Massachusetts','State'),('US','IA','Iowa','State'),('US','NE','Nebraska','State'),('US','ME','Maine','State'),('US','FL','Florida','State'),('US','NV','Nevada','State'),('US','CT','Connecticut','State'),('US','DE','Delaware','State'),('US','AK','Alaska','State'),('US','ID','Idaho','State'),('US','CA','California','State'),('US','MT','Montana','State'),('US','HI','Hawaii','State'),('US','IL','Illinois','State'),('US','ND','North Dakota','State'),('US','PR','Puerto Rico (see also separate entry under PR)','Outlying area'),('US','MP','Northern Mariana Islands (see also separate entry MP)','Outlying area'),('US','CO','Colorado','State'),('US','GU','Guam (see also separate entry under GU)','Outlying area'),('US','MD','Maryland','State'),('US','NM','New Mexico','State'),('US','NC','North Carolina','State'),('US','LA','Louisiana','State'),('US','GA','Georgia','State'),('US','KS','Kansas','State'),('US','MO','Missouri','State'),('US','IN','Indiana','State'),('US','NH','New Hampshire','State'),('US','MN','Minnesota','State'),('US','NY','New York','State'),('US','NJ','New Jersey','State'),('US','DC','District of Columbia','District'),('US','MS','Mississippi','State'),('US','TX','Texas','State'),('US','SD','South Dakota','State'),('US','OH','Ohio','State'),('US','TN','Tennessee','State'),('US','PA','Pennsylvania','State'),('US','UT','Utah','State'),('US','VI','Virgin Islands of the U.S. (see also separate entry VI)','Outlying area'),('US','RI','Rhode Island','State'),('US','SC','South Carolina','State'),('US','OK','Oklahoma','State'),('US','UM','U.S. Minor Outlying Islands (cf. separate entry UM)','Outlying area'),('US','WY','Wyoming','State'),('US','VA','Virginia','State'),('US','WI','Wisconsin','State'),('US','OR','Oregon','State'),('US','WV','West Virginia','State'),('US','WA','Washington','State'),('US','VT','Vermont','State'),('DO','6','Duarte','Province'),('DO','2','Azua','Province'),('DO','18','Puerto Plata','Province'),('DO','33','Cibao Nordeste','Region'),('DO','17','Peravia','Province'),('DO','25','Santiago','Province'),('DO','10','Independencia','Province'),('DO','15','Monte Cristi','Province'),('DO','9','Espaillat','Province'),('DO','20','Saman�','Province'),('DO','21','San Crist�bal','Province'),('DO','4','Barahona','Province'),('DO','7','El�as Pi�a','Province'),('DO','23','San Pedro de Macor�s','Province'),('DO','5','Dajab�n','Province'),('DO','1','Distrito Nacional (Santo Domingo)','District'),('DO','16','Pedernales','Province'),('DO','19','Hermanas Mirabal','Province'),('DO','3','Baoruco','Province'),('DO','8','El Seibo','Province'),('DO','11','La Altagracia','Province'),('DO','13','La Vega','Province'),('DO','28','Monse�or Nouel','Province'),('DO','12','La Romana','Province'),('DO','14','Mar�a Trinidad S�nchez','Province'),('DO','30','Hato Mayor','Province'),('DO','32','Santo Domingo','Province'),('DO','29','Monte Plata','Province'),('DO','24','S�nchez Ram�rez','Province'),('DO','36','Cibao Sur','Region'),('DO','31','San Jos_ de Ocoa','Province'),('DO','34','Cibao Noroeste','Region'),('DO','26','Santiago Rodr�guez','Province'),('DO','40','Ozama','Region'),('DO','22','San Juan','Province'),('DO','27','Valverde','Province'),('DO','37','El Valle','Region'),('DO','42','Yuma','Region'),('DO','38','Enriquillo','Region'),('DO','35','Cibao Norte','Region'),('DO','41','Valdesia','Region'),('DO','39','Higuamo','Region'),('CF','BGF','Bangui','Commune'),('CF','MB','Mbomou','Prefecture'),('CF','BB','Bamingui-Bangoran','Prefecture'),('CF','AC','Ouham','Prefecture'),('CF','UK','Ouaka','Prefecture'),('CF','KB','Gribingui','economic prefecture'),('CF','BK','Basse-Kotto','Prefecture'),('CF','VK','Vakaga','Prefecture'),('CF','MP','Ombella-Mpoko','Prefecture'),('CF','HS','Mamb_r_-Kad_�','Prefecture'),('CF','SE','Sangha','economic prefecture'),('CF','HK','Haute-Kotto','Prefecture'),('CF','OP','Ouham-Pend_','Prefecture'),('CF','HM','Haut-Mbomou','Prefecture'),('CF','LB','Lobaye','Prefecture'),('CF','NM','Nana-Mamb_r_','Prefecture'),('CF','KG','K_mo-Gribingui','Prefecture'),('CR','L','Lim�n','Province'),('CR','A','Alajuela','Province'),('CR','G','Guanacaste','Province'),('CR','P','Puntarenas','Province'),('CR','C','Cartago','Province'),('CR','SJ','San Jos_','Province'),('CR','H','Heredia','Province'),('TT','PTF','Point Fortin','Municipality'),('TT','ARI','Arima','Municipality'),('TT','DMN','Diego Martin','Region'),('TT','POS','Port of Spain','Municipality'),('TT','SGE','Sangre Grande','Region'),('TT','SJL','San Juan-Laventille','Region'),('TT','PRT','Princes Town','Region'),('TT','MRC','Mayaro-Rio Claro','region'),('TT','TUP','Tunapuna-Piarco','Region'),('TT','SFO','San Fernando','Municipality'),('TT','PED','Penal-Debe','Region'),('TT','TOB','Tobago','ward'),('TT','CHA','Chaguanas','Municipality'),('TT','CTT','Couva-Tabaquite-Talparo','Region'),('TT','SIP','Siparia','Region'),('UA','48','Mykolaivska oblast','Region'),('UA','53','Poltavska oblast','Region'),('UA','14','Donetska oblast','Region'),('UA','18','Zhytomyrska oblast','Region'),('UA','23','Zaporizka oblast','Region'),('UA','63','Kharkivska oblast','Region'),('UA','71','Cherkaska oblast','Region'),('UA','59','Sumska oblast','Region'),('UA','26','Ivano-Frankivska oblast','Region'),('UA','9','Luhanska oblast','Region'),('UA','7','Volynska oblast','Region'),('UA','56','Rivnenska oblast','Region'),('UA','30','Kyiv','City'),('UA','5','Vinnytska oblast','Region'),('UA','43','Avtonomna Respublika Krym','Republic'),('UA','40','Sevastopol','City'),('UA','77','Chernivetska oblast','Region'),('UA','12','Dnipropetrovska oblast','Region'),('UA','51','Odeska oblast','Region'),('UA','61','Ternopilska oblast','Region'),('UA','46','Lvivska oblast','Region'),('UA','65','Khersonska oblast','Region'),('UA','74','Chernihivska oblast','Region'),('UA','21','Zakarpatska oblast','Region'),('UA','68','Khmelnytska oblast','Region'),('UA','32','Kyivska oblast','Region'),('UA','35','Kirovohradska oblast','Region'),('GM','W','Western','Division'),('GM','L','Lower River','Division'),('GM','N','North Bank','Division'),('GM','B','Banjul','City'),('GM','U','Upper River','Division'),('GM','M','Central River','Division'),('DJ','DI','Dikhil','Region'),('DJ','AR','Arta','Region'),('DJ','DJ','Djibouti','City'),('DJ','TA','Tadjourah','Region'),('DJ','OB','Obock','Region'),('DJ','AS','Ali Sabieh','Region'),('IN','CH','Chandigarh','Union territory'),('IN','DL','Delhi','Union territory'),('IN','HR','Haryana','State'),('IN','GA','Goa','State'),('IN','BR','Bihar','State'),('IN','PY','Puducherry','Union territory'),('IN','AR','Arunachal Pradesh','State'),('IN','UP','Uttar Pradesh','State'),('IN','WB','West Bengal','State'),('IN','MH','Maharashtra','State'),('IN','OR','Odisha','State'),('IN','MN','Manipur','State'),('IN','TR','Tripura','State'),('IN','CT','Chhattisgarh','State'),('IN','RJ','Rajasthan','State'),('IN','JK','Jammu and Kashmir','State'),('IN','KL','Kerala','State'),('IN','JH','Jharkhand','State'),('IN','HP','Himachal Pradesh','State'),('IN','UT','Uttarakhand','State'),('IN','ML','Meghalaya','State'),('IN','KA','Karnataka','State'),('IN','AP','Andhra Pradesh','State'),('IN','TG','Telangana','State'),('IN','TN','Tamil Nadu','State'),('IN','AS','Assam','State'),('IN','GJ','Gujarat','State'),('IN','SK','Sikkim','State'),('IN','MZ','Mizoram','State'),('IN','DN','Dadra and Nagar Haveli','Union territory'),('IN','DD','Daman and Diu','Union territory'),('IN','AN','Andaman and Nicobar Islands','Union territory'),('IN','LD','Lakshadweep','Union territory'),('IN','MP','Madhya Pradesh','State'),('IN','PB','Punjab','State'),('IN','NL','Nagaland','State'),('UZ','AN','Andijon','Region'),('UZ','QR','Qoraqalpog�iston Respublikasi','Republic'),('UZ','SI','Sirdaryo','Region'),('UZ','SU','Surkhondaryo','Region'),('UZ','JI','Jizzax','Region'),('UZ','NG','Namangan','Region'),('UZ','NW','Nawoiy','Region'),('UZ','XO','Xorazm','Region'),('UZ','TK','Toshkent','City'),('UZ','KH','Khorazm','Region'),('UZ','FA','Farg�ona','Region'),('UZ','BU','Bukhoro','Region'),('UZ','TO','Toshkent','Region'),('UZ','QA','Qashqadaryo','Region'),('UZ','SA','Samarqand','Region'),('PT','1','Aveiro','District'),('PT','6','Coimbra','District'),('PT','7','�vora','District'),('PT','4','Bragan�a','District'),('PT','11','Lisboa','District'),('PT','18','Viseu','District'),('PT','13','Porto','District'),('PT','14','Santar_m','District'),('PT','8','Faro','District'),('PT','15','Set�bal','District'),('PT','2','Beja','District'),('PT','20','Regi�o Aut�noma dos A�ores','Autonomous region'),('PT','3','Braga','District'),('PT','30','Regi�o Aut�noma da Madeira','Autonomous region'),('PT','9','Guarda','District'),('PT','17','Vila Real','District'),('PT','5','Castelo Branco','District'),('PT','10','Leiria','District'),('PT','12','Portalegre','District'),('PT','16','Viana do Castelo','District'),('KH','11','Mondol Kiri [M�nd�l Kiri]','Province'),('KH','2','Baat Dambang [Batd�mb�ng]','Province'),('KH','13','Preah Vihear [Preah Vih_ar]','Province'),('KH','16','Rotanak Kiri [R�t�n�kiri]','Province'),('KH','7','Kampot [K�mp�t]','Province'),('KH','24','Pailin [Pailin]','Province'),('KH','10','Kracheh [Kr�ch_h]','Province'),('KH','1','Banteay Mean Chey [B�nt_ay M_anchey]','Province'),('KH','25','Tbong Khmum','province'),('KH','18','Preah Sihanouk [Preah Sihanouk]','Province'),('KH','20','Svaay Rieng [Svay Rieng]','Province'),('KH','17','Siem Reab [Siemr_ab]','Province'),('KH','6','Kampong Thum [K�mp�ng Thum]','Province'),('KH','4','Kampong Chhnang [K�mp�ng Chhnang]','Province'),('KH','21','Taakaev [Tak�v]','Province'),('KH','14','Prey Veaeng [Prey V�ng]','Province'),('KH','5','Kampong Spueu [K�mp�ng Sp�]','Province'),('KH','22','Otdar Mean Chey [Otd�r M_anchey]','Province'),('KH','19','Stueng Traeng [Stoeng Tr�ng]','Province'),('KH','12','Phnom Penh [Phnum P_nh]','Autonomous municipality'),('KH','15','Pousaat [Pouthisat]','Province'),('KH','23','Keb [K�b]','Province'),('KH','9','Kaoh Kong [Ka�h Kong]','Province'),('KH','3','Kampong Chaam [K�mp�ng Cham]','Province'),('KH','8','Kandaal [K�ndal]','Province'),('CZ','10','Praha, Hlavn� me_to','Region'),('CZ','20','Stredocesk_ kraj','Region'),('CZ','31','Jihocesk_ kraj','Region'),('CZ','42','�steck_ kraj','Region'),('CZ','32','Plzensk_ kraj','Region'),('CZ','64','Jihomoravsk_ kraj','Region'),('CZ','41','Karlovarsk_ kraj','Region'),('CZ','52','Kr�lov_hradeck_ kraj','Region'),('CZ','51','Libereck_ kraj','Region'),('CZ','80','Moravskoslezsk_ kraj','Region'),('CZ','53','Pardubick_ kraj','Region'),('CZ','72','Zl�nsk_ kraj','Region'),('CZ','63','Kraj Vysocina','Region'),('CZ','71','Olomouck_ kraj','Region'),('IE','CW','Carlow','County'),('IE','MH','Meath','County'),('IE','LK','Limerick','County'),('IE','KE','Kildare','County'),('IE','KK','Kilkenny','County'),('IE','SO','Sligo','County'),('IE','CN','Cavan','County'),('IE','D','Dublin','County'),('IE','LH','Louth','County'),('IE','WX','Wexford','County'),('IE','G','Galway','County'),('IE','CO','Cork','County'),('IE','LM','Leitrim','County'),('IE','KY','Kerry','County'),('IE','LS','Laois','County'),('IE','DL','Donegal','County'),('IE','RN','Roscommon','County'),('IE','CE','Clare','County'),('IE','MO','Mayo','County'),('IE','LD','Longford','County'),('IE','WD','Waterford','County'),('IE','WW','Wicklow','County'),('IE','TA','Tipperary','County'),('IE','MN','Monaghan','County'),('IE','OY','Offaly','County'),('IE','WH','Westmeath','County'),('WS','VS','Vaisigano','District'),('WS','PA','Palauli','District'),('WS','AL','Aiga-i-le-Tai','District'),('WS','SA','Satupa \'itea','District'),('WS','VF','Va\'a-o-Fonoti','District'),('WS','FA','Fa\'asaleleaga','District'),('WS','GE','Gaga\'emauga','District'),('WS','GI','Gagaifomauga','District'),('WS','TU','Tuamasaga','District'),('WS','AT','Atua','District'),('WS','AA','A\'ana','District'),('LY','JG','Al Jabal al Gharbi','Popularate'),('LY','WS','Wadi ash Shati?','Popularate'),('LY','SB','Sabha','Popularate'),('LY','ZA','Az Zawiyah','Popularate'),('LY','JI','Al Jafarah','Popularate'),('LY','TB','Tarabulus','Popularate'),('LY','MI','Misratah','Popularate'),('LY','KF','Al Kufrah','Popularate'),('LY','JU','Al Jufrah','Popularate'),('LY','BA','Banghazi','Popularate'),('LY','SR','Surt','Popularate'),('LY','MB','Al Marqab','Popularate'),('LY','BU','Al Butnan','Popularate'),('LY','MQ','Murzuq','Popularate'),('LY','GT','Ghat','Popularate'),('LY','WD','Wadi al Hayat','Popularate'),('LY','MJ','Al Marj','Popularate'),('LY','JA','Al Jabal al Akh?ar','Popularate'),('LY','WA','Al Wa?at','Popularate'),('LY','NQ','An Nuqat al Khams','Popularate'),('LY','NL','Nalut','Popularate'),('LY','DR','Darnah','Popularate'),('LC','1','Anse la Raye','District'),('LC','5','Dennery','District'),('LC','2','Castries','District'),('LC','7','Laborie','District'),('LC','3','Choiseul','District'),('LC','10','Soufri�re','District'),('LC','11','Vieux Fort','District'),('LC','6','Gros Islet','District'),('LC','12','Canaries','District'),('LC','8','Micoud','District'),('KR','11','Seoul-teukbyeolsi [Seoul]','Special city'),('KR','41','Gyeonggido [Kyonggi-do]','Province'),('KR','43','Chungcheongbugdo [Ch\'ungch\'ongbuk-do]','Province'),('KR','47','Gyeongsangbugdo [Kyongsangbuk-do]','Province'),('KR','44','Chungcheongnamdo [Ch\'ungch\'ongnam-do]','Province'),('KR','29','Gwangju Gwang\'yeogsi [Kwangju-Kwangyokshi]','Metropolitan city'),('KR','28','Incheon Gwang\'yeogsi [Incheon]','Metropolitan city'),('KR','46','Jeonranamdo [Chollanam-do]','Province'),('KR','49','Jeju-teukbyeoljachido [Jeju]','Special self-governing province'),('KR','30','Daejeon Gwang\'yeogsi [Taejon-Kwangyokshi]','Metropolitan city'),('KR','27','Daegu Gwang\'yeogsi [Taegu-Kwangyokshi]','Metropolitan city'),('KR','48','Gyeongsangnamdo [Kyongsangnam-do]','Province'),('KR','45','Jeonrabugdo [Chollabuk-do]','Province'),('KR','42','Gang\'weondo [Kang-won-do]','Province'),('KR','26','Busan Gwang\'yeogsi [Pusan-Kwangyokshi]','Metropolitan city'),('KR','31','Ulsan Gwang\'yeogsi [Ulsan-Kwangyokshi]','Metropolitan city'),('KR','50','Sejong','Special self-governing city'),('MT','1','Attard','Local council'),('MT','14','Gharb','Local council'),('MT','13','Ghajnsielem','Local council'),('MT','24','Lija','Local council'),('MT','10','Fontana','Local council'),('MT','21','Kalkara','Local council'),('MT','4','Birkirkara','Local council'),('MT','2','Balzan','Local council'),('MT','31','Mgarr','Local council'),('MT','40','Pembroke','Local council'),('MT','18','Hamrun','Local council'),('MT','51','Saint Paul\'s Bay','Local council'),('MT','3','Birgu','Local council'),('MT','8','Fgura','Local council'),('MT','26','Marsa','Local council'),('MT','25','Luqa','Local council'),('MT','34','Msida','Local council'),('MT','29','Mdina','Local council'),('MT','9','Floriana','Local council'),('MT','64','Zabbar','Local council'),('MT','52','Sannat','Local council'),('MT','47','Safi','Local council'),('MT','12','Gzira','Local council'),('MT','27','Marsaskala','Local council'),('MT','6','Bormla','Local council'),('MT','20','Isla','Local council'),('MT','11','Gudja','Local council'),('MT','38','Naxxar','Local council'),('MT','42','Qala','Local council'),('MT','17','Ghaxaq','Local council'),('MT','28','Marsaxlokk','Local council'),('MT','57','Swieqi','Local council'),('MT','44','Qrendi','Local council'),('MT','16','Ghasri','Local council'),('MT','5','Birzebbuga','Local council'),('MT','23','Kirkop','Local council'),('MT','33','Mqabba','Local council'),('MT','43','Qormi','Local council'),('MT','19','Iklin','Local council'),('MT','37','Nadur','Local council'),('MT','35','Mtarfa','Local council'),('MT','15','Gharghur','Local council'),('MT','36','Munxar','Local council'),('MT','49','Saint John','Local council'),('MT','22','Kercem','Local council'),('MT','32','Mosta','Local council'),('MT','56','Sliema','Local council'),('MT','30','Mellieha','Local council'),('MT','45','Rabat Gozo','Local council'),('MT','39','Paola','Local council'),('MT','41','Piet�','Local council'),('MT','7','Dingli','Local council'),('MT','46','Rabat Malta','Local council'),('MT','50','Saint Lawrence','Local council'),('MT','62','Xewkija','Local council'),('MT','55','Siggiewi','Local council'),('MT','66','Zebbug Malta','Local council'),('MT','60','Valletta','Local council'),('MT','48','Saint Julian\'s','Local council'),('MT','59','Tarxien','Local council'),('MT','54','Santa Venera','Local council'),('MT','65','Zebbug Gozo','Local council'),('MT','61','Xaghra','Local council'),('MT','58','Ta\' Xbiex','Local council'),('MT','53','Saint Lucia\'s','Local council'),('MT','68','Zurrieq','Local council'),('MT','67','Zejtun','Local council'),('MT','63','Xghajra','Local council'),('ZM','1','Western','Province'),('ZM','4','Luapula','Province'),('ZM','5','Northern','Province'),('ZM','3','Eastern','Province'),('ZM','9','Lusaka','Province'),('ZM','6','North-Western','Province'),('ZM','8','Copperbelt','Province'),('ZM','10','Muchinga','Province'),('ZM','7','Southern','Province'),('ZM','2','Central','Province'),('GW','BS','Bissau','Autonomous sector'),('GW','QU','Quinara','Region'),('GW','BA','Bafat�','Region'),('GW','CA','Cacheu','Region'),('GW','GA','Gab�','Region'),('GW','BM','Biombo','Region'),('GW','OI','Oio','Region'),('GW','TO','Tombali','Region'),('GW','BL','Bolama','Region'),('AG','10','Barbuda','Dependency'),('AG','11','Redonda','undefined'),('AG','8','Saint Philip','Parish'),('AG','6','Saint Paul','Parish'),('AG','4','Saint John','Parish'),('AG','7','Saint Peter','Parish'),('AG','5','Saint Mary','Parish'),('AG','3','Saint George','Parish'),('SS','WR','Warrap','State'),('SS','EC','Central Equatoria','State'),('SS','LK','Lakes','State'),('SS','UY','Unity','State'),('SS','BN','Northern Bahr el Ghazal','State'),('SS','BW','Western Bahr el Ghazal','State'),('SS','JG','Jonglei','State'),('SS','NU','Upper Nile','State'),('SS','EW','Western Equatoria','State'),('SS','EE','Eastern Equatoria','State'),('GE','KA','Kakhet\'i','Region'),('GE','SK','Shida K\'art\'li','Region'),('GE','AB','Abkhazia','Autonomous republic'),('GE','IM','Imeret\'i','Region'),('GE','TB','T\'bilisi','City'),('GE','AJ','Ajaria','Autonomous republic'),('GE','MM','Mts\'khet\'a-Mt\'ianet\'i','Region'),('GE','GU','Guria','Region'),('GE','RL','Racha-Lech�khumi-K�vemo Svanet�i','Region'),('GE','KK','K\'vemo K\'art\'li','Region'),('GE','SZ','Samegrelo-Zemo Svanet\'i','Region'),('GE','SJ','Samts\'khe-Javakhet\'i','Region'),('DM','5','Saint John','Parish'),('DM','6','Saint Joseph','Parish'),('DM','10','Saint Paul','Parish'),('DM','11','Saint Peter','Parish'),('DM','7','Saint Luke','Parish'),('DM','4','Saint George','Parish'),('DM','8','Saint Mark','Parish'),('DM','2','Saint Andrew','Parish'),('DM','3','Saint David','Parish'),('DM','9','Saint Patrick','Parish'),('KG','GB','Bishkek','City'),('KG','C','Ch�y','Region'),('KG','B','Batken','Region'),('KG','Y','Ysyk-K_l','Region'),('KG','GO','Osh','City'),('KG','J','Jalal-Abad','Region'),('KG','N','Naryn','Region'),('KG','O','Osh','Region'),('KG','T','Talas','Region'),('BG','9','Kardzhali','Region'),('BG','7','Gabrovo','Region'),('BG','4','Veliko Tarnovo','Region'),('BG','12','Montana','Region'),('BG','8','Dobrich','Region'),('BG','17','Razgrad','Region'),('BG','16','Plovdiv','Region'),('BG','1','Blagoevgrad','Region'),('BG','3','Varna','Region'),('BG','11','Lovech','Region'),('BG','18','Ruse','Region'),('BG','15','Pleven','Region'),('BG','5','Vidin','Region'),('BG','2','Burgas','Region'),('BG','21','Smolyan','Region'),('BG','10','Kjustendil','Region'),('BG','6','Vratsa','Region'),('BG','20','Sliven','Region'),('BG','25','Targovishte','Region'),('BG','14','Pernik','Region'),('BG','13','Pazardzik','Region'),('BG','19','Silistra','Region'),('BG','23','Sofia','Region'),('BG','22','Sofia (stolitsa)','Region'),('BG','27','Shumen','Region'),('BG','24','Stara Zagora','Region'),('BG','26','Haskovo','Region'),('BG','28','Yambol','Region'),('ZA','NL','Kwazulu-Natal','Province'),('ZA','NC','Northern Cape','Province'),('ZA','FS','Free State','Province'),('ZA','MP','Mpumalanga','Province'),('ZA','EC','Eastern Cape','Province'),('ZA','NW','North-West','Province'),('ZA','LP','Limpopo','Province'),('ZA','WC','Western Cape','Province'),('ZA','GT','Gauteng','Province'),('TG','M','Maritime (R_gion)','Region'),('TG','C','Centrale','Region'),('TG','P','Plateaux','Region'),('TG','K','Kara','Region'),('TG','S','Savanes','Region'),('CV','RB','Ribeira Brava','Municipality'),('CV','SF','S�o Filipe','Municipality'),('CV','SD','S�o Domingos','Municipality'),('CV','PN','Porto Novo','Municipality'),('CV','SS','S�o Salvador do Mundo','Municipality'),('CV','SL','Sal','Municipality'),('CV','BV','Boa Vista','Municipality'),('CV','MA','Maio','Municipality'),('CV','CA','Santa Catarina','Municipality'),('CV','SM','S�o Miguel','Municipality'),('CV','RG','Ribeira Grande','Municipality'),('CV','PR','Praia','Municipality'),('CV','TA','Tarrafal','Municipality'),('CV','TS','Tarrafal de S�o Nicolau','Municipality'),('CV','SO','S�o Louren�o dos �rg�os','Municipality'),('CV','BR','Brava','Municipality'),('CV','SV','S�o Vicente','Municipality'),('CV','RS','Ribeira Grande de Santiago','Municipality'),('CV','CF','Santa Catarina do Fogo','Municipality'),('CV','CR','Santa Cruz','Municipality'),('CV','MO','Mosteiros','Municipality'),('CV','PA','Paul','Municipality'),('AF','SAR','Sar-e Pul','Province'),('AF','DAY','Daykundi','Province'),('AF','BGL','Baghlan','Province'),('AF','KAN','Kandahar','Province'),('AF','JOW','Jowzjan','Province'),('AF','TAK','Takhar','Province'),('AF','FRA','Farah','Province'),('AF','KNR','Kuna?','Province'),('AF','BDG','Badghis','Province'),('AF','PAR','Parwan','Province'),('AF','HER','Herat','Province'),('AF','GHA','Ghazni','Province'),('AF','GHO','Ghor','Province'),('AF','BAL','Balkh','Province'),('AF','FYB','Faryab','Province'),('AF','KHO','Khost','Province'),('AF','KAP','Kapisa','Province'),('AF','BAM','Bamyan','Province'),('AF','PKA','Paktika','Province'),('AF','KAB','Kabul','Province'),('AF','ZAB','Zabul','Province'),('AF','BDS','Badakhshan','Province'),('AF','LAG','Laghman','Province'),('AF','HEL','Helmand','Province'),('AF','NUR','Nuristan','Province'),('AF','PAN','Panjshayr','Province'),('AF','URU','Uruzgan','Province'),('AF','SAM','Samangan','Province'),('AF','NIM','Nimroz','Province'),('AF','KDZ','Kunduz','Province'),('AF','NAN','Nangarhar','Province'),('AF','LOG','Logar','Province'),('AF','PIA','Paktiya','Province'),('AF','WAR','Wardak','Province'),('VN','3','H� Giang','Province'),('VN','14','H�a B�nh','Province'),('VN','9','L?ng Son','Province'),('VN','5','Son La','Province'),('VN','71','_i?n Bi�n','Province'),('VN','31','B�nh _?nh','Province'),('VN','1','Lai Ch�u','Province'),('VN','25','Qu?ng Tr?','Province'),('VN','4','Cao B?ng','Province'),('VN','34','Kh�nh H�a','Province'),('VN','47','Ki?n Giang','Province'),('VN','7','Tuy�n Quang','Province'),('VN','2','L�o Cai','Province'),('VN','21','Thanh H�a','Province'),('VN','22','Ngh? An','Province'),('VN','37','T�y Ninh','Province'),('VN','26','Th?a Thi�n-Hu?','Province'),('VN','CT','Can Tho','Municipality'),('VN','27','Qu?ng Nam','Province'),('VN','67','Nam _?nh','Province'),('VN','23','H� Tinh','Province'),('VN','24','Qu?ng B�nh','Province'),('VN','56','B?c Ninh','Province'),('VN','32','Ph� Y�n','Province'),('VN','52','S�c Trang','Province'),('VN','13','Qu?ng Ninh','Province'),('VN','58','B�nh Phu?c','Province'),('VN','40','B�nh Thu?n','Province'),('VN','6','Y�n B�i','Province'),('VN','28','Kon Tum','Province'),('VN','18','Ninh B�nh','Province'),('VN','20','Th�i B�nh','Province'),('VN','72','_?k N�ng','Province'),('VN','63','H� Nam','Province'),('VN','29','Qu?ng Ng�i','Province'),('VN','41','Long An','Province'),('VN','53','B?c K?n','Province'),('VN','51','Tr� Vinh','Province'),('VN','HP','Hai Phong','Municipality'),('VN','33','_?k L?k','Province'),('VN','55','B?c Li�u','Province'),('VN','36','Ninh Thu?n','Province'),('VN','30','Gia Lai','Province'),('VN','46','Ti?n Giang','Province'),('VN','35','L�m _?ng','Province'),('VN','DN','Da Nang, thanh pho','Municipality'),('VN','44','An Giang','Province'),('VN','57','B�nh Duong','Province'),('VN','61','H?i Duong','Province'),('VN','45','_?ng Th�p','Province'),('VN','39','_?ng Nai','Province'),('VN','70','Vinh Ph�c','Province'),('VN','50','B?n Tre','Province'),('VN','49','Vinh Long','Province'),('VN','59','C� Mau','Province'),('VN','54','B?c Giang','Province'),('VN','43','B� R?a - Vung T�u','Province'),('VN','66','Hung Y�n','Province'),('VN','73','H?u Giang','Province'),('VN','68','Ph� Th?','Province'),('VN','HN','Ha Noi','Municipality'),('VN','SG','Ho Chi Minh','Municipality'),('VN','69','Th�i Nguy�n','Province'),('BA','BRC','Brcko distrikt','District with special\nstatus'),('BA','BIH','Federacija Bosne i Hercegovine','Entity'),('BA','SRP','Republika Srpska','Entity'),('LB','AK','Aakk�r','Governorate'),('LB','AS','Liban-Nord','Governorate'),('LB','JA','Liban-Sud','Governorate'),('LB','BA','Beyrouth','Governorate'),('LB','BI','El B_qaa','Governorate'),('LB','BH','Baalbek-Hermel','Governorate'),('LB','JL','Mont-Liban','Governorate'),('LB','NA','Nabat�y_','Governorate'),('BO','S','Santa Cruz','Department'),('BO','B','El Beni','Department'),('BO','T','Tarija','Department'),('BO','O','Oruro','Department'),('BO','H','Chuquisaca','Department'),('BO','C','Cochabamba','Department'),('BO','L','La Paz','Department'),('BO','N','Pando','Department'),('BO','P','Potos�','Department'),('SA','10','Najran','Region'),('SA','3','Al Madinah al Munawwarah','Region'),('SA','12','AI Jawf','Region'),('SA','7','Tabuk','Region'),('SA','5','AI Qasim','Region'),('SA','2','Makkah al Mukarramah','Region'),('SA','11','AI Bahah','Region'),('SA','1','Ar Riyad','Region'),('SA','9','Jazan','Region'),('SA','6','Ha\'il','Region'),('SA','4','Ash Sharqiyah','Region'),('SA','8','AI Hudud ash Shamaliyah','Region'),('SA','14','\'Asir','Region'),('HT','NO','Nord-Ouest','Department'),('HT','AR','Artibonite','Department'),('HT','CE','Centre','Department'),('HT','NE','Nord-Est','Department'),('HT','NI','Nippes','Department'),('HT','SE','Sud-Est','Department'),('HT','ND','Nord','Department'),('HT','GA','Grande�Anse','Department'),('HT','OU','Ouest','Department'),('HT','SD','Sud','Department'),('UY','CA','Canelones','Department'),('UY','DU','Durazno','Department'),('UY','LA','Lavalleja','Department'),('UY','CO','Colonia','Department'),('UY','MO','Montevideo','Department'),('UY','TA','Tacuaremb�','Department'),('UY','AR','Artigas','Department'),('UY','FS','Flores','Department'),('UY','RV','Rivera','Department'),('UY','SA','Salto','Department'),('UY','FD','Florida','Department'),('UY','CL','Cerro Largo','Department'),('UY','MA','Maldonado','Department'),('UY','RN','R�o Negro','Department'),('UY','SO','Soriano','Department'),('UY','PA','Paysand�','Department'),('UY','TT','Treinta y Tres','Department'),('UY','RO','Rocha','Department'),('UY','SJ','San Jos_','Department'),('CO','AMA','Amazonas','Department'),('CO','CAU','Cauca','Department'),('CO','DC','Distrito Capital de Bogot�','Capital district'),('CO','VAC','Valle del Cauca','Department'),('CO','SAN','Santander','Department'),('CO','SUC','Sucre','Department'),('CO','CHO','Choc�','Department'),('CO','BOL','Bol�var','Department'),('CO','ANT','Antioquia','Department'),('CO','SAP','San Andr_s, Providencia y Santa Catalina','Department'),('CO','CAQ','Caquet�','Department'),('CO','RIS','Risaralda','Department'),('CO','NSA','Norte de Santander','Department'),('CO','ARA','Arauca','Department'),('CO','CAS','Casanare','Department'),('CO','MET','Meta','Department'),('CO','CUN','Cundinamarca','Department'),('CO','QUI','Quind�o','Department'),('CO','VID','Vichada','Department'),('CO','BOY','Boyac�','Department'),('CO','PUT','Putumayo','Department'),('CO','NAR','Nari�o','Department'),('CO','COR','C�rdoba','Department'),('CO','MAG','Magdalena','Department'),('CO','VAU','Vaup_s','Department'),('CO','CES','Cesar','Department'),('CO','HUI','Huila','Department'),('CO','LAG','La Guajira','Department'),('CO','ATL','Atl�ntico','Department'),('CO','TOL','Tolima','Department'),('CO','GUV','Guaviare','Department'),('CO','CAL','Caldas','Department'),('CO','GUA','Guain�a','Department'),('TV','FUN','Funafuti','Town council'),('TV','NMG','Nanumaga','Island council'),('TV','NKL','Nukulaelae','Island council'),('TV','NIT','Niutao','Island council'),('TV','NIU','Nui','Island council'),('TV','NKF','Nukufetau','Island council'),('TV','NMA','Nanumea','Island council'),('TV','VAI','Vaitupu','Island council'),('ET','TI','Tigray','Regional State'),('ET','AA','Adis Abeba','Administration'),('ET','AF','Afar','Regional State'),('ET','BE','Binshangul Gumuz','Regional State'),('ET','SN','YeDebub Biheroch Bihereseboch na Hizboch','Regional State'),('ET','HA','Hareri Hizb','Regional State'),('ET','GA','Gambela Hizboch','Regional State'),('ET','DD','Dire Dawa','Administration'),('ET','AM','Amara','Regional State'),('ET','OR','Oromiya','Regional State'),('ET','SO','Sumale','Regional State'),('VE','B','Anzo�tegui','State'),('VE','A','Distrito Capital','Capital district'),('VE','U','Yaracuy','State'),('VE','Z','Amazonas','State'),('VE','X','vargas','State'),('VE','J','Gu�rico','State'),('VE','F','Bol�var','State'),('VE','W','Dependencias Federales','Federal dependencies'),('VE','H','Cojedes','State'),('VE','L','M_rida','State'),('VE','R','Sucre','State'),('VE','V','Zulia','State'),('VE','E','Barinas','State'),('VE','I','Falc�n','State'),('VE','C','Apure','State'),('VE','P','Portuguesa','State'),('VE','K','Lara','State'),('VE','G','Carabobo','State'),('VE','O','Nueva Esparta','State'),('VE','D','Aragua','State'),('VE','M','Miranda','State'),('VE','S','T�chira','State'),('VE','N','Monagas','State'),('VE','Y','Delta Amacuro','State'),('VE','T','Trujillo','State'),('GT','ES','Escuintla','Department'),('GT','AV','Alta Verapaz','Department'),('GT','QC','Quich_','Department'),('GT','CM','Chimaltenango','Department'),('GT','BV','Baja Verapaz','Department'),('GT','JU','Jutiapa','Department'),('GT','IZ','Izabal','Department'),('GT','PR','El Progreso','Department'),('GT','SR','Santa Rosa','Department'),('GT','GU','Guatemala','Department'),('GT','RE','Retalhuleu','Department'),('GT','SA','Sacatep_quez','Department'),('GT','PE','Pet_n','Department'),('GT','TO','Totonicap�n','Department'),('GT','SU','Suchitep_quez','Department'),('GT','HU','Huehuetenango','Department'),('GT','ZA','Zacapa','Department'),('GT','SO','Solol�','Department'),('GT','JA','Jalapa','Department'),('GT','CQ','Chiquimula','Department'),('GT','SM','San Marcos','Department'),('GT','QZ','Quetzaltenango','Department'),('GL','KU','Kommune Kujalleq','Municipality'),('GL','QE','Qeqqata Kommunia','Municipality'),('GL','AV','Avannaata Kommunia','Municipality'),('GL','SM','Kommuneqarfik Sermersooq','Municipality'),('GL','QT','Kommune Qeqertalik','Municipality'),('SH','AC','Ascension','Geographical entity'),('SH','TA','Tristan da Cunha','Geographical entity'),('SH','HL','Saint Helena','Geographical entity'),('MY','9','Perlis','State'),('MY','4','Melaka','State'),('MY','11','Terengganu','State'),('MY','14','Wilayah Persekutuan Kuala Lumpur','Federal territory'),('MY','12','Sabah','State'),('MY','2','Kedah','State'),('MY','5','Negeri Sembilan','State'),('MY','6','Pahang','State'),('MY','15','Wilayah Persekutuan Labuan','Federal territory'),('MY','3','Kelantan','State'),('MY','10','Selangor','State'),('MY','1','Johor','State'),('MY','8','Perak','State'),('MY','13','Sarawak','State'),('MY','7','Pulau Pinang','State'),('MY','16','Wilayah Persekutuan Putrajaya','Federal territory'),('KM','M','Moh_li','Island'),('KM','G','Grande Comore','Island'),('KM','A','Anjouan','Island'),('LV','3','Aizputes novads (Aizpute)','Municipality'),('LV','1','Aglonas novads (Aglona)','Municipality'),('LV','5','Alojas novads (Aloja)','Municipality'),('LV','15','Balvu novads (Balvi)','Municipality'),('LV','12','Babites novads (Babite)','Municipality'),('LV','13','Baldones novads (Baldone)','Municipality'),('LV','2','Aizkraukles novads (Aizkraukle)','Municipality'),('LV','7','Aluksnes novads (Aluksne)','Municipality'),('LV','46','Kokneses novads (Koknese)','Municipality'),('LV','23','Ciblas novads (Cibla)','Municipality'),('LV','8','Amatas novads (Amata)','Municipality'),('LV','24','Dagdas novads (Dagda)','Municipality'),('LV','21','Cesvaines novads (Cesvaine)','Municipality'),('LV','16','Bauskas novads (Bauska)','Municipality'),('LV','61','Malpils novads (Malpils)','Municipality'),('LV','67','Ogres novads (Ogre)','Municipality'),('LV','30','Erglu novads (Ergli)','Municipality'),('LV','18','Brocenu novads (Broceni)','Municipality'),('LV','58','Ludzas novads (Ludza)','Municipality'),('LV','19','Burtnieku novads (Burtnieki)','Municipality'),('LV','14','Baltinavas novads (Baltinava)','Municipality'),('LV','36','Ilukstes novads (Ilukste)','Municipality'),('LV','69','Ozolnieku novads (Ozolnieki)','Municipality'),('LV','4','Aknistes novads (Akniste)','Municipality'),('LV','9','Apes novads (Ape)','Municipality'),('LV','31','Garkalnes novads (Garkalne)','Municipality'),('LV','44','Karsavas novads (Karsava)','Municipality'),('LV','20','Carnikavas novads (Carnikava)','Municipality'),('LV','57','Lubanas novads (Lubana)','Municipality'),('LV','52','Kekavas novads (Kekava)','Municipality'),('LV','34','Iecavas novads (Iecava)','Municipality'),('LV','71','Pavilostas novads (Pavilosta)','Municipality'),('LV','35','Ik_kiles novads (Ik_kile)','Municipality'),('LV','47','Kraslavas novads (Kraslava)','Municipality'),('LV','22','Cesu novads (Cesis)','Municipality'),('LV','32','Grobinas novads (Grobina)','Municipality'),('LV','41','Jelgavas novads (Jelgava)','Municipality'),('LV','74','Priekules novads (Priekule)','Municipality'),('LV','53','Lielvardes novads (Lielvarde)','Municipality'),('LV','70','Pargaujas novads (Pargauja)','Municipality'),('LV','38','Jaunjelgavas novads\n(Jaunjelgava)','Municipality'),('LV','25','Daugavpils novads (Daugavpils)','Municipality'),('LV','60','Mazsalacas novads (Mazsalaca)','Municipality'),('LV','37','Incukalna novads (Incukalns)','Municipality'),('LV','76','Raunas novads (Rauna)','Municipality'),('LV','42','Jekabpils novads (Jekabpils)','Municipality'),('LV','59','Madonas novads (Madona)','Municipality'),('LV','43','Kandavas novads (Kandava)','Municipality'),('LV','78','Riebinu novads (Riebini)','Municipality'),('LV','51','Keguma novads (Kegums)','Municipality'),('LV','77','Rezeknes novads (Rezekne)','Municipality'),('LV','64','Nauk_enu novads (Nauk_eni)','Municipality'),('LV','49','Krustpils novads (Krustpils)','Municipality'),('LV','84','Rujienas novads (Rujiena)','Municipality'),('LV','68','Olaines novads (Olaine)','Municipality'),('LV','10','Auces novads (Auce)','Municipality'),('LV','29','Engures novads (Engure)','Municipality'),('LV','82','Rugaju novads (Rugaji)','Municipality'),('LV','50','Kuldigas novads (Kuldiga)','Municipality'),('LV','105','Vecumnieku novads (Vecumnieki)','Municipality'),('LV','81','Rucavas novads (Rucava)','Municipality'),('LV','45','Kocenu novads (Koceni)','Municipality'),('LV','17','Beverinas novads (Beverina)','Municipality'),('LV','87','Salaspils novads (Salaspils)','Municipality'),('LV','65','Neretas novads (Nereta)','Municipality'),('LV','33','Gulbenes novads (Gulbene)','Municipality'),('LV','55','Ligatnes novads (Ligatne)','Municipality'),('LV','11','Ada_u novads (Ada_i)','Municipality'),('LV','85','Salas novads (Sala)','Municipality'),('LV','DGV','Daugavpils','Republican city'),('LV','28','Durbes novads (Durbe)','Municipality'),('LV','56','Livanu novads (Livani)','Municipality'),('LV','75','Priekulu novads (Priekuli)','Municipality'),('LV','39','Jaunpiebalgas novads\n(Jaunpiebalga)','Municipality'),('LV','27','Dundagas novads (Dundaga)','Municipality'),('LV','26','Dobeles novads (Dobele)','Municipality'),('LV','86','Salacgrivas novads (Salacgriva)','Municipality'),('LV','6','Alsungas novads (Alsunga)','Municipality'),('LV','66','Nicas novads (Nica)','Municipality'),('LV','40','Jaunpils novads (Jaunpils)','Municipality'),('LV','54','Limba_u novads (Limba_i)','Municipality'),('LV','79','Rojas novads (Roja)','Municipality'),('LV','63','Mersraga novads (Mersrags)','Municipality'),('LV','62','Marupes novads (Marupe)','Municipality'),('LV','48','Krimuldas novads (Krimulda)','Municipality'),('LV','72','Plavinu novads (Plavinas)','Municipality'),('LV','73','Preilu novads (Preili)','Municipality'),('LV','80','Ropa_u novads (Ropa_i)','Municipality'),('LV','LPX','Liepaja','Republican city'),('LV','108','Vilakas novads (Vilaka)','Municipality'),('LV','88','Saldus novads (Saldus)','Municipality'),('LV','103','Varkavas novads (Varkava)','Municipality'),('LV','110','Zilupes novads (Zilupe)','Municipality'),('LV','JEL','Jelgava','Republican city'),('LV','101','Valkas novads (Valka)','Municipality'),('LV','97','Talsu novads (Talsi)','Municipality'),('LV','94','Smiltenes novads (Smiltene)','Municipality'),('LV','RIX','Riga','Republican city'),('LV','107','Viesites novads (Viesite)','Municipality'),('LV','83','Rundales novads (Rundale)','Municipality'),('LV','90','Sejas novads (Seja)','Municipality'),('LV','VEN','Ventspils','Republican city'),('LV','99','Tukuma novads (Tukums)','Municipality'),('LV','92','Skriveru novads (Skriveri)','Municipality'),('LV','95','Stopinu novads (Stopini)','Municipality'),('LV','104','Vecpiebalgas novads\n(Vecpiebalga)','Municipality'),('LV','100','Vainodes novads (Vainode)','Municipality'),('LV','106','Ventspils novads (Ventspils)','Municipality'),('LV','89','Saulkrastu novads (Saulkrasti)','Municipality'),('LV','91','Siguldas novads (Sigulda)','Municipality'),('LV','REZ','Rezekne','Republican city'),('LV','93','Skrundas novads (Skrunda)','Municipality'),('LV','98','Tervetes novads (Tervete)','Municipality'),('LV','JKB','Jekabpils','Republican city'),('LV','96','Strencu novads (Strenci)','Municipality'),('LV','JUR','Jurmala','Republican city'),('LV','102','Varaklanu novads (Varaklani)','Municipality'),('LV','109','Vilanu novads (Vilani)','Municipality'),('LV','VMR','Valmiera','Republican city'),('VC','6','Grenadines','Parish'),('VC','1','Charlotte','Parish'),('VC','2','Saint Andrew','Parish'),('VC','3','Saint David','Parish'),('VC','4','Saint George','Parish'),('VC','5','Saint Patrick','Parish'),('MA','8','Dr�a-Tafilalet','Region'),('MA','ESI','Essaouira','Province'),('MA','6','Casablanca-Settat','Region'),('MA','AOU','Aousserd','Prefecture'),('MA','9','Souss-Massa','Region'),('MA','GUF','	Guercif','Province'),('MA','12','Dakhla-Oued Ed-Dahab (EH)','Region'),('MA','BOD','Boujdour (EH)','Province'),('MA','KES','	El Kel�a des Sraghna','Province'),('MA','CHT','Chtouka-Ait Baha','Province'),('MA','AGD','Agadir-Ida-Ou-Tanane','Prefecture'),('MA','5','B_ni Mellal-Kh_nifra','Region'),('MA','MEK','Mekn�s*','Prefecture'),('MA','LAR','Larache','Province'),('MA','INE','Inezgane-Ait Melloul','Prefecture'),('MA','CHE','Chefchaouene','Province'),('MA','OUA','Ouarzazate','Province'),('MA','SAL','Sal_','Prefecture'),('MA','FES','	F�s','Prefecture'),('MA','MAR','Marrakech','Prefecture'),('MA','FAH','	Fahs-Anjra','Prefecture'),('MA','11','La�youne-Sakia El Hamra (EH-partial)','Region'),('MA','FIG','Figuig','Province'),('MA','ESM','Es-Semara (EH-partial)','Province'),('MA','4','Rabat-Sal_-K_nitra','Region'),('MA','SEF','Sefrou','Province'),('MA','TAZ','Taza','Province'),('MA','FQH','	Fquih Ben Salah','Province'),('MA','OUZ','Ouezzane','Province'),('MA','SYB','Sidi Youssef Ben Ali','Prefecture'),('MA','SIB','Sidi Bennour','Province'),('MA','MMN','Marrakech-Menara','Prefecture'),('MA','BES','Benslimane','Province'),('MA','CHT','Chtouka-Ait Baha','Province'),('MA','CHI','Chichaoua','Province'),('MA','7','Marrakech-Safi','Region'),('MA','SET','Settat','Province'),('MA','LAA','La�youne','Province'),('MA','JRA','	Jerada','Province'),('MA','TIN','Tinghir','Province'),('MA','KES','Kelaat Sraghna','Province'),('MA','IFR','Ifrane','Province'),('MA','ERR','Errachidia','Province'),('MA','10','Guelmim-Oued Noun (EH-partial)','Region'),('MA','MID','	Midelt','Province'),('MA','BOM','Boulemane','Province'),('MA','OUD','	Oued Ed-Dahab (EH)','Province'),('MA','GUE','Guelmim','Province'),('MA','JDI','El Jadida','Province'),('MA','2','	L\'Oriental','Region'),('MA','DRI','	Driouch','Province'),('MA','AZI','Azilal','Province'),('MA','MOU','Moulay Yacoub','Province'),('MA','KHN','Khenifra','Province'),('MA','BER','Berkane','Province'),('MA','OUJ','Oujda-Angad','Prefecture'),('MA','TAI','Taourirt','Province'),('MA','SIL','Sidi Slimane','Province'),('MA','MOH','Mohammadia','Prefecture'),('MA','NAD','Nador','Province'),('MA','1','Tanger-T_touan-Al Hoce�ma','Region'),('MA','ASZ','Assa-Zag (EH-partial)','Province'),('MA','HAO','Al Haouz','Province'),('MA','REH','Rehamna','Province'),('MA','SAF','Safi','Province'),('MA','CAS','Casablanca [Dar el Be�da]*','Prefecture'),('MA','YUS','Youssoufia','Provicne'),('MA','3','	F�s- Mekn�s','Region'),('MA','HAJ','El Hajeb','Province'),('MA','RAB','Rabat','Prefecture'),('MA','HOC','Al Hoce�ma','Province'),('MA','BEM','Beni Mellal','Province'),('MA','MDF','M�diq-Fnideq','Prefecture'),('MA','TET','T_touan*','Prefecture'),('MA','KEN','K_nitra','Province'),('MA','BRR','Berrechid','Province'),('MA','TNT','Tan-Tan','Province'),('MA','TAR','Taroudannt','Province'),('MA','NOU','Nouaceur','Province'),('MA','KHE','Khemisset','Province'),('MA','KHO','Khouribga','Province'),('MA','MMD','Marrakech-Medina','Prefecture'),('MA','ZAG','Zagora','Province'),('MA','MED','M_diouna','Province'),('MA','SIK','Sidi Kacem','Province'),('MA','TAO','Taounate','Province'),('MA','TAF','Tarfaya (EH-partial)','Province'),('MA','TAT','Tata','Province'),('MA','SKH','Skhirate-T_mara','Prefecture'),('MA','SIF','	Sidi Ifni','Province'),('MA','TNG','Tanger-Assilah','Prefecture'),('MA','TIZ','Tiznit','Province'),('NO','3','Oslo','County'),('NO','6','Buskerud','County'),('NO','50','Tr�ndelag','County'),('NO','19','Troms','County'),('NO','10','Vest-Agder','County'),('NO','12','Hordaland','County'),('NO','2','Akershus','County'),('NO','20','Finnmark','County'),('NO','21','Svalbard (Arctic Region) (See\nalso country code SJ)','Arctic region'),('NO','5','Oppland','County'),('NO','4','Hedmark','County'),('NO','11','Rogaland','County'),('NO','14','Sogn og Fjordane','County'),('NO','18','Nordland','County'),('NO','15','M�re og Romsdal','County'),('NO','1','�stfold','County'),('NO','8','Telemark','County'),('NO','9','Aust-Agder','County'),('NO','7','Vestfold','County'),('NO','22','Jan Mayen (Arctic Region) (See\nalso country code SJ)','Arctic region'),('BE','VBR','Vlaams Brabant','Province'),('BE','VWV','West-Vlaanderen','Province'),('BE','VOV','Oost-Vlaanderen','Province'),('BE','WHT','Hainaut','Province'),('BE','WNA','Namur','Province'),('BE','BRU','Bruxelles-Capitale, R_gion de','Region'),('BE','VLI','Limburg','Province'),('BE','WLG','Li�ge','Province'),('BE','WBR','Brabant wallon','Province'),('BE','VAN','Antwerpen','Province'),('BE','WLX','Luxembourg','Province'),('TZ','29','Njombe','Region'),('TZ','30','Simiyu','Region'),('TZ','1','Arusha','Region'),('TZ','17','Mtwara','Region'),('TZ','11','Kusini Unguja','Region'),('TZ','4','Iringa','Region'),('TZ','7','Kaskazini Unguja','Region'),('TZ','3','Dodoma','Region'),('TZ','13','Mara','Region'),('TZ','16','Morogoro','Region'),('TZ','19','Pwani','Region'),('TZ','14','Mbeya','Region'),('TZ','9','Kilimanjaro','Region'),('TZ','24','Tabora','Region'),('TZ','21','Ruvuma','Region'),('TZ','23','Singida','Region'),('TZ','18','Mwanza','Region'),('TZ','15','Mjini Magharibi','Region'),('TZ','10','Kusini Pemba','Region'),('TZ','27','Geita','Region'),('TZ','2','Dar es Salaam','Region'),('TZ','5','Kagera','Region'),('TZ','12','Lindi','Region'),('TZ','6','Kaskazini Pemba','Region'),('TZ','25','Tanga','Region'),('TZ','20','Rukwa','Region'),('TZ','26','Manyara','Region'),('TZ','8','Kigoma','Region'),('TZ','31','	Songwe','Region'),('TZ','28','Katavi','Region'),('TZ','22','Shinyanga','Region'),('JP','31','Tottori','Prefecture'),('JP','5','Akita','Prefecture'),('JP','36','Tokusima [Tokushima]','Prefecture'),('JP','39','K�ti [Kochi]','Prefecture'),('JP','1','Hokkaid� [Hokkaido]','Prefecture'),('JP','4','Miyagi','Prefecture'),('JP','14','Kanagawa','Prefecture'),('JP','19','Yamanasi [Yamanashi]','Prefecture'),('JP','21','Gihu [Gifu]','Prefecture'),('JP','9','Totigi [Tochigi]','Prefecture'),('JP','2','Aomori','Prefecture'),('JP','15','Niigata','Prefecture'),('JP','17','Isikawa [Ishikawa]','Prefecture'),('JP','11','Saitama','Prefecture'),('JP','20','Nagano','Prefecture'),('JP','6','Yamagata','Prefecture'),('JP','26','Hy�go [Kyoto]','Prefecture'),('JP','7','Hukusima [Fukushima]','Prefecture'),('JP','16','Toyama','Prefecture'),('JP','24','Mie','Prefecture'),('JP','30','Wakayama','Prefecture'),('JP','28','Hy�go[Hyogo]','Prefecture'),('JP','3','Iwate','Prefecture'),('JP','8','Ibaraki','Prefecture'),('JP','25','Siga [Shiga]','Prefecture'),('JP','18','Hukui [Fukui]','Prefecture'),('JP','13','T�ky� [Tokyo]','Prefecture'),('JP','22','Sizuoka [Shizuoka]','Prefecture'),('JP','10','Gunma','Prefecture'),('JP','34','Hirosima [Hiroshima]','Prefecture'),('JP','29','Nara','Prefecture'),('JP','12','Tiba [Chiba]','Prefecture'),('JP','41','Saga','Prefecture'),('JP','44','�ita [Oita]','Prefecture'),('JP','23','Aiti [Aichi]','Prefecture'),('JP','40','Hukuoka [Fukuoka]','Prefecture'),('JP','33','Okayama','Prefecture'),('JP','43','Kumamoto','Prefecture'),('JP','45','Miyazaki','Prefecture'),('JP','32','Simane [Shimane]','Prefecture'),('JP','46','Kagosima [Kagoshima]','Prefecture'),('JP','37','Kagawa','Prefecture'),('JP','27','�saka [Osaka]','Prefecture'),('JP','38','Ehime','Prefecture'),('JP','35','Yamaguti [Yamaguchi]','Prefecture'),('JP','47','Okinawa','Prefecture'),('JP','42','Nagasaki','Prefecture'),('TW','NWT','New Taipei','special municipality'),('TW','CYQ','Chiayi','County'),('TW','CHA','Changhua','County'),('TW','KHH','Kaohsiung','special municipality'),('TW','HSQ','Hsinchu','County'),('TW','MIA','Miaoli','County'),('TW','CYI','Chiayi','City'),('TW','HSZ','Hsinchu','City'),('TW','TTT','Taitung','County'),('TW','KEE','Keelung','City'),('TW','NAN','Nantou','County'),('TW','TXG','Taichung','special municipality'),('TW','KIN','Kinmen','County'),('TW','HUA','Hualien','County'),('TW','ILA','Yilan','County'),('TW','PEN','Penghu','County'),('TW','LIE','Lienchiang','County'),('TW','TPE','Taipei','special municipality'),('TW','PIF','Pingtung','County'),('TW','TAO','Taoyuan','special municipality'),('TW','TNN','Tainan','special municipality'),('TW','YUN','Yunlin','County'),('AE','DU','Dubayy [Dubai]','Emirate'),('AE','UQ','Umm al Qaywayn','Emirate'),('AE','AJ','\'Ajman','Emirate'),('AE','RK','Ras al Khaymah','Emirate'),('AE','SH','Ash Shariqah [Sharjah]','Emirate'),('AE','FU','Al Fujayrah','Emirate'),('AE','AZ','Abu Zhaby [Abu Dhabi]','Emirate'),('UG','103','Kiboga','District'),('UG','112','Kayunga','District'),('UG','117','Buikwe','District'),('UG','121','Gomba','District'),('UG','126','Kasanda','District'),('UG','122','Kalungu','District'),('UG','216','Amuria','District'),('UG','218','Bududa','District'),('UG','101','Kalangala','District'),('UG','114','Lyantonde','District'),('UG','204','Jinja','District'),('UG','210','Pallisa','District'),('UG','106','Mpigi','District'),('UG','105','Masaka','District'),('UG','107','Mubende','District'),('UG','113','Wakiso','District'),('UG','108','Mukono','District'),('UG','124','Lwengo','District'),('UG','206','Kapchorwa','District'),('UG','208','Kumi','District'),('UG','224','Namutumba','District'),('UG','205','Kamuli','District'),('UG','110','Rakai','District'),('UG','120','Buvuma','District'),('UG','215','Sironko','District'),('UG','104','Luwero','District'),('UG','209','Mbale','District'),('UG','220','Bukwa','District'),('UG','119','Butambala','District'),('UG','123','Kyankwanzi','District'),('UG','213','Kaberamaido','District'),('UG','211','Soroti','District'),('UG','201','Bugiri','District'),('UG','207','Katakwi','District'),('UG','102','Kampala','City'),('UG','116','Nakaseke','District'),('UG','115','Mityana','District'),('UG','109','Nakasongola','District'),('UG','125','Kyotera','District'),('UG','111','Sembabule','District'),('UG','203','Iganga','District'),('UG','118','Bukomansibi','District'),('UG','219','Bukedea','District'),('UG','202','Busia','District'),('UG','212','Tororo','District'),('UG','229','Luuka','District'),('UG','305','Kitgum','District'),('UG','222','Kaliro','District'),('UG','319','Koboko','District'),('UG','226','Buyende','District'),('UG','320','Maracha','District'),('UG','234','Namisindwa','District'),('UG','217','Budaka','District'),('UG','318','Kaabong','District'),('UG','301','Adjumani','District'),('UG','403','Hoima','District'),('UG','315','Amolatar','District'),('UG','223','Manafwa','District'),('UG','221','Butaleja','District'),('UG','227','Kibuku','District'),('UG','312','Pader','District'),('UG','328','Nwoya','District'),('UG','316','Amuru','District'),('UG','332','Pakwach','District'),('UG','235','Bugweri','District'),('UG','309','Moyo','District'),('UG','225','Bulambuli','District'),('UG','302','Apac','District'),('UG','236','Kapelebyong','District'),('UG','233','Butebo','District'),('UG','419','Kiruhura','District'),('UG','424','Ntoroko','District'),('UG','321','Oyam','District'),('UG','310','Nebbi','District'),('UG','416','Buliisa','District'),('UG','228','Kween','District'),('UG','308','Moroto','District'),('UG','407','Kibaale','District'),('UG','401','Bundibugyo','District'),('UG','402','Bushenyi','District'),('UG','244','Mayuge','District'),('UG','311','Nakapiripirit','District'),('UG','329','Otuke','District'),('UG','304','Gulu','District'),('UG','420','Buhweju','District'),('UG','418','Isingiro','District'),('UG','232','Serere','District'),('UG','325','Kole','District'),('UG','429','Rubanda','District'),('UG','314','Abim','District'),('UG','333','Kwania','District'),('UG','421','Kiryandongo','District'),('UG','306','Kotido','District'),('UG','408','Kisoro','District'),('UG','307','Lira','District'),('UG','230','Namayingo','District'),('UG','423','Mitooma','District'),('UG','410','Mbarara','District'),('UG','317','Dokolo','District'),('UG','411','Ntungamo','District'),('UG','415','Kyenjojo','District'),('UG','425','Rubirizi','District'),('UG','330','Zombo','District'),('UG','432','Kikuube','District'),('UG','405','Kabarole','District'),('UG','327','Napak','District'),('UG','409','Masindi','District'),('UG','313','Yumbe','District'),('UG','426','Sheema','District'),('UG','231','Ngora','District'),('UG','331','Omoro','District'),('UG','303','Arua','District'),('UG','427','Kagadi','District'),('UG','413','Kamwenge','District'),('UG','430','Bunyangabu','District'),('UG','406','Kasese','District'),('UG','414','Kanungu','District'),('UG','326','Lamwo','District'),('UG','428','Kakumiro','District'),('UG','334','Nabilatuk','District'),('UG','404','Kabale','District'),('UG','417','Ibanda','District'),('UG','431','Rukiga','District'),('UG','412','Rukungiri','District'),('UG','422','Kyegegwa','District'),('BN','TE','Temburong','District'),('BN','TU','Tutong','District'),('BN','BM','Brunei-Muara','District'),('BN','BE','Belait','District'),('FM','KSA','Kosrae','State'),('FM','PNI','Pohnpei','State'),('FM','TRK','Chuuk','State'),('FM','YAP','Yap','State'),('PK','GB','Gilgit-Baltistan','Pakistan administrered area'),('PK','BA','Balochistan','Province'),('PK','PB','Punjab','Province'),('PK','IS','Islamabad','Federal capital territory'),('PK','KP','Khyber Pakhtunkhwa','Province'),('PK','JK','Azad Jammu and Kashmir','Pakistan administrered area'),('PK','TA','Federally Administered Tribal Areas','Territory'),('PK','SD','Sindh','Province'),('CU','4','Matanzas','Province'),('CU','13','Santiago de Cuba','Province'),('CU','9','Camag�ey','Province'),('CU','7','Sancti Sp�ritus','Province'),('CU','12','Granma','Province'),('CU','11','Holgu�n','Province'),('CU','8','Ciego de �vila','Province'),('CU','2','La Habana','Province'),('CU','3','Ciudad de La Habana','Province'),('CU','10','Las Tunas','Province'),('CU','5','Villa Clara','Province'),('CU','6','Cienfuegos','Province'),('CU','1','Pinar del R�o','Province'),('CU','16','Mayabeque','Province'),('CU','14','Guant�namo','Province'),('CU','99','Isla de la Juventud','Special municipality'),('CU','15','Artemisa','Province'),('MH','NMK','Namdrik','Municipality'),('MH','LAE','Lae','Municipality'),('MH','LIB','Lib','Municipality'),('MH','JAB','Jabat','Municipality'),('MH','ENI','Enewetak & Ujelang','Municipality'),('MH','ALL','Ailinglaplap','Municipality'),('MH','UJA','Ujae','Municipality'),('MH','KIL','Bikini & Kili','Municipality'),('MH','T','Ratak chain','Chains (of islands)'),('MH','EBO','Ebon','Municipality'),('MH','ARN','Arno','Municipality'),('MH','RON','Rongelap','Municipality'),('MH','KWA','Kwajalein','Municipality'),('MH','JAL','Jaluit','Municipality'),('MH','LIK','Likiep','Municipality'),('MH','MEJ','Mejit','Municipality'),('MH','AUR','Aur','Municipality'),('MH','L','Ralik chain','Chains (of islands)'),('MH','NMU','Namu','Municipality'),('MH','MIL','Mili','Municipality'),('MH','ALK','Ailuk','Municipality'),('MH','UTI','Utrik','Municipality'),('MH','MAJ','Majuro','Municipality'),('MH','MAL','Maloelap','Municipality'),('MH','WTH','Wotho','Municipality'),('MH','WTJ','Wotje','Municipality'),('LR','RG','River Gee','County'),('LR','GK','Grand Kru','County'),('LR','GG','Grand Gedeh','County'),('LR','LO','Lofa','County'),('LR','SI','Sinoe','County'),('LR','GP','Gbarpolu','County'),('LR','BG','Bong','County'),('LR','CM','Grand Cape Mount','County'),('LR','BM','Bomi','County'),('LR','MO','Montserrado','County'),('LR','MG','Margibi','County'),('LR','MY','Maryland','County'),('LR','GB','Grand Bassa','County'),('LR','NI','Nimba','County'),('LR','RI','	River Cess','County'),('BT','15','Thimphu','District'),('BT','32','Trongsa','District'),('BT','12','Chhukha','District'),('BT','31','Sarpang','District'),('BT','43','Pemagatshel','District'),('BT','34','Zhemgang','District'),('BT','13','Haa','District'),('BT','22','Dagana','District'),('BT','44','Lhuentse','District'),('BT','23','Punakha','District'),('BT','21','Tsirang','District'),('BT','14','Samtse','District'),('BT','GA','Gasa','District'),('BT','11','Paro','District'),('BT','42','Monggar','District'),('BT','TY','Trashi Yangtse','District'),('BT','45','Samdrup Jongkhar','District'),('BT','24','Wangdue Phodrang','District'),('BT','41','Trashigang','District'),('BT','33','Bumthang','District'),('SY','HI','Hims','Province'),('SY','DY','Dayr az Zawr','Province'),('SY','LA','AI Ladhiqiyah','Province'),('SY','HL','Halab','Province'),('SY','HM','Hamah','Province'),('SY','QU','AI Qunaytirah','Province'),('SY','DR','Dar\'a','Province'),('SY','DI','Dimashq','Province'),('SY','SU','As Suwayda\'','Province'),('SY','HA','AI Hasakah','Province'),('SY','RD','Rif Dimashq','Province'),('SY','TA','Tartus','Province'),('SY','ID','Idlib','Province'),('SY','RA','Ar Raqqah','Province'),('GB','BNE','Barnet','Council area'),('GB','BRD','Bradford','Council area'),('GB','BNH','Brighton and Hove','Unitary authority'),('GB','BIR','Birmingham','Council area'),('GB','CLK','Clackmannanshire','Council area'),('GB','ELN','East Lothian','Council area'),('GB','BRC','Bracknell Forest','Unitary authority'),('GB','CGN','Ceredigion [Sir Ceredigion]','Unitary authority'),('GB','ANS','Angus','Council area'),('GB','ABE','Aberdeen City','Council area'),('GB','BGW','Blaenau Gwent','Unitary authority'),('GB','CLD','Calderdale','Council area'),('GB','BGE','Bridgend [Pen-y-bont ar Ogwr GB-POG]','Unitary authority'),('GB','ABC','Armagh, Banbridge and Craigavon','district'),('GB','BST','Bristol, City of','Unitary authority'),('GB','BKM','Buckinghamshire','County'),('GB','AND','Ards and North Down','district'),('GB','ARM','Armagh','District council area'),('GB','BUR','Bury','Council area'),('GB','BRY','Bromley','Council area'),('GB','CMA','Cumbria','County'),('GB','ABD','Aberdeenshire','Council area'),('GB','ANN','Antrim and Newtownabbey','district'),('GB','CBF','Central Bedfordshire','Unitary authority'),('GB','BDF','Bedford','Council area'),('GB','AGB','Argyll and Bute','Council area'),('GB','BAS','Bath and North East Somerset','Unitary authority'),('GB','DAL','Darlington','Unitary authority'),('GB','BEN','Brent','Council area'),('GB','AGY','Isle of Anglesey [Sir Ynys M�n GB-YNM]','Unitary authority'),('GB','BEX','Bexley','Council area'),('GB','DUR','Durham','Unitary authority'),('GB','CHE','Cheshire East','Unitary authority'),('GB','BBD','Blackburn with Darwen','Unitary authority'),('GB','CAM','Cambridgeshire','County'),('GB','DER','Derby','Unitary authority'),('GB','COV','Coventry','Council area'),('GB','BOL','Bolton','Council area'),('GB','CRF','Cardiff [Caerdydd GB-CRD]','Unitary authority'),('GB','CCG','Causeway Coast and Glens','district'),('GB','BNS','Barnsley','Council area'),('GB','BFS','Belfast','District'),('GB','BMH','Bournemouth','Unitary authority'),('GB','CAY','Caerphilly [Caerffili GB-CAF]','Unitary authority'),('GB','CWY','Conwy','Unitary authority'),('GB','DRS','	Derry and Strabane','district'),('GB','BPL','Blackpool','Unitary authority'),('GB','CMN','Carmarthenshire [Sir Gaerfyrddin GB-GFY]','Unitary authority'),('GB','BDG','Barking and Dagenham','London borough'),('GB','CRY','Croydon','Council area'),('GB','CHW','Cheshire West and Chester','Unitary authority'),('GB','DBY','Derbyshire','County'),('GB','CON','Cornwall','Unitary authority'),('GB','DGY','Dumfries and Galloway','Council area'),('GB','ESX','East Sussex','County'),('GB','DEV','Devon','County'),('GB','ERY','East Riding of Yorkshire','Unitary authority'),('GB','EDU','East Dunbartonshire','Council area'),('GB','HAV','Havering','Council area'),('GB','ENF','Enfield','Council area'),('GB','HMF','Hammersmith and Fulham','Council area'),('GB','EAL','Ealing','Council area'),('GB','FAL','Falkirk','Council area'),('GB','DND','Dundee City','Council area'),('GB','EDH','Edinburgh, City of','Council area'),('GB','GAT','Gateshead','Council area'),('GB','CMD','Camden','Council area'),('GB','DUD','Dudley','Council area'),('GB','FIF','Fife','Council area'),('GB','DEN','Denbighshire [Sir Ddinbych GB-DDB]','Unitary authority'),('GB','DOR','Dorset','County'),('GB','DNC','Doncaster','Council area'),('GB','GLG','Glasgow City','Council area'),('GB','ESS','Essex','County'),('GB','ERW','East Renfrewshire','Council area'),('GB','ELS','Eilean Siar','Council area'),('GB','HLD','Highland','Council area'),('GB','HRT','Hertfordshire','County'),('GB','HRY','Haringey','Council area'),('GB','GLS','Gloucestershire','County'),('GB','HCK','Hackney','Council area'),('GB','EAY','East Ayrshire','Council area'),('GB','FMO','	Fermanagh and Omagh','district'),('GB','GRE','Greenwich','Council area'),('GB','HNS','Hounslow','Council area'),('GB','HIL','Hillingdon','Council area'),('GB','HRW','Harrow','Council area'),('GB','GWN','Gwynedd','Unitary authority'),('GB','ISL','Islington','Council area'),('GB','IOS','Isles of Scilly','Unitary authority'),('GB','LBH','Lambeth','Council area'),('GB','KTT','Kingston upon Thames','Council area'),('GB','FLN','Flintshire [Sir y Fflint GB-FFL]','Unitary authority'),('GB','KWL','Knowsley','Council area'),('GB','KIR','Kirklees','Council area'),('GB','KHL','Kingston upon Hull','Unitary authority'),('GB','LIN','Lincolnshire','County'),('GB','LCE','Leicester','Unitary authority'),('GB','HEF','Herefordshire','Unitary authority'),('GB','MDW','Medway','Unitary authority'),('GB','LAN','Lancashire','County'),('GB','IVC','Inverclyde','Council area'),('GB','MDB','Middlesbrough','Unitary authority'),('GB','HAL','Halton','Unitary authority'),('GB','LEW','Lewisham','Council area'),('GB','KEC','Kensington and Chelsea','Council area'),('GB','MON','Monmouthshire [Sir Fynwy GB-FYN]','Unitary authority'),('GB','NYK','North Yorkshire','County'),('GB','NLK','North Lanarkshire','Council area'),('GB','MRT','Merton','Council area'),('GB','NSM','North Somerset','Unitary authority'),('GB','KEN','Kent','County'),('GB','MAN','Manchester','Council area'),('GB','HPL','Hartlepool','Unitary authority'),('GB','HAM','Hampshire','County'),('GB','IOW','Isle of Wight','Unitary authority'),('GB','LBC','Lisburn and Castlereagh','district'),('GB','LDS','Leeds','Council area'),('GB','NBL','Northumberland','Unitary authority'),('GB','MUL','Mid Ulster','district'),('GB','LIV','Liverpool','Council area'),('GB','MEA','Mid and East Antrim','district'),('GB','LND','London, City of','City Corporation'),('GB','NFK','Norfolk','County'),('GB','LEC','Leicestershire','County'),('GB','NLN','North Lincolnshire','Unitary authority'),('GB','LUT','Luton','Unitary authority'),('GB','MRY','Moray','Council area'),('GB','MLN','Midlothian','Council area'),('GB','NEL','North East Lincolnshire','Unitary authority'),('GB','NET','Newcastle upon Tyne','Council area'),('GB','PEM','Pembrokeshire [Sir Benfro GB-BNF]','Unitary authority'),('GB','NTL','Neath Port Talbot [Castell-nedd Port Talbot GB-CTL]','Unitary authority'),('GB','NAY','North Ayrshire','Council area'),('GB','NTT','Nottinghamshire','County'),('GB','SLG','Slough','Unitary authority'),('GB','NWM','Newham','Council area'),('GB','NMD','Newry, Mourne and Down','district'),('GB','SOM','Somerset','County'),('GB','STN','Sutton','Council area'),('GB','NTY','North Tyneside','Council area'),('GB','NGM','Nottingham','Unitary authority'),('GB','NTH','Northamptonshire','County'),('GB','POW','Powys','Unitary authority'),('GB','ROT','Rotherham','Council area'),('GB','PKN','Perth and Kinross','Council area'),('GB','MIK','Milton Keynes','Unitary authority'),('GB','MTY','Merthyr Tydfil [Merthyr Tudful GB-MTU]','Unitary authority'),('GB','RFW','Renfrewshire','Council area'),('GB','SAY','South Ayrshire','Council area'),('GB','NWP','Newport [Casnewydd GB-CNW]','Unitary authority'),('GB','SOL','Solihull','Council area'),('GB','OXF','Oxfordshire','County'),('GB','SFT','Sefton','Council area'),('GB','SKP','Stockport','Council area'),('GB','SHR','Shropshire','Unitary authority'),('GB','PTE','Peterborough','Unitary authority'),('GB','RDG','Reading','Unitary authority'),('GB','SAW','Sandwell','Council area'),('GB','RUT','Rutland','Unitary authority'),('GB','SLF','Salford','Council area'),('GB','RCT','Rhondda, Cynon, Taff [Rhondda, Cynon,Taf]','Unitary authority'),('GB','STY','South Tyneside','Council area'),('GB','RCC','Redcar and Cleveland','Unitary authority'),('GB','POL','Poole','Unitary authority'),('GB','PLY','Plymouth','Unitary authority'),('GB','SHF','Sheffield','Council area'),('GB','SWD','Swindon','Unitary authority'),('GB','POR','Portsmouth','Unitary authority'),('GB','SGC','South Gloucestershire','Unitary authority'),('GB','TFW','Telford and Wrekin','Unitary authority'),('GB','SFK','Suffolk','County'),('GB','OLD','Oldham','Council area'),('GB','RDB','Redbridge','Council area'),('GB','RCH','Rochdale','Council area'),('GB','ORK','Orkney Islands','Council area'),('GB','SWA','Swansea [Abertawe GB-ATA]','Unitary authority'),('GB','THR','Thurrock','Unitary authority'),('GB','STT','Stockton-on-Tees','Unitary authority'),('GB','RIC','Richmond upon Thames','Council area'),('GB','SCB','Scottish Borders, The','Council area'),('GB','STH','Southampton','Unitary authority'),('GB','TAM','Tameside','Council area'),('GB','SHN','St. Helens','Council area'),('GB','TRF','Trafford','Council area'),('GB','STG','Stirling','Council area'),('GB','SND','Sunderland','Council area'),('GB','WDU','West Dunbartonshire','Council area'),('GB','WAR','Warwickshire','County'),('GB','TOF','Torfaen [Tor-faen]','Unitary authority'),('GB','STE','Stoke-on-Trent','Unitary authority'),('GB','SOS','Southend-on-Sea','Unitary authority'),('GB','WBK','West Berkshire','Unitary authority'),('GB','SRY','Surrey','County'),('GB','STS','Staffordshire','County'),('GB','WRT','Warrington','Unitary authority'),('GB','SWK','Southwark','Council area'),('GB','WRX','Wrexham [Wrecsam GB-WRC]','Unitary authority'),('GB','TOB','Torbay','Unitary authority'),('GB','WKF','Wakefield','Council area'),('GB','SLK','South Lanarkshire','Council area'),('GB','TWH','Tower Hamlets','Council area'),('GB','WFT','Waltham Forest','Council area'),('GB','WLV','Wolverhampton','Council area'),('GB','WNM','Windsor and Maidenhead','Unitary authority'),('GB','WSM','Westminster','Council area'),('GB','WOR','Worcestershire','County'),('GB','WSX','West Sussex','County'),('GB','WLL','Walsall','Council area'),('GB','WRL','Wirral','Council area'),('GB','VGL','Vale of Glamorgan, The [Bro Morgannwg GB-BMG]','Unitary authority'),('GB','WOK','Wokingham','Unitary authority'),('GB','WND','Wandsworth','Council area'),('GB','WGN','Wigan','Council area'),('GB','YOR','York','Unitary authority'),('GB','ZET','Shetland Islands','Council area'),('GB','WIL','Wiltshire','Unitary authority'),('GB','WLN','West Lothian','Council area'),('PL','14','Mazowieckie','Voivodship'),('PL','22','Pomorskie','Voivodship'),('PL','24','Slaskie','Voivodship'),('PL','30','Wielkopolskie','Voivodship'),('PL','2','Dolnoslaskie','Voivodship'),('PL','8','Lubuskie','Voivodship'),('PL','28','Warminsko-mazurskie','Voivodship'),('PL','4','Kujawsko-pomorskie','Voivodship'),('PL','12','Malopolskie','Voivodship'),('PL','32','Zachodniopomorskie','Voivodship'),('PL','18','Podkarpackie','Voivodship'),('PL','16','Opolskie','Voivodship'),('PL','6','Lubelskie','Voivodship'),('PL','20','Podlaskie','Voivodship'),('PL','10','L�dzkie','Voivodship'),('PL','26','Swietokrzyskie','Voivodship'),('MD','BA','Balti','City'),('MD','CU','Chisinau','City'),('MD','RI','R�scani','District'),('MD','BD','Bender [Tighina]','City'),('MD','CT','Cantemir','District'),('MD','DR','Drochia','District'),('MD','GL','Glodeni','District'),('MD','BS','Basarabeasca','District'),('MD','BR','Briceni','District'),('MD','DO','Donduseni','District'),('MD','CS','Causeni','District'),('MD','CL','Calarasi','District'),('MD','ED','Edinet','District'),('MD','CA','Cahul','District'),('MD','NI','Nisporeni','District'),('MD','HI','H�ncesti','District'),('MD','OC','Ocni_a','District'),('MD','SV','Stefan Voda','District'),('MD','SD','Soldanesti','District'),('MD','GA','Gagauzia, Unitatea teritoriala\nautonoma (UTAG)','Autonomous territory unit'),('MD','SN','St�nga Nistrului, unitatea teritoriala din','Territorial unit'),('MD','SI','S�ngerei','District'),('MD','SO','Soroca','District'),('MD','AN','Anenii Noi','District'),('MD','LE','Leova','District'),('MD','ST','Straseni','District'),('MD','FL','Floresti','District'),('MD','TA','Taraclia','District'),('MD','OR','Orhei','District'),('MD','DU','Dubasari','District'),('MD','IA','Ialoveni','District'),('MD','CM','Cimislia','District'),('MD','CR','Criuleni','District'),('MD','TE','Telenesti','District'),('MD','UN','Ungheni','District'),('MD','FA','Falesti','District'),('MD','RE','Rezina','District'),('BF','BAL','Bal_','Province'),('BF','GNA','Gnagna','Province'),('BF','BAM','Bam','Province'),('BF','GAN','Ganzourgou','Province'),('BF','KAD','Kadiogo','Province'),('BF','BGR','Bougouriba','Province'),('BF','GOU','Gourma','Province'),('BF','YAG','Yagha','Province'),('BF','BAN','Banwa','Province'),('BF','IOB','Ioba','Province'),('BF','KEN','K_n_dougou','Province'),('BF','BLG','Boulgou','Province'),('BF','NOU','Noumbiel','Province'),('BF','KMD','Komondjari','Province'),('BF','BAZ','Baz�ga\nga','Province'),('BF','KOW','Kourw_ogo','Province'),('BF','KOT','Kouritenga','Province'),('BF','NAM','Namentenga','Province'),('BF','KMP','Kompienga','Province'),('BF','BLK','Boulkiemd_','Province'),('BF','OUD','Oudalan','Province'),('BF','LOR','Loroum','Province'),('BF','COM','Como_','Province'),('BF','NAO','Nahouri','Province'),('BF','KOS','Kossi','Province'),('BF','TUI','Tuy','Province'),('BF','MOU','Mouhoun','Province'),('BF','SIS','Sissili','Province'),('BF','ZOU','Zoundw_ogo','Province'),('BF','PAS','Passor_','Province'),('BF','LER','L_raba','Province'),('BF','OUB','Oubritenga','Province'),('BF','SEN','S_no','Province'),('BF','PON','Poni','Province'),('BF','KOP','Koulp_logo','Province'),('BF','SNG','Sangui_','Province'),('BF','SMT','Sanmatenga','Province'),('BF','HOU','Houet','Province'),('BF','SOM','Soum','Province'),('BF','ZON','Zondoma','Province'),('BF','YAT','Yatenga','Province'),('BF','NAY','Nayala','Province'),('BF','SOR','Sourou','Province'),('BF','TAP','Tapoa','Province'),('BF','ZIR','Ziro','Province'),('CH','BL','Basel-Landschaft (de)','Canton'),('CH','VD','Vaud (fr)','Canton'),('CH','GE','Gen�ve (fr)','Canton'),('CH','FR','Fribourg (fr)','Canton'),('CH','TG','Thurgau (de)','Canton'),('CH','TI','Ticino (it)','Canton'),('CH','AR','Appenzell Ausserrhoden (de)','Canton'),('CH','AI','Appenzell Innerrhoden (de)','Canton'),('CH','JU','Jura (fr)','Canton'),('CH','ZH','Z�rich (de)','Canton'),('CH','BE','Bern (de)','Canton'),('CH','AG','Aargau (de)','Canton'),('CH','GL','Glarus (de)','Canton'),('CH','BS','Basel-Stadt (de)','Canton'),('CH','OW','Obwalden (de)','Canton'),('CH','NW','Nidwalden (de)','Canton'),('CH','GR','Graub�nden (de)','Canton'),('CH','SH','Schaffhausen (de)','Canton'),('CH','SG','Sankt Gallen (de)','Canton'),('CH','UR','Uri (de)','Canton'),('CH','ZG','Zug (de)','Canton'),('CH','NE','Neuch�tel (fr)','Canton'),('CH','SO','Solothurn (de)','Canton'),('CH','LU','Luzern (de)','Canton'),('CH','VS','Valais (fr)','Canton'),('CH','SZ','Schwyz (de)','Canton'),('NA','OW','Ohangwena','Region'),('NA','KH','Khomas','Region'),('NA','OD','Otjozondjupa','Region'),('NA','ER','Erongo','Region'),('NA','KE','Kavango East','Region'),('NA','KA','Karas','Region'),('NA','OH','Omaheke','Region'),('NA','OS','Omusati','Region'),('NA','HA','Hardap','Region'),('NA','CA','Zambezi','Region'),('NA','ON','Oshana','Region'),('NA','KU','Kunene','Region'),('NA','KW','Kavango West','undefined'),('NA','OT','Oshikoto','Region'),('DE','BW','Baden-W�rttemberg','Land'),('DE','SL','Saarland','Land'),('DE','HB','Bremen','Land'),('DE','HE','Hessen','Land'),('DE','MV','Mecklenburg-Vorpommern','Land'),('DE','ST','Sachsen-Anhalt','Land'),('DE','HH','Hamburg','Land'),('DE','BB','Brandenburg','Land'),('DE','TH','Th�ringen','Land'),('DE','NW','Nordrhein-Westfalen','Land'),('DE','BE','Berlin','Land'),('DE','NI','Niedersachsen','Land'),('DE','SH','Schleswig-Holstein','Land'),('DE','BY','Bayern','Land'),('DE','RP','Rheinland-Pfalz','Land'),('DE','SN','Sachsen','Land'),('KP','1','Phyeongyang','Capital City'),('KP','2','Phyeongannamto','Province'),('KP','3','Phyeonganpukto','Province'),('KP','9','Hamkyeongpukto','Province'),('KP','14','Namp�o','Metropolitan City'),('KP','13','Rason','Special City'),('KP','5','Hwanghainamto','Province'),('KP','7','Kangweonto','Province'),('KP','8','Hamkyeongnamto','Province'),('KP','4','Jakangto','Province'),('KP','6','Hwanghaipukto','Province'),('KP','10','Ryanggang-do','Province'),('MW','CK','Chikwawa','District'),('MW','DE','Dedza','District'),('MW','MG','Mangochi','District'),('MW','BL','Blantyre','District'),('MW','DO','Dowa','District'),('MW','NE','Neno','District'),('MW','LI','Lilongwe','District'),('MW','CR','Chiradzulu','District'),('MW','KR','Karonga','District'),('MW','NU','Ntcheu','District'),('MW','TH','Thyolo','District'),('MW','NS','Nsanje','District'),('MW','SA','Salima','District'),('MW','ZO','Zomba','District'),('MW','MC','Mchinji','District'),('MW','CT','Chitipa','District'),('MW','BA','Balaka','District'),('MW','MH','Machinga','District'),('MW','C','Central','Region'),('MW','KS','Kasungu','District'),('MW','S','Southern','Region'),('MW','NK','Nkhotakota','District'),('MW','N','Northern','Region'),('MW','MZ','Mzimba','District'),('MW','MW','Mwanza','District'),('MW','RU','Rumphi','District'),('MW','NB','Nkhata Bay','District'),('MW','LK','Likoma','District'),('MW','MU','Mulanje','District'),('MW','NI','Ntchisi','District'),('MW','PH','Phalombe','District'),('MU','BL','Black River','District'),('MU','AG','Agalega Islands','Dependency'),('MU','FL','Flacq','District'),('MU','QB','Quatre Bornes','City'),('MU','GP','Grand Port','District'),('MU','BR','Beau Bassin-Rose Hill','City'),('MU','RR','Rivi�re du Rempart','District'),('MU','SA','Savanne','District'),('MU','MO','Moka','District'),('MU','PU','Port Louis','City'),('MU','PA','Pamplemousses','District'),('MU','CC','Cargados Carajos Shoals [Saint Brandon Islands]','Dependency'),('MU','PL','Port Louis','District'),('MU','PW','Plaines wilhems','District'),('MU','VP','Vacoas-Phoenix','City'),('MU','CU','Curepipe','City'),('MU','RO','Rodrigues Island','Dependency'),('MM','7','Ayeyarwady','Region'),('MM','15','Mon','State'),('MM','13','Kayin','State'),('MM','14','Chin','State'),('MM','18','Nay Pyi Taw','Union territory'),('MM','17','Shan','State'),('MM','16','Rakhine','State'),('MM','11','Kachin','State'),('MM','3','Magway','Region'),('MM','2','Bago','Region'),('MM','5','Tanintharyi','Region'),('MM','12','Kayah','State'),('MM','6','Yangon','Region'),('MM','1','Sagaing','Region'),('MM','4','Mandalay','Region'),('MK','3','Berovo','Municipality'),('MK','6','Bogovinje','Municipality'),('MK','22','Debarca','Municipality'),('MK','18','Gevgelija','Municipality'),('MK','56','Novo Selo','Municipality'),('MK','21','Debar','Municipality'),('MK','33','Zrnovci','Municipality'),('MK','37','Karbinci','Municipality'),('MK','7','Bosilovo','Municipality'),('MK','24','Demir Kapija','Municipality'),('MK','27','Dolneni','Municipality'),('MK','59','Petrovec','Municipality'),('MK','13','Veles','Municipality'),('MK','32','Zelenikovo','Municipality'),('MK','49','Lozovo','Municipality'),('MK','10','Valandovo','Municipality'),('MK','34','Ilinden','Municipality'),('MK','52','Makedonski Brod','Municipality'),('MK','20','Gradsko','Municipality'),('MK','11','Vasilevo','Municipality'),('MK','54','Negotino','Municipality'),('MK','4','Bitola','Municipality'),('MK','14','Vinica','Municipality'),('MK','42','Kocani','Municipality'),('MK','23','Delcevo','Municipality'),('MK','35','Jegunovce','Municipality'),('MK','44','Kriva Palanka','Municipality'),('MK','25','Demir Hisar','Municipality'),('MK','50','Mavrovo-i-Rostu_a','Municipality'),('MK','2','Aracinovo','Municipality'),('MK','5','Bogdanci','Municipality'),('MK','41','Konce','Municipality'),('MK','8','Brvenica','Municipality'),('MK','16','Vrapci_te','Municipality'),('MK','26','Dojran','Municipality'),('MK','12','Vevcani','Municipality'),('MK','53','Mogila','Municipality'),('MK','36','Kavadarci','Municipality'),('MK','19','Gostivar','Municipality'),('MK','45','Krivoga_tani','Municipality'),('MK','30','_elino','Municipality'),('MK','70','Sopi_te','Municipality'),('MK','47','Kumanovo','Municipality'),('MK','64','Radovi_','Municipality'),('MK','65','Rankovce','Municipality'),('MK','83','_tip','Municipality'),('MK','46','Kru_evo','Municipality'),('MK','71','Staro Nagoricane','Municipality'),('MK','73','Strumica','Municipality'),('MK','43','Kratovo','Municipality'),('MK','40','Kicevo','Municipality'),('MK','51','Makedonska Kamenica','Municipality'),('MK','76','Tetovo','Municipality'),('MK','81','Ce_inovo-Oble_evo','Municipality'),('MK','48','Lipkovo','Municipality'),('MK','67','Rosoman','Municipality'),('MK','72','Struga','Municipality'),('MK','61','Plasnica','Municipality'),('MK','85','Skopje','municipality'),('MK','75','Tearce','Municipality'),('MK','80','Ca_ka','Municipality'),('MK','74','Studenicani','Municipality'),('MK','78','Centar _upa','Municipality'),('MK','82','Cucer Sandevo','Municipality'),('MK','69','Sveti Nikole','Municipality'),('MK','60','Pehcevo','Municipality'),('MK','55','Novaci','Municipality'),('MK','58','Ohrid','Municipality'),('MK','62','Prilep','Municipality'),('MK','63','Probi_tip','Municipality'),('MK','66','Resen','Municipality'),('NR','9','Ewa','District'),('NR','8','Denigomodu','District'),('NR','1','Aiwo','District'),('NR','4','Anibare','District'),('NR','11','Meneng','District'),('NR','6','Boe','District'),('NR','14','Yaren','District'),('NR','2','Anabar','District'),('NR','13','Uaboe','District'),('NR','7','Buada','District'),('NR','5','Baitsi','District'),('NR','12','Nibok','District'),('NR','3','Anetan','District'),('NR','10','Ijuw','District'),('CL','MA','Magallanes','Region'),('CL','CO','Coquimbo','Region'),('CL','AP','Arica y Parinacota','Region'),('CL','NB','�uble','Region'),('CL','LR','Los R�os','Region'),('CL','AT','Atacama','Region'),('CL','LL','Los Lagos','Region'),('CL','AN','Antofagasta','Region'),('CL','VS','Valpara�so','Region'),('CL','AI','Ais_n del General Carlos Iba�ez del Campo','Region'),('CL','ML','Maule','Region'),('CL','AR','La Araucan�a','Region'),('CL','BI','Biob�o','Region'),('CL','LI','Libertador General Bernardo O\'Higgins','Region'),('CL','TA','Tarapac�','Region'),('CL','RM','Regi�n Metropolitana de Santiago','Region'),('LA','CH','Champasak [Champasack]','Province'),('LA','XA','Xaignabouli [Xayabury]','Province'),('LA','VT','Vientiane','Prefecture'),('LA','BK','Bok�o','Province'),('LA','OU','Oud�mxai [Oudomxay]','Province'),('LA','AT','Attapu [Attapeu]','Province'),('LA','HO','Houaphan [Huaphanh]','Province'),('LA','LP','Louangphabang [Luangprabang]','Province'),('LA','XI','Xiangkhouang [Xiengkhuang]','Province'),('LA','BL','Bolikhamxai [Borikhamxay]','Province'),('LA','XE','X_kong [Sekong]','Province'),('LA','SL','Salavan [Saravane]','Province'),('LA','KH','Khammouan [Khammuane]','Province'),('LA','PH','Ph�ngsali [Phongsaly]','Province'),('LA','VI','Vientiane','Province'),('LA','SV','Savannakh_t [Savannakhet]','Province'),('LA','XS','Xais�mboun [Xaysomboon]','province'),('LA','LM','Louang Namtha [Luangnamtha]','Province'),('CI','GD','G�h-Djiboua','district'),('CI','SM','Sassandra-Marahou_','district'),('CI','LG','Lagunes','district'),('CI','SV','Savanes','district'),('CI','DN','Dengu_l_','district'),('CI','AB','Abidjan','autonomous district'),('CI','YM','Yamoussoukro','autonomous district'),('CI','MG','Montagnes','district'),('CI','VB','Vall_e du Bandama','district'),('CI','BS','Bas-Sassandra','district'),('CI','LC','Lacs','district'),('CI','ZZ','Zanzan','district'),('CI','WR','Woroba','district'),('CI','CM','	Como_','district'),('AR','D','San Luis','Province'),('AR','T','Tucumán','Province'),('AR','L','La Pampa','Province'),('AR','C','Ciudad Autónoma de Buenos Aires','City'),('AR','U','Chubut','Province'),('AR','Y','Jujuy','Province'),('AR','F','La Rioja','Province'),('AR','S','Santa Fe','Province'),('AR','G','Santiago del Estero','Province'),('AR','E','Entre Ríos','Province'),('AR','R','Río Negro','Province'),('AR','B','Buenos Aires','Province'),('AR','J','San Juan','Province'),('AR','N','Misiones','Province'),('AR','H','Chaco','Province'),('AR','P','Formosa','Province'),('AR','A','Salta','Province'),('AR','K','Catamarca','Province'),('AR','M','Mendoza','Province'),('AR','X','Córdoba','Province'),('AR','Z','Santa Cruz','Province'),('AR','V','Tierra del Fuego','Province'),('AR','Q','Neuquén','Province'),('AR','W','Corrientes','Province'),('HU','EG','Eger','City with county rights'),('HU','KM','Kecskem_t','City with county rights'),('HU','BU','Budapest','Capital City'),('HU','KV','Kaposvár','City with county rights'),('HU','VE','Veszpr_m','County'),('HU','SN','Sopron','City with county rights'),('HU','BC','B_k_scsaba','City with county rights'),('HU','SF','Székesfehérvár','City with county rights'),('HU','HV','Hódmezovősárhely','City with county rights'),('HU','HE','Heves','County'),('HU','FE','Fej_r','County'),('HU','BA','Baranya','County'),('HU','BZ','Borsod-Abaúj-Zempl_n','County'),('HU','DE','Debrecen','City with county rights'),('HU','CS','Csongrád','County'),('HU','ER','Érd','City with county rights'),('HU','PS','P_cs','City with county rights'),('HU','DU','Dunaújváros','City with county rights'),('HU','KE','Komárom-Esztergom','County'),('HU','SO','Somogy','County'),('HU','HB','Hajdú-Bihar','County'),('HU','NO','Nógrád','County'),('HU','JN','Jász-Nagykun-Szolnok','County'),('HU','TO','Tolna','County'),('HU','ZE','Zalaegerszeg','City with county rights'),('HU','SS','Szekszárd','City with county rights'),('HU','BK','Bács-Kiskun','County'),('HU','ST','Salgótarján','City with county rights'),('HU','NK','Nagykanizsa','City with county rights'),('HU','SD','Szeged','City with county rights'),('HU','BE','B_k_s','County'),('HU','GY','Gyor','City with county rights'),('HU','SH','Szombathely','City with county rights'),('HU','ZA','Zala','County'),('HU','VM','Veszpr_m','City with county rights'),('HU','MI','Miskolc','City with county rights'),('HU','SK','Szolnok','City with county rights'),('HU','NY','Nyáregyháza','City with county rights'),('HU','TB','Tatabánya','City with county rights'),('HU','PE','Pest','County'),('HU','SZ','Szabolcs-Szatmár-Bereg','County'),('HU','GS','Gyor-Moson-Sopron','County'),('HU','VA','Vas','County'),('LI','6','Ruggell','Commune'),('LI','2','Eschen','Commune'),('LI','4','Mauren','Commune'),('LI','8','Schellenberg','Commune'),('LI','7','Schaan','Commune'),('LI','3','Gamprin','Commune'),('LI','11','Vaduz','Commune'),('LI','9','Triesen','Commune'),('LI','10','Triesenberg','Commune'),('LI','1','Balzers','Commune'),('LI','5','Planken','Commune'),('QA','MS','Ash Shamal','Municipality'),('QA','ZA','Az� Z�a�ayin','Municipality'),('QA','RA','Ar Rayyan','Municipality'),('QA','KH','Al Khawr wa adh Dhakhirah','Municipality'),('QA','SH','Ash Shi?aniyah','Municipality'),('QA','WA','Al Wakrah','Municipality'),('QA','US','Umm Salal','Municipality'),('QA','DA','Ad Dawhah','Municipality'),('PA','7','Los Santos','Province'),('PA','KY','Guna Yala','indigenous region'),('PA','10','Panam� Oeste','Province'),('PA','EM','Ember�','indigenous region'),('PA','2','Cocl_','Province'),('PA','NB','Ng_be-Bugl_','indigenous region'),('PA','4','Chiriqu�','Province'),('PA','3','Col�n','Province'),('PA','6','Herrera','Province'),('PA','5','Dari_n','Province'),('PA','1','Bocas del Toro','Province'),('PA','9','Veraguas','Province'),('PA','8','Panam�','Province'),('LS','A','Maseru','District'),('LS','H','Qacha\'s Nek','District'),('LS','C','Leribe','District'),('LS','F','Mohale\'s Hoek','District'),('LS','E','Mafeteng','District'),('LS','K','Thaba-Tseka','District'),('LS','D','Berea','District'),('LS','G','Quthing','District'),('LS','B','Butha-Buthe','District'),('LS','J','Mokhotlong','District'),('BH','14','Al Janubiyah','Governorat'),('BH','13','Al �Asimah','Governorat'),('BH','17','Ash Shamaliyah','Governorat'),('BH','15','Al Mu?arraq','Governorat'),('EG','WAD','AI Wadi al Jadid','Governorate'),('EG','FYM','AI Fayyum','Governorate'),('EG','BA','Al Ba?r al A?mar','Governorate'),('EG','BH','Al Bu?ayrah','Governorate'),('EG','LX','Al Uqsur','Governorate'),('EG','SIN','Shamal Sina\'','Governorate'),('EG','ASN','Aswan','Governorate'),('EG','DK','Ad Daqahliyah','Governorate'),('EG','BNS','Bani Suwayf','Governorate'),('EG','PTS','Bur Sa\'id','Governorate'),('EG','MNF','AI Minufiyah','Governorate'),('EG','C','AI Qahirah','Governorate'),('EG','SHR','Ash Sharqiyah','Governorate'),('EG','GH','AI Gharbiyah','Governorate'),('EG','MT','Matruh','Governorate'),('EG','IS','AI Isma \'iliyah','Governorate'),('EG','KFS','Kafr ash Shaykh','Governorate'),('EG','ALX','AI Iskandariyah','Governorate'),('EG','JS','Janub Sina\'','Governorate'),('EG','AST','Asyut','Governorate'),('EG','KN','Qina','Governorate'),('EG','MN','AI Minya','Governorate'),('EG','GZ','AI Jizah','Governorate'),('EG','DT','Dumyat','Governorate'),('EG','SUZ','As Suways','Governorate'),('EG','KB','AI Qalyubiyah','Governorate'),('EG','SHG','Suhaj','Governorate'),('IT','BG','Bergamo','Province'),('IT','BS','Brescia','Province'),('IT','BA','Bari','Metropolitan City'),('IT','AP','Ascoli Piceno','Province'),('IT','AT','Asti','Province'),('IT','CA','Cagliari','Metropolitan City'),('IT','PD','Padova','Province'),('IT','CT','Catania','Metropolitan City'),('IT','EN','Enna','Free Communal Consortia'),('IT','AV','Avellino','Province'),('IT','BL','Belluno','Province'),('IT','AL','Alessandria','Province'),('IT','MT','Matera','Province'),('IT','LE','Lecce','Province'),('IT','AR','Arezzo','Province'),('IT','BZ','Bolzano / Bozen (de)','Province'),('IT','AN','Ancona','Province'),('IT','BI','Biella','Province'),('IT','AG','Agrigento','Free Communal Consortia'),('IT','CN','Cuneo','Province'),('IT','FI','Firenze','Metropolitan City'),('IT','BN','Benevento','Province'),('IT','CL','Caltanissetta','Province'),('IT','FR','Frosinone','Province'),('IT','MB','Monza e Brianza','Province'),('IT','BR','Brindisi','Province'),('IT','LI','Livorno','Province'),('IT','FG','Foggia','Province'),('IT','CS','Cosenza','Province'),('IT','FC','Forl�-Cesena','Province'),('IT','IM','Imperia','Province'),('IT','MI','Milano','Metropolitan City'),('IT','AQ','L\'Aquila','Province'),('IT','CO','Como','Province'),('IT','NO','Novara','Province'),('IT','MO','Modena','Province'),('IT','LT','Latina','Province'),('IT','BO','Bologna','Metropolitan City'),('IT','OR','Oristano','Province'),('IT','NA','Napoli','Metropolitan City'),('IT','NU','Nuoro','Province'),('IT','CH','Chieti','Province'),('IT','GE','Genova','Metropolitan City'),('IT','FE','Ferrara','Province'),('IT','MC','Macerata','Province'),('IT','LU','Lucca','Province'),('IT','GR','Grosseto','Province'),('IT','AO','Aosta / Aoste (fr)','Province'),('IT','MN','Mantova','Province'),('IT','KR','Crotone','Province'),('IT','BT','Barletta-Andria-Trani','Province'),('IT','IS','Isernia','Province'),('IT','FM','Fermo','Province'),('IT','CZ','Catanzaro','Province'),('IT','PR','Parma','Province'),('IT','PG','Perugia','Province'),('IT','CB','Campobasso','Province'),('IT','CE','Caserta','Province'),('IT','CR','Cremona','Province'),('IT','ME','Messina','Metropolitan City'),('IT','LC','Lecco','Province'),('IT','PE','Pescara','Province'),('IT','MS','Massa-Carrara','Province'),('IT','LO','Lodi','Province'),('IT','PC','Piacenza','Province'),('IT','PV','Pavia','Province'),('IT','SP','La Spezia','Province'),('IT','VB','Verbano-Cusio-Ossola','Province'),('IT','TA','Taranto','Province'),('IT','RG','Ragusa','Free Communal Consortia'),('IT','SD','Sud Sardegna','Province'),('IT','PA','Palermo','Metropolitan City'),('IT','RN','Rimini','Province'),('IT','VV','Vibo Valentia','Province'),('IT','PZ','Potenza','Province'),('IT','PI','Pisa','Province'),('IT','RA','Ravenna','Province'),('IT','TV','Treviso','Province'),('IT','RC','Reggio Calabria','Metropolitan City'),('IT','PU','Pesaro e Urbino','Province'),('IT','RM','Roma','Metropolitan City'),('IT','PO','Prato','Province'),('IT','PT','Pistoia','Province'),('IT','RO','Rovigo','Province'),('IT','RE','Reggio Emilia','Province'),('IT','SO','Sondrio','Province'),('IT','SA','Salerno','Province'),('IT','TR','Terni','Province'),('IT','VA','Varese','Province'),('IT','VR','Verona','Province'),('IT','RI','Rieti','Province'),('IT','TE','Teramo','Province'),('IT','TN','Trento','Province'),('IT','SI','Siena','Province'),('IT','SV','Savona','Province'),('IT','SR','Siracusa','Free Communal Consortia'),('IT','VC','Vercelli','Province'),('IT','TP','Trapani','Free Communal Consortia'),('IT','VI','Vicenza','Province'),('IT','VE','Venezia','Metropolitan City'),('IT','TO','Torino','Metropolitan City'),('IT','SS','Sassari','Province'),('IT','VT','Viterbo','Province'),('AM','AR','Ararat','Region'),('AM','LO','Lo?i','Region'),('AM','SH','_irak','Region'),('AM','GR','Gegark\'unik\'','Region'),('AM','AG','Aragac?otn','Region'),('AM','ER','Erevan','City'),('AM','TV','Tavu_','Region'),('AM','VD','Vayoc Jor','Region'),('AM','SU','Syunik\'','Region'),('AM','AV','Armavir','Region'),('AM','KT','Kotayk\'','Region'),('KE','4','Busia','County'),('KE','2','Bomet','County'),('KE','13','Kiambu','County'),('KE','14','Kilifi','County'),('KE','9','Isiolo','County'),('KE','8','Homa Bay','County'),('KE','12','Kericho','County'),('KE','5','Elgeyo/Marakwet','County'),('KE','1','Baringo','County'),('KE','11','Kakamega','County'),('KE','7','Garissa','County'),('KE','6','Embu','County'),('KE','3','Bungoma','County'),('KE','10','Kajiado','County'),('KE','29','Murang\'a','County'),('KE','22','Machakos','County'),('KE','38','Siaya','County'),('KE','23','Makueni','County'),('KE','24','Mandera','County'),('KE','19','Kwale','County'),('KE','33','Narok','County'),('KE','36','Nyeri','County'),('KE','18','Kitui','County'),('KE','47','West Pokot','County'),('KE','17','Kisumu','County'),('KE','32','Nandi','County'),('KE','34','Nyamira','County'),('KE','16','Kisii','County'),('KE','44','Uasin Gishu','County'),('KE','28','Mombasa','County'),('KE','21','Lamu','County'),('KE','31','Nakuru','County'),('KE','46','Wajir','County'),('KE','43','Turkana','County'),('KE','26','Meru','County'),('KE','20','Laikipia','County'),('KE','27','Migori','County'),('KE','40','Tana River','County'),('KE','35','Nyandarua','County'),('KE','37','Samburu','County'),('KE','25','Marsabit','County'),('KE','15','Kirinyaga','County'),('KE','39','Taita/Taveta','County'),('KE','45','Vihiga','County'),('KE','41','Tharaka-Nithi','County'),('KE','30','Nairobi City','County'),('KE','42','Trans Nzoia','County'),('ZW','MA','Manicaland','Province'),('ZW','MW','Mashonaland West','Province'),('ZW','MI','Midlands','Province'),('ZW','MC','Mashonaland Central','Province'),('ZW','MN','Matabeleland North','Province'),('ZW','MV','Masvingo','Province'),('ZW','ME','Mashonaland East','Province'),('ZW','MS','Matabeleland South','Province'),('ZW','BU','Bulawayo','Province'),('ZW','HA','Harare','Province'),('GQ','LI','Litoral','Province'),('GQ','AN','Annob�n','Province'),('GQ','CS','Centro Sur','Province'),('GQ','BS','Bioko Sur','Province'),('GQ','BN','Bioko Norte','Province'),('GQ','WN','Wele-Nzas','Province'),('GQ','KN','Ki_-Ntem','Province'),('SR','CM','Commewijne','District'),('SR','SA','Saramacca','District'),('SR','PR','Para','District'),('SR','PM','Paramaribo','undefined'),('SR','WA','Wanica','District'),('SR','BR','Brokopondo','District'),('SR','CR','Coronie','District'),('SR','MA','Marowijne','District'),('SR','SI','Sipaliwini','District'),('SR','NI','Nickerie','District'),('JM','4','Portland','Partish'),('JM','5','Saint Mary','Partish'),('JM','9','Hanover','Partish'),('JM','8','Saint James','Partish'),('JM','1','Kingston','Partish'),('JM','10','Westmoreland','Partish'),('JM','2','Saint Andrew','Partish'),('JM','3','Saint Thomas','Partish'),('JM','12','Manchester','Partish'),('JM','13','Clarendon','Partish'),('JM','14','Saint Catherine','Partish'),('JM','7','Trelawny','Partish'),('JM','6','Saint Ann','Partish'),('JM','11','Saint Elizabeth','Partish'),('CN','34','Anhui','Province'),('CN','11','Beijing','Municipality'),('CN','61','Shaanxi','Province'),('CN','21','Liaoning','Province'),('CN','43','Hunan','Province'),('CN','37','Shandong','Province'),('CN','45','Guangxi','Autonomous Region'),('CN','32','Jiangsu','Province'),('CN','35','Fujian','Province'),('CN','31','Shanghai','Municipality'),('CN','33','Zhejiang','Province'),('CN','15','Nei Mongol (mn)','Autonomous Region'),('CN','41','Henan','Province'),('CN','36','Jiangxi','Province'),('CN','64','Ningxia','Autonomous Region'),('CN','52','Guizhou','Province'),('CN','42','Hubei','Province'),('CN','92','Aomen','Special Administrative Region'),('CN','14','Shanxi','Province'),('CN','53','Yunnan','Province'),('CN','50','Chongqing','Municipality'),('CN','44','Guangdong','Province'),('CN','46','Hainan','Province'),('CN','12','Tianjin','Municipality'),('CN','54','Xizang','Autonomous Region'),('CN','51','Sichuan','Province'),('CN','62','Gansu','Province'),('CN','71','Taiwan','Province'),('CN','91','Xianggang','Special Administrative Region'),('CN','22','Jilin','Province'),('CN','23','Heilongjiang','Province'),('CN','65','Xinjiang','Autonomous Region'),('CN','13','Hebei','Province'),('CN','63','Qinghai','Province'),('TO','3','Niuas','Division'),('TO','5','Vava\'u','Division'),('TO','2','Ha\'apai','Division'),('TO','1','\'Eua','Division'),('TO','4','Tongatapu','Division'),('MX','SON','Sonora','State'),('MX','CHH','Chihuahua','State'),('MX','CMX','Ciudad de M_xico','Federal District'),('MX','GUA','Guanajuato','State'),('MX','TAM','Tamaulipas','State'),('MX','ROO','Quintana Roo','State'),('MX','JAL','Jalisco','State'),('MX','COL','Colima','State'),('MX','BCS','Baja California Sur','State'),('MX','COA','Coahuila de Zaragoza','State'),('MX','TAB','Tabasco','State'),('MX','CHP','Chiapas','State'),('MX','PUE','Puebla','State'),('MX','SLP','San Luis Potos�','State'),('MX','HID','Hidalgo','State'),('MX','TLA','Tlaxcala','State'),('MX','BCN','Baja California','State'),('MX','CAM','Campeche','State'),('MX','DUR','Durango','State'),('MX','MOR','Morelos','State'),('MX','NLE','Nuevo Le�n','State'),('MX','SIN','Sinaloa','State'),('MX','QUE','Quer_taro','State'),('MX','VER','Veracruz de Ignacio de la Llave','State'),('MX','MEX','M_xico','State'),('MX','AGU','Aguascalientes','State'),('MX','GRO','Guerrero','State'),('MX','NAY','Nayarit','State'),('MX','YUC','Yucat�n','State'),('MX','OAX','Oaxaca','State'),('MX','MIC','Michoac�n de Ocampo','State'),('MX','ZAC','Zacatecas','State'),('ML','6','Tombouctou','Region'),('ML','1','Kayes','Region'),('ML','9','M_naka','Region'),('ML','10','Taoud_nit','Region'),('ML','2','Koulikoro','Region'),('ML','3','Sikasso','Region'),('ML','8','Kidal','Region'),('ML','7','Gao','Region'),('ML','5','Mopti','Region'),('ML','4','S_gou','Region'),('ML','BKO','Bamako','District'),('TH','12','Nonthaburi','Province'),('TH','16','Lop Buri','Province'),('TH','10','Krung Thep Maha Nakhon [Bangkok]','Metropolitan administration'),('TH','13','Pathum Thani','Province'),('TH','15','Ang Thong','Province'),('TH','17','Sing Buri','Province'),('TH','11','Samut Prakan','Province'),('TH','14','Phra Nakhon Si Ayutthaya','Province'),('TH','34','Ubon Ratchathani','Province'),('TH','18','Chai Nat','Province'),('TH','22','Chanthaburi','Province'),('TH','23','Trat','Province'),('TH','39','Nong Bua Lam Phu','Province'),('TH','20','Chon Buri','Province'),('TH','44','Maha Sarakham','Province'),('TH','31','Buri Ram','Province'),('TH','41','Udon Thani','Province'),('TH','21','Rayong','Province'),('TH','35','Yasothon','Province'),('TH','49','Mukdahan','Province'),('TH','65','Phitsanulok','Province'),('TH','50','Chiang Mai','Province'),('TH','30','Nakhon Ratchasima','Province'),('TH','66','Phichit','Province'),('TH','32','Surin','Province'),('TH','37','Amnat Charoen','Province'),('TH','67','Phetchabun','Province'),('TH','55','Nan','Province'),('TH','33','Si Sa Ket','Province'),('TH','40','Khon Kaen','Province'),('TH','51','Lamphun','Province'),('TH','53','Uttaradit','Province'),('TH','38','Bueng Kan','Province'),('TH','42','Loei','Province'),('TH','60','Nakhon Sawan','Province'),('TH','52','Lampang','Province'),('TH','19','Saraburi','Province'),('TH','25','Prachin Buri','Province'),('TH','80','Nakhon Si Thammarat','Province'),('TH','36','Chaiyaphum','Province'),('TH','47','Sakon Nakhon','Province'),('TH','27','Sa Kaeo','Province'),('TH','46','Kalasin','Province'),('TH','72','Suphan Buri','Province'),('TH','26','Nakhon Nayok','Province'),('TH','57','Chiang Rai','Province'),('TH','45','Roi Et','Province'),('TH','56','Phayao','Province'),('TH','54','Phrae','Province'),('TH','61','Uthai Thani','Province'),('TH','24','Chachoengsao','Province'),('TH','64','Sukhothai','Province'),('TH','58','Mae Hong Son','Province'),('TH','43','Nong Khai','Province'),('TH','70','Ratchaburi','Province'),('TH','77','Prachuap Khiri Khan','Province'),('TH','48','Nakhon Phanom','Province'),('TH','62','Kamphaeng Phet','Province'),('TH','63','Tak','Province'),('TH','73','Nakhon Pathom','Province'),('TH','85','Ranong','Province'),('TH','92','Trang','Province'),('TH','71','Kanchanaburi','Province'),('TH','74','Samut Sakhon','Province'),('TH','84','Surat Thani','Province'),('TH','90','Songkhla','Province'),('TH','93','Phatthalung','Province'),('TH','86','Chumphon','Province'),('TH','95','Yala','Province'),('TH','83','Phuket','Province'),('TH','94','Pattani','Province'),('TH','76','Phetchaburi','Province'),('TH','81','Krabi','Province'),('TH','75','Samut Songkhram','Province'),('TH','96','Narathiwat','Province'),('TH','91','Satun','Province'),('TH','82','Phangnga','Province'),('TH','S','Phatthaya','special administrative\nSpecial administrative city'),('EE','78','Tartumaa','County'),('EE','59','L__ne-Virumaa','County'),('EE','49','J�gevamaa','County'),('EE','67','P_rnumaa','County'),('EE','39','Hiiumaa','County'),('EE','70','Raplamaa','County'),('EE','65','P�lvamaa','County'),('EE','57','L__nemaa','County'),('EE','82','Valgamaa','County'),('EE','86','V�rumaa','County'),('EE','37','Harjumaa','County'),('EE','44','Ida-Virumaa','County'),('EE','51','J_rvamaa','County'),('EE','74','Saaremaa','County'),('EE','84','Viljandimaa','County'),('AO','BIE','Bi_','Province'),('AO','NAM','Namibe','Province'),('AO','BGU','Benguela','Province'),('AO','CNO','Kwanza Norte','Province'),('AO','HUA','Huambo','Province'),('AO','MOX','Moxico','Province'),('AO','UIG','Uíge','Province'),('AO','LUA','Luanda','Province'),('AO','LNO','Lunda Norte','Province'),('AO','LSU','Lunda Sul','Province'),('AO','BGO','Bengo','Province'),('AO','CCU','Kuando Kubango','Province'),('AO','CUS','Kwanza Sul','Province'),('AO','CNN','Cunene','Province'),('AO','MAL','Malange','Province'),('AO','HUI','Huíla','Province'),('AO','ZAI','Zaire','Province'),('AO','CAB','Cabinda','Province'),('GN','DB','Dabola','Prefecture'),('GN','FO','For_cariah','Prefecture'),('GN','BK','Bok_','Prefecture'),('GN','CO','Coyah','Prefecture'),('GN','DU','Dubr_ka','Prefecture'),('GN','MD','Mandiana','Prefecture'),('GN','DI','Dinguiraye','Prefecture'),('GN','FA','Faranah','Prefecture'),('GN','MC','Macenta','Prefecture'),('GN','LE','L_louma','Prefecture'),('GN','BF','Boffa','Prefecture'),('GN','BE','Beyla','Prefecture'),('GN','SI','Siguiri','Prefecture'),('GN','GA','Gaoual','Prefecture'),('GN','KA','Kankan','Prefecture'),('GN','GU','Gu_k_dou','Prefecture'),('GN','DL','Dalaba','Prefecture'),('GN','KB','Koubia','Prefecture'),('GN','LO','Lola','Prefecture'),('GN','KN','Koundara','Prefecture'),('GN','KD','Kindia','Prefecture'),('GN','NZ','Nz_r_kor_','Prefecture'),('GN','FR','Fria','Prefecture'),('GN','KS','Kissidougou','Prefecture'),('GN','KE','K_rouan_','Prefecture'),('GN','PI','Pita','Prefecture'),('GN','KO','Kouroussa','Prefecture'),('GN','LA','Lab_','Prefecture'),('GN','TO','Tougu_','Prefecture'),('GN','ML','Mali','Prefecture'),('GN','TE','T_lim_l_','Prefecture'),('GN','MM','Mamou','Prefecture'),('GN','YO','Yomou','Prefecture'),('BQ','BO','Bonaire','Special Municipality'),('BQ','SE','Sint Eustatius','Special Municipality'),('BQ','SA','Saba','Special Municipality'),('SN','KD','Kolda','Region'),('SN','FK','Fatick','Region'),('SN','KL','Kaolack','Region'),('SN','DK','Dakar','Region'),('SN','MT','Matam','Region'),('SN','KE','K_dougou','Region'),('SN','TH','Thi�s','Region'),('SN','KA','Kaffrine','Region'),('SN','TC','Tambacounda','Region'),('SN','SL','Saint-Louis','Region'),('SN','ZG','Ziguinchor','Region'),('SN','DB','Diourbel','Region'),('SN','LG','Louga','Region'),('SN','SE','S_dhiou','Region'),('NE','5','Tahoua','Region'),('NE','6','Tillab_ri','Region'),('NE','4','Maradi','Region'),('NE','2','Diffa','Region'),('NE','1','Agadez','Region'),('NE','8','Niamey','Urban community'),('NE','3','Dosso','Region'),('NE','7','Zinder','Region'),('AZ','AST','Astara','Rayon'),('AZ','BAR','B?rd?','Rayon'),('AZ','DAS','Dask?s?n','Rayon'),('AZ','KAL','K?lb?c?r','Rayon'),('AZ','AGA','Agstafa','Rayon'),('AZ','BA','Baki','Municipality'),('AZ','GA','G?nc?','Municipality'),('AZ','AGM','Agdam','Rayon'),('AZ','QOB','Qobustan','Rayon'),('AZ','QBA','Quba','Rayon'),('AZ','GOR','Goranboy','Rayon'),('AZ','KAN','K?ng?rli','Rayon'),('AZ','OGU','Oguz','Rayon'),('AZ','SMI','Samaxi','Rayon'),('AZ','GYG','G_yg_l','Rayon'),('AZ','FUZ','F�zuli','Rayon'),('AZ','HAC','Haciqabul','Rayon'),('AZ','AGU','Agsu','Rayon'),('AZ','AGC','Agcab?di','Rayon'),('AZ','BEY','Beyl?qan','Rayon'),('AZ','GOY','G_y�ay','Rayon'),('AZ','BAB','Bab?k','Rayon'),('AZ','QAB','Q?b?l?','Rayon'),('AZ','BIL','Bil?suvar','Rayon'),('AZ','CAL','C?lilabad','Rayon'),('AZ','NX','Nax�ivan','Autonomous republic'),('AZ','MAS','Masalli','Rayon'),('AZ','AGS','Agdas','Rayon'),('AZ','LAN','L?nk?ran','Rayon'),('AZ','SR','Sirvan','Municipality'),('AZ','SA','S?ki','Municipality'),('AZ','LER','Lerik','Rayon'),('AZ','MI','Ming?�evir','Municipality'),('AZ','QAZ','Qazax','Rayon'),('AZ','CAB','C?brayil','Rayon'),('AZ','SAL','Salyan','Rayon'),('AZ','ABS','Abseron','Rayon'),('AZ','SKR','S?mkir','Rayon'),('AZ','QUS','Qusar','Rayon'),('AZ','GAD','G?d?b?y','Rayon'),('AZ','SAD','S?d?r?k','Rayon'),('AZ','LAC','La�in','Rayon'),('AZ','BAL','Balak?n','Rayon'),('AZ','ISM','Ismayilli','Rayon'),('AZ','KUR','K�rd?mir','Rayon'),('AZ','SM','Sumqayit','Municipality'),('AZ','QBI','Qubadli','Rayon'),('AZ','NEF','Neft�ala','Rayon'),('AZ','QAX','Qax','Rayon'),('AZ','CUL','Culfa','Rayon'),('AZ','LA','L?nk?ran','Municipality'),('AZ','NA','Naftalan','Municipality'),('AZ','NV','Nax�ivan','Municipality'),('AZ','ORD','Ordubad','Rayon'),('AZ','SBN','Sabran','Rayon'),('AZ','IMI','Imisli','Rayon'),('AZ','SAH','Sahbuz','Rayon'),('AZ','SAT','Saatli','Rayon'),('AZ','SAB','Sabirabad','Rayon'),('AZ','SAK','S?ki','Rayon'),('AZ','SIY','Siy?z?n','Rayon'),('AZ','XIZ','Xizi','Rayon'),('AZ','YAR','Yardimli','Rayon'),('AZ','YE','Yevlax','Municipality'),('AZ','SAR','S?rur','Rayon'),('AZ','TAR','T?rt?r','Rayon'),('AZ','SMX','Samux','Rayon'),('AZ','TOV','Tovuz','Rayon'),('AZ','ZAQ','Zaqatala','Rayon'),('AZ','XA','Xank?ndi','Municipality'),('AZ','XCI','Xocali','Rayon'),('AZ','SUS','Susa','Rayon'),('AZ','ZAN','Z?ngilan','Rayon'),('AZ','UCA','Ucar','Rayon'),('AZ','XAC','Xa�maz','Rayon'),('AZ','ZAR','Z?rdab','Rayon'),('AZ','XVD','Xocav?nd','Rayon'),('AZ','YEV','Yevlax','Rayon'),('CA','PE','Prince Edward Island','Province'),('CA','SK','Saskatchewan','Province'),('CA','MB','Manitoba','Province'),('CA','NL','Newfoundland and Labrador','Province'),('CA','NS','Nova Scotia','Province'),('CA','BC','British Columbia','Province'),('CA','NU','Nunavut','Territory'),('CA','ON','Ontario','Province'),('CA','YT','Yukon','Territory'),('CA','NT','Northwest Territories','Territory'),('CA','AB','Alberta','Province'),('CA','NB','New Brunswick','Province'),('CA','QC','Quebec','Province'),('MC','MO','Monaco-Ville','Quarter'),('MC','MG','Moneghetti','Quarter'),('MC','GA','La Gare','Quarter'),('MC','SO','La Source','Quarter'),('MC','MA','Malbousquet','Quarter'),('MC','CO','La Condamine','Quarter'),('MC','JE','Jardin Exotique','Quarter'),('MC','PH','Port-Hercule','Quarter'),('MC','MC','Monte-Carlo','Quarter'),('MC','FO','Fontvieille','Quarter'),('MC','SD','Sainte-D_vote','Quarter'),('MC','SP','Sp_lugues','Quarter'),('MC','MU','Moulins','Quarter'),('MC','VR','Vallon de la Rousse','Quarter'),('MC','LA','Larvotto','Quarter'),('MC','SR','Saint-Roman','Quarter'),('MC','CL','La Colle','Quarter'),('KZ','ATY','Atyrau oblysy','Region'),('KZ','AST','Astana','City'),('KZ','AKM','Aqmola oblysy','Region'),('KZ','ALA','Almaty','City'),('KZ','KAR','Qaraghandy oblysy','Region'),('KZ','MAN','Mangghystau oblysy','Region'),('KZ','ALM','Almaty oblysy','Region'),('KZ','KZY','Qyzylorda oblysy','Region'),('KZ','SEV','Solt�stik Qazaqstan oblysy','Region'),('KZ','AKT','Aqt_be oblysy','Region'),('KZ','BAY','Bayqonyr','City'),('KZ','KUS','Qostanay oblysy','Region'),('KZ','VOS','Shyghys Qazaqstan oblysy','Region'),('KZ','YUZ','T�rkistan oblysy','Region'),('KZ','ZAP','Batys Qazaqstan oblysy','Region'),('KZ','PAV','Pavlodar oblysy','Region'),('KZ','ZHA','Zhambyl oblysy','Region'),('KZ','SHY','_imkent','City'),('SV','AH','Ahuachap�n','Department'),('SV','CA','Caba�as','Department'),('SV','MO','Moraz�n','Department'),('SV','SM','San Miguel','Department'),('SV','CU','Cuscatl�n','Department'),('SV','PA','La Paz','Department'),('SV','CH','Chalatenango','Department'),('SV','US','Usulut�n','Department'),('SV','LI','La Libertad','Department'),('SV','UN','La Uni�n','Department'),('SV','SO','Sonsonate','Department'),('SV','SS','San Salvador','Department'),('SV','SV','San Vicente','Department'),('SV','SA','Santa Ana','Department'),('FI','1','Ahvenanmaan maakunta','Region'),('FI','5','Kainuu','Region'),('FI','6','Kanta-H_me','Region'),('FI','3','Etel_-Pohjanmaa','Region'),('FI','2','Etel_-Karjala','Region'),('FI','10','Lappi','Region'),('FI','7','Keski-Pohjanmaa','Region'),('FI','16','P_ij_t-H_me','Region'),('FI','17','Satakunta','Region'),('FI','11','Pirkanmaa','Region'),('FI','13','Pohjois-Karjala','Region'),('FI','14','Pohjois-Pohjanmaa','Region'),('FI','8','Keski-Suomi','Region'),('FI','4','Etel_-Savo','Region'),('FI','15','Pohjois-Savo','Region'),('FI','12','Pohjanmaa','Region'),('FI','18','Uusimaa','Region'),('FI','19','Varsinais-Suomi','Region'),('FI','9','Kymenlaakso','Region'),('IQ','DI','Diyal�','Governorate'),('IQ','AN','AI Anbar','Governorate'),('IQ','AR','Arbil','Governorate'),('IQ','KI','Kirkuk','Governorate'),('IQ','DQ','Dhi Qar','Governorate'),('IQ','MA','Maysan','Governorate'),('IQ','BG','Baghdad','Governorate'),('IQ','BA','Al Basrah','Governorate'),('IQ','MU','AI Muthann�','Governorate'),('IQ','QA','Al Qadisiyah','Governorate'),('IQ','NA','An Najaf','Governorate'),('IQ','NI','Ninaw�','Governorate'),('IQ','SU','As Sulaymaniyah','Governorate'),('IQ','WA','Wasit','Governorate'),('IQ','DA','Dahuk','Governorate'),('IQ','BB','Babil','Governorate'),('IQ','KA','Karbala\'','Governorate'),('IQ','SD','Salah ad Din','Governorate'),('SI','6','Bovec','Municipality'),('SI','8','Brezovica','Municipality'),('SI','4','Bohinj','Municipality'),('SI','7','Brda','Municipality'),('SI','3','Bled','Municipality'),('SI','10','Ti_ina','Municipality'),('SI','5','Borovnica','Municipality'),('SI','24','Dornava','Municipality'),('SI','36','Idrija','Municipality'),('SI','49','Komen','Municipality'),('SI','29','Gornja Radgona','Municipality'),('SI','16','Crna na Koro_kem','Municipality'),('SI','25','Dravograd','Municipality'),('SI','44','Kanal','Municipality'),('SI','18','Destrnik','Municipality'),('SI','23','Dom_ale','Municipality'),('SI','9','Bre_ice','Municipality'),('SI','2','Beltinci','Municipality'),('SI','12','Cerklje na Gorenjskem','Municipality'),('SI','60','Litija','Municipality'),('SI','20','Dobrepolje','Municipality'),('SI','1','Ajdov_cina','Municipality'),('SI','69','Maj_perk','Municipality'),('SI','17','Crnomelj','Municipality'),('SI','22','Dol pri Ljubljani','Municipality'),('SI','28','Gori_nica','Municipality'),('SI','56','Kuzma','Municipality'),('SI','19','Divaca','Municipality'),('SI','46','Kobarid','Municipality'),('SI','85','Novo mesto','Municipality'),('SI','30','Gornji Grad','Municipality'),('SI','11','Celje','Municipality'),('SI','67','Luce','Municipality'),('SI','65','Lo_ka dolina','Municipality'),('SI','21','Dobrova-Polhov Gradec','Municipality'),('SI','26','Duplek','Municipality'),('SI','42','Jur_inci','Municipality'),('SI','35','Hrpelje-Kozina','Municipality'),('SI','62','Ljubno','Municipality'),('SI','91','Pivka','Municipality'),('SI','74','Me_ica','Municipality'),('SI','31','Gornji Petrovci','Municipality'),('SI','52','Kranj','Municipality'),('SI','78','Moravske Toplice','Municipality'),('SI','68','Lukovica','Municipality'),('SI','53','Kranjska Gora','Municipality'),('SI','33','_alovci','Municipality'),('SI','51','Kozje','Municipality'),('SI','14','Cerkno','Municipality'),('SI','13','Cerknica','Municipality'),('SI','82','Naklo','Municipality'),('SI','76','Mislinja','Municipality'),('SI','50','Koper','Municipality'),('SI','59','Lendava','Municipality'),('SI','71','Medvode','Municipality'),('SI','15','Cren_ovci','Municipality'),('SI','34','Hrastnik','Municipality'),('SI','54','Kr_ko','Municipality'),('SI','45','Kidricevo','Municipality'),('SI','63','Ljutomer','Municipality'),('SI','92','Podcetrtek','Municipality'),('SI','98','Race-Fram','Municipality'),('SI','118','_entilj','Municipality'),('SI','105','Roga_ovci','Municipality'),('SI','27','Gorenja vas-Poljane','Municipality'),('SI','86','Odranci','Municipality'),('SI','89','Pesnica','Municipality'),('SI','84','Nova Gorica','Municipality'),('SI','38','Ilirska Bistrica','Municipality'),('SI','58','Lenart','Municipality'),('SI','129','Trbovlje','Municipality'),('SI','40','Izola','Municipality'),('SI','55','Kungota','Municipality'),('SI','106','Roga_ka Slatina','Municipality'),('SI','120','_entjur','Municipality'),('SI','134','Velike La_ce','Municipality'),('SI','43','Kamnik','Municipality'),('SI','113','Slovenska Bistrica','Municipality'),('SI','70','Maribor','Municipality'),('SI','64','Logatec','Municipality'),('SI','97','Puconci','Municipality'),('SI','32','Grosuplje','Municipality'),('SI','87','Ormo_','Municipality'),('SI','37','Ig','Municipality'),('SI','131','Tr_ic','Municipality'),('SI','90','Piran','Municipality'),('SI','109','Semic','Municipality'),('SI','66','Lo_ki Potok','Municipality'),('SI','104','Ribnica','Municipality'),('SI','101','Radlje ob Dravi','Municipality'),('SI','73','Metlika','Municipality'),('SI','111','Se_ana','Municipality'),('SI','135','Videm','Municipality'),('SI','48','Kocevje','Municipality'),('SI','39','Ivancna Gorica','Municipality'),('SI','103','Ravne na Koro_kem','Municipality'),('SI','100','Radenci','Municipality'),('SI','77','Moravce','Municipality'),('SI','41','Jesenice','Municipality'),('SI','107','Rogatec','Municipality'),('SI','124','_marje pri Jel_ah','Municipality'),('SI','108','Ru_e','Municipality'),('SI','61','Ljubljana','Municipality'),('SI','114','Slovenske Konjice','Municipality'),('SI','116','Sveti Jurij','Municipality'),('SI','47','Kobilje','Municipality'),('SI','133','Velenje','Municipality'),('SI','154','Dobje','Municipality'),('SI','148','Benedikt','Municipality'),('SI','123','_kofljica','Municipality'),('SI','88','Osilnica','Municipality'),('SI','128','Tolmin','Municipality'),('SI','57','La_ko','Municipality'),('SI','83','Nazarje','Municipality'),('SI','157','Dolenjske Toplice','Municipality'),('SI','79','Mozirje','Municipality'),('SI','119','_entjernej','Municipality'),('SI','75','Miren-Kostanjevica','Municipality'),('SI','112','Slovenj Gradec','Municipality'),('SI','139','Vojnik','Municipality'),('SI','146','_elezniki','Municipality'),('SI','80','Murska Sobota','Municipality'),('SI','122','_kofja Loka','Municipality'),('SI','165','Kostel','Municipality'),('SI','140','Vrhnika','Municipality'),('SI','155','Dobrna','Municipality'),('SI','195','Apace','Municipality'),('SI','72','Menge_','Municipality'),('SI','110','Sevnica','Municipality'),('SI','130','Trebnje','Municipality'),('SI','191','_etale','Municipality'),('SI','177','Ribnica na Pohorju','Municipality'),('SI','132','Turni_ce','Municipality'),('SI','147','_iri','Municipality'),('SI','170','Mirna Pec','Municipality'),('SI','162','Horjul','Municipality'),('SI','126','_o_tanj','Municipality'),('SI','136','Vipava','Municipality'),('SI','193','_u_emberk','Municipality'),('SI','143','Zavrc','Municipality'),('SI','144','Zrece','Municipality'),('SI','161','Hodo_','Municipality'),('SI','94','Postojna','Municipality'),('SI','137','Vitanje','Municipality'),('SI','176','Razkri_je','Municipality'),('SI','167','Lovrenc na Pohorju','Municipality'),('SI','93','Podvelka','Municipality'),('SI','182','Sveti Andra_ v Slovenskih goricah','Municipality'),('SI','169','Miklav_ na Dravskem polju','Municipality'),('SI','152','Cankova','Municipality'),('SI','197','Kosanjevica na Krki','Municipality'),('SI','158','Grad','Municipality'),('SI','168','Markovci','Municipality'),('SI','180','Solcava','Municipality'),('SI','115','Star_e','Municipality'),('SI','81','Muta','Municipality'),('SI','196','Cirkulane','Municipality'),('SI','151','Braslovce','Municipality'),('SI','138','Vodice','Municipality'),('SI','188','Ver_ej','Municipality'),('SI','181','Sveta Ana','Municipality'),('SI','173','Polzela','Municipality'),('SI','149','Bistrica ob Sotli','Municipality'),('SI','190','_alec','Municipality'),('SI','185','Trnovska vas','Municipality'),('SI','184','Tabor','Municipality'),('SI','153','Cerkvenjak','Municipality'),('SI','198','Makole','Municipality'),('SI','121','_kocjan','Municipality'),('SI','208','Log-Dragomer','Municipality'),('SI','159','Hajdina','Municipality'),('SI','194','_martno pri Litiji','Municipality'),('SI','172','Podlehnik','Municipality'),('SI','160','Hoce-Slivnica','Municipality'),('SI','189','Vransko','Municipality'),('SI','205','Sveti Toma_','Municipality'),('SI','142','Zagorje ob Savi','Municipality'),('SI','203','Stra_a','Municipality'),('SI','192','_irovnica','Municipality'),('SI','164','Komenda','Municipality'),('SI','211','_entrupert','Municipality'),('SI','166','Kri_evci','Municipality'),('SI','171','Oplotnica','Municipality'),('SI','96','Ptuj','Municipality'),('SI','201','Ren�e-Vogrsko','Municipality'),('SI','95','Preddvor','Municipality'),('SI','174','Prebold','Municipality'),('SI','99','Radece','Municipality'),('SI','204','Sveta Trojica v Slovenskih\nGoricah','Municipality'),('SI','102','Radovljica','Municipality'),('SI','187','Velika Polana','Municipality'),('SI','212','Mirna','Municipality'),('SI','175','Prevalje','Municipality'),('SI','179','Sodra_ica','Municipality'),('SI','213','Ankaran','Municipality'),('SI','202','Sredi_ce ob Dravi','Municipality'),('SI','207','Gorje','Municipality'),('SI','210','Sveti Jurij v Slovenskih Goricah','Municipality'),('SI','199','Mokronog-Trebelno','Municipality'),('SI','206','_marje_ke Toplice','Municipality'),('SI','127','_tore','Municipality'),('SI','141','Vuzenica','Municipality'),('SI','117','_encur','Municipality'),('SI','150','Bloke','Municipality'),('SI','156','Dobrovnik','Municipality'),('SI','125','_martno ob Paki','Municipality'),('SI','163','Jezersko','Municipality'),('SI','178','Selnica ob Dravi','Municipality'),('SI','183','_empeter-Vrtojba','Municipality'),('SI','186','Trzin','Municipality'),('SI','200','Poljcane','Municipality'),('SI','209','Recica ob Savinji','Municipality'),('NG','JI','Jigawa','State'),('NG','GO','Gombe','State'),('NG','AD','Adamawa','State'),('NG','ED','Edo','State'),('NG','BO','Borno','State'),('NG','CR','Cross River','State'),('NG','AB','Abia','State'),('NG','TA','Taraba','State'),('NG','IM','Imo','State'),('NG','KO','Kogi','State'),('NG','AN','Anambra','State'),('NG','BA','Bauchi','State'),('NG','BY','Bayelsa','State'),('NG','EB','Ebonyi','State'),('NG','EN','Enugu','State'),('NG','EK','Ekiti','State'),('NG','FC','Abuja Capital Territory','Capital territory'),('NG','ON','Ondo','State'),('NG','KE','Kebbi','State'),('NG','AK','Akwa Ibom','State'),('NG','BE','Benue','State'),('NG','DE','Delta','State'),('NG','OS','Osun','State'),('NG','SO','Sokoto','State'),('NG','NA','Nasarawa','State'),('NG','YO','Yobe','State'),('NG','PL','Plateau','State'),('NG','OY','Oyo','State'),('NG','KD','Kaduna','State'),('NG','LA','Lagos','State'),('NG','KW','Kwara','State'),('NG','KN','Kano','State'),('NG','NI','Niger','State'),('NG','ZA','Zamfara','State'),('NG','KT','Katsina','State'),('NG','OG','Ogun','State'),('NG','RI','Rivers','State'),('MV','0','	Alifu Dhaalu','Administrative atoll'),('MV','7','Haa Alif','Administrative atoll'),('MV','MLE','Male','City'),('MV','8','Thaa','Administrative atoll'),('MV','4','Vaavu','Administrative atoll'),('MV','29','Gnaviyani','Administrative atoll'),('MV','1','Seenu','City'),('MV','3','Lhaviyani','Administrative atoll'),('MV','14','Faafu','Administrative atoll'),('MV','20','Baa','Administrative atoll'),('MV','28','Gaafu Dhaalu','Administrative atoll'),('MV','12','Meemu','Administrative atoll'),('MV','26','Kaafu','Administrative atoll'),('MV','5','Hahdhunmathi','Administrative atoll'),('MV','23','Haa Dhaalu','Administrative atoll'),('MV','24','Shaviyani','Administrative atoll'),('MV','17','Dhaalu','Administrative atoll'),('MV','25','Noonu','Administrative atoll'),('MV','27','Gaafu Alifu','Administrative atoll'),('MV','2','Alifu Alifu','Administrative atoll'),('MV','13','Raa','Administrative atoll'),('HN','AT','Atl�ntida','Department'),('HN','SB','Santa B�rbara','Department'),('HN','VA','Valle','Department'),('HN','EP','El Para�so','Department'),('HN','CP','Cop�n','Department'),('HN','CM','Comayagua','Department'),('HN','OL','Olancho','Department'),('HN','GD','Gracias a Dios','Department'),('HN','LE','Lempira','Department'),('HN','OC','Ocotepeque','Department'),('HN','CL','Col�n','Department'),('HN','IB','Islas de la Bah�a','Department'),('HN','CR','Cort_s','Department'),('HN','CH','Choluteca','Department'),('HN','IN','Intibuc�','Department'),('HN','FM','Francisco Moraz�n','Department'),('HN','YO','Yoro','Department'),('HN','LP','La Paz','Department'),('ID','BA','Bali','Province'),('ID','GO','Gorontalo','Province'),('ID','JA','Jambi','Province'),('ID','JI','Jawa Timur','Province'),('ID','JK','Jakarta Raya','Capital district'),('ID','BE','Bengkulu','Province'),('ID','AC','Aceh','Province'),('ID','BB','Kepulauan Bangka Belitung','Province'),('ID','JT','Jawa Tengah','Province'),('ID','KR','Kepulauan Riau','Province'),('ID','BT','Banten','Province'),('ID','KU','Kalimantan Utara','Province'),('ID','JB','Jawa Barat','Province'),('ID','MA','Maluku','Province'),('ID','SA','Sulawesi Utara','Province'),('ID','RI','Riau','Province'),('ID','SG','Sulawesi Tenggara','Province'),('ID','SN','Sulawesi Selatan','Province'),('ID','MU','Maluku Utara','Province'),('ID','NT','Nusa Tenggara Timur','Province'),('ID','SS','Sumatera Selatan','Province'),('ID','PA','Papua','Province'),('ID','KI','Kalimantan Timur','Province'),('ID','LA','Lampung','Province'),('ID','KB','Kalimantan Barat','Province'),('ID','SR','Sulawesi Barat','Province'),('ID','KT','Kalimantan Tengah','Province'),('ID','KS','Kalimantan Selatan','Province'),('ID','SB','Sumatera Barat','Province'),('ID','NB','Nusa Tenggara Barat','Province'),('ID','YO','Yogyakarta','Special region'),('ID','ST','Sulawesi Tengah','Province'),('ID','PB','Papua Barat','Province'),('ID','SU','Sumatera Utara','Province'),('CM','NO','North','Region'),('CM','SW','South-West','Region'),('CM','NW','North-West','Region'),('CM','OU','West','Region'),('CM','SU','South','Region'),('CM','AD','Adamaoua','Region'),('CM','EN','Far North','Region'),('CM','LT','Littoral','Region'),('CM','ES','East','Region'),('CM','CE','Centre','Region'),('PH','APA','Apayao','Province'),('PH','ABR','Abra','Province'),('PH','SLE','Southern Leyte','Province'),('PH','BIL','Biliran','Province'),('PH','BAN','Bataan','Province'),('PH','AKL','Aklan','Province'),('PH','LEY','Leyte','Province'),('PH','BUL','Bulacan','Province'),('PH','LAS','Lanao del Sur','Province'),('PH','CAG','Cagayan','Province'),('PH','BOH','Bohol','Province'),('PH','AGS','Agusan del Sur','Province'),('PH','MAD','Marinduque','Province'),('PH','CAS','Camarines Sur','Province'),('PH','BTN','Batanes','Province'),('PH','LAG','Laguna','Province'),('PH','ALB','Albay','Province'),('PH','DVO','Kanlurang Dabaw','province'),('PH','BAS','Basilan','Province'),('PH','MSR','Misamis Oriental','Province'),('PH','NCO','Kotabato','Province'),('PH','QUI','Quirino','Province'),('PH','LAN','Lanao del Norte','Province'),('PH','NUE','Nueva Ecija','Province'),('PH','BTG','Batangas','Province'),('PH','COM','Compostela Valley','Province'),('PH','ANT','Antique','Province'),('PH','CEB','Cebu','Province'),('PH','NER','Negros oriental','Province'),('PH','LUN','La Union','Province'),('PH','GUI','Guimaras','Province'),('PH','PAN','Pangasinan','Province'),('PH','ZSI','Zamboanga Sibuguey [Zamboanga Sibugay]','Province'),('PH','CAN','Camarines Norte','Province'),('PH','MDR','Mindoro Oriental','Province'),('PH','MOU','Mountain Province','Province'),('PH','AUR','Aurora','Province'),('PH','DAV','Davao del Norte','Province'),('PH','NEC','Negros occidental','Province'),('PH','ZAS','Zamboanga del Sur','Province'),('PH','EAS','Eastern Samar','Province'),('PH','ILS','Ilocos Sur','Province'),('PH','CAV','Cavite','Province'),('PH','SIG','Siquijor','Province'),('PH','CAM','Camiguin','Province'),('PH','CAT','Catanduanes','Province'),('PH','MAS','Masbate','Province'),('PH','SUR','Surigao del Sur','Province'),('PH','ILN','Ilocos Norte','Province'),('PH','IFU','Ifugao','Province'),('PH','DAO','Davao Oriental','Province'),('PH','MDC','Mindoro Occidental','Province'),('PH','TAW','Tawi-Tawi','Province'),('PH','SAR','Sarangani','Province'),('PH','SUN','Surigao del Norte','Province'),('PH','ISA','Isabela','Province'),('PH','SCO','South Cotabato','Province'),('PH','BEN','Benguet','Province'),('PH','DAS','Davao del Sur','Province'),('PH','AGN','Agusan del Norte','Province'),('PH','MSC','Misamis Occidental','Province'),('PH','QUE','Quezon','Province'),('PH','ZAN','Zamboanga del Norte','Province'),('PH','PAM','Pampanga','Province'),('PH','KAL','Kalinga-Apayao','Province'),('PH','0','National Capital R_gion (Manila)','Region'),('PH','DIN','Dinagat Islands','Province'),('PH','ROM','Romblon','Province'),('PH','NUV','Nueva Vizcaya','Province'),('PH','ILI','Iloilo','Province'),('PH','SLU','Sulu','Province'),('PH','TAR','Tarlac','Province'),('PH','NSA','Northern Samar','Province'),('PH','BUK','Bukidnon','Province'),('PH','MAG','Maguindanao','Province'),('PH','CAP','Capiz','Province'),('PH','PLW','Palawan','Province'),('PH','RIZ','Rizal','Province'),('PH','WSA','Western Samar','Province'),('PH','SUK','Sultan Kudarat','Province'),('PH','ZMB','Zambales','Province'),('PH','SOR','Sorsogon','Province'),('KI','G','Gilbert Islands','Group of islands'),('KI','L','Line Islands','Group of islands'),('KI','P','Phoenix Islands','Group of islands'),('BI','CI','Cibitoke','Province'),('BI','KR','Karuzi','Province'),('BI','BR','Bururi','Province'),('BI','KI','Kirundo','Province'),('BI','MY','Muyinga','Province'),('BI','MU','Muramvya','Province'),('BI','KY','Kayanza','Province'),('BI','BL','Bujumbura Rural','Province'),('BI','RY','Ruyigi','Province'),('BI','NG','Ngozi','Province'),('BI','CA','Cankuzo','Province'),('BI','GI','Gitega','Province'),('BI','BB','Bubanza','Province'),('BI','MW','Mwaro','Province'),('BI','RM','Rumonge','province'),('BI','BM','Bujumbura Mairie','Province'),('BI','MA','Makamba','Province'),('BI','RT','Rutana','Province'),('TM','S','Asgabat','City'),('TM','B','Balkan','Region'),('TM','D','Dasoguz','Region'),('TM','M','Mary','Region'),('TM','A','Ahal','Region'),('TM','L','Lebap','Region'),('KW','JA','Al Jahra�','Governorate'),('KW','HA','?awalli','Governorate'),('KW','MU','Mubarak al Kabir','Governorate'),('KW','FA','Al Farwaniyah','Governorate'),('KW','AH','Al A?madi','Governorate'),('KW','KU','	Al �Asimah','Governorate'),('BR','AP','Amapá','State'),('BR','AC','Acre','State'),('BR','MS','Mato Grosso do Sul','State'),('BR','MA','Maranhão','State'),('BR','MT','Mato Grosso','State'),('BR','TO','Tocantins','State'),('BR','GO','Goiás','State'),('BR','AL','Alagoas','State'),('BR','RS','Rio Grande do Sul','State'),('BR','SE','Sergipe','State'),('BR','AM','Amazonas','State'),('BR','RN','Rio Grande do Norte','State'),('BR','DF','Distrito Federal','Federal district'),('BR','PE','Pernambuco','State'),('BR','CE','Ceará','State'),('BR','SP','São Paulo','State'),('BR','PB','Paraíba','State'),('BR','ES','Espírito Santo','State'),('BR','MG','Minas Gerais','State'),('BR','RO','Rondônia','State'),('BR','PI','Piauí','State'),('BR','RR','Roraima','State'),('BR','BA','Bahia','State'),('BR','RJ','Rio de Janeiro','State'),('BR','PA','Pará','State'),('BR','PR','Paraná','State'),('BR','SC','Santa Catarina','State'),('TR','11','Bilecik','Province'),('TR','2','Adiyaman','Province'),('TR','8','Artvin','Province'),('TR','4','Agri','Province'),('TR','19','Corum','Province'),('TR','5','Amasya','Province'),('TR','25','Erzurum','Province'),('TR','33','Mersin','Province'),('TR','15','Burdur','Province'),('TR','44','Malatya','Province'),('TR','23','Elazig','Province'),('TR','13','Bitlis','Province'),('TR','7','Antalya','Province'),('TR','12','Bing_l','Province'),('TR','30','Hakkari','Province'),('TR','48','Mugla','Province'),('TR','3','Afyonkarahisar','Province'),('TR','26','Eskisehir','Province'),('TR','24','Erzincan','Province'),('TR','1','Adana','Province'),('TR','53','Rize','Province'),('TR','46','Kahramanmaras','Province'),('TR','29','G�m�shane','Province'),('TR','31','Hatay','Province'),('TR','56','Siirt','Province'),('TR','18','�ankiri','Province'),('TR','52','Ordu','Province'),('TR','49','Mus','Province'),('TR','17','Canakkale','Province'),('TR','50','Nevsehir','Province'),('TR','66','Yozgat','Province'),('TR','45','Manisa','Province'),('TR','57','Sinop','Province'),('TR','32','Isparta','Province'),('TR','79','Kilis','Province'),('TR','38','Kayseri','Province'),('TR','71','Kirikkale','Province'),('TR','27','Gaziantep','Province'),('TR','67','Zonguldak','Province'),('TR','21','Diyarbakir','Province'),('TR','42','Konya','Province'),('TR','54','Sakarya','Province'),('TR','76','Igdir','Province'),('TR','9','Aydin','Province'),('TR','16','Bursa','Province'),('TR','39','Kirklareli','Province'),('TR','60','Tokat','Province'),('TR','70','Karaman','Province'),('TR','58','Sivas','Province'),('TR','36','Kars','Province'),('TR','55','Samsun','Province'),('TR','20','Denizli','Province'),('TR','62','Tunceli','Province'),('TR','74','Bartin','Province'),('TR','37','Kastamonu','Province'),('TR','61','Trabzon','Province'),('TR','22','Edirne','Province'),('TR','80','Osmaniye','Province'),('TR','78','Karabuk','Province'),('TR','40','Kirsehir','Province'),('TR','59','Tekirdag','Province'),('TR','6','Ankara','Province'),('TR','10','Balikesir','Province'),('TR','63','Sanliurfa','Province'),('TR','28','Giresun','Province'),('TR','64','Usak','Province'),('TR','34','Istanbul','Province'),('TR','65','Van','Province'),('TR','14','Bolu','Province'),('TR','72','Batman','Province'),('TR','69','Bayburt','Province'),('TR','41','Kocaeli','Province'),('TR','77','Yalova','Province'),('TR','81','D�zce','Province'),('TR','43','K�tahya','Province'),('TR','47','Mardin','Province'),('TR','35','Izmir','Province'),('TR','51','Nigde','Province'),('TR','68','Aksaray','Province'),('TR','73','Sirnak','Province'),('TR','75','Ardahan','Province'),('ER','MA','Ma�ikel','Region'),('ER','AN','�Anseba','Region'),('ER','DU','Debub','Region'),('ER','DK','Debubawi K�eyyi? Ba?ri','Region'),('ER','GB','Gash-Barka','Region'),('ER','SK','Semienawi K�eyyi? Ba?ri','Region'),('NI','MD','Madriz','Department'),('NI','MS','Masaya','Department'),('NI','GR','Granada','Department'),('NI','ES','Estel�','Department'),('NI','SJ','R�o San Juan','Department'),('NI','MN','Managua','Department'),('NI','CA','Carazo','Department'),('NI','AN','Atl�ntico Norte','Autonomous region'),('NI','LE','Le�n','Department'),('NI','CO','Chontales','Department'),('NI','JI','Jinotega','Department'),('NI','NS','Nueva Segovia','Department'),('NI','RI','Rivas','Department'),('NI','CI','Chinandega','Department'),('NI','BO','Boaco','Department'),('NI','MT','Matagalpa','Department'),('NI','AS','Atl�ntico Sur','Autonomous region'),('AT','9','Wien','state'),('AT','1','Burgenland','state'),('AT','5','Salzburg','state'),('AT','3','Nieder_sterreich','state'),('AT','6','Steiermark','state'),('AT','8','Vorarlberg','state'),('AT','4','Ober_sterreich','state'),('AT','2','K_rnten','state'),('AT','7','Tirol','state'),('AD','3','Encamp','Parish'),('AD','7','Andorra la Vella','Parish'),('AD','2','Canillo','Parish'),('AD','8','Escaldes-Engordany','Parish'),('AD','5','Ordino','Parish'),('AD','6','Sant Julià de Lòria','Parish'),('AD','4','La Massana','Parish'),('OM','SS','Shamal ash Sharqiyah','governorate'),('OM','SJ','Janub ash Sharqiyah','governorate'),('OM','ZA','Az Zahirah','Region'),('OM','BJ','Janub al Batinah','governorate'),('OM','ZU','Z�ufar','governorate'),('OM','BU','Al Buraymi','governorate'),('OM','BS','Shamal al Batinah','governorate'),('OM','WU','AI Wusta','governorate'),('OM','MA','Masqat','governorate'),('OM','MU','Musandam','governorate'),('OM','DA','Ad Dakhiliyah','governorate'),('TJ','KT','Khatlon','Region'),('TJ','GB','Kuhistoni Badakhshon','Autonomous region'),('TJ','RA','nohiyahoi tobei jumhur�','districts under republic administration'),('TJ','DU','Dushanbe','Capital territory'),('TJ','SU','Sughd','Region'),('SD','KN','Shiamal Kurdufan','State'),('SD','GD','Al Qadarif','State'),('SD','GZ','Al Jazirah','State'),('SD','GK','Gharb Kurdufan','state'),('SD','DE','Sharq Darfur','State'),('SD','NR','Nahr an Nil','State'),('SD','DS','Janub Darfur','State'),('SD','KH','Al Khartum','State'),('SD','KS','Janub Kurdufan','State'),('SD','DW','Gharb Darfur','State'),('SD','DN','Shamal Darfur','State'),('SD','NB','An Nil al Azraq','State'),('SD','DC','Wasat Darfur Zalinjay','State'),('SD','SI','Sinnar','State'),('SD','NO','Ash Shamaliyah','State'),('SD','KA','Kassala','State'),('SD','NW','An Nil al Abya?','State'),('SD','RS','Al Ba?r al A?mar','State'),('HR','9','Licko-senjska _upanija','County'),('HR','6','Koprivnicko-kri_evacka _upanija','County'),('HR','4','Karlovacka _upanija','County'),('HR','7','Bjelovarsko-bilogorska _upanija','County'),('HR','21','Grad Zagreb','City'),('HR','2','Krapinsko-zagorska _upanija','County'),('HR','11','Po_e_ko-slavonska _upanija','County'),('HR','16','Vukovarsko-srijemska _upanija','County'),('HR','14','Osjecko-baranjska _upanija','County'),('HR','1','Zagrebacka _upanija','County'),('HR','13','Zadarska _upanija','County'),('HR','8','Primorsko-goranska _upanija','County'),('HR','3','Sisacko-moslavacka _upanija','County'),('HR','10','Viroviticko-podravska _upanija','County'),('HR','17','Splitsko-dalmatinska _upanija','County'),('HR','20','Medimurska _upanija','County'),('HR','19','Dubrovacko-neretvanska _upanija','County'),('HR','5','Vara_dinska _upanija','County'),('HR','12','Brodsko-posavska _upanija','County'),('HR','18','Istarska _upanija','County'),('HR','15','_ibensko-kninska _upanija','County'),('PG','MBA','Milne Bay','Province'),('PG','SAN','West Sepik','Province'),('PG','MRL','Manus','Province'),('PG','EPW','Enga','Province'),('PG','ESW','East Sepik','Province'),('PG','EBR','East New Britain','Province'),('PG','WHM','Western Highlands','Province'),('PG','CPK','Chimbu','Province'),('PG','GPK','Gulf','Province'),('PG','NCD','National Capital District (Port Moresby)','District'),('PG','JWK','Jiwaka','Province'),('PG','CPM','Central','Province'),('PG','EHG','Eastern Highlands','Province'),('PG','WBK','West New Britain','Province'),('PG','NPP','Northern','Province'),('PG','HLA','Hela','Province'),('PG','NIK','New Ireland','Province'),('PG','MPM','Madang','Province'),('PG','SHM','Southern Highlands','Province'),('PG','NSB','Bougainville','autonomous region'),('PG','MPL','Morobe','Province'),('PG','WPD','Western','Province'),('NP','KO','Kosi [Koshi]','Zone'),('NP','RA','Rapti','Zone'),('NP','DH','Dhawalagiri','Zone'),('NP','SE','Seti','Zone'),('NP','BA','Bagmati','Zone'),('NP','BH','Bheri','Zone'),('NP','SA','Sagarmatha','Zone'),('NP','P7','Pradesh 7','Province'),('NP','LU','Lumbini','Zone'),('NP','MA','Mahakali','Zone'),('NP','P6','Pradesh 6','Province'),('NP','KA','Karnali','Zone'),('NP','ME','Mechi','Zone'),('NP','NA','Narayani','Zone'),('NP','P4','Pradesh 4','Province'),('NP','P2','Pradesh 2','Province'),('NP','P5','Pradesh 5','Province'),('NP','GA','Gandaki','Zone'),('NP','P3','Pradesh 3','Province'),('NP','JA','Janakpur','Zone'),('NP','P1','	Pradesh 1','Province'),('TL','AL','Aileu','Municipality'),('TL','BO','Bobonaro','Municipality'),('TL','BA','Baucau','Municipality'),('TL','ER','Ermera','Municipality'),('TL','DI','D�li','Municipality'),('TL','VI','Viqueque','Municipality'),('TL','LA','Laut_m','Municipality'),('TL','CO','Cova Lima','Municipality'),('TL','LI','Liqui�a','Municipality'),('TL','OE','	O_-Cusse Ambeno','Special administrative region'),('TL','AN','Ainaro','Municipality'),('TL','MT','Manatuto','Municipality'),('TL','MF','Manufahi','Municipality'),('GY','EB','East Berbice-Corentyne','Region'),('GY','ES','Essequibo Islands-West Demerara','Region'),('GY','BA','Barima-Waini','Region'),('GY','DE','Demerara-Mahaica','Region'),('GY','UD','Upper Demerara-Berbice','Region'),('GY','MA','Mahaica-Berbice','Region'),('GY','PT','Potaro-Siparuni','Region'),('GY','CU','Cuyuni-Mazaruni','Region'),('GY','PM','Pomeroon-Supenaam','Region'),('GY','UT','Upper Takutu-Upper Essequibo','Region'),('BZ','TOL','Toledo','District'),('BZ','OW','Orange Walk','District'),('BZ','CZL','Corozal','District'),('BZ','BZ','Belize','District'),('BZ','CY','Cayo','District'),('BZ','SC','Stann Creek','District'),('FR','5','Hautes-Alpes','Metropolitan department'),('FR','25','Doubs','Metropolitan department'),('FR','9','Ari�ge','Metropolitan department'),('FR','18','Cher','Metropolitan department'),('FR','29','Finist�re','Metropolitan department'),('FR','24','Dordogne','Metropolitan department'),('FR','2A','Corse-du-Sud','Metropolitan department'),('FR','15','Cantal','Metropolitan department'),('FR','3','Allier','Metropolitan department'),('FR','2','Aisne','Metropolitan department'),('FR','26','Dr�me','Metropolitan department'),('FR','22','C�tes-d\'Armor','Metropolitan department'),('FR','13','Bouches-du-Rh�ne','Metropolitan department'),('FR','2B','Haute-Corse','Metropolitan department'),('FR','1','Ain','Metropolitan department'),('FR','19','Corr�ze','Metropolitan department'),('FR','40','Landes','Metropolitan department'),('FR','38','Is�re','Metropolitan department'),('FR','43','Haute-Loire','Metropolitan department'),('FR','31','Haute-Garonne','Metropolitan department'),('FR','10','Aube','Metropolitan department'),('FR','50','Manche','Metropolitan department'),('FR','4','Alpes-de-Haute-Provence','Metropolitan department'),('FR','53','Mayenne','Metropolitan department'),('FR','21','C�te-d\'Or','Metropolitan department'),('FR','6','Alpes-Maritimes','Metropolitan department'),('FR','52','Haute-Marne','Metropolitan department'),('FR','36','Indre','Metropolitan department'),('FR','41','Loir-et-Cher','Metropolitan department'),('FR','12','Aveyron','Metropolitan department'),('FR','44','Loire-Atlantique','Metropolitan department'),('FR','60','Oise','Metropolitan department'),('FR','74','Haute-Savoie','Metropolitan department'),('FR','8','Ardennes','Metropolitan department'),('FR','35','Ille-et-Vilaine','Metropolitan department'),('FR','56','Morbihan','Metropolitan department'),('FR','73','Savoie','Metropolitan department'),('FR','33','Gironde','Metropolitan department'),('FR','32','Gers','Metropolitan department'),('FR','46','Lot','Metropolitan department'),('FR','49','Maine-et-Loire','Metropolitan department'),('FR','65','Hautes-Pyr_n_es','Metropolitan department'),('FR','54','Meurthe-et-Moselle','Metropolitan department'),('FR','71','Sa�ne-et-Loire','Metropolitan department'),('FR','27','Eure','Metropolitan department'),('FR','30','Gard','Metropolitan department'),('FR','45','Loiret','Metropolitan department'),('FR','89','Yonne','Metropolitan department'),('FR','68','Haut-Rhin','Metropolitan department'),('FR','7','Ard�che','Metropolitan department'),('FR','91','Essonne','Metropolitan department'),('FR','66','Pyr_n_es-Orientales','Metropolitan department'),('FR','42','Loire','Metropolitan department'),('FR','84','Vaucluse','Metropolitan department'),('FR','16','Charente','Metropolitan department'),('FR','63','Puy-de-D�me','Metropolitan department'),('FR','79','Deux-S�vres','Metropolitan department'),('FR','47','Lot-et-Garonne','Metropolitan department'),('FR','80','Somme','Metropolitan department'),('FR','51','Marne','Metropolitan department'),('FR','58','Ni�vre','Metropolitan department'),('FR','57','Moselle','Metropolitan department'),('FR','17','Charente-Maritime','Metropolitan department'),('FR','48','Loz�re','Metropolitan department'),('FR','81','Tarn','Metropolitan department'),('FR','64','Pyr_n_es-Atlantiques','Metropolitan department'),('FR','85','Vend_e','Metropolitan department'),('FR','59','Nord','Metropolitan department'),('FR','55','Meuse','Metropolitan department'),('FR','23','Creuse','Metropolitan department'),('FR','14','Calvados','Metropolitan department'),('FR','67','Bas-Rhin','Metropolitan department'),('FR','83','Var','Metropolitan department'),('FR','34','H_rault','Metropolitan department'),('FR','62','Pas-de-Calais','Metropolitan department'),('FR','69','Rh�ne','Metropolitan department'),('FR','78','Yvelines','Metropolitan department'),('FR','28','Eure-et-Loir','Metropolitan department'),('FR','77','Seine-et-Marne','Metropolitan department'),('FR','37','Indre-et-Loire','Metropolitan department'),('FR','86','Vienne','Metropolitan department'),('FR','94','Val-de-Marne','Metropolitan department'),('FR','61','Orne','Metropolitan department'),('FR','82','Tarn-et-Garonne','Metropolitan department'),('FR','39','Jura','Metropolitan department'),('FR','90','Territoire de Belfort','Metropolitan department'),('FR','11','Aude','Metropolitan department'),('FR','88','Vosges','Metropolitan department'),('FR','76','Seine-Maritime','Metropolitan department'),('FR','75','Paris','Metropolitan department'),('FR','70','Haute-Sa�ne','Metropolitan department'),('FR','87','Haute-Vienne','Metropolitan department'),('FR','72','Sarthe','Metropolitan department'),('FR','93','Seine-Saint-Denis','Metropolitan department'),('FR','92','Hauts-de-Seine','Metropolitan department'),('FR','95','Val-d\'Oise','Metropolitan department'),('GH','UW','Upper West','Region'),('GH','EP','Eastern','Region'),('GH','AA','Greater Accra','Region'),('GH','CP','Central','Region'),('GH','NP','Northern','Region'),('GH','WP','Western','Region'),('GH','TV','Volta','Region'),('GH','BA','Brong-Ahafo','Region'),('GH','AH','Ashanti','Region'),('GH','UE','Upper East','Region'),('SC','23','Takamaka','District'),('SC','6','Baie Lazare','District'),('SC','1','Anse aux Pins','District'),('SC','10','Bel Ombre','District'),('SC','13','Grand\'Anse Mah_','District'),('SC','7','Baie Sainte Anne','District'),('SC','24','Lemamel','District'),('SC','8','Beau Vallon','District'),('SC','19','Plaisance','District'),('SC','3','Anse �toile','District'),('SC','2','Anse Boileau','District'),('SC','16','La Rivi�re Anglaise','District'),('SC','9','Bel Air','District'),('SC','11','Cascade','District'),('SC','21','Port Glaud','District'),('SC','22','Saint Louis','District'),('SC','25','Ros Kaiman','District'),('SC','15','La Digue','District'),('SC','18','Mont Fleuri','District'),('SC','14','Grand\'Anse Praslin','District'),('SC','17','Mont Buxton','District'),('SC','4','Au Cap','District'),('SC','20','Pointe La Rue','District'),('SC','5','Anse Royale','District'),('SC','12','Glacis','District'),('RU','KB','Kabardino-Balkarskaya Respublika','Republic'),('RU','KGN','Kurganskaya oblast\'','Administrative region'),('RU','IRK','Irkutskaya oblast\'','Administrative region'),('RU','KIR','Kirovskaya oblast\'','Administrative region'),('RU','AD','Adygeya, Respublika','Republic'),('RU','CHU','Chukotskiy avtonomnyy okrug','Autonomous district'),('RU','OMS','Omskaya oblast\'','Administrative region'),('RU','NGR','Novgorodskaya oblast\'','Administrative region'),('RU','BEL','Belgorodskaya oblast\'','Administrative region'),('RU','KGD','Kaliningradskaya oblast,','Administrative region'),('RU','CE','Chechenskaya Respublika','Republic'),('RU','KR','Kareliya, Respublika','Republic'),('RU','MAG','Magadanskaya oblast\'','Administrative region'),('RU','AL','Altay, Respublika','Republic'),('RU','LIP','Lipetskaya oblast\'','Administrative region'),('RU','KEM','Kemerovskaya oblast\'','Administrative region'),('RU','KAM','Kamchatskaya oblast\'','Administrative region'),('RU','KYA','Krasnoyarskiy kray','Administrative territory'),('RU','SA','Sakha, Respublika [Yakutiya]','Republic'),('RU','ARK','Arkhangel\'skaya oblast,','Administrative region'),('RU','IN','Ingushskaya Respublika [Respublika Ingushetiya]','Republic'),('RU','KL','Kalmykiya, Respublika','Republic'),('RU','BU','Buryatiya, Respublika','Republic'),('RU','MOS','Moskovskaya oblast\'','Administrative region'),('RU','SMO','Smolenskaya oblast\'','Administrative region'),('RU','SAR','Saratovskaya oblast\'','Administrative region'),('RU','TAM','Tambovskaya oblast\'','Administrative region'),('RU','KHA','Khabarovskiy kray','Administrative territory'),('RU','AST','Astrakhanskaya oblast\'','Administrative region'),('RU','DA','Dagestan, Respublika','Republic'),('RU','YEV','Yevreyskaya avtonomnaya oblast\'','Autonomous region'),('RU','ORE','Orenburgskaya oblast\'','Administrative region'),('RU','SAM','Samarskaya oblast\'','Administrative region'),('RU','PNZ','Penzenskaya oblast\'','Administrative region'),('RU','KHM','Khanty-Mansiyskiy avtonomnyy okrug','Autonomous district'),('RU','KDA','Krasnodarskiy kray','Administrative territory'),('RU','RYA','Ryazanskaya oblast\'','Administrative region'),('RU','AMU','Amurskaya oblast\'','Administrative region'),('RU','PRI','Primorskiy kray','Administrative territory'),('RU','BA','Bashkortostan, Respublika','Republic'),('RU','STA','Stavropol\'skiy kray','Administrative territory'),('RU','MOW','Moskva','Autonomous city'),('RU','TOM','Tomskaya oblast\'','Administrative region'),('RU','KRS','Kurskaya oblast\'','Administrative region'),('RU','CHE','Chelyabinskaya oblast\'','Administrative region'),('RU','VLG','Vologodskaya oblast\'','Administrative region'),('RU','ME','Mariy El, Respublika','Republic'),('RU','SPE','Sankt-Peterburg','Autonomous city'),('RU','SAK','Sakhalinskaya oblast\'','Administrative region'),('RU','NVS','Novosibirskaya oblast\'','Administrative region'),('RU','MO','Mordoviya, Respublika','Republic'),('RU','KC','Karachayevo-Cherkesskaya Respublika','Republic'),('RU','KK','Khakasiya, Respublika','Republic'),('RU','IVA','Ivanovskaya oblast\'','Administrative region'),('RU','ROS','Rostovskaya oblast\'','Administrative region'),('RU','LEN','Leningradskaya oblast\'','Administrative region'),('RU','MUR','Murmanskaya oblast\'','Administrative region'),('RU','KLU','Kaluzhskaya oblast\'','Administrative region'),('RU','KO','Komi, Respublika','Republic'),('RU','TYU','Tyumenskaya oblast\'','Administrative region'),('RU','NEN','Nenetskiy avtonomnyy okrug','Autonomous district'),('RU','SVE','Sverdlovskaya oblast\'','Administrative region'),('RU','PER','Perm','Administrative territory'),('RU','ORL','Orlovskaya oblast\'','Administrative region'),('RU','KOS','Kostromskaya oblast\'','Administrative region'),('RU','NIZ','Nizhegorodskaya oblast\'','Administrative region'),('RU','TA','Tatarstan, Respublika','Republic'),('RU','ULY','Ul\'yanovskaya oblast\'','Administrative region'),('RU','SE','Severnaya Osetiya, Respublika Alaniya] [Respublika Severnaya Osetiya-Alaniya]','Republic'),('RU','ALT','Altayskiy kray','Administrative territory'),('RU','PSK','Pskovskaya oblast\'','Administrative region'),('RU','BRY','Bryanskaya oblast\'','Administrative region'),('RU','YAN','Yamalo-Nenetskiy avtonomnyy okrug','Autonomous district'),('RU','TUL','Tul\'skaya oblast\'','Administrative region'),('RU','CU','Chuvashskaya Respublika','Republic'),('RU','TVE','Tverskaya oblast\'','Administrative region'),('RU','TY','Tyva, Respublika [Tuva]','Republic'),('RU','YAR','Yaroslavskaya oblast\'','Administrative region'),('RU','VGG','Volgogradskaya oblast\'','Administrative region'),('RU','ZAB','Zabaykal\'skiy kray','Administrative territory'),('RU','UD','Udmurtskaya Respublika','Republic'),('RU','VLA','Vladimirskaya oblast\'','Administrative region'),('RU','VOR','Voronezhskaya oblast\'','Administrative region'),('RW','5','Sud','Province'),('RW','1','Ville de Kigali','city'),('RW','3','Nord','Province'),('RW','4','Ouest','Province'),('RW','2','Est','Province'),('EC','L','Loja','Province'),('EC','SE','Santa Elena','Province'),('EC','SD','Santo Domingo de los Ts�chilas','Province'),('EC','N','Napo','Province'),('EC','D','Orellana','Province'),('EC','I','Imbabura','Province'),('EC','U','Sucumb�os','Province'),('EC','A','Azuay','Province'),('EC','T','Tungurahua','Province'),('EC','H','Chimborazo','Province'),('EC','O','El Oro','Province'),('EC','R','Los R�os','Province'),('EC','E','Esmeraldas','Province'),('EC','C','Carchi','Province'),('EC','M','Manab�','Province'),('EC','F','Ca�ar','Province'),('EC','G','Guayas','Province'),('EC','P','Pichincha','Province'),('EC','Y','Pastaza','Province'),('EC','B','Bol�var','Province'),('EC','S','Morona-Santiago','Province'),('EC','W','Galápagos','Province'),('EC','X','Cotopaxi','Province'),('EC','Z','Zamora Chinchipe','Province'),('KN','7','Saint John Figtree','Parish'),('KN','6','Saint John Capisterre','Parish'),('KN','2','Saint Anne Sandy Point','Parish'),('KN','1','Christ Church Nichola Town','Parish'),('KN','12','Saint Thomas Lowland','Parish'),('KN','8','Saint Mary Cayon','Parish'),('KN','10','Saint Paul Charlestown','Parish'),('KN','9','Saint Paul Capisterre','Parish'),('KN','5','Saint James Windward','Parish'),('KN','4','Saint George Gingerland','Parish'),('KN','3','Saint George Basseterre','Parish'),('KN','15','Trinity Palmetto Point','Parish'),('KN','11','Saint Peter Basseterre','Parish'),('KN','13','Saint Thomas Middle Island','Parish'),('ME','15','Plu_ine','Municipality'),('ME','13','Plav','Municipality'),('ME','4','Bijelo Polje','Municipality'),('ME','16','Podgorica','Municipality'),('ME','9','Kola_in','Municipality'),('ME','1','Andrijevica','Municipality'),('ME','10','Kotor','Municipality'),('ME','7','Danilovgrad','Municipality'),('ME','17','Ro_aje','Municipality'),('ME','6','Cetinje','Municipality'),('ME','18','_avnik','Municipality'),('ME','5','Budva','Municipality'),('ME','2','Bar','Municipality'),('ME','14','Pljevlja','Municipality'),('ME','21','_abljak','Municipality'),('ME','23','Petnjica','Municipality'),('ME','8','Herceg-Novi','Municipality'),('ME','3','Berane','Municipality'),('ME','11','Mojkovac','Municipality'),('ME','22','Gusinje','Municipality'),('ME','12','Nik_ic�','Municipality'),('ME','20','Ulcinj','Municipality'),('ME','19','Tivat','Municipality'),('IR','4','Esfahan','Province'),('IR','23','Hormozgan','Province'),('IR','13','Sistan va Baluchestan','Province'),('IR','20','Lorestan','Province'),('IR','19','Gilan','Province'),('IR','7','Tehran','Province'),('IR','2','AZarbayjan-e Gharbi','Province'),('IR','5','Ilam','Province'),('IR','3','Ardabil','Province'),('IR','26','Qom','Province'),('IR','11','Zanjan','Province'),('IR','18','Kohgiluyeh va Bowyer A?mad','Province'),('IR','1','AZarbayjan-e Sharqi','Province'),('IR','29','Khorasan-e Jonubi','Province'),('IR','31','Khorasan-e Shomali','Province'),('IR','28','Qazvin','Province'),('IR','30','	Khorasan-e Ra?avi','Province'),('IR','15','Kerman','Province'),('IR','16','Kordestan','Province'),('IR','24','Hamadan','Province'),('IR','10','Khuzestan','Province'),('IR','22','Markazi','Province'),('IR','14','Fars','Province'),('IR','17','Kermanshah','Province'),('IR','12','Semnan','Province'),('IR','6','Bushehr','Province'),('IR','25','Yazd','Province'),('IR','32','Alborz','Province'),('IR','8','Chahar Ma?al va Bakhtiari','Province'),('IR','21','Mazandaran','Province'),('IR','27','Golestan','Province'),('SL','W','Western Area (Freetown)','Area'),('SL','N','Northern','Province'),('SL','NW','North Western','Province'),('SL','E','Eastern','Province'),('SL','S','Southern','Province'),('PS','RFH','Rafah','Governorate'),('PS','TBS','Tubas','Governorate'),('PS','GZA','Gaza','Governorate'),('PS','HBN','Hebron','Governorate'),('PS','NBS','Nablus','Governorate'),('PS','DEB','Deir El Balah','Governorate'),('PS','SLT','Salfit','Governorate'),('PS','NGZ','North Gaza','Governorate'),('PS','QQA','Qalqilya','Governorate'),('PS','BTH','Bethlehem','Governorate'),('PS','TKM','Tulkarm','Governorate'),('PS','RBH','Ramallah','Governorate'),('PS','KYS','Khan Yunis','Governorate'),('PS','JEM','Jerusalem','Governorate'),('PS','JRH','	Jericho and Al Aghwar','Governorate'),('VU','SEE','Shefa','undefined'),('VU','TAE','Tafea','undefined'),('VU','SAM','Sanma','undefined'),('VU','MAP','Malampa','undefined'),('VU','PAM','Paama','undefined'),('VU','TOB','Torba','undefined'),('BJ','PL','Plateau','Department'),('BJ','AQ','Atlantique','Department'),('BJ','KO','Couffo','Department'),('BJ','AK','Atacora','Department'),('BJ','BO','Borgou','Department'),('BJ','MO','Mono','Department'),('BJ','LI','Littoral','Department'),('BJ','ZO','Zou','Department'),('BJ','DO','Donga','Department'),('BJ','CO','Collines','Department'),('BJ','OU','Ou_m_','Department'),('BJ','AL','Alibori','Department'),('GR','J','Peloponn�sos','Administrative region'),('GR','B','Kentrik� Makedon�a','Administrative region'),('GR','A','Anatolik� Makedon�a kai Thr�ki','Administrative region'),('GR','H','Stere� Ell�da','Administrative region'),('GR','I','Attik�','Administrative region'),('GR','F','Ion�a N�sia','Administrative region'),('GR','E','Thessal�a','Administrative region'),('GR','K','Vore�o Aiga�o','Administrative region'),('GR','C','Dytiki Makedonia','Administrative region'),('GR','D','�peiros','Administrative region'),('GR','M','Kr�ti','Administrative region'),('GR','G','Dytik� Ell�da','Administrative region'),('GR','L','Not�o Aiga�o','Administrative region');
/*!40000 ALTER TABLE `countries_subdivisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_students`
--

DROP TABLE IF EXISTS `course_students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_students` (
  `id` int NOT NULL AUTO_INCREMENT,
  `course_id` int NOT NULL,
  `student_id` int NOT NULL,
  `student_status` enum('registered','regular','paused','suspended') DEFAULT 'registered',
  PRIMARY KEY (`id`),
  KEY `course_id` (`course_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `course_students_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  CONSTRAINT `course_students_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_students`
--

LOCK TABLES `course_students` WRITE;
/*!40000 ALTER TABLE `course_students` DISABLE KEYS */;
INSERT INTO `course_students` VALUES (1,1,1,NULL),(2,1,2,NULL),(3,1,3,NULL),(4,2,2,NULL),(5,2,3,NULL),(6,2,4,NULL),(7,3,3,NULL),(8,3,4,NULL),(9,3,5,NULL);
/*!40000 ALTER TABLE `course_students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_subjects`
--

DROP TABLE IF EXISTS `course_subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_subjects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `course_id` int NOT NULL,
  `subject_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_id` (`course_id`),
  KEY `subject_id` (`subject_id`),
  CONSTRAINT `course_subjects_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  CONSTRAINT `course_subjects_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_subjects`
--

LOCK TABLES `course_subjects` WRITE;
/*!40000 ALTER TABLE `course_subjects` DISABLE KEYS */;
INSERT INTO `course_subjects` VALUES (1,1,3),(2,2,2),(3,3,1),(4,1,2);
/*!40000 ALTER TABLE `course_subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `start_date_time` datetime DEFAULT NULL,
  `duration_days` smallint NOT NULL,
  `status` enum('planning','planned','in-course','finished') DEFAULT 'planning',
  `price` mediumint DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'SQL','2024-05-20 00:00:00',65,NULL,132,'Course description'),(2,'Backend','2023-11-22 00:00:00',115,'planned',295,'Course description'),(3,'React','2023-10-10 00:00:00',60,'in-course',115,'Course description'),(4,'Vue','2023-10-20 00:00:00',65,'in-course',115,'Course description'),(5,'Docker','2023-08-30 00:00:00',40,'finished',90,'Course description');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_insert_course_aud` AFTER INSERT ON `courses` FOR EACH ROW BEGIN
	INSERT INTO audits (id_log, entity, entity_id, reg_action, action_dt, action_by)
    VALUES (NULL, 'course', NEW.id, 'insert', CURRENT_TIMESTAMP(), USER());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_update_course_aud` AFTER UPDATE ON `courses` FOR EACH ROW BEGIN
	INSERT INTO audits (id_log, entity, entity_id, reg_action, action_dt, action_by)
    VALUES (NULL, 'course', NEW.id, 'update', CURRENT_TIMESTAMP(), USER());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_delete_course_aud` BEFORE DELETE ON `courses` FOR EACH ROW BEGIN
	INSERT INTO audits (id_log, entity, entity_id, reg_action, action_dt, action_by)
    VALUES (NULL, 'course', OLD.id, 'delete', CURRENT_TIMESTAMP(), USER());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `lesson_present_students`
--

DROP TABLE IF EXISTS `lesson_present_students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lesson_present_students` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lesson_id` int NOT NULL,
  `student_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lesson_id` (`lesson_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `lesson_present_students_ibfk_1` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`),
  CONSTRAINT `lesson_present_students_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson_present_students`
--

LOCK TABLES `lesson_present_students` WRITE;
/*!40000 ALTER TABLE `lesson_present_students` DISABLE KEYS */;
INSERT INTO `lesson_present_students` VALUES (1,1,1),(2,1,2),(3,1,3),(4,2,2),(5,2,3),(6,2,1),(7,3,3),(8,3,2),(9,3,3);
/*!40000 ALTER TABLE `lesson_present_students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lessons`
--

DROP TABLE IF EXISTS `lessons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lessons` (
  `id` int NOT NULL AUTO_INCREMENT,
  `topic` varchar(50) NOT NULL,
  `start_date_time` datetime DEFAULT NULL,
  `duration_time` time DEFAULT NULL,
  `subject_id` int NOT NULL,
  `status` enum('planning','planned','in-course','finished') DEFAULT 'planning',
  `description` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subject_id` (`subject_id`),
  CONSTRAINT `lessons_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lessons`
--

LOCK TABLES `lessons` WRITE;
/*!40000 ALTER TABLE `lessons` DISABLE KEYS */;
INSERT INTO `lessons` VALUES (1,'Prototypes','2024-05-20 00:00:00','01:00:00',1,NULL,'Lesson description'),(2,'NPM versions','2023-11-22 00:00:00','01:00:00',2,NULL,'Lesson description'),(3,'Composition API','2023-10-10 00:00:00','01:30:00',3,NULL,'Lesson description'),(4,'Pinia','2023-10-20 00:00:00','01:30:00',3,NULL,'Lesson description'),(5,'Git Branches','2023-08-30 00:00:00','01:00:00',2,NULL,'Lesson description');
/*!40000 ALTER TABLE `lessons` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_insert_lesson_aud` AFTER INSERT ON `lessons` FOR EACH ROW BEGIN
	INSERT INTO audits (id_log, entity, entity_id, reg_action, action_dt, action_by)
    VALUES (NULL, 'lesson', NEW.id, 'insert', CURRENT_TIMESTAMP(), USER());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_update_lesson_aud` AFTER UPDATE ON `lessons` FOR EACH ROW BEGIN
	INSERT INTO audits (id_log, entity, entity_id, reg_action, action_dt, action_by)
    VALUES (NULL, 'lesson', NEW.id, 'update', CURRENT_TIMESTAMP(), USER());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_delete_lesson_aud` BEFORE DELETE ON `lessons` FOR EACH ROW BEGIN
	INSERT INTO audits (id_log, entity, entity_id, reg_action, action_dt, action_by)
    VALUES (NULL, 'lesson', OLD.id, 'delete', CURRENT_TIMESTAMP(), USER());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `payment_types`
--

DROP TABLE IF EXISTS `payment_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `payment_type` varchar(100) DEFAULT NULL,
  `details` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_types`
--

LOCK TABLES `payment_types` WRITE;
/*!40000 ALTER TABLE `payment_types` DISABLE KEYS */;
INSERT INTO `payment_types` VALUES (1,'cash','Course description'),(2,'transfer','Course description'),(3,'debit','Course description'),(4,'credit','Course description');
/*!40000 ALTER TABLE `payment_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quizzes`
--

DROP TABLE IF EXISTS `quizzes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quizzes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `topic` varchar(50) NOT NULL,
  `start_date_time` datetime DEFAULT NULL,
  `duration_time` time NOT NULL,
  `subject_id` int NOT NULL,
  `status` enum('planning','planned','in-course','finished') DEFAULT 'planning',
  `description` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subject_id` (`subject_id`),
  CONSTRAINT `quizzes_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quizzes`
--

LOCK TABLES `quizzes` WRITE;
/*!40000 ALTER TABLE `quizzes` DISABLE KEYS */;
INSERT INTO `quizzes` VALUES (1,'Prototypes','2024-06-20 00:00:00','01:00:00',1,NULL,'Quizzes description'),(2,'NPM versions','2023-12-22 00:00:00','01:00:00',2,NULL,'Quizzes description'),(3,'Composition API','2023-11-10 00:00:00','01:00:00',3,NULL,'Quizzes description'),(4,'Pinia','2023-11-20 00:00:00','01:00:00',3,NULL,'Quizzes description'),(5,'Git Branches','2023-09-30 00:00:00','01:00:00',2,'finished','Quizzes description');
/*!40000 ALTER TABLE `quizzes` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_insert_quiz_aud` AFTER INSERT ON `quizzes` FOR EACH ROW BEGIN
	INSERT INTO audits (id_log, entity, entity_id, reg_action, action_dt, action_by)
    VALUES (NULL, 'quiz', NEW.id, 'insert', CURRENT_TIMESTAMP(), USER());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_update_quiz_aud` AFTER UPDATE ON `quizzes` FOR EACH ROW BEGIN
	INSERT INTO audits (id_log, entity, entity_id, reg_action, action_dt, action_by)
    VALUES (NULL, 'quiz', NEW.id, 'update', CURRENT_TIMESTAMP(), USER());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_delete_quiz_aud` BEFORE DELETE ON `quizzes` FOR EACH ROW BEGIN
	INSERT INTO audits (id_log, entity, entity_id, reg_action, action_dt, action_by)
    VALUES (NULL, 'quiz', OLD.id, 'delete', CURRENT_TIMESTAMP(), USER());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `quizzes_answers_options`
--

DROP TABLE IF EXISTS `quizzes_answers_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quizzes_answers_options` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question_id` int NOT NULL,
  `option_answer` varchar(300) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `quizzes_answers_options_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `quizzes_questions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quizzes_answers_options`
--

LOCK TABLES `quizzes_answers_options` WRITE;
/*!40000 ALTER TABLE `quizzes_answers_options` DISABLE KEYS */;
INSERT INTO `quizzes_answers_options` VALUES (4,29,'Opción 1'),(5,29,'Opción 2'),(6,29,'Opción 3'),(7,29,'Opción 4'),(8,30,'Opción 1'),(9,30,'Opción 2'),(10,30,'Opción 3'),(11,30,'Opción 4');
/*!40000 ALTER TABLE `quizzes_answers_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quizzes_questions`
--

DROP TABLE IF EXISTS `quizzes_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quizzes_questions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quiz_id` int NOT NULL,
  `question` varchar(300) NOT NULL,
  `question_type` enum('true_false','multiple_choice','text') DEFAULT 'text',
  `correct_answer` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quiz_id` (`quiz_id`),
  CONSTRAINT `quizzes_questions_ibfk_1` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quizzes_questions`
--

LOCK TABLES `quizzes_questions` WRITE;
/*!40000 ALTER TABLE `quizzes_questions` DISABLE KEYS */;
INSERT INTO `quizzes_questions` VALUES (1,1,'This is a question 1?','true_false','1'),(2,1,'This is a question 2?','true_false','2'),(3,1,'This is a question 3?','multiple_choice','3'),(4,1,'This is a question 4?','true_false','4'),(5,2,'This is a question 5?','multiple_choice','5'),(6,3,'This is a question 6?','text','6'),(7,2,'This is a question 7?','true_false','7'),(8,1,'This is a question 8?','true_false','8'),(9,3,'This is a question? 9','text','9'),(10,1,'This is a question? 10','true_false','10'),(29,1,'PRUEBA DE INCERCIÓN MULTIPLEOPCIÓN','multiple_choice','4'),(30,1,'PRUEBA DE INCERCIÓN MULTIPLEOPCIÓN','multiple_choice','8');
/*!40000 ALTER TABLE `quizzes_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_payments`
--

DROP TABLE IF EXISTS `student_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `amount` mediumint NOT NULL,
  `payment_type_id` int NOT NULL,
  `code` char(12) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `status` enum('rejected','paid') DEFAULT 'rejected',
  `concepts` varchar(300) NOT NULL,
  `observations` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`),
  KEY `payment_type_id` (`payment_type_id`),
  CONSTRAINT `student_payments_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  CONSTRAINT `student_payments_ibfk_2` FOREIGN KEY (`payment_type_id`) REFERENCES `payment_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_payments`
--

LOCK TABLES `student_payments` WRITE;
/*!40000 ALTER TABLE `student_payments` DISABLE KEYS */;
INSERT INTO `student_payments` VALUES (1,1,102,2,'PAY986453123','2023-05-10 10:23:00','paid','Payment concepts',NULL),(2,2,60,2,'PAY986454123','2023-05-10 10:24:00','paid','Payment concepts',NULL),(3,3,97,4,'PAY986455123','2023-05-10 10:25:00','paid','Payment concepts',NULL),(4,4,79,3,'PAY986456123','2023-05-10 10:26:00','paid','Payment concepts',NULL);
/*!40000 ALTER TABLE `student_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_quiz`
--

DROP TABLE IF EXISTS `student_quiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_quiz` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `quiz_id` int NOT NULL,
  `score` tinyint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`),
  KEY `quiz_id` (`quiz_id`),
  CONSTRAINT `student_quiz_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  CONSTRAINT `student_quiz_ibfk_2` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_quiz`
--

LOCK TABLES `student_quiz` WRITE;
/*!40000 ALTER TABLE `student_quiz` DISABLE KEYS */;
INSERT INTO `student_quiz` VALUES (1,1,1,75),(2,2,2,90),(3,3,3,60),(4,1,4,50),(5,2,5,80),(6,2,1,97);
/*!40000 ALTER TABLE `student_quiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_quiz_responses`
--

DROP TABLE IF EXISTS `student_quiz_responses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_quiz_responses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_quiz_id` int NOT NULL,
  `quiz_question_id` int NOT NULL,
  `text_answer` varchar(300) DEFAULT NULL,
  `option_answer_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_quiz_id` (`student_quiz_id`),
  KEY `quiz_question_id` (`quiz_question_id`),
  CONSTRAINT `student_quiz_responses_ibfk_1` FOREIGN KEY (`student_quiz_id`) REFERENCES `student_quiz` (`id`),
  CONSTRAINT `student_quiz_responses_ibfk_2` FOREIGN KEY (`quiz_question_id`) REFERENCES `quizzes_questions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_quiz_responses`
--

LOCK TABLES `student_quiz_responses` WRITE;
/*!40000 ALTER TABLE `student_quiz_responses` DISABLE KEYS */;
INSERT INTO `student_quiz_responses` VALUES (1,1,2,'Response from the student 1',NULL),(2,2,1,NULL,1),(3,3,3,'Response from the student 3',NULL),(4,2,2,NULL,3),(5,2,3,NULL,2);
/*!40000 ALTER TABLE `student_quiz_responses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `birthdate` date DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `address` varchar(50) DEFAULT NULL,
  `cp` varchar(15) DEFAULT NULL,
  `country_code` varchar(3) NOT NULL,
  `country_subdivision_code` varchar(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `country_code` (`country_code`),
  KEY `country_subdivision_code` (`country_subdivision_code`),
  CONSTRAINT `students_ibfk_1` FOREIGN KEY (`country_code`) REFERENCES `countries` (`code`),
  CONSTRAINT `students_ibfk_2` FOREIGN KEY (`country_subdivision_code`) REFERENCES `countries_subdivisions` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'Josías','Genem','1994-05-20','josias@mail.com','Av. Siempre viva 123','5500','AR','M'),(2,'Jennifer','Allamano','1994-11-18','jennifer@mail.com','Av. Siempre viva 123','5500','AR','X'),(3,'Ezequiel','Genem','1997-11-05','ezequiel@mail.com','Av. Siempre viva 123','5500','AR','M'),(4,'Inés','Paredes','1961-04-20','ines@mail.com','Av. Siempre viva 123','5500','AR','C'),(5,'Omar','Genem','1994-10-25','omar@mail.com','Av. Siempre viva 123','5500','AR','T');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_insert_student_aud` AFTER INSERT ON `students` FOR EACH ROW BEGIN
	INSERT INTO audits (id_log, entity, entity_id, reg_action, action_dt, action_by)
    VALUES (NULL, 'student', NEW.id, 'insert', CURRENT_TIMESTAMP(), USER());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_update_student_aud` AFTER UPDATE ON `students` FOR EACH ROW BEGIN
	INSERT INTO audits (id_log, entity, entity_id, reg_action, action_dt, action_by)
    VALUES (NULL, 'student', NEW.id, 'update', CURRENT_TIMESTAMP(), USER());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_delete_student_aud` BEFORE DELETE ON `students` FOR EACH ROW BEGIN
	INSERT INTO audits (id_log, entity, entity_id, reg_action, action_dt, action_by)
    VALUES (NULL, 'student', OLD.id, 'delete', CURRENT_TIMESTAMP(), USER());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `students_by_countries`
--

DROP TABLE IF EXISTS `students_by_countries`;
/*!50001 DROP VIEW IF EXISTS `students_by_countries`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `students_by_countries` AS SELECT 
 1 AS `country`,
 1 AS `students`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `students_by_subject`
--

DROP TABLE IF EXISTS `students_by_subject`;
/*!50001 DROP VIEW IF EXISTS `students_by_subject`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `students_by_subject` AS SELECT 
 1 AS `subject`,
 1 AS `student`,
 1 AS `student_status`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `subject_students`
--

DROP TABLE IF EXISTS `subject_students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject_students` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subject_id` int NOT NULL,
  `student_id` int NOT NULL,
  `student_status` enum('registered','regular','paused','suspended','transferred') DEFAULT 'registered',
  PRIMARY KEY (`id`),
  KEY `subject_id` (`subject_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `subject_students_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`),
  CONSTRAINT `subject_students_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject_students`
--

LOCK TABLES `subject_students` WRITE;
/*!40000 ALTER TABLE `subject_students` DISABLE KEYS */;
INSERT INTO `subject_students` VALUES (1,1,1,NULL),(2,1,2,NULL),(3,1,3,NULL),(4,2,2,NULL),(5,2,3,NULL),(6,2,4,NULL),(7,3,3,NULL),(8,3,4,NULL),(9,3,5,NULL);
/*!40000 ALTER TABLE `subject_students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject_teachers`
--

DROP TABLE IF EXISTS `subject_teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject_teachers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subject_id` int NOT NULL,
  `teacher_id` int NOT NULL,
  `teacher_status` enum('designated','active','suspended','replaced') DEFAULT 'designated',
  PRIMARY KEY (`id`),
  UNIQUE KEY `subject_id_UNIQUE` (`subject_id`),
  KEY `teacher_id` (`teacher_id`),
  CONSTRAINT `subject_teachers_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`),
  CONSTRAINT `subject_teachers_ibfk_2` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject_teachers`
--

LOCK TABLES `subject_teachers` WRITE;
/*!40000 ALTER TABLE `subject_teachers` DISABLE KEYS */;
INSERT INTO `subject_teachers` VALUES (1,1,1,NULL),(6,2,4,NULL),(10,3,2,NULL);
/*!40000 ALTER TABLE `subject_teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject_tutors`
--

DROP TABLE IF EXISTS `subject_tutors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject_tutors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subject_id` int NOT NULL,
  `tutor_id` int NOT NULL,
  `tutor_status` enum('designated','active','suspended','replaced') DEFAULT 'designated',
  PRIMARY KEY (`id`),
  KEY `subject_id` (`subject_id`),
  KEY `tutor_id` (`tutor_id`),
  CONSTRAINT `subject_tutors_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`),
  CONSTRAINT `subject_tutors_ibfk_2` FOREIGN KEY (`tutor_id`) REFERENCES `tutors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject_tutors`
--

LOCK TABLES `subject_tutors` WRITE;
/*!40000 ALTER TABLE `subject_tutors` DISABLE KEYS */;
INSERT INTO `subject_tutors` VALUES (1,1,1,NULL),(2,1,2,NULL),(3,1,3,NULL),(4,2,2,NULL),(5,2,3,NULL),(6,2,1,NULL),(7,3,3,NULL),(8,3,2,NULL),(9,3,3,NULL);
/*!40000 ALTER TABLE `subject_tutors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subjects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `start_date_time` datetime DEFAULT NULL,
  `lessons_quantity` tinyint NOT NULL,
  `week_day_1` enum('monday','tuesday','wednesday','thursday','friday','saturday') DEFAULT NULL,
  `day_time_1` time DEFAULT NULL,
  `week_day_2` enum('monday','tuesday','wednesday','thursday','friday','saturday') DEFAULT NULL,
  `day_time_2` time DEFAULT NULL,
  `week_day_3` enum('monday','tuesday','wednesday','thursday','friday','saturday') DEFAULT NULL,
  `day_time_3` time DEFAULT NULL,
  `week_day_4` enum('monday','tuesday','wednesday','thursday','friday','saturday') DEFAULT NULL,
  `day_time_4` time DEFAULT NULL,
  `week_day_5` enum('monday','tuesday','wednesday','thursday','friday','saturday') DEFAULT NULL,
  `day_time_5` time DEFAULT NULL,
  `next_lesson_id` int DEFAULT NULL,
  `status` enum('planning','planned','in-course','finished') DEFAULT 'planning',
  `description` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES (1,'DML','2023-06-20 00:00:00',3,'monday','18:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,'finished','Subject description'),(2,'Javascript','2023-08-20 00:00:00',20,'monday','20:00:00','thursday','20:00:00',NULL,NULL,NULL,NULL,NULL,NULL,2,'planned','Subject description'),(3,'TypeScript','2024-01-20 00:00:00',15,'tuesday','21:00:00','thursday','21:00:00',NULL,NULL,NULL,NULL,NULL,NULL,2,'planning','Subject description');
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `subjects_by_courses`
--

DROP TABLE IF EXISTS `subjects_by_courses`;
/*!50001 DROP VIEW IF EXISTS `subjects_by_courses`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `subjects_by_courses` AS SELECT 
 1 AS `course`,
 1 AS `subject`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `teacher_by_subject`
--

DROP TABLE IF EXISTS `teacher_by_subject`;
/*!50001 DROP VIEW IF EXISTS `teacher_by_subject`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `teacher_by_subject` AS SELECT 
 1 AS `subject`,
 1 AS `teacher`,
 1 AS `teacher_status`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teachers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `birthdate` date DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `address` varchar(50) DEFAULT NULL,
  `cp` varchar(15) DEFAULT NULL,
  `country_code` varchar(3) NOT NULL,
  `country_subdivision_code` varchar(3) NOT NULL,
  `professions` varchar(50) DEFAULT NULL,
  `salary` mediumint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `country_code` (`country_code`),
  KEY `country_subdivision_code` (`country_subdivision_code`),
  CONSTRAINT `teachers_ibfk_1` FOREIGN KEY (`country_code`) REFERENCES `countries` (`code`),
  CONSTRAINT `teachers_ibfk_2` FOREIGN KEY (`country_subdivision_code`) REFERENCES `countries_subdivisions` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` VALUES (1,'Mariano','Peluffo','1994-05-20','mariano@mail.com','Av. Siempre viva 123','5500','AR','S','Developer',7000),(2,'Florencia','Peña','1994-11-18','florencia@mail.com','Av. Siempre viva 123','5500','AR','X','QA',6000),(3,'Jhonatan','Prato','1997-11-05','jhonatan@mail.com','Av. Siempre viva 123','5500','AR','M','Data Engineer',6500),(4,'Andrea','Taborda','1961-04-20','andrea@mail.com','Av. Siempre viva 123','5500','AR','C','SAP Consultor',5000),(5,'Zelenio','Cobre','1994-10-25','zelenio@mail.com','Av. Siempre viva 123','5500','AR','T','Product Manager',7500);
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_insert_teacher_aud` AFTER INSERT ON `teachers` FOR EACH ROW BEGIN
	INSERT INTO audits (id_log, entity, entity_id, reg_action, action_dt, action_by)
    VALUES (NULL, 'teacher', NEW.id, 'insert', CURRENT_TIMESTAMP(), USER());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_update_teacher_aud` AFTER UPDATE ON `teachers` FOR EACH ROW BEGIN
	INSERT INTO audits (id_log, entity, entity_id, reg_action, action_dt, action_by)
    VALUES (NULL, 'teacher', NEW.id, 'update', CURRENT_TIMESTAMP(), USER());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_delete_teacher_aud` BEFORE DELETE ON `teachers` FOR EACH ROW BEGIN
	INSERT INTO audits (id_log, entity, entity_id, reg_action, action_dt, action_by)
    VALUES (NULL, 'teacher', OLD.id, 'delete', CURRENT_TIMESTAMP(), USER());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `teachers_salary_payments`
--

DROP TABLE IF EXISTS `teachers_salary_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teachers_salary_payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `teacher_id` int NOT NULL,
  `amount` mediumint NOT NULL,
  `code` char(12) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `status` enum('sent') DEFAULT 'sent',
  `concepts` varchar(300) NOT NULL,
  `observations` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `teacher_id` (`teacher_id`),
  CONSTRAINT `teachers_salary_payments_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers_salary_payments`
--

LOCK TABLES `teachers_salary_payments` WRITE;
/*!40000 ALTER TABLE `teachers_salary_payments` DISABLE KEYS */;
INSERT INTO `teachers_salary_payments` VALUES (1,1,5000,'PAY186453123','2023-05-01 08:23:00','sent','Payment concepts',NULL),(2,2,4000,'PAY186454123','2023-05-01 08:24:00','sent','Payment concepts',NULL),(3,2,4500,'PAY186455123','2023-06-01 08:25:00','sent','Payment concepts',NULL),(4,1,4800,'PAY186456123','2023-06-01 08:26:00','sent','Payment concepts',NULL),(5,1,4000,'PAY186353123','2023-05-01 08:23:00','sent','Payment concepts',NULL),(6,2,3000,'PAY186254123','2023-05-01 08:24:00','sent','Payment concepts',NULL),(7,2,3500,'PAY186155123','2023-06-01 08:25:00','sent','Payment concepts',NULL),(8,1,4800,'PAY186056123','2023-06-01 08:26:00','sent','Payment concepts',NULL);
/*!40000 ALTER TABLE `teachers_salary_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tutors`
--

DROP TABLE IF EXISTS `tutors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tutors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `birthdate` date DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `address` varchar(50) DEFAULT NULL,
  `cp` varchar(15) DEFAULT NULL,
  `country_code` varchar(3) NOT NULL,
  `country_subdivision_code` varchar(3) NOT NULL,
  `professions` varchar(50) DEFAULT NULL,
  `salary` mediumint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `country_code` (`country_code`),
  KEY `country_subdivision_code` (`country_subdivision_code`),
  CONSTRAINT `tutors_ibfk_1` FOREIGN KEY (`country_code`) REFERENCES `countries` (`code`),
  CONSTRAINT `tutors_ibfk_2` FOREIGN KEY (`country_subdivision_code`) REFERENCES `countries_subdivisions` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tutors`
--

LOCK TABLES `tutors` WRITE;
/*!40000 ALTER TABLE `tutors` DISABLE KEYS */;
INSERT INTO `tutors` VALUES (1,'Javier','Milei','1994-05-20','javier@mail.com','Av. Siempre viva 123','5500','AR','S','Developer',5000),(2,'Patricia','Bulrrich','1994-11-18','patricia@mail.com','Av. Siempre viva 123','5500','AR','X','QA',4000),(3,'Juan','Schiaretti','1997-11-05','juan@mail.com','Av. Siempre viva 123','5500','AR','M','Data Engineer',4500),(4,'Myriam','Bregman','1961-04-20','myriam@mail.com','Av. Siempre viva 123','5500','AR','C','SAP Consultor',3000),(5,'Panqueque','Massa','1994-10-25','panqueque@mail.com','Av. Siempre viva 123','5500','AR','T','Product Manager',5500);
/*!40000 ALTER TABLE `tutors` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_insert_tutor_aud` AFTER INSERT ON `tutors` FOR EACH ROW BEGIN
	INSERT INTO audits (id_log, entity, entity_id, reg_action, action_dt, action_by)
    VALUES (NULL, 'tutor', NEW.id, 'insert', CURRENT_TIMESTAMP(), USER());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_update_tutor_aud` AFTER UPDATE ON `tutors` FOR EACH ROW BEGIN
	INSERT INTO audits (id_log, entity, entity_id, reg_action, action_dt, action_by)
    VALUES (NULL, 'tutor', NEW.id, 'update', CURRENT_TIMESTAMP(), USER());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_delete_tutor_aud` BEFORE DELETE ON `tutors` FOR EACH ROW BEGIN
	INSERT INTO audits (id_log, entity, entity_id, reg_action, action_dt, action_by)
    VALUES (NULL, 'tutor', OLD.id, 'delete', CURRENT_TIMESTAMP(), USER());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `tutors_by_subject`
--

DROP TABLE IF EXISTS `tutors_by_subject`;
/*!50001 DROP VIEW IF EXISTS `tutors_by_subject`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `tutors_by_subject` AS SELECT 
 1 AS `subject`,
 1 AS `tutor`,
 1 AS `tutor_status`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `tutors_salary_payments`
--

DROP TABLE IF EXISTS `tutors_salary_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tutors_salary_payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tutor_id` int NOT NULL,
  `amount` mediumint NOT NULL,
  `code` char(12) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `status` enum('sent') DEFAULT 'sent',
  `concepts` varchar(300) NOT NULL,
  `observations` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tutor_id` (`tutor_id`),
  CONSTRAINT `tutors_salary_payments_ibfk_1` FOREIGN KEY (`tutor_id`) REFERENCES `tutors` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tutors_salary_payments`
--

LOCK TABLES `tutors_salary_payments` WRITE;
/*!40000 ALTER TABLE `tutors_salary_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `tutors_salary_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'virtual_classroom'
--

--
-- Dumping routines for database 'virtual_classroom'
--
/*!50003 DROP FUNCTION IF EXISTS `is_correct_answer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `is_correct_answer`(correct_answer_id INT, student_answer_id INT) RETURNS char(1) CHARSET utf8mb4
    NO SQL
    DETERMINISTIC
BEGIN
	DECLARE result CHAR(1);
	
    IF correct_answer_id = NULL THEN
		SET result = NULL;
    ELSEIF correct_answer_id = student_answer_id THEN
		SET result = 'Y';
	ELSE
		SET result = 'N';
	END IF;
    RETURN result;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `quiz_media` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `quiz_media`(quiz_id INT) RETURNS float
    DETERMINISTIC
BEGIN
	DECLARE sum BIGINT;
    DECLARE qty INT;
    DECLARE media FLOAT;
    
    SET sum = (SELECT SUM(score) FROM student_quiz q WHERE quiz_id = q.quiz_id);
	SET qty = (SELECT COUNT(score) FROM student_quiz q WHERE quiz_id = q.quiz_id);
    SET media = sum / qty;
    
	RETURN media;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `quiz_question_insertion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `quiz_question_insertion`(
	IN quiz_id INT,
    IN question_type ENUM('true_false', 'multiple_choice', 'text'),
    IN question_text VARCHAR(300),
    IN correct_answer_text VARCHAR(300),
    IN option_answer_1 VARCHAR(300),
    IN option_answer_2 VARCHAR(300),
    IN option_answer_3 VARCHAR(300),
    
    OUT question_id INT
)
BEGIN
	INSERT INTO quizzes_questions VALUE(NULL, quiz_id, question_text, question_type, NULL);
    SET @question_id = (SELECT LAST_INSERT_ID());
    IF question_type = 'true_false' OR question_type = 'multiple_choice' THEN
		INSERT INTO quizzes_answers_options VALUE(NULL, @question_id, correct_answer_text);
        SET @correct_answer_id = (SELECT LAST_INSERT_ID());
        UPDATE quizzes_questions SET correct_answer = @correct_answer_id WHERE id = @question_id;
        
        IF option_answer_1 IS NOT NULL THEN
			INSERT INTO quizzes_answers_options VALUE(NULL, @question_id, option_answer_1);
        END IF;
        IF option_answer_2 IS NOT NULL THEN
			INSERT INTO quizzes_answers_options VALUE(NULL, @question_id, option_answer_2);
        END IF;
        IF option_answer_3 IS NOT NULL THEN
			INSERT INTO quizzes_answers_options VALUE(NULL, @question_id, option_answer_3);
        END IF;
    END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `student_quiz_answers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `student_quiz_answers`(
	IN student_quiz_id INT,
    IN sort_field VARCHAR(30),
    IN sort_order CHAR(3),
    # OUT student_quiz_id INT,
    OUT question_id INT,
    OUT question_type VARCHAR(300),
    OUT question_text VARCHAR(300),
    OUT student_option_answer_id VARCHAR(300),
    OUT student_text_answer VARCHAR(300),
    OUT is_correct BOOLEAN
)
BEGIN
    IF sort_order = 'DES' THEN
		SET @sql_order = CONCAT('ORDER BY ', sort_field, ' DESC');
	ELSE
		SET @sql_order = CONCAT('ORDER BY ', sort_field, ' ASC');
	END IF;
    
	SELECT
        # sqr.student_quiz_id,
        qq.id AS question_id,
        qq.question_type,
        qq.question AS question_text,
        sqr.option_answer_id,
        sqr.text_answer,
        is_correct_answer(qq.correct_answer, sqr.option_answer_id) AS is_correct
	FROM student_quiz_responses sqr
	JOIN quizzes_questions qq
	ON sqr.quiz_question_id = qq.id
	WHERE sqr.student_quiz_id = student_quiz_id
	ORDER BY question_id DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `students_by_countries`
--

/*!50001 DROP VIEW IF EXISTS `students_by_countries`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `students_by_countries` AS select `c`.`name` AS `country`,count(`s`.`id`) AS `students` from (`countries` `c` join `students` `s` on((`c`.`code` = `s`.`country_code`))) group by `c`.`name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `students_by_subject`
--

/*!50001 DROP VIEW IF EXISTS `students_by_subject`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `students_by_subject` AS select `s`.`name` AS `subject`,concat(`st`.`firstname`,' ',`st`.`lastname`) AS `student`,`ss`.`student_status` AS `student_status` from ((`subjects` `s` join `subject_students` `ss` on((`s`.`id` = `ss`.`subject_id`))) join `students` `st` on((`st`.`id` = `ss`.`student_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `subjects_by_courses`
--

/*!50001 DROP VIEW IF EXISTS `subjects_by_courses`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `subjects_by_courses` AS select `c`.`name` AS `course`,`s`.`name` AS `subject` from ((`courses` `c` join `course_subjects` `cs` on((`c`.`id` = `cs`.`course_id`))) join `subjects` `s` on((`cs`.`subject_id` = `s`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `teacher_by_subject`
--

/*!50001 DROP VIEW IF EXISTS `teacher_by_subject`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `teacher_by_subject` AS select `s`.`name` AS `subject`,concat(`t`.`firstname`,' ',`t`.`lastname`) AS `teacher`,`st`.`teacher_status` AS `teacher_status` from ((`subjects` `s` join `subject_teachers` `st` on((`s`.`id` = `st`.`subject_id`))) join `teachers` `t` on((`t`.`id` = `st`.`teacher_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `tutors_by_subject`
--

/*!50001 DROP VIEW IF EXISTS `tutors_by_subject`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `tutors_by_subject` AS select `s`.`name` AS `subject`,concat(`t`.`firstname`,' ',`t`.`lastname`) AS `tutor`,`st`.`tutor_status` AS `tutor_status` from ((`subjects` `s` join `subject_tutors` `st` on((`s`.`id` = `st`.`subject_id`))) join `tutors` `t` on((`t`.`id` = `st`.`tutor_id`))) */;
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

-- Dump completed on 2023-11-20 21:09:13
