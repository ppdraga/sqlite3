CREATE TABLE teachers (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  surname TEXT NOT NULL,
  email TEXT
);

CREATE TABLE courses (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL UNIQUE
);

CREATE TABLE streams (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  course_id INTEGER NOT NULL,
  number INTEGER NOT NULL UNIQUE,
  start_date TEXT NOT NULL,
  students_amount INTEGER DEFAULT 0,
  FOREIGN KEY (course_id) REFERENCES courses(id)
);

CREATE TABLE achievements (
  teacher_id INTEGER NOT NULL,
  stream_id INTEGER NOT NULL,
  grade REAL NOT NULL,
  PRIMARY KEY(teacher_id, stream_id),
  FOREIGN KEY (teacher_id) REFERENCES teachers(id),
  FOREIGN KEY (stream_id) REFERENCES streams(id)
);
