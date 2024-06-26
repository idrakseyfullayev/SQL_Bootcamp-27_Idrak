-------------------------------------------(1)------------------------------

--xepdb1 для подключения используем
--Если пишем first_name varchar(10) то оно будет хранить символы по его длине то есть если 6символов будет 6 байтов
--А char(10) если даже будем писать 1 символ размер будет соответствовать 10
-- nchar и nvarchar использут формат Unicode

--------------Типы данных для числовых переменных-------------------------------

-- integer-Целые числа без десятичных знаков.
-- float-Числа с плавающей точкой, которые могут представлять дробные значения.
-- decimal or numeric-Он представляет точные значения, где количество десятичных знаков (масштаб) фиксировано.
-- DATE -  используется для хранения только даты без временной информации.
-- TIMESTAMP используется для хранения даты и времени с разрешением до микросекунд.
-- DATETIME также используется для хранения даты и времени, но с меньшим разрешением, чем TIMESTAMP.
-- clob -2GB, blob- 4GB
-- слэш и звёздочка /* используется для комментирования абзаца в конце также пишем
-- каждую написанную строку или код должны завершить с точкой запятой;


select * from hr.employees; --звёздочка означает все столбцы то есть
select  employee_id, last_name, first_name, salary, hire_date from hr.employees; -- когда используем select все столбцы через запятую пишем, но кроме последней потом from пишем указываем датабазу 
select a.employee_id from hr.employees a; -- здесь сами псевдоним ставим перед столбцом чтобы различать когда дело идёт о нескольких таблиицах и тогда после таблицы также должны ставить

------------------------------------(2)-----------------------------------------------------------------


----DDL----

--CREATE: Создает новую таблицу, индекс или другой объект базы данных.

--DROP: Удаляет таблицу, индекс или другой объект базы данных.

--ALTER: Изменяет структуру существующего объекта базы данных, такого как таблицы или индекс.

--TRUNCATE: Удаляет все записи из таблицы, при этом сама структура таблицы остается нетронутой.

----DML----

--SELECT: Извлекает данные из таблицы базы данных. 

--INSERT: Вставляет новую запись в таблицу. 

--UPDATE: Обновляет существующие записи в таблице. 

--DELETE: Удаляет записи из таблицы, удовлетворяющие определенным условиям. 

----DCL----

--GRANT: Предоставляет права доступа к объектам базы данных другим пользователям. 

--REVOKE: Отменяет предоставленные ранее права доступа к объектам базы данных.

----TCL----

--COMMIT: Фиксирует транзакцию, сохраняя все изменения, выполненные с момента начала транзакции. 

--ROLLBACK: Откатывает транзакцию, отменяя все изменения, выполненные с момента начала транзакции. 

--SAVEPOINT: Создает точку сохранения в текущей транзакции, чтобы можно было выполнить откат только до этой точки. 

--SET TRANSACTION: Устанавливает параметры транзакции, такие как уровень изоляции транзакции. Пример использования:


-----------------------------------------(3)-------------------------------------------------------------------------
--DDL (Data Definition Language):DDL команды используются для определения структуры базы данных и её объектов, таких как таблицы, индексы и представления. 

--DML (Data Manipulation Language):DML команды предназначены для управления данными в базе данных. Они позволяют извлекать, вставлять, обновлять и удалять данные в таблицах. 

--DCL (Data Control Language):DCL команды используются для управления доступом к данным и защиты информации в базе данных. Они определяют права доступа пользователей к различным объектам базы данных. Примеры таких команд: GRANT, REVOKE.

--TCL (Transaction Control Language):TCL команды управляют транзакциями в базе данных. Транзакции используются для обеспечения целостности данных, позволяя выполнять группу операций как одно целое. 


------------------------------------------(4)-----------------------------------------------------------------------------------------------
--Транзакция в базе данных представляет собой логическую единицу работы, которая состоит из одной или нескольких операций базы данных. Эти операции должны быть выполнены либо полностью, либо не выполнены вовсе (атомарность), при этом гарантируется целостность данных, независимо от возникновения ошибок или сбоев.
/*Атомарность (Atomicity): Транзакция считается либо выполненной полностью, либо не выполненной вовсе. Не существует промежуточного состояния, где некоторые операции выполнены, а другие нет.

Согласованность (Consistency): Транзакция должна переводить базу данных из одного согласованного состояния в другое согласованное состояние. Если данные нарушают какие-либо ограничения целостности, транзакция должна быть отклонена.

Изолированность (Isolation): Изменения, внесенные одной транзакцией, должны быть изолированы от изменений, внесенных другими транзакциями, до момента фиксации. Это гарантирует, что результаты транзакции не будут видны другим транзакциям до завершения текущей.

Долговечность (Durability): После фиксации (commit) транзакции изменения, внесенные ею в базу данных, должны оставаться постоянными даже в случае сбоя системы или перезагрузки.*/


