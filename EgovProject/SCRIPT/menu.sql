-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.6.7-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- 테이블 egovprog.menu 구조 내보내기
CREATE TABLE IF NOT EXISTS `menu` (
  `menu_cd` varchar(50) DEFAULT NULL,
  `menu_nm` varchar(100) DEFAULT NULL,
  `p_menu_cd` varchar(50) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `depth` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 테이블 데이터 egovprog.menu:~6 rows (대략적) 내보내기
INSERT INTO `menu` (`menu_cd`, `menu_nm`, `p_menu_cd`, `type`, `depth`) VALUES
	('M0001', 'EgovProject', NULL, NULL, 0),
	('M0002', 'EgovFramework', 'M0001', NULL, 1),
	('M0003', 'Language', 'M0001', NULL, 1),
	('M0004', 'Java', 'M0003', 'file', 2),
	('M0005', 'Jquery', 'M0003', 'file', 2),
	('M0006', 'Server', 'M0001', NULL, 1),
	('M0007', 'Linux', 'M0006', NULL, 2),
	('M0008', 'Office', 'M0001', NULL, 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
