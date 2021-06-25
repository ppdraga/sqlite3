

-- 1. Вывести для каждого потока номер, год, месяц и день начала потока. Каждое значение должно быть отображено в отдельном столбце.

SELECT 
    number, 
    SUBSTR(start_date, 7, 4) AS 'year',
    SUBSTR(start_date, 4, 2) AS 'month',
    SUBSTR(start_date, 1, 2) AS 'day'
FROM streams;


-- 2. Получить идентификатор и номер потока, который запланирован на самую позднюю дату.

SELECT id, number FROM streams ORDER BY SUBSTR(start_date, 7, 4) || SUBSTR(start_date, 4, 2) || SUBSTR(start_date, 1, 2) DESC LIMIT 1;


-- 3. Показать уникальные значения года дат начала потоков обучения

SELECT DISTINCT SUBSTR(start_date, 7, 4) FROM streams;


-- 4. Найти количество преподавателей в базе данных. Вывести искомое значение в столбец с именем total_teachers.

SELECT COUNT(*) AS total_teachers FROM teachers;


-- 5. Показать даты начала двух последних по времени потоков.

SELECT start_date FROM streams ORDER BY SUBSTR(start_date, 7, 4) || SUBSTR(start_date, 4, 2) || SUBSTR(start_date, 1, 2) DESC LIMIT 2;


-- 6. Найти среднюю успеваемости учеников по потоку преподавателя с идентификатором равным 1.

SELECT AVG(performance) FROM academic_performance WHERE teacher_id = 1;


-- 7. Найти идентификаторы преподавателей, у которых средняя успеваемость по всем потокам меньше чем 4.8.

SELECT teacher_id FROM academic_performance GROUP BY teacher_id HAVING AVG(performance) < 4.8;