-------------------------------------------(5)-------------------------------------------------------------------------------------------------

select employee_id as "İşçinin nömrəsi", --as используется для того, чтобы переобразовать потом двойные кавычки пишем"
last_name as "İşçinin soyadı", -- после первого указания as мы также можем его не указать программа поймёт,ч то мы хотим переименовать
first_name as "İşçinin adı", 
salary İşçinin_maaşı, -- если имя одно слово можем не писать кавычки, но заглавными напишет
hire_date as "İşçinin işə qəbul tarixi"
from hr.employees;


-----------------------------------------------(6)----------------------------------------------------------------------------------
--одинарные кавычки испоьзуются для присваивания значения value
select  employee_id as "İşçinin nömrəsi",
last_name || ' ' || first_name as "İşçinin adı və soyadı", --Для объединения столбцов используем вот этот значок || Сначала объединяем пустотой, потом эту пустоту со 2-м столбцом
salary  İşcinin_maaşı,
hire_date as "İşçinin işə qəbul tarixi"
from hr.employees;


---------------------------------------------------(7)----------------------------------------------------------------------------
select  employee_id as "İşçinin nömrəsi",
last_name || ' ' || first_name as "İşçinin adı və soyadı", 
salary İşçinin_maaşı, salary * 1.3 as "Mükafat", --создание интерактивного столбца--
hire_date as "İşçinin işə qəbul tarixi"
from hr.employees;
--в какой последовательноси пишем столбцы в такой последовательности они выйдут


------------------------------------------------(8)-------------------------------------------------------------------------------------------
select  employee_id as "İşçinin nömrəsi",--структура сначала select, потом from после него уже мы проводим фильтрацию   
last_name || ' ' || first_name as "İşçinin adı və soyadı", 
salary İşçinin_maaşı, salary * 1.3 as "Mükafat", 
hire_date as "İşçinin işə qəbul tarixi",job_id
from hr.employees where salary < 5000 and job_id='SH_CLERK'; --После where указываем столбец потом условие --и ещё когда ищем какой столбец с заданными значениями, то =пишем и одинарные скобки
-- <,>,<>,>=,<=,BETWEEN, LIKE, IN
-- and и or используются для объединения двух условий
-- and оба условия выполняються должны 
-- or если одно условие верное, то выполнится, а если оба значения есть, то обои значения выполнятся
and
true and true = true
false and true = false
false and false = false 
true and false = false

or
true or true = true
false or true = true
true or false = true
false or false = false

---------------------------------------(9)------------------------------
select  employee_id as "İşçinin nömrəsi",
last_name || ' ' || first_name as "İşçinin adı və soyadı", 
salary İşçinin_maaşı, salary * 1.3 as "Mükafat", 
hire_date as "İşçinin işə qəbul tarixi",job_id
from hr.employees where salary < 5000 and job_id='SH_CLERK' or 
job_id='IT_PROG';

