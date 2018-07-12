SHOW PROCESSLIST;

USE KODILLA_COURSE;

DROP EVENT UPDATE_STATS;

INSERT INTO STATS (STAT_DATE, STAT,VALUE) 
	VALUES (curdate(),"BESTSELLERS", (SELECT count(*) FROM  BESTSELLERS_COUNT));

select * from bestsellers_count;
    
INSERT INTO STATS (VALUE)
	SELECT (COUNT(*))
	FROM BESTSELLERS_COUNT; 
    
DELETE FROM STATS WHERE STAT_ID = 5; 


CREATE EVENT UPDATE_STATS
ON SCHEDULE EVERY 15 second
DO 	
    INSERT INTO STATS (STAT) 
	VALUES ("BESTSELLERS");
 
COMMIT;


  INSERT INTO STATS(VALUE) 
	SELECT COUNT(*)
	FROM BESTSELLERS_COUNT;
    
        CALL UpdateBestSellers();

SELECT * FROM BOOKS;

SELECT * FROM STATS;

SELECT * FROM BESTSELLERS_COUNT;