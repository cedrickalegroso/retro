

INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_thelost', 'thelost', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_thelost', 'thelost', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_thelost', 'thelost', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('thelost', 'thelost')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('thelost',0,'recruit','Recruit',20,'{}','{}'),
	('thelost',1,'officer','Soldiers',40,'{}','{}'),
	('thelost',2,'sergeant','Capo',60,'{}','{}'),
	('thelost',3,'lieutenant','Asst. Boss',85,'{}','{}'),
	('thelost',4,'boss','Boss',100,'{}','{}')
;
