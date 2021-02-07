

INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_magtibay', 'magtibay', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_magtibay', 'magtibay', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_magtibay', 'magtibay', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('magtibay', 'Magtibay Family')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('magtibay',0,'recruit','Recruit',20,'{}','{}'),
	('magtibay',1,'officer','Soldiers',40,'{}','{}'),
	('magtibay',2,'sergeant','Capo',60,'{}','{}'),
	('magtibay',3,'lieutenant','Asst. Boss',85,'{}','{}'),
	('magtibay',4,'boss','Boss',100,'{}','{}')
;
