
-- 1.  DESCRIBE

-- +----------------+-------------+------+-----+---------+-------+
-- | Field          | Type        | Null | Key | Default | Extra |
-- +----------------+-------------+------+-----+---------+-------+
-- | course_num     | varchar(45) | NO   | PRI | NULL    |       |
-- | course_name    | varchar(45) | YES  |     | NULL    |       |
-- | professor_name | varchar(45) | YES  |     | NULL    |       |
-- | office_hours   | varchar(45) | YES  |     | NULL    |       |
-- | meet_day       | varchar(45) | YES  |     | NULL    |       |
-- | meet_time      | varchar(45) | YES  |     | NULL    |       |
-- | description    | varchar(45) | YES  |     | NULL    |       |
-- | pre_req        | varchar(45) | YES  |     | NULL    |       |
-- | semester       | varchar(45) | NO   | PRI | NULL    |       |
-- +----------------+-------------+------+-----+---------+-------+


-- 2.   select * from courses limit 5;

+------------------+-------------------+------------------+--------------+----------+-------------+-----------------------------------------------+-----------------------------------------------+------------+
| course_num       | course_name       | professor_name   | office_hours | meet_day | meet_time   | description                                   | pre_req                                       | semester   |
+------------------+-------------------+------------------+--------------+----------+-------------+-----------------------------------------------+-----------------------------------------------+------------+
| CSCI-GA.1133-001 | PAC I*            | Evan Korth       | 1            | T        | 6:30-9:00PM | An accelerated introduction to the fundamenta | NULL                                          | Fall2020   |
| CSCI-GA.1133-002 | PAC I Recitation  | Nolan Filte      | 0            | W        | 6:10-7:00PM | An accelerated introduction to the fundamenta | NULL                                          | Fall2020   |
| CSCI-GA.1133-003 | PAC I Recitation  | NUL              | 0            | -        | NULL        | An accelerated introduction to the fundamenta | NULL                                          | Fall2020   |
| CSCI-GA.1144-001 | PAC II*           | Mohamed Zahran   | 1            | T        |             | This course builds directly on the foundation | Prerequisites: CSCI-GA 1133 or departmental p | Spring2020 |
| CSCI-GA.1144-002 | PAC II Recitation | Rutviben Malaviy | 0            | R        |             | This course builds directly on the foundation | Prerequisites: CSCI-GA 1133 or departmental p | Spring2020 |
+------------------+-------------------+------------------+--------------+----------+-------------+-----------------------------------------------+-----------------------------------------------+------------+





-- 3. show session 001 courses
select * from courses where course_num LIKE '%001' LIMIT 5;

+------------------+---------------------------------------------+----------------+--------------+----------+-------------+-----------------------------------------------+-----------------------------------------------+------------+
| course_num       | course_name                                 | professor_name | office_hours | meet_day | meet_time   | description                                   | pre_req                                       | semester   |
+------------------+---------------------------------------------+----------------+--------------+----------+-------------+-----------------------------------------------+-----------------------------------------------+------------+
| CSCI-GA.1133-001 | PAC I*                                      | Evan Korth     | 1            | T        | 6:30-9:00PM | An accelerated introduction to the fundamenta | NULL                                          | Fall2020   |
| CSCI-GA.1144-001 | PAC II*                                     | Mohamed Zahran | 1            | T        |             | This course builds directly on the foundation | Prerequisites: CSCI-GA 1133 or departmental p | Spring2020 |
| CSCI-GA.1170-001 | Fundamental Algorithms                      | Richard  Cole  | 1            | T        | 5:10-7:00PM | Reviews a number of important algorithms, wit | Prerequisites: At least one year of experienc | Fall2020   |
| CSCI-GA.1170-001 | Fundamental Algorithms                      | Chee Yap       | 1            | M        |             | Reviews a number of important algorithms, wit | Prerequisites: At least one year of experienc | Spring2020 |
| CSCI-GA.1180-001 | Mathematical Techniques For CS Applications | Ernest Davis   | 1            | M        | 5:10-7:00PM | An introduction to theory, computational tech | NULL                                          | Fall2020   |
+------------------+---------------------------------------------+----------------+--------------+----------+-------------+-----------------------------------------------+-----------------------------------------------+------------+


-- 4. courses with no office office_hours

select * from courses where office_hours = 0 LIMIT 5;

+------------------+-----------------------------------+-------------------+--------------+----------+-------------+-----------------------------------------------+-----------------------------------------------+------------+
| course_num       | course_name                       | professor_name    | office_hours | meet_day | meet_time   | description                                   | pre_req                                       | semester   |
+------------------+-----------------------------------+-------------------+--------------+----------+-------------+-----------------------------------------------+-----------------------------------------------+------------+
| CSCI-GA.1133-002 | PAC I Recitation                  | Nolan Filte       | 0            | W        | 6:10-7:00PM | An accelerated introduction to the fundamenta | NULL                                          | Fall2020   |
| CSCI-GA.1133-003 | PAC I Recitation                  | NUL               | 0            | -        | NULL        | An accelerated introduction to the fundamenta | NULL                                          | Fall2020   |
| CSCI-GA.1144-002 | PAC II Recitation                 | Rutviben Malaviy  | 0            | R        |             | This course builds directly on the foundation | Prerequisites: CSCI-GA 1133 or departmental p | Spring2020 |
| CSCI-GA.1170-002 | Fundamental Algorithms Recitation | Harish Karthikeya | 0            | R        | 5:10-6:00PM | Reviews a number of important algorithms, wit | Prerequisites: At least one year of experienc | Fall2020   |
| CSCI-GA.1170-002 | Fundamental Algorithms Recitation | Abhinav Tamaska   | 0            | W        |             | Reviews a number of important algorithms, wit | Prerequisites: At least one year of experienc | Spring2020 |
+------------------+-----------------------------------+-------------------+--------------+----------+-------------+-----------------------------------------------+-----------------------------------------------+------------+