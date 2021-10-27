/***************************************************************
* Date		Programmer		Description
* -----		----------		-----------
* 10/8/21	DBrockert		Initial implementation of media db.
* 10/14/21	DBrockert		Fixed typo on status table, changed CHAR(10) to NCHAR(60), started insert statements.
* 10/15/21	DBrockert		Added and ran insert statements. 
* 10/22/21	DBrockert		Add sql for reports. 
* 10/25/21  DBrockert		Add ins and upd sp's for media_has_borrower.
* 10/27/21	DBrockert		Add ins, upd, and del sp's for artist, borrower, and media.
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
artist_name					NVARCHAR(60)		NOT NULL,
artist_type_id				INT				NOT NULL references artist_type (artist_type_id));

create table media 
(media_id					INT				NOT NULL IDENTITY PRIMARY KEY,
media_name					NVARCHAR(60)		NOT NULL,
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

select * from artist;


-- Project 4 queries

use mediaInventoryDBrockert;


-- #3
select media_name as 'Media Name', release_date as 'Release Date', 
	iif(charindex(' ', artist_name) > 0, left(artist_name, charindex(' ', artist_name)), artist_name) as 'First Name',
	iif(charindex(' ', artist_name) > 0, right(artist_name, len(artist_name) - charindex(' ', artist_name)), '') as 'Last Name',
	charindex(' ', artist_name),
	len(artist_name) 
from media 
join media_has_artist on media.media_id = media_has_artist.media_id
join artist on artist.artist_id = media_has_artist.artist_id
where artist_type_id = 1
order by 'Last Name';




-- #4
drop view if exists View_Individual_Artist;
go

create view View_Individual_Artist as 
	select artist_id, artist_name
	from artist
	where artist_type_id = 1
go
select artist_name
from View_Individual_Artist




-- #5
select media_name as 'Media Name', release_date as 'Release Date', artist_name as 'Group Name'
from media
join media_has_artist on media.media_id = media_has_artist.media_id
join artist on artist.artist_id = media_has_artist.artist_id
where artist_type_id = 2
order by 'Group Name';
go




-- #6
select media_name as 'Media Name', release_date as 'Release Date', artist_name as 'Group Name'
from media
join media_has_artist on media.media_id = media_has_artist.media_id
join artist on artist.artist_id = media_has_artist.artist_id
where not exists
	(select *
	from View_Individual_Artist
	where artist_type_id = 1)
order by 'Group Name';
go




-- #7
select first_name as 'First Name', last_name as 'Last Name', media_name as 'Media Name', borrow_date as 'Borrow Date', return_date as 'Return Date'
from media
join media_has_borrower on media.media_id = media_has_borrower.media_id
join borrower on borrower.borrower_id = media_has_borrower.borrower_id
order by 'Last Name';




-- #8
select media.media_id as 'Media ID', media_name as 'Media Name', count(*) as 'Times Borrowed'
from media
join media_has_borrower on media.media_id = media_has_borrower.media_id
group by media_has_borrower.media_id, media.media_id, media.media_name
order by 'Media ID'
go



-- #9
select media_name as 'Media Name', borrow_date as 'Borrow Date', return_date as 'Return Date', last_name as 'Last Name'
from media_has_borrower
join media on media.media_id = media_has_borrower.media_id
join borrower on borrower.borrower_id = media_has_borrower.borrower_id
where return_date is null
order by 'Last Name';



--Week 5 Day 1 Lab

-- #1
drop proc if exists sp_ins_media_has_borrower
go
create proc sp_ins_media_has_borrower
	@media_id int, @borrower_id int, @borrow_date datetime2,
	@return_date datetime2 = null
as 
begin try
	insert into media_has_borrower
	(media_id, borrower_id, borrow_date, return_date)
	values
	(@media_id, @borrower_id, @borrow_date, @return_date);
end try
begin catch
	print 'An error occured. Row was not inserted.';
	print 'Error number: ' + convert(varchar, error_number());
	print 'Error message: ' + convert(varchar(255), error_message());
end catch
go
exec sp_ins_media_has_borrower 20, 19, '10/25/2021'
go
exec sp_ins_media_has_borrower 20, 19, '10/01/2021', '10/10/2021'
go



-- #2
drop proc if exists sp_upd_media_has_borrower
go
create proc sp_upd_media_has_borrower
	@media_has_borrower_id int, @media_id int, @borrower_id int, @borrow_date datetime2,
	@return_date datetime2 = null
as
begin try
update media_has_borrower
set media_id = 18, borrower_id = 18, borrow_date = getdate(), return_date = getdate()
where media_has_borrower_id = @media_has_borrower_id;
end try
begin catch
	print 'An error occured. Row was not inserted.';
	print 'Error number: ' + convert(varchar, error_number());
	print 'Error message: ' + convert(varchar(255), error_message());
end catch
go
exec sp_upd_media_has_borrower 19, 1, 11, '1/1/2021', '2/2/2021';
go
exec sp_upd_media_has_borrower 19, 1, 11, '1/1/2021';
go
exec sp_upd_media_has_borrower 19, 1, 1111, '1/1/2021', '2/2/2021';
go

grant exec on sp_upd_media_has_borrower to mediaUserBrockert




-- Project 5

-- #2
-- artist insert
drop proc if exists sp_ins_artist
go
create proc sp_ins_artist
	@artist_name nvarchar(60), @artist_type_id int
as
begin try
	insert into artist (artist_name, artist_type_id)
	values 
	(@artist_name, @artist_type_id)
end try
begin catch
	print 'An error occured. Row was not inserted.';
	print 'Error number: ' + convert(varchar, error_number());
	print 'Error message: ' + convert(varchar(255), error_message());
end catch
go

exec sp_ins_artist 'Billie Eilish', 1;
go

exec sp_ins_artist 'Billie Eilish', 111;
go

grant exec on sp_ins_artist to mediaUserBrockert;
go

-- artist update
drop proc if exists sp_upd_artist
go
create proc sp_upd_artist
	@artist_id int, @artist_name nvarchar(60), @artist_type_id int
as
begin try
	update artist
	set artist_name = @artist_name, artist_type_id = @artist_type_id
	where artist_id = @artist_id
end try
begin catch
	print 'An error occured. Row was not updated.';
	print 'Error number: ' + convert(varchar, error_number());
	print 'Error message: ' + convert(varchar(255), error_message());
end catch
go

exec sp_upd_artist 21, 'Billie Eilish update 2', 1;
go

exec sp_upd_artist 21, 'Billie Eilish update 2', 1111;
go

grant exec on sp_upd_artist to mediaUserBrockert;
go

-- delete artist
drop proc if exists sp_del_artist
go
create proc sp_del_artist
	@artist_id int
as
begin try
	delete artist
	where artist_id = @artist_id
end try
begin catch
	print 'An error occured. Row was not deleted.';
	print 'Error number: ' + convert(varchar, error_number());
	print 'Error message: ' + convert(varchar(255), error_message());
end catch
go

exec sp_del_artist 21;
go

exec sp_del_artist 1;
go

grant exec on sp_del_artist to mediaUserBrockert;
go

-- #3
-- insert borrower
drop proc if exists sp_ins_borrower
go
create proc sp_ins_borrower
	@first_name nvarchar(60),@last_name nvarchar(60), @phone_number nvarchar(60)
as
begin try
	insert into borrower (first_name, last_name, phone_number)
	values (@first_name, @last_name, @phone_number)
end try
begin catch
	print 'An error occured. Row was not inserted.';
	print 'Error number: ' + convert(varchar, error_number());
	print 'Error message: ' + convert(varchar(255), error_message());
end catch
go

exec sp_ins_borrower 'John', 'Smith', '208-111-1111';
go

exec sp_ins_borrower 'Jane', 'Doe', null;
go

grant exec on sp_ins_artist to mediaUserBrockert;
go


-- update borrower
drop proc if exists sp_upd_borrower
go
create proc sp_upd_borrower
	@borrower_id int, @first_name nvarchar(60),@last_name nvarchar(60), @phone_number nvarchar(60)
as
begin try
	update borrower
	set first_name = @first_name, last_name = @last_name, phone_number = @phone_number
	where borrower_id = @borrower_id
end try
begin catch
	print 'An error occured. Row was not updated.';
	print 'Error number: ' + convert(varchar, error_number());
	print 'Error message: ' + convert(varchar(255), error_message());
end catch
go

exec sp_upd_borrower 20, 'John', 'Smith', '208-111-1111';
go

exec sp_upd_borrower 20, 'Jane', 'Doe', null;
go

grant exec on sp_upd_borrower to mediaUserBrockert;
go


-- delete borrower
drop proc if exists sp_del_borrower
go
create proc sp_del_borrower
	@borrower_id int
as
begin try
	delete borrower
	where borrower_id = @borrower_id
end try
begin catch
	print 'An error occured. Row was not deleted.';
	print 'Error number: ' + convert(varchar, error_number());
	print 'Error message: ' + convert(varchar(255), error_message());
end catch
go

exec sp_del_borrower 21;
go

exec sp_del_borrower 1;
go

grant exec on sp_del_borrower to mediaUserBrockert;
go



-- #4
-- insert media
drop proc if exists sp_ins_media
go
create proc sp_ins_media
	@media_name nvarchar(60), @release_date date, @genre_id int, @status_id int, @media_type_id int
as
begin try
	insert into media (media_name, release_date, genre_id, status_id, media_type_id)
	values (@media_name, @release_date, @genre_id, @status_id, @media_type_id)
end try
begin catch
	print 'An error occured. Row was not inserted.';
	print 'Error number: ' + convert(varchar, error_number());
	print 'Error message: ' + convert(varchar(255), error_message());
end catch
go

exec sp_ins_media 'Hocus Pocus', '01-04-2009', 1, 1, 2;
go

exec sp_ins_media 'Billie Eilish', '', 111, 1, 1;
go

grant exec on sp_ins_media to mediaUserBrockert;
go


-- update media
drop proc if exists sp_upd_media
go
create proc sp_upd_media
	@media_id int, @media_name nvarchar(60), @release_date date, @genre_id int, @status_id int, @media_type_id int
as
begin try
	update media
	set media_name = @media_name, release_date = @release_date, genre_id = @genre_id, status_id = @status_id, media_type_id = @media_type_id
	where media_id = @media_id
end try
begin catch
	print 'An error occured. Row was not updated.';
	print 'Error number: ' + convert(varchar, error_number());
	print 'Error message: ' + convert(varchar(255), error_message());
end catch
go

exec sp_upd_media 21, 'Hocus Pocus update', '01-13-2009', 2, 1, 1;
go

exec sp_upd_media 21, 'Hocus Pocus update', '01-13-2009', 2, 1, 1111;
go

grant exec on sp_upd_media to mediaUserBrockert;
go


-- delete media
drop proc if exists sp_del_media
go
create proc sp_del_media
	@media_id int
as
begin try
	delete media
	where media_id = @media_id
end try
begin catch
	print 'An error occured. Row was not deleted.';
	print 'Error number: ' + convert(varchar, error_number());
	print 'Error message: ' + convert(varchar(255), error_message());
end catch
go

exec sp_del_media 21;
go

exec sp_del_media 1;
go

grant exec on sp_del_media to mediaUserBrockert;
go