/***************************************************************
* Date		Programmer		Description
* -----		----------		-----------
* 10/8/21	DBrockert		Initial implementation of media db.
* 10/14/21	DBrockert		Fixed typo on status table, changed CHAR(10) to NCHAR(60), started insert statements.
* 10/15/21	DBrockert		Added and ran insert statements. 
*
***************************************************************/

-- drop & create database

use master;
drop database if exists mediaInventoryDBrockert;
go

create database mediaInventoryDBrockert;
go

-- drop & create server login
if suser_id('mediaUserBrockert') is null
create login mediaUserBrockert with password = 'MSPress#1',
	default_database = mediaInventoryDBrockert;
go

use mediaInventoryDBrockert;
go

create user mediaUserBrockert;
go

alter role db_datareader add member mediaUserBrockert;
go

--create tables 
create table media_type
(media_type_id				INT				NOT NULL IDENTITY PRIMARY KEY,
description					CHAR(10)		NOT NULL); 

create table genre
(genre_id					INT				NOT NULL IDENTITY PRIMARY KEY,
description					NCHAR(60)		NOT NULL);

create table status
(status_id					INT				NOT NULL IDENTITY PRIMARY KEY,
description					CHAR(10)		NOT NULL);

create table artist_type
(artist_type_id				INT				NOT NULL IDENTITY PRIMARY KEY,
description					CHAR(10)		NOT NULL);

create table borrower 
(borrower_id				INT				NOT NULL IDENTITY PRIMARY KEY,
first_name					CHAR(60)		NOT NULL,
last_name					CHAR(60)		NOT NULL, 
phone_number				CHAR(60)		NOT NULL);

create table artist
(artist_id					INT				NOT NULL IDENTITY PRIMARY KEY,
artist_name					NCHAR(60)		NOT NULL,
artist_type_id				INT				NOT NULL references artist_type (artist_type_id));

create table media 
(media_id					INT				NOT NULL IDENTITY PRIMARY KEY,
media_name					NCHAR(60)		NOT NULL,
release_date				DATE			NOT NULL, 
media_type_id				INT				NOT NULL references media_type (media_type_id),
status_id					INT				NOT NULL references status (status_id),
genre_id					INT				NOT NULL references genre (genre_id));

create table media_has_borrower
(media_has_borrower_id		INT				NOT NULL IDENTITY PRIMARY KEY,
borrower_id					INT				NOT NULL references borrower (borrower_id),
media_id					INT				NOT NULL references media (media_id),
borrow_date					DATE			NOT NULL,
return_date					DATE			NULL);

create table media_has_artist
(media_has_artist		INT				NOT NULL IDENTITY PRIMARY KEY,
artist_id				INT				NOT NULL references artist (artist_id),
media_id				INT				NOT NULL references media (media_id));





-- Insert statements

insert into media_type (description)
values
	('CD'), ('Vinyl'), ('DVD');

insert into genre (description)
values
	('Classic Rock'), ('Country'), ('Jazz'), ('Rock'), ('Metal'), ('Folk'), ('Indie'), ('Pop'), ('Alternative');

insert into status (description)
values
	('Available'), ('On loan'), ('Broken'), ('Missing');

insert into artist_type (description)
values 
	('Solo'), ('Group');

insert into borrower (first_name, last_name, phone_number)
values ('Clair', 'Redfield', '105-555-1233'), 
		('Chris', 'Redfield', '105-555-2367'),
		('Booker', 'Dewitt', '105-555-4568'),
		('Sander', 'Cohen', '105-555-5798'),
		('Andrew', 'Ryan', '105-555-5223'),
		('Frank', 'Fontaine', '105-555-6776'),
		('Zachary', 'Comstock', '105-555-3383'),
		('Jill', 'Valentine', '105-555-4435'),
		('Leon', 'Kennedy', '105-555-1112'),
		('Albert', 'Wesker', '105-555-8877'),
		('Ada', 'Wong', '105-555-0009'),
		('Ashley', 'Graham', '105-555-2211'),
		('Luis', 'Sera', '105-555-4545'),
		('Osmund', 'Saddler', '105-555-9090'),
		('Piers', 'Nivans', '105-555-1233'),
		('Ethan', 'Winter', '105-555-1200'),
		('Sherry', 'Birkin', '105-555-5552'),
		('Sheva', 'Alomar', '105-555-3777'),
		('Jake', 'Muller', '105-555-3666'),
		('Ingrid', 'Hunnigan', '105-555-4222');

