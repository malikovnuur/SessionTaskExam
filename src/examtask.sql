-- 1. Owner_лердин аттарынын арасынан эн коп символ камтыган owner_ди жана анын уйун(House) чыгар.

SELECT *,(SELECT * FROM houses WHERE owners.id=houses.id) FROM owners WHERE first_name=(SELECT max(first_name) FROM owners);

-- 2. Уйлордун баалары 1500, 2000 дин аралыгында бар болсо true чыгар, жок болсо false чыгар.
SELECT furniture FROM houses WHERE price BETWEEN 1500 AND 2000;

-- 3. id_лери 5, 6, 7, 8, 9, 10 го барабар болгон адресстерди жана ал адрессте кайсы уйлор бар экенин чыгар.
SELECT *,(SELECT * FROM houses WHERE address_id=addresses.id AND addresses.id IN (5,6,7,8,9,10)) FROM addresses WHERE id IN(5,6,7,8,9,10);

-- 4. Бардык уйлорду, уйдун ээсинин атын, клиенттин атын, агенттин атын чыгар.
SELECT (SELECT house_type FROM houses WHERE houses.id=rent_info.house_id),(SELECT first_name FROM owners WHERE owners.id=owner_id),(SELECT first_name FROM customers WHERE customers.id=customer_id),(SELECT name FROM agencies WHERE agencies.id=rent_info.agency_id) FROM rent_info;


-- 5. Клиенттердин 10-катарынан баштап 1999-жылдан кийин туулган 15 клиентти чыгар.
SELECT * FROM customers WHERE date_of_birth>DATE'1999-12-31' LIMIT 5 OFFSET 10;

-- 6. Рейтинги боюнча уйлорду сорттоп, уйлордун тайптарын, рейтингин жана уйдун ээлерин чыгар. (asc and desc)
SELECT house_type,rating,(SELECT first_name FROM owners WHERE id=owner_id) FROM houses ORDER BY rating;
SELECT house_type,rating,(SELECT first_name FROM owners WHERE id=owner_id) FROM houses ORDER BY rating DESC ;

-- 7. Уйлордун арасынан квартиралардын (apartment) санын жана алардын баасынын суммасын чыгар.
SELECT count(*),sum(price) FROM houses;

-- 8. Агентсволардын арасынан аты ‘My_House’ болгон агентсвоны, агентсвонын адресин жана анын бардык уйлорун, уйлордун адрессин чыгар.
SELECT *,(SELECT city FROM addresses WHERE agencies.id=addresses.id),(SELECT house_type FROM houses WHERE houses.id=agencies.address_id) FROM agencies WHERE name='My_House';

-- 9. Уйлордун арасынан мебели бар уйлорду, уйдун ээсин жана уйдун адрессин чыгар.

SELECT *,(SELECT first_name FROM owners WHERE houses.id=owners.id),address_id FROM houses WHERE furniture=TRUE;
-- 10.Кленти жок уйлордун баарын жана анын адрессин жана ал уйлор кайсыл агентсвога тийешелуу экенин чыгар.

SELECT (SELECT city FROM addresses WHERE addresses.id=(SELECT address_id FROM houses)),(SELECT house_type FROM houses WHERE houses.id=rent_info.house_id),(SELECT name FROM agencies WHERE agencies.id=address_id) FROM rent_info WHERE customer_id=NULL ;
-- 11.Клиенттердин улутуна карап, улутуну жана ал улуутта канча клиент жашайт санын чыгар.
SELECT nationality,count(*) FROM customers GROUP BY nationality;

-- 12.Уйлордун арасынан рейтингтери  чон, кичине, орточо болгон 3 уйду чыгар.
SELECT * FROM houses WHERE rating=(SELECT min(rating) FROM houses) OR rating=(SELECT max(rating) FROM houses) OR rating=(SELECT avg(rating) FROM houses);

-- 13.Уйлору жок киленттерди, клиенттери жок уйлорду чыгар.

SELECT * FROM customers FULL JOIN rent_info ri ON customers.id = ri.customer_id;
SELECT * FROM  houses WHERE id<>(SELECT house_id FROM rent_info);

-- 14.Уйлордун бааларынын орточо суммасын чыгар.
SELECT round(avg(price)) FROM houses;

-- 15.‘A’ тамга менен  башталган уйдун ээсинин аттарын, клиенттердин аттарын чыгар.

SELECT  * FROM  owners,customers WHERE first_name LIKE 'A%';

-- 16.Эн уйу коп owner_ди жана анын уйлорунун санын чыгар.

-- 17.Улуту Kyrgyzstan уй-булолу customer'лерди чыгарыныз.

-- 18.Эн коп болмолуу уйду жана анын адресин ал уй кайсыл owner'ге таандык ошону чыгарыныз.

-- 19.Бишкекте   жайгашкан уйлорду  жана  клиентерин  кошо чыгарыныз.

-- 20.Жендерине карап группировка кылыныз.

-- 21.Эн коп моонотко  ижарага алынган уйду чыгарыныз.

-- 22.Эн кымбат уйду жана анын ээсин чыгарыныз.
SELECT max(price)  FROM houses WHERE id=owner_id;

-- 23.Бир региондо жайгашкан баардык агентстволорду чыгарыныз

-- 24.Рейтинг боюнча эн популярдуу 5 уйду чыгар.

-- 25.Орто жаштагы owner_ди , анын уйун , уйдун адрессин чыгар.