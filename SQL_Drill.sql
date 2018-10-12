USE db_zoo2
GO
/*DRILL 1:
Compose a SELECT statement that queries for the following information
? All information from the habitat table.*/

SELECT * FROM tbl_habitat;

/*
DRILL 2:
Compose a SELECT statement that queries for the following information:
? Retrieve all names from the species_name column that have a species_order value of 3.*/

SELECT species_name 
FROM tbl_species
INNER JOIN tbl_order ON tbl_species.species_order = tbl_order.order_id 
WHERE species_order = 3
	
/*DRILL 3:
Compose a SELECT statement that queries for the following information:
? Retrieve only the nutrition_type from the nutrition table that have a nutrition_cost of 600.00 or less.*/

SELECT nutrition_type FROM tbl_nutrition
WHERE nutrition_cost <= 600.00

/*DRILL 4:
Compose a SELECT statement that queries for the following information:
? Retrieve all species_names with the nutrition_id between 2202 and 2206 from the nutrition table.*/

SELECT species_name, nutrition_id 
FROM tbl_species
INNER JOIN tbl_nutrition ON tbl_species.species_nutrition = tbl_nutrition.nutrition_id
WHERE nutrition_id < 2206 AND nutrition_id > 2202

/*DRILL 5:
Compose a SELECT statement that queries for the following information:
? Retrieve all names within the species_name column using the alias "Species Name:" 
from the species table and their corresponding nutrition_type under the alias "Nutrition Type:" 
from the nutrition table.*/

SELECT species_name AS 'Species Name:', nutrition_type AS 'Nutrition Type:'
 FROM tbl_species INNER JOIN tbl_nutrition ON tbl_species.species_nutrition = tbl_nutrition.nutrition_id

/*DRILL 6:
Compose a SELECT statement that queries for the following information:
? From the specialist table, retrieve the first and last name and contact 
number of those that provide care for the penguins from the species table.*/

SELECT specialist_fname, specialist_lname, specialist_contact
FROM tbl_specialist
INNER JOIN tbl_care ON tbl_specialist.specialist_id = tbl_care.care_specialist 
INNER JOIN tbl_species ON tbl_care.care_id = tbl_species.species_care
WHERE species_name = 'penguin'

/*DRILL 7:
Creating your own tables: Build a select statement that queries for the following information:

? Create a database with two tables. Assign a foreign key constraint on one table that shares 
related data with the primary key on the second table. Finally, create a statement that queries 
data from both tables.

If you need advice...How about a table with a first and last name column and a second table 
that has a phone number and address column?

When submitting DRILL 7 be sure to include the table creation code along with your INSERT 
statements and query.*/

CREATE DATABASE db_drill7
GO

USE db_drill7
GO

CREATE TABLE tbl_person (
	person_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	person_fname VARCHAR(25) NOT NULL,
	person_lname VARCHAR(25) NOT NULL
);

CREATE TABLE tbl_contact(
	contact_person INT NOT NULL CONSTRAINT fk_person_id FOREIGN KEY REFERENCES tbl_person(person_id) ON UPDATE CASCADE ON DELETE CASCADE,
	contact_phone VARCHAR(25) NOT NULL,
	contact_address VARCHAR(100) NOT NULL
);


SELECT * FROM tbl_contact;


INSERT INTO tbl_person
	(person_fname,person_lname)
	VALUES
	('John', 'Snow'),
	('Isaac', 'Asimov'),
	('David', 'Coperfield')
;


INSERT INTO tbl_contact
	(contact_person, contact_address, contact_phone)
	VALUES
	(1,'123 Maple Lane, Springfield NJ, 65239', '456-852-9563'),
	(2, '654 Main Street, Southpark CO, 84596', '953-455-6653'),
	(3, '85 Ocean Avenue, Brooklyn NY, 26359', '646-589-9632')
	;

SELECT person_fname, person_lname, contact_address
FROM tbl_person
INNER JOIN tbl_contact ON tbl_person.person_id = tbl_contact.contact_person
WHERE contact_address LIKE '%CO%'
