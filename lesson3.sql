-- 1. Переименовать таблицу streams в training_groups.
ALTER TABLE streams RENAME TO training_groups;

-- 2. В таблице training_groups переименовать столбец даты начала обучения в started_at.
ALTER TABLE training_groups RENAME COLUMN start_date TO started_at;

-- 3. В таблице training_groups добавить столбец даты завершения обучения в finished_at.
ALTER TABLE training_groups ADD COLUMN finished_at TEXT;

-- 4. Привести данные в полное соответствие с данными в таблицах 

INSERT INTO teachers (id, name, surname, email)  VALUES 
    (1, 'Николай', 'Савельев', 'saveliev.n@mai.ru'),
    (2, 'Наталья', 'Петрова', 'petrova.n@yandex.ru'),
    (3, 'Елена', 'Малышева', 'malisheva.e@google.com');

INSERT INTO courses (id, name)  VALUES 
    (1, 'Базы данных'),
    (2, 'Основы Python'),
    (3, 'Linux. Рабочая станция');
    
ALTER TABLE training_groups RENAME TO streams;
ALTER TABLE streams RENAME COLUMN started_at TO start_date;

INSERT INTO streams (id, course_id, number, start_date, students_amount)  VALUES 
    (1, 3, 165, '18.08.2020', 34),
    (2, 2, 178, '02.10.2020', 37),
    (3, 1, 203, '12.11.2020', 35),
    (4, 1, 210, '03.12.2020', 41);


ALTER TABLE achievements RENAME TO academic_performance;
ALTER TABLE academic_performance RENAME COLUMN grade TO performance;

INSERT INTO academic_performance (teacher_id, stream_id, performance)  VALUES 
    (3, 1, 4.7),
    (2, 2, 4.9),
    (1, 3, 4.8),
    (1, 4, 4.9);
    