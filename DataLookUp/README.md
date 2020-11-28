# 데이터 조회

1.Primary Key(기본키)
---
* 정의
    > 하나의 row를 식별할 수 있게하는 column.
* 특징
    > 중복값이나, NULL값을 가질 수 없음. <br/>
    항상 존재할 필요는 없으나, 존재하는 것이 바람직.
* 종류
    1. Natural Key(자연키)
        > 개체가 소유하고 있는 특성(column)이 Primary Key가 될때.
    2. Surrogate Key(대체키)
        > 개체가 소유하고 있지 않은 특성이 아닌 새로 추가한 column이 Primary Key가 될때.

2.SELECT
---
* sql<br/>
```mysql
SELECT [column1, column2....] FROM DATABASE.TABLE_NAME;
```

3.WHERE
---
* sql<br/>
```mysql
SELECT [column1, colum2, ...] FROM DATABASE.TABLE_NAME;
    WHERE 조건
```

* \>=, <=, =, (!=, <>), BETWEEN
```mysql
SELECT * FROM marvel_characters.character
    WHERE ALIGN = 'Good Characters';
```
```mysql
SELECT * FROM marvel_characters.character
    WHERE Year BETWEEN 1960 AND 2001;
```

* LIKE, %, _
    * %
    > 길이가 0 이상인 임의의 문자열
    ```mysql
  # Peter라는 문자열 양옆으로 길이가 0 이상인 임의의 문자열 올 수 있음
    SELECT * FROM marvel_characters.character
       WHERE NAME LIKE '%Peter%';
    ```
    * _
    > 길이가 1인 문자열
    ```mysql
  # V와 E 사이의 임의의 한 글자를 가지고 있는 이름
    SELECT * FROM marvel_characters.character
       WHERE NAME LIKE 'V_E';
    ```
  
4.IN
---
> OR와 같은 개념으로 괄호 안의 값중 하나라도 만족할시 조회.
* sql
```mysql
# EYE가 Blue Eyes 이거나 Brown Eyes인 rows
SELECT * FROM marvel_characters.character
    WHERE EYE IN ('Blue Eyes', 'Brown Eyes');
```

5.ORDER BY
---
> ASC(오름차순), DESC(내림차순) 으로 행들을 정렬.
* sql
```mysql
SELECT * FROM marvel_character.character
    WHERE ALIGN = 'Bad Character'
    ORDER BY Year ASC, name DESC;
```

6.LIMIT
---
> 조회된 데이터의 최대 갯수를 제한. <br/>
> LIMIT integer > integer 만큼 조회 <br/>
> LIMIT integer1, integer2 > integer1 + 1번째 행부터 interger2개 만큼 조회
```mysql
SELECT * FROM marvel_character.character
    WHRER ALIGN = 'Bad Character'
    ORDER BY Year, name DECS
    LIMIT 10;
```

```mysql
SELECT name, ALIGN, Year FROM marvel_characters.`character`
    WHERE ALIGN = 'Bad Characters'
    ORDER BY Year ASC, name DESC
    LIMIT 3, 2;
```