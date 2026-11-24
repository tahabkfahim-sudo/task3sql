CREATE DATABASE CompanyDB;
GO

USE CompanyDB;
GO

CREATE SCHEMA Sales;
GO

CREATE SEQUENCE Sales.seq_employee_id
    AS INT
    START WITH 1
    INCREMENT BY 1;
GO

CREATE TABLE Sales.employees (
    employee_id INT NOT NULL 
        CONSTRAINT DF_employees_employee_id 
        DEFAULT (NEXT VALUE FOR Sales.seq_employee_id),
    first_name  VARCHAR(50)    NOT NULL,
    last_name   VARCHAR(50)    NOT NULL,
    salary      DECIMAL(10,2)  NULL,
    CONSTRAINT PK_employees PRIMARY KEY (employee_id)
);
GO

ALTER TABLE Sales.employees
ADD hire_date DATE NULL;
GO

insert into sales.employees (first_name, last_name, salary, hire_date) values ('Carlie', 'Habershaw', 76264.4, '2019/11/11');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Morganne', 'Haslehurst', 44906.2, '2021/04/30');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Cary', 'McLuckie', 27059.0, '2020/03/31');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Bee', 'Finding', 77285.1, '2015/11/11');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Rodger', 'Baysting', 38612.5, '2017/09/29');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Langsdon', 'Ruilton', 53872.5, '2015/01/30');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Vidovic', 'Girton', 78694.5, '2023/02/15');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Lacie', 'Eakins', 68465.7, '2020/07/18');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Ryon', 'Gullyes', 69535.1, '2023/04/27');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Randene', 'Leebetter', 36189.2, '2024/12/23');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Zulema', 'Le feuvre', 26798.2, '2020/07/15');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Christophe', 'Cansdall', 81432.5, '2015/11/19');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Isahella', 'Catherick', 58652.1, '2023/07/09');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Creigh', 'Perview', 60303.1, '2022/07/22');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Goran', 'Clinning', 36949.2, '2016/02/02');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Billy', 'Starkings', 26206.7, '2016/01/30');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Giulio', 'Cowles', 42613.8, '2020/09/29');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Harland', 'Wisedale', 55234.9, '2019/11/25');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Les', 'Brittle', 31975.0, '2017/06/19');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Drucy', 'Ianni', 64292.4, '2015/09/16');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Clerkclaude', 'Stollen', 84968.5, '2019/01/06');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Gwendolin', 'Di Maria', 75225.7, '2023/03/08');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Gussi', 'Vasiljevic', 70191.3, '2019/01/19');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Laney', 'Blakeley', 49320.2, '2021/05/17');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Brose', 'Skillett', 79215.0, '2017/08/11');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Boone', 'Kippax', 57382.1, '2023/05/10');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Hedy', 'Cressy', 30181.1, '2016/09/25');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Adey', 'Philippet', 72107.6, '2015/08/27');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Erda', 'Bhar', 88936.9, '2023/08/04');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Adolphus', 'Jachtym', 57533.0, '2017/08/24');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Sollie', 'Koppelmann', 44572.9, '2021/12/21');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Emile', 'Charon', 32807.6, '2015/02/05');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Dayna', 'Freshwater', 58104.1, '2015/10/23');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Arielle', 'Goodfield', 48684.3, '2019/06/19');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Torie', 'Janout', 36240.7, '2023/09/09');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Oates', 'Bernli', 47016.7, '2020/04/10');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Lucho', 'Fominov', 86977.3, '2024/04/06');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Sonny', 'Klesse', 69614.7, '2018/03/12');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Seline', 'Chown', 66705.3, '2019/09/10');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Naomi', 'Davenhall', 75233.3, '2018/06/15');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Yorgos', 'Fuzzard', 44865.1, '2019/05/20');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Dorice', 'Gamlen', 81127.6, '2016/08/26');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Nestor', 'Reddy', 66617.8, '2024/10/08');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Aarika', 'Chasle', 53930.1, '2018/04/18');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Ferdinande', 'Burgin', 85908.8, '2021/05/02');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Muffin', 'Battell', 62412.3, '2015/04/28');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Tracey', 'Reynault', 42026.8, '2023/06/18');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Gordy', 'Bestman', 79954.4, '2020/02/21');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Meryl', 'Najera', 61916.1, '2017/10/20');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Krispin', 'Yearby', 31385.1, '2023/03/02');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Noel', 'Deeny', 60921.2, '2015/10/10');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Stacee', 'Duiguid', 74549.5, '2021/09/14');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Faunie', 'Huzzey', 28071.3, '2021/12/06');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Liliane', 'Eyckelbeck', 51921.4, '2017/04/14');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Lionel', 'Boland', 73256.4, '2022/08/15');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Gradeigh', 'Hoffman', 74145.9, '2020/03/14');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Kylen', 'Warrilow', 29836.1, '2021/02/24');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Cari', 'Springett', 36525.6, '2019/08/20');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Basia', 'Sperski', 41934.6, '2020/09/22');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Paulita', 'McGeechan', 74538.3, '2015/11/27');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Clemens', 'De La Cote', 27165.4, '2020/09/04');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Regina', 'Devennie', 51300.0, '2019/03/06');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Town', 'Gohn', 80345.0, '2016/11/23');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Daisy', 'Lett', 81316.4, '2024/10/28');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Rip', 'Sweetman', 80549.4, '2017/04/07');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Brett', 'Mulligan', 25051.7, '2021/11/18');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Phaedra', 'Clewlow', 48717.0, '2020/11/13');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Fania', 'Loisi', 72133.6, '2020/12/31');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Othilie', 'Kelso', 56877.5, '2019/03/22');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Juditha', 'Hesbrook', 47204.9, '2021/10/10');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Catina', 'Ord', 81436.2, '2024/05/24');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Bink', 'Merle', 44187.1, '2024/02/15');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Lila', 'Barrat', 25243.1, '2018/07/03');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Hermine', 'Esel', 28005.5, '2021/11/03');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Irving', 'Von Helmholtz', 74233.0, '2015/12/14');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Julianne', 'Guilliland', 50482.3, '2024/06/13');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Zolly', 'Attle', 23167.6, '2024/06/15');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Sherye', 'Strickler', 84423.5, '2015/01/17');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Baldwin', 'Hacon', 53669.0, '2020/02/01');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Kimble', 'Hoggins', 37734.0, '2024/04/25');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Petunia', 'Dobey', 63669.4, '2018/11/24');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Seamus', 'Zemler', 31492.7, '2018/08/12');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Phillis', 'Brymham', 34501.5, '2017/03/17');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Rafaela', 'Kristiansen', 65856.8, '2017/08/09');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Liz', 'Prinn', 36464.6, '2015/09/06');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Robyn', 'Segges', 71424.3, '2021/09/08');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Devy', 'Latour', 55445.4, '2023/09/02');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Sharla', 'Shivell', 48537.7, '2015/05/20');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Eve', 'Digweed', 44906.8, '2023/03/08');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Ollie', 'Blakey', 68944.8, '2018/12/03');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Caria', 'Olliver', 86776.6, '2020/10/13');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Shena', 'Blase', 45382.7, '2021/02/06');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Nanni', 'Willgoose', 28366.4, '2019/08/23');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Filmer', 'Smallthwaite', 52263.6, '2018/10/16');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Gerladina', 'Glasser', 51434.0, '2020/07/30');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Darline', 'Ciccetti', 50954.3, '2016/03/15');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Del', 'Pusey', 34689.5, '2019/03/01');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Giulio', 'Abrahamsen', 37424.5, '2015/09/05');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Rhetta', 'Stansby', 72427.0, '2022/08/23');
insert into sales.employees (first_name, last_name, salary, hire_date) values ('Geoffry', 'Curragh', 61568.7, '2015/03/11');

SELECT * FROM Sales.employees;

