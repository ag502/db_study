### 데이터 조회
SELECT * FROM marvel_characters.character;

### 조건
SELECT * FROM marvel_characters.`character`
    WHERE Year >= 1961;

SELECT * FROM marvel_characters.`character`
    WHERE Year BETWEEN 1980 AND 2001;

SELECT * FROM marvel_characters.`character`
    WHERE Year NOT BETWEEN 1980 AND 2001;

SELECT * FROM marvel_characters.`character`
    WHERE name LIKE '%PETER%';

SELECT * FROM marvel_characters.`character`
    WHERE name LIKE '%V_e%';

SELECT * FROM marvel_characters.`character`
    WHERE EYE = 'Blue Eyes' OR EYE = 'Brown Eyes';

SELECT * FROM marvel_characters.`character`
    WHERE EYE IN ('Blue Eyes', 'Brown Eyes');

### 정렬
SELECT name, ALIGN, Year FROM marvel_characters.`character`
    WHERE ALIGN = 'Bad Characters'
    ORDER BY Year, name;

### LIMIT
SELECT name, ALIGN, Year FROM marvel_characters.`character`
    WHERE ALIGN = 'Bad Characters'
    ORDER BY Year ASC, name DESC
    LIMIT 10;

SELECT name, ALIGN, Year FROM marvel_characters.`character`
    WHERE ALIGN = 'Bad Characters'
    ORDER BY Year ASC, name DESC
    LIMIT 3, 2;