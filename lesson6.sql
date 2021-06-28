-- 1. Показать информацию по потокам. 
--    В отчет вывести номер потока, название курса и дату начала занятий.

SELECT 
    streams."number" AS "stream number", 
    courses.name AS course, 
    streams.start_date 
FROM 
    streams 
LEFT JOIN 
    courses ON streams.course_id = courses.id;

   
-- 2. Найти общее количество учеников для каждого курса. 
--    В отчет вывести название курса и количество учеников по всем потокам курса.  

SELECT 
    courses.name AS course,
    SUM(streams.students_amount) AS total_students 
FROM 
    streams
LEFT JOIN 
    courses ON streams.course_id = courses.id
GROUP BY
    streams.course_id ;
   


-- 3. Найти среднюю оценку по всем потокам для всех учителей. 
--    В отчет вывести идентификатор, фамилию и имя учителя, среднюю оценку по всем проведенным потокам. 
--    Учителя, у которых не было потоков, также должны попасть в выборку.

SELECT 
    t.id, 
    t.name, 
    t.surname, 
    AVG(ap.performance) 
FROM 
    teachers AS t 
LEFT JOIN 
    academic_performance AS ap ON t.id = ap.teacher_id 
GROUP BY 
    t.id;
   
