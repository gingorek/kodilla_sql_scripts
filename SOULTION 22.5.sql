SHOW PROCESSLIST;

USE KODILLA_COURSE;

INSERT INTO STATS (VALUE) 
	SELECT COUNT(*) AS HOW_MANY
	FROM BESTSELLERS_COUNT;

DELIMITER $$

CREATE EVENT UPDATE_STATS
ON SCHEDULE EVERY 15 second
DO 	
BEGIN

    INSERT INTO STATS (STAT_DATE, STAT,VALUE) 
	VALUES (curdate(),"BESTSELLERS", (SELECT HOW_MANY FROM  BESTSELLERS_COUNT));
    
    CALL UpdateBestSellers();
    
END $$

DELIMITER ;
COMMIT;

SELECT * FROM STATS;