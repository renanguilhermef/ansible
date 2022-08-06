DECLARE
    c int:=0;
BEGIN
    SELECT count(*) into c FROM user_tables where table_name = 'RANDOM_TABLE'; 
    
    IF c = 0 THEN

        EXECUTE IMMEDIATE 'CREATE TABLE random_table (id INT PRIMARY KEY NOT NULL,
                                random_number NUMBER,
                                random_char  VARCHAR2(100),
                                random_date DATE)';			  
    ELSE

        EXECUTE IMMEDIATE 'TRUNCATE TABLE random_table';

    END IF;
END;
/

INSERT /*+ APPEND */ INTO random_table
SELECT level AS id,
       TRUNC(DBMS_RANDOM.value(100,10000)) AS random_number,
       DBMS_RANDOM.string('L',TRUNC(DBMS_RANDOM.value(10,100))) AS random_char,
       TRUNC(SYSDATE + DBMS_RANDOM.value(0,366)) AS random_date
FROM   dual
CONNECT BY level <= 1000000;
COMMIT;

EXIT