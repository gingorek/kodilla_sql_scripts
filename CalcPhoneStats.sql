CREATE TABLE PHONESTATS (
	ID INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    RANGE_FROM INT(11),
    RANGE_TO INT(11),
    QUANTITY INT(11)
);

select * from phonesTATS ;

DELIMITER $$ 

CREATE PROCEDURE CalcPhoneStats()
BEGIN 
	DECLARE K INT DEFAULT 0;
    DECLARE QTY INT(11);
    DELETE FROM PHONESTATS;
    COMMIT;
    WHILE (K < 100000000) DO 
		SELECT COUNT(*)
        FROM PHONES
        WHERE PHONENUM BETWEEN K-99999 AND K
        INTO QTY;
        INSERT INTO PHONESTATS(RANGE_FROM, RANGE_TO, QUANTITY)
			VALUES (K - 99999, K , QTY);
		COMMIT;
        SET K = K + 100000;
	END WHILE;
END $$

DELIMITER ;

call CalcPhoneStats();