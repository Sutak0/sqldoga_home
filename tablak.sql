CREATE TABLE tort(az INT(4) PRIMARY KEY,hajoaz INT(3),nev VARCHAR(50));

CREATE TABLE tulajdonos(az INT(5) PRIMARY KEY,nev VARCHAR(50),varos VARCHAR(50));

SELECT COUNT(*) AS "Nincs történeti név"
FROM hajo
WHERE nev IS NULL;
