USE `essentialmode`;

INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_golda', 'Golda', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('golda', 'Golda')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('golda',0,'worker','Worker',24,'{}','{}'),
	('golda',1,'boss','Boss',40,'{}','{}'),
;

