
-- 1. Найти общее количество учеников для каждого курса. 
--    В отчет вывести название курса и количество учеников по всем потокам курса. 
--    Решить задание с применением оконных функций.

SELECT DISTINCT 
  courses.name AS course,
  SUM(streams.students_amount) OVER(PARTITION BY streams.course_id) AS students_total
  FROM 
    streams 
  LEFT JOIN courses 
    ON courses.id = streams.course_id;


-- 2. Найти среднюю оценку по всем потокам для всех учителей. 
--    В отчет вывести идентификатор, фамилию и имя учителя, среднюю оценку по всем проведенным потокам. 
--    Учителя, у которых не было потов, также должны попасть в выборку. 
--    Решить задание с применением оконных функций.

SELECT DISTINCT
  t.id, 
  t.name, 
  t.surname, 
  AVG(ap.performance) OVER(PARTITION BY t.id) AS avg_performance
  FROM 
    teachers t 
  LEFT JOIN 
    academic_performance ap 
      ON t.id = ap.teacher_id ;



-- 3. Построить индексы, необходимые для максимально быстрого выполнения данного запроса.
		--SELECT
		--  surname,
		--  name,
		--  number,
		--  performance
		--FROM academic_performance
		--  JOIN teachers 
		--    ON academic_performance.teacher_id = teachers.id
		--  JOIN streams
		--    ON academic_performance.stream_id = streams.id
		--WHERE number >= 200;

     CREATE INDEX academic_performance_teacher_id_idx ON academic_performance(teacher_id);
     CREATE INDEX academic_performance_stream_id_idx ON academic_performance(stream_id);
     CREATE INDEX streams_number_idx ON streams(number);

