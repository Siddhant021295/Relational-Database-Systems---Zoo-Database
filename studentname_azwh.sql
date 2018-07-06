/* Australia Zoo Wildlife Hospital Accession Database (c) by
<AUTHOR(S)>
Australia Zoo Wildlife Hospital Accession Database is licensed
under a
Creative Commons Attribution 4.0 International License.
You should have received a copy of the license along with this
work. If not, see <http://creativecommons.org/licenses/by/4.0/>.
*/

CREATE  TABLE 
1. CREATE TABLE Patient (
    	patientID varchar(10),
    	name varchar(30), 
    	breed varchar(30), NOT NULL,
    	picture mediumblob ,
	CONSTRAINT patientpk PRIMARY KEY (patientID) ,
	CONSTRAINT patientfk1 breed REFERENCES type_of_patient(Breed)
	
);

2. CREATE TABLE Type_of_patient(
	Breed varchar(30) ,
	Taxon varchar (50), NOT NULL,
	CONSTRAINT Type_of_patientpk PRIMARY KEY (Breed)
);
3. CREATE TABLE Identifier (
	patientID varchar(10),
	One_tag varchar(10),
	left_tag varchar(10),
	right_tag varchar(10),
	other_ids varchar(10),
	CONSTRAINT Identifierpk PRIMARY KEY (patientID)
);

4. CREATE TABLE Diagnosis (
	type varchar(30)
	first_name_vet varchar(30),
	last_name_vet varchar(30),
	phone_vet int(11),
	patientID varchar(10),
	CONSTRAINT diagnosispk (type ,first_name, last_name, phone_vet, patientID)
	CONSTRAINT diagnosisfk1 FOREIGN KEY ( first_name_vet ,last_name_vet, phone_vet) 
	REFERENCES vet (first_name,last_name,vet_mobile)
	CONSTRAINT diagnosisfk2 FOREIGN KEY(patientID) 
	REFERENCES patient (patientID)
);

5. CREATE TABLE Adimitted (
	patientID varchar(10),
	first_name varchar(30),
	last_name varchar(30),
	rescuer_Mobile int(11),
	accessionnumber int(5),
	location varchar(30),
	date DATE, NOT NULL
	time TIME, NOT NULL
	suburb varchar(30),
	jurisdiction varchar(30),
	CONSTRAINT adimittedpk PRIMARY KEY accessionnumber,
	CONSTRAINT adimittedfk1 FOREIGN KEY (patientID)
	REFERENCES Patient (patientID),
	CONSTRAINT adimittedfk2 FOREIGN KEY (first_name , last_name , rescuer_mobile) 
	REFERENCES Rescuer( first_name ,last_name ,rescuer_mobile)

);
6. CREATE TABLE Rescuer (
	first_name varchar(30),
	last_name varchar(30),
	rescuer_mobile int(11),
	CONSTRAINT rescuerpk PRIMARY KEY(first_name ,last_name , rescuer_mobile)
	ON DELETE CASCADE
);
7. CERATE TABLE DNA (
	patientID varchar(10),
	sample_taken_date TIMESTAMP, NOT NULL
	sample_entry_date TIMESTAMP, NOT NULL
	Result TEXT
	CONSTRAINT DNApk PRIMARY KEY( patientID, sample_taken_date, sample_entry_date)
	CONSTRAINT DNAfk1 FOREIGN KEY (patientID) REFERENCES Patient(patientID)

);

8. CREATE TABLE Treatment(
	patientID varchar(10),
	first_name varchar (30),
	last_name varchar (30),
	phone_vet varchar (11),
	CONSTRAINT treatmentpk PRIMARY KEY( first_name , last_name , phone_vet, patientID)
	CONSTRAINT treatmentfk1 FOREIGN KEY (patientID) REFERENCES Patient (patientID) 
	CONSTRAINT treatmentfk2 FOREIGN KEY ( first_name, last_name, phone_vet) REFERENCES vet (first_name,last_name,phone_vet)

);

9. CREATE TABLE Medicine (
	patientID varchar(10),
	first_name varchar(30),
	last_name varchar(30),
	phone_vet int (11),
	med_name varchar(30),
	start_date DATE,
	end_date DATE,
	CONSTRAINT medicinepk PRIMARY KEY( first_name , last_name , phone_vet, patientID ,med_name,start_date,end_date)
	CONSTRAINT medicinefk1 FORIEGN KEY ( first_name, last_name, phone_vet) REFERENCES vet (first_name,last_name,phone_vet)
	CONSTRAINT medicinefk2 FOREIGN KEY (patientID) REFERENCES Patient (patientID) 
	ON DELETE CASCADE
);

10. CREATE TABLE Vet(
	first_name varchar (30),
	last_name varchar (30),
	phone_vet int (11),
	CONSTRAINT vetpk PRIMARY KEY (first_name,last_name,phone_vet)
	ON DELETE CASCADE
);

