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

