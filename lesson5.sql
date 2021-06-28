
-- 1. Найти потоки, количество учеников в которых больше или равно 40. 
--    В отчёт вывести номер потока, название курса и количество учеников.

SELECT 
    number, 
    (SELECT name FROM courses WHERE id = course_id) AS course, 
    students_amount 
FROM streams WHERE students_amount  >= 40;


-- 2. Найти два потока с самыми низкими оценками за успеваемость. 
--    В отчёт вывести номер потока, название курса, фамилию и имя преподавателя (одним столбцом), оценку успеваемости.

SELECT 
    (SELECT number FROM streams WHERE id = stream_id) AS stream,
    (SELECT name FROM courses WHERE id = (SELECT course_id FROM streams WHERE id = stream_id)) AS course,
    (SELECT name || " " || surname FROM teachers WHERE id = teacher_id) AS teacher, 
    performance 
FROM academic_performance ap ORDER BY performance ASC LIMIT 2;


-- 3. Найти среднюю успеваемость всех потоков преподавателя Николая Савельева. 
--    В отчёт вывести идентификатор преподавателя и среднюю оценку по потокам.

SELECT 
    teacher_id,
    AVG(performance)
FROM academic_performance ap 
WHERE teacher_id in (SELECT id FROM teachers t WHERE name = "Николай" AND surname = "Савельев")
GROUP BY teacher_id ;


-- 4. Найти потоки преподавателя Натальи Петровой а также потоки, по которым успеваемость ниже 4.8. 
--    В отчёт вывести идентификатор потока, фамилию и имя преподавателя.

SELECT 
    stream_id,
    (SELECT name || " " || surname FROM teachers WHERE id = teacher_id) AS teacher
FROM academic_performance WHERE teacher_id in (SELECT id FROM teachers t WHERE name = "Наталья" AND surname = "Петрова")
UNION
SELECT 
    stream_id,
    (SELECT name || " " || surname FROM teachers WHERE id = teacher_id) AS teacher
FROM academic_performance WHERE performance < 4.8;

