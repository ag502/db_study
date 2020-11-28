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