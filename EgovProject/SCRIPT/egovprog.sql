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

-- 함수 egovprog.fnc_hierarchi 구조 내보내기
DROP FUNCTION IF EXISTS `fnc_hierarchi`;
DELIMITER //
CREATE FUNCTION `fnc_hierarchi`() RETURNS int(11)
    READS SQL DATA
BEGIN 



DECLARE v_id INT; 
DECLARE v_parent INT; 
DECLARE CONTINUE HANDLER FOR NOT FOUND SET @id = NULL; 

SET v_parent = @id; 
SET v_id = -1; 

IF @id IS NULL THEN 
RETURN NULL; 
END IF; 

LOOP 
SELECT MIN(id) 
INTO @id 
FROM menu 
WHERE p_id = v_parent 
AND id > v_id;

 IF (@id IS NOT NULL) OR (v_parent = @start_with) THEN 
 SET @level = @level + 1; 
RETURN @id; 
END IF; 

SET @level := @level - 1; 

SELECT id, p_id 
INTO v_id , v_parent 
FROM menu 
WHERE id = v_parent; 

END LOOP; 

END//
DELIMITER ;

-- 테이블 egovprog.menu 구조 내보내기
DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) DEFAULT NULL COMMENT '메뉴코드',
  `nm` varchar(100) DEFAULT NULL COMMENT '메뉴명',
  `p_id` int(11) DEFAULT NULL COMMENT '부모메뉴코드',
  `url` varchar(1000) DEFAULT NULL COMMENT '접근url',
  `depth` int(1) DEFAULT NULL COMMENT '메뉴레벨',
  `type` varchar(10) DEFAULT NULL COMMENT '메뉴타입'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 테이블 데이터 egovprog.menu:~12 rows (대략적) 내보내기
INSERT INTO `menu` (`id`, `nm`, `p_id`, `url`, `depth`, `type`) VALUES
	(1, 'EgovProject', 0, NULL, 0, NULL),
	(2, 'EgovFramework', 1, NULL, 1, NULL),
	(3, 'Language', 1, NULL, 1, NULL),
	(4, 'Java', 3, 'test1.do', 2, 'content'),
	(5, 'Jquery', 3, 'test2.do', 2, 'board'),
	(6, 'Server', 1, NULL, 1, NULL),
	(7, 'Linux', 6, 'test3.do', 2, 'program'),
	(8, 'Office', 1, NULL, 1, NULL),
	(9, 'test', 6, 'xxx', 2, 'content'),
	(10, 'New node', 8, 'ddd', 2, 'program'),
	(11, 'New node', 3, 'aaa', 2, 'board'),
	(12, '???', 2, '', 2, 'board');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
