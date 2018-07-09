drop table phones;
CREATE TABLE PHONES (
	PHONE_ID INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    PHONENUM INT(9),
    FIRSTNAME VARCHAR(50),
    LASTNAME VARCHAR(50)
);

select * from phones ;

DELIMITER $$ 

CREATE PROCEDURE FillTestData()
BEGIN 
	DECLARE K INT DEFAULT 0;
    WHILE (K < 100000) DO 
		INSERT INTO PHONES (PHONENUM, FIRSTNAME, LASTNAME)
        VALUES (ROUND(rand()*1000000000),
				CONCAT('Firstname number ' , K),
                CONCAT('Lastname number ', K));
		IF (MOD(K,5000) = 0) THEN
			COMMIT;
		END IF;
        SET K = K + 1;
	END WHILE;
    COMMIT;
END $$

DELIMITER ;

call FillTestData();