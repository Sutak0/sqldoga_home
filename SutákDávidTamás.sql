CREATE DATABASE hajolista CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
USE hajolista;

ALTER TABLE tort ADD CONSTRAINT fk_tort_hajoaz FOREIGN KEY (hajoaz) REFERENCES hajo(az);
ALTER TABLE hajo ADD CONSTRAINT fk_hajo_tulaz FOREIGN KEY (tulaz) REFERENCES tulajdonos(az);

DELETE FROM hajo WHERE az = 65;

UPDATE hajo SET tipus = 'vitorlás hajó' WHERE tipus = 'vitorlás';

SELECT nev FROM hajo WHERE uzemel = 1 AND nev LIKE '%Balaton%';

SELECT h.nev AS "Hajó neve", t.nev AS "Tulajdonos neve", taz.nev AS "Régi név"
FROM hajo h
JOIN tulajdonos t ON h.tulaz = t.az
LEFT JOIN tort taz ON h.az = taz.hajoaz
WHERE h.uzemel = 1 AND h.tipus = 'személyhajó'
ORDER BY h.nev;

SELECT t.nev AS "Tulajdonos", COUNT(h.az) AS "Hajók száma"
FROM tulajdonos t
JOIN hajo h ON t.az = h.tulaz
GROUP BY t.nev
HAVING COUNT(h.az) >= 5;

SELECT t.varos AS "Város", COUNT(h.az) AS "Még most is üzemelő hajók száma"
FROM tulajdonos t
JOIN hajo h ON t.az = h.tulzas
WHERE h.uzemel = 1
GROUP BY t.varos
ORDER BY COUNT(h.az) DESC
LIMIT 1;

SELECT AVG(ev) AS "Átlagos év"
FROM hajo
WHERE tipus = 'személyhajó';

SELECT COUNT(*) AS "Nincs történeti név"
FROM hajo
WHERE nev IS NULL;

