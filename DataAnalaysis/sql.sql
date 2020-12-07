# IFNULL, IF
SELECT IFNULL(name, '이름 없음') FROM acc_intakes.aac_intakes
ORDER BY name;

SELECT IF(name IS NULL, '이름 없음', name) FROM acc_intakes.aac_intakes
ORDER BY name;