----------------------------------(10)---------------------------------------
select  employee_id as "İşçinin nömrəsi",
last_name || ' ' || first_name as "İşçinin adı və soyadı", 
salary İşçinin_maaşı, salary * 1.3 as "Mükafat", 
hire_date as "İşçinin işə qəbul tarixi",job_id
from hr.employees --если мы даже поменяли названия столбца оно в реалии не меняются. Это в основном в таблице 
where salary between 5000 and 10000; --between используется для показа диапазона и после него с and мы задаём условие


-----------------------------------------------(11)--------------------------------------------------------
SELECT * from hr.employees where department_id = 20 or department_id = 30 or department_id=40 or department_id=50; -- каждый раз столбец также указываем
Select * from hr.employees where department_id in (20,30,40,50);-- не больше 2000 символов внутрь помещается
Select * from hr.employees where first_name like '%nn%'; --like находит шаблоны после него кавычки нужно использовать 
/*Первый символ % соответствует любому количеству символов перед ‘nn’.
Второй символ % соответствует любому количеству символов после ‘nn’.*/
Select * from hr.employees where first_name like '%n_i%'; -- _ вот этот знак означает, что пропускаем букву
Select * from hr.employees where first_name not like '%n_i%'; --когда пишем not like кроме этих частей всё что есть приводит
Select * from hr.employees where COMMISSION_PCT is null; --для пустых ячеек используется is null
Select * from hr.employees where COMMISSION_PCT is not null;-- для непустых ячеек, только после is ставится not в остальных случаях ставится перед

----------------------------------------------(12)-----------------------------------------------------------

select  employee_id as "İşçinin nömrəsi",
last_name || ' ' || first_name as "İşçinin adı və soyadı", 
salary İşçinin_maaşı, salary * 1.3 as "Mükafat", 
hire_date as "İşçinin işə qəbul tarixi",job_id
from hr.employees --если мы даже поменяли названия столбца оно в реалии не меняются. Это в основном в таблице 
where salary between 5000 and 10000 order by salary desc; -- Здесь для сортировки используем order by о по умолчанию ascending, поэтому если хотим обратное пишем desc в конце

select  employee_id as "İşçinin nömrəsi",
last_name || ' ' || first_name as "İşçinin adı və soyadı", 
salary İşçinin_maaşı, salary * 1.3 as "Mükafat", 
hire_date as "İşçinin işə qəbul tarixi",job_id
from hr.employees --если мы даже поменяли названия столбца оно в реалии не меняются. Это в основном в таблице 
where salary between 5000 and 10000 order by salary, hire_date desc; --первый из них будет сортироваться по убыванию, а второй по возрасттанию и сначала сортирует всегда по первому столбцу


-----------------------------------------------------------------(13)--------------------------------------------------------------------------
select  employee_id as "İşçinin nömrəsi",
last_name || ' ' || first_name as "İşçinin adı və soyadı", 
salary İşçinin_maaşı, salary * 1.3 as "Mükafat", 
hire_date as "İşçinin işə qəbul tarixi",job_id
from hr.employees
where salary between 5000 and 10000 order by 3; --по индексу также мы можем сортировать нашу дату просто указывам номер строки кода, где находится наша строка
-- а также можем сортировать по неуказанному столбцу

-- сортировку мы также можем провести по переименованному столбцу, то есть новое имя столбца пишем 

---------------------------------------------------------------(14)---------------------------------------------------------------------------------------
select distinct first_name from hr.employees; -----distinct, unique для уникальных значений используется


----------------------------------------------------(15)-----------------------------------------------------------------------------
SELECT
    e.first_name AS employee,
    m.first_name AS manager
FROM
    employees e
INNER JOIN--INNER JOIN объединяет две таблицы "employees" в одну, используя условие соединения.
    employees m
ON --Это условие соединения, которое говорит базе данных, каким образом соединить строки из таблиц "employees e" и "employees m".
    m.employee_id = e.employee_id;
    
------------------------------------------------(16)------------------------------------------------------------------------------------
SELECT
    order_id,
    customer_id,
    status,
    order_date
FROM
    orders
WHERE
    order_date BETWEEN DATE '2016-12-01' AND DATE '2016-12-31' -- 
ORDER BY
    order_date;
