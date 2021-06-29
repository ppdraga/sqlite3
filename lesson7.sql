-- 1. Создать представление, которое выводит название курса, номер последнего потока, 
--    дату начала обучения и среднюю успеваемость курса по всем потокам.

CREATE VIEW courses_info AS SELECT
  courses.name AS course_name,
  MAX(streams.number) AS last_stream,
  streams.start_date,
  AVG(ap.performance)
  FROM streams
  LEFT JOIN academic_performance AS ap
      ON ap.stream_id = streams.id
  LEFT JOIN courses
      ON courses.id = streams.course_id
  GROUP BY courses.id;

--SELECT * FROM courses_info;


-- 2. Удалить из базы данных всю информацию, которая относится к преподавателю с идентификатором, равным 3.
--    Выполнить все необходимые действия в транзакции.

BEGIN TRANSACTION;
  DELETE FROM academic_performance WHERE teacher_id = 3;
  DELETE FROM teachers WHERE id = 3;
COMMIT;
 
 

-- 3. Создать триггер для таблицы academic_performance, который проверяет значение успеваемости 
--    на соответствие диапазону чисел между 0.1 и 5 включительно.

CREATE TRIGGER check_performance_value BEFORE INSERT ON academic_performance
BEGIN
	SELECT CASE 
	WHEN NEW.performance NOT BETWEEN 0.1 AND 5
	THEN RAISE(ABORT, "Wrong performance value format!")
	END;
END;
	
--INSERT INTO academic_performance (teacher_id, stream_id, performance)  VALUES 
--    (3, 1, 7);	
	
	
	
	
