# IFNULL, IF
SELECT IFNULL(name, '이름 없음') FROM acc_intakes.aac_intakes
ORDER BY name;

SELECT IF(name IS NULL, '이름 없음', name) FROM acc_intakes.aac_intakes
ORDER BY name;

# ALIAS
SELECT COALESCE(name, 'N/A') AS 'NAME' FROM acc_intakes.aac_intakes
ORDER BY NAME;

#CASE
SELECT sex_upon_intake,
    CASE
        WHEN sex_upon_intake LIKE '%Sprayed%' OR
             sex_upon_intake LIKE '%Neutered%' THEN '중성화'
        WHEN sex_upon_intake LIKE '%Unknown%' THEN '모름'
        ELSE '중성화 하지 않음'
    END AS '중성화 여부'
FROM acc_intakes.aac_intakes;

#DISTINCT
SELECT DISTINCT(animal_type) FROM acc_intakes.aac_intakes;

# 문자열 함수
SELECT SUBSTRING(name, 1, 3) FROM acc_intakes.aac_intakes;

SELECT RPAD(name, 10, '0') FROM acc_intakes.aac_intakes;

# GROUP BY
SELECT name, COUNT(*) AS 'NUM OF SAME NAME' FROM acc_intakes.aac_intakes
GROUP BY name
ORDER BY name;

SELECT name, animal_type, COUNT(*) FROM acc_intakes.aac_intakes
GROUP BY name, animal_type
ORDER BY name;

SELECT name, animal_type FROM acc_intakes.aac_intakes
GROUP BY name, animal_type
HAVING animal_type <> 'Other'
ORDER BY name;

SELECT name, animal_type, intake_condition, COUNT(*) AS NUM_OF_NAME FROM acc_intakes.aac_intakes
GROUP BY name, animal_type, intake_condition
WITH ROLLUP
ORDER BY name;

SELECT name, animal_type, intake_condition, COUNT(*), GROUPING(name), GROUPING(animal_type), GROUPING(intake_condition)
FROM acc_intakes.aac_intakes
GROUP BY name, animal_type, intake_condition
WITH ROLLUP
ORDER BY name;