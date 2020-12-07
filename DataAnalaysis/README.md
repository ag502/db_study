# 데이터 분석

1.집계, 산술 함수
---
* 집계함수
    > 해당하는 행들을 계산한 후 하나의 행으로 결과를 반환
    * COUNT(컬럼명)
    > NULL을 제외한 행들의 수를 반환<br/>
      NULL을 포함한 모든 행들의 수를 반환하고 싶으면 Count(*)
    * MAX, MIN, AVG, SUM, STD
    > 최대, 최소, 평균, 합계, 표준편차를 구한 결과를 반환(NULL 제외)

* 산술함수
    > 각각의 행에서 값을 계산후 결과를 반환
    * ABS, SQRT, CEIL, FLOOR, ROUND
    
2.IS NULL, IS NOT NULL
---
> NULL 값을 가지거나 가지지 않은 행들을 반환
```mysql
SELECT * FROM DATABASE.TABLE
WHERE column IS NULL;
```
```mysql
SELECT * FROM DATABASE.TABLE
WHERE column IS NOT NULL;
```                        

3.COALESCE
---
> NULL값을 다른 값으로 대체
```mysql
# height가 NULL일시 N/A로 값 대체
SELECT COLEASCE(height, 'N/A') FROM DATABASE.TABLE;
``` 
```mysql
# height NULL일 경우 weight / 10으로 대체,
# weight도 NULL일 경우 N/A로 대체
SELECT COALESCE(height, weight / 10, 'N/A') FROM DATABASE.TABLE;
```              