delete borrower 
where borrower_id = 19;


insert into artist (artist_name, artist_type_id)
values ('LP', 1),
		('Poor Mans Poison', 2),
		('Nothing But Thieves', 2),
		('Queen', 2),
		('Greg Laswell', 1),
		('Aquilo', 2),
		('Kesha', 1),
		('Lorde', 1),
		('PVRIS', 2), 
		('Frank Sinatra', 1),
		('Slipknot', 2),
		('Def Leppard', 2),
		('Keith Urban', 1),
		('Nirvana', 2),
		('MGMT', 2),
		('Hozier', 1),
		('Band of Horses', 2),
		('Bille Holiday', 1),
		('Metallica', 2),
		('John Mayer', 1);

update media
set genre_id = 7
where media_id = 1;
 

insert into media (media_name, release_date, genre_id, status_id, media_type_id)
values ('Lost on You', '12-07-2018', 9, 1, 1),
		('Providence', '01-28-2014', 6, 1, 1),
		('Nothing But Theives', '10-16-2015', 7, 1, 1),
		('The Game', '06-20-1980', 2, 2, 2),
		('Three Flights from Alto Nido', '07-08-2008', 7, 2, 1),
		('Silhouettes', '01-27-2018', 8, 1, 1),
		('Animal', '01-01-2010', 8, 2, 1),
		('Pure Heroine', '09-27-2013', 8, 1, 1),
		('White Noise', '11-04-2014', 9, 1, 1),
		('Close to You', '08-23-1957', 3, 2, 1),
		('All Hope Is Gone', '08-20-2008', 5, 1, 1),
		('On Through the Night', '03-14-1980', 5, 3, 2),
		('Golden Road', '10-08-2002', 2, 4, 1),
		('Nevermind', '09-24-1991', 4, 2, 2),
		('Oracular Spectacular', '10-02-2007', 7, 1, 1),
		('Hozier', '09-14-2014', 9, 2, 1),
		('Everything All the Time', '03-21-2006', 6, 4, 1), 
		('Music for Torching', '10-01-1955', 3, 3, 2),
		('Ride the Lightning', '07-27-1984', 5, 1, 2),
		('Heart to Mouth', '12-07-2018', 9, 2, 1);
		

insert into media_has_borrower (borrower_id, media_id, borrow_date, return_date)	
values (2, 4, '1-2-2012', '2-15-2012'),
		(1, 4, '10-05-2021', null),
		(11, 5, '06-01-2021', null),
		(15, 12, '03-14-2009', '04-01-2009'),
		(15, 12, '07-24-2011', '09-12-2011'),
		(6, 1, '01-03-2014', '03-04-2014'),
		(20, 7, '08-22-2021', null),
		(3, 10, '02-05-2021', null),
		(10, 12, '11-20-2020', '12-13-2020'),
		(7, 13, '09-01-2021', null),
		(12, 18, '08-30-2019', '10-03-2019'),
		(14, 20, '10-14-2021', null),
		(4, 4, '05-23-2018', '07-12-2018'),
		(5, 3, '02-28-2020', '04-13-2020'),
		(8, 1, '12-03-2019', '12-05-2019'),
		(9, 6, '07-02-2020', '09-18-2020'),
		(13, 14, '04-19-2021', '06-20-2021'),
		(16, 15, '01-02-2018', '02-03-2018'),
		(17, 16, '05-26-2020', '06-01-2020'),
		(18, 2, '01-01-2020', '01-02-2020');



insert into media_has_artist (media_id, artist_id)
values (1, 1),
		(2, 2),
		(3, 3),
		(4, 4),
		(5, 5),
		(6, 6),
		(7, 7),
		(8, 8),
		(9, 9),
		(10, 10),
		(11, 11),
		(12, 12),
		(13, 13),
		(14, 14), 
		(15, 15),
		(16, 16), 
		(17, 17),
		(18, 18),
		(19, 19),
		(20, 1);



select *
from media_has_borrower
where return_date = NULL;

select * from media_has_borrower;