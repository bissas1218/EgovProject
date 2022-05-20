-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.6.5-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win32
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

-- 테이블 egovprog.content 구조 내보내기
CREATE TABLE IF NOT EXISTS `content` (
  `id` int(11) DEFAULT NULL,
  `content` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 테이블 데이터 egovprog.content:~0 rows (대략적) 내보내기
INSERT INTO `content` (`id`, `content`) VALUES
	(4, '&lt;h2&gt;asadwasdㅇㅀㄴㄹㅇㅎㄴㄹㅇㅎㄴㄹㅇㅎ2222&lt;/h2&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;figure class=&quot;image&quot;&gt;&lt;img src=&quot;/images/upload/fcf9ddda-2b2c-4ddf-bbae-b310a13618ae.캡처.JPG&quot;&gt;&lt;/figure&gt;'),
	(9, '&lt;p&gt;fsdfsdf555&lt;/p&gt;'),
	(10, '&lt;figure class=&quot;image&quot;&gt;&lt;img src=&quot;/images/upload/33ed66c6-3083-42dc-8540-3ea8187d366a.캡처.JPG&quot;&gt;&lt;/figure&gt;');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