4.IFNULL, IF
---           
```mysql
SELECT name FROM acc_intakes.accintakes
ORDER BY name;
```
![image](https://user-images.githubusercontent.com/35404137/101333206-b0b9bd80-38b9-11eb-8761-284d6622cf00.png)

```mysql
SELECT IFNULL(name, '이름 없음') FROM acc_intakes.acc_intakes
ORDER BY name
```
![image](https://user-images.githubusercontent.com/35404137/101333334-d6df5d80-38b9-11eb-95a2-3e58cf69f88e.png)

```mysql
# IF(조건, 참 일시 반환 값, 거짓 일시 반환 값)
SELECT IF(name IS NULL, '이름 없음', name) FROM acc_intakes.acc_intakes
ORDER BY name
```
![image](https://user-images.githubusercontent.com/35404137/101333334-d6df5d80-38b9-11eb-95a2-3e58cf69f88e.png)

5.ALIAS
---
>컬럼의 이름을 지정. <br/>
>공백이 있다면 ''로 감싸 줘야 함.

```mysql
SELECT COALESCE(name, '이름 없음') AS 'NAME'
FROM acc_intakes.acc_intakes
ORDER BY NAME
```
![image](https://user-images.githubusercontent.com/35404137/101335654-d5fbfb00-38bc-11eb-8d88-556b413640ed.png)

6.CASE
---
> 조건에 따라 컬럼의 값 지정

```mysql
SELECT sex_upon_intake,
    CASE
        WHEN sex_upon_intake LIKE '%Sprayed%' OR
             sex_upon_intake LIKE '%Neutered%' THEN '중성화'
        WHEN sex_upon_intake LIKE '%Unknown%' THEN '모름'
        ELSE '중성화 하지 않음'
    END AS '중성화 여부'
FROM acc_intakes.aac_intakes
```

![image](https://user-images.githubusercontent.com/35404137/101337413-f927aa00-38be-11eb-8c34-8ba57dd81e16.png)

7.DISTINCT
---
> 중복되는 컬럼의 제거 후 조회

```mysql
SELECT DISTINCT(animal_type) FROM acc_intakes.acc_intakes
```
DISTINCT 사용 전 | DISTINCT 사용 후
:-------------------------:|:-------------------------:
![image](https://user-images.githubusercontent.com/35404137/101338197-01ccb000-38c0-11eb-982c-6da7c157273c.png)  | ![image](https://user-images.githubusercontent.com/35404137/101338045-c9c56d00-38bf-11eb-86ce-c861f8801acb.png)

8.문자열 관련 함수
---
> SUBSTRING(컬럼명, 시작위치, 갯수) <br/>
> LENGTH <br/>
> UPPER, LOWER <br/>
> LPAD, RPAD <br/>
> TRIM, LTRIM, RTIRM

* SUBSTRING
```mysql
# 시작 위치 부터 갯 수 만큼 trimming
SELECT SUBSTRING(name, 1, 3) FROM acc_intakes.acc_intakes
```
사용 전 | 사용 후
:---:|:---:
![image](https://user-images.githubusercontent.com/35404137/101339201-72280100-38c1-11eb-8025-0408ced0475c.png) | ![image](https://user-images.githubusercontent.com/35404137/101339060-3b51eb00-38c1-11eb-89d4-3f39a00b1a9d.png)

* LPAD, RPAD
> L(R)PAD(컬럼명, 총 문자열 길이, 채울 문자열)
```mysql
SELECT RPAD(name, 10, '0') FROM acc_intakes.acc_intakes
```
사용 전 | 사용 후
:---:|:---:
![image](https://user-images.githubusercontent.com/35404137/101339201-72280100-38c1-11eb-8025-0408ced0475c.png) | ![image](https://user-images.githubusercontent.com/35404137/101343172-f16c0380-38c6-11eb-9202-8f4570f43110.png)

9.GROUP BY
---
> 정한 기준으로 row들을 그룹화 <br/>
> 그룹화 한 컬럼명과 집계함수(COUNT, SUM, AVG, MAX, MIN...) 만 SELECT문 에 사용 가능. <br/>
> 집계함수 사용 시 그룹화 된 컬럼별로 실행.
```mysql
SELECT name, COUNT(*) AS 'NUM_OF_NAME' FROM acc_intakes.acc_intakes
GROUP BY name
ORDER BY name;
```
![image](https://user-images.githubusercontent.com/35404137/101366861-d14d3c00-38e8-11eb-84bd-c2d7da8f8e67.png)

> 여러 조건으로 그룹화 가능. <br/>

![image](https://user-images.githubusercontent.com/35404137/101367560-a1eaff00-38e9-11eb-919e-d17809c3802b.png)

* HAVING
    > GROUP화 한 컬럼의 조건 설정
    ```mysql
    SELECT name, animal_type FROM acc_intakes.acc_intakes
    GROUP BY name, animal_type
    HAVING animal_type <> 'Other'
    ORDER BY name;
    ```
  
  ![image](https://user-images.githubusercontent.com/35404137/101368329-5a18a780-38ea-11eb-8cd9-382da03b10e2.png)

* WITH ROLLUP
    > 큰 단위의 그룹으로 중간 총계를 구해줌. <br/>
    > 그룹화 한 컬럼 역순으로 그룹화를 풀어 총계 계산 <br/>
    ```mysql
    SELECT name, animal_type, intake_condition FROM acc_intakes.acc_intakes
    GROUP BY name, animal_type
    WITH ROLLUP
    ORDER BY name;
    ```
  ![image](https://user-images.githubusercontent.com/35404137/101369732-fd1df100-38eb-11eb-802e-52f4bd1bcd91.png)

* GROUPING
    > 총 합을 나타내기 위해 사용된 NULL인지 실제 NULL인지 구분 할 수 있음. <br/>
    > 총 합을 나타내는 경우: 1, 실제 NULL: 0
    
    ```mysql
    SELECT name, animal_type, intake_condition, COUNT(*),
    GROUPING(name), GROUPING(animal_type), GROUPING(intake_condition)
    FROM acc_intakes.acc_intakes
    WITH ROLLUP
    ORDER BY name;
    ```
  
    ![image](https://user-images.githubusercontent.com/35404137/101371249-deb8f500-38ed-11eb-9f03-707e53eb99ae.png)