11. CREATE TABLE Wildlife_carer(
	first_name varchar (30),
	last_name varchar (30),
	phone_carer int (11),
	permit_number int (12),
	CONSTRAINT wildlife_carerpk PRIMARY KEY (first_name, last_name, phone_carer)
	CONSTRAINT wildlife_carerfk1 FORIEGN KEY ( permit_number ) REFERENCES Wildlife_carer_group(permit_number)
	ON DELETE CASCADE
);

12. CREATE TABLE Wildlife_carer_group (
	permit_number varchar(12),
	valid_uptill DATE,
	name varchar(30),
	CONSTRAINT wildlife_carer_grouppk PRIMARY KEY (permit_number)
	ON DELETE CASCADE
);
13. CREATE TABLE Permit_type(
	permit_number varchar(12),
	type varchar(30),
	CONSTRAINT permit_typepk PRIMARY KEY (permit_number, type)
	ON DELETE CASCADE
);

14. CREATE TABLE AZWH (
	first_name varchar (30),
	last_name varchar(30),
	mobile int (11),
	type_of_person varchar(30),
	email varchar(50),
	salutation varchar(6),
	state varchar (30),
	Country varchar(30),
	postcode int (4),
	Street varchar (100),
	City varchar(30)
	CONSTRAINT azwhpk PRIMARY KEY (first_name, last_name, mobile)
	ON DELETE CASCADE
);
15. CREATE TABLE Other_contact(
	first_name varchar (30),
	last_name varchar(30),
	mobile int (11),
	other_contact (11),
	CONSTRAINT othercontactpk PRIMARY KEY (first_name, last_name, mobile)
	ON DELETE CASCADE
);
16. CREATE TABLE Care_for(
	first_name varchar (30),
	last_name varchar (30),
	phone_carer int (11),
	patientID varchar(10),
	CONSTRAINT care_forpk PRIMARY KEY (first_name, last_name, phone_carer,patientID ),
	CONSTRAINT care_forfk1 FOREIGN KEY (first_name, last_name, phone_carer) REFERENCES Wildlife_carer( first_name, last_name, phone_carer),
	CONSTRAINT care_forfk2 FOREIGN KEY (patientID) REFERENCES Patient (patientID) 
	ON DELETE CASCADE
);


INSERT STATMENT

1. if an animal is admitted and there is no identification on it.
	INSERT INTO Admitted ('p234567890',' siddhant','gupta','5658945213','45678','12-12-2018','place',' 12:12:12','place','under');
	INSERT INTO Patient ('p234567890','name','image',breed);
	INSERT INTO Rescuer ('siddhant','gupta','5658945213');
	 
2.if Diagnosis is there
	INSERT INTO Diagnosis ('reproduction' , 'proova' , 'verma' , '46546464464','p234567890');
	INSERT INTO vet ('siddharth' 'Jain' , '1234564779');
3.if given to carer 
	INSERT INTO Care_for( 'p234567890','himanshu','sahu','1234465488');
4. if carer is new entry in AZWH table
	INSERT INTO AZWH ('himanshu','sahu','1234465488','carer','someone@gamil.con','Melbourne','Marshall Islands','123 street' ,'1234','city');
5.if there are other comtacts
	INSERT INTO Other_contacts('himanshu', 'sahu', '1234465488', '1234567897');

QUERIES and PROCEDURE

1. SELECT p1.patientID , accessionnumber, name , breed from Patient as p1 INNER JOIN Type_of_patient as b1 INNER JOIN Treatment as t1 ON p1.patientID = b1.patientID = t1.patientID , care_for as c1 where p1.patientID NOT IN c1.patientID ;  


2.DELIMITER $$
	
	CREATE PROCEDURE 'Monthly report' (  )
	BEGIN
	
		SELECT COUNT(assessionnumber) 
		FROM Admitted as a1 
		WHERE date > DATE_FORMAT( CURRENT_DATE - INTERVAL 1 			MONTH ) 
		GROUPBY jurisdiction  
		UNION ALL
		SELECT count(assessionnumber) 
		FROM Admitted as a1 
		INNER JOIN Patient as p1 
		INNER JOIN Type_of_patient as b1
		ON p1.patientID=a1.patientID=b1.patientID
		WHERE  date > DATE_FORMAT( CURRENT_DATE - INTERVAL 1 			MONTH ) 
		UNION ALL 
		SELECT count(assessionnumber)
		FROM Admitted as a1 
		WHERE date > DATE_FORMAT(CURRENT_DATE - INTERVAL 1 YEAR 1 		MONTH) and date < DATE_FORMATE(CURRENT_DATE - INTERVAL 1 		YEAR);
	

	END


3.Select from Carer_group where permit_uptill < DATE(NOW())

INDEX STATEMENT

CREATE INDEX ACCESION_INDEX ON Admitted (accessionnumber DESC)
CREATE INDEX PATIENT_INDEX ON Patient (patientID DESC)

