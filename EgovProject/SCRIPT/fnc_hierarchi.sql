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

-- 함수 egovprog.fnc_hierarchi 구조 내보내기
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

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
