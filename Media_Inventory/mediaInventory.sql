/***************************************************************
* Date		Programmer		Description
* -----		----------		-----------
* 10/8/21	DBrockert		Initial implementation of media db.
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
(media_type_id				INT				NOT NULL PRIMARY KEY,
description					CHAR(10)		NOT NULL); 

create table genre
(genre_id					INT				NOT NULL PRIMARY KEY,
description					CHAR(10)		NOT NULL);

create table status
(status_id					INT				NOT NULL PRIMARY KEY,
desciption					CHAR(10)		NOT NULL);

create table artist_type
(artist_type_id				INT				NOT NULL PRIMARY KEY,
description					CHAR(10)		NOT NULL);

create table borrower 
(borrower_id				INT				NOT NULL PRIMARY KEY,
first_name					CHAR(60)		NOT NULL,
last_name					CHAR(60)		NOT NULL, 
phone_number				CHAR(60)		NOT NULL);

create table artist
(artist_id					INT				NOT NULL PRIMARY KEY,
artist_name					CHAR(10)		NOT NULL,
artist_type_id				INT				NOT NULL);

create table media 
(media_id					INT				NOT NULL PRIMARY KEY,
media_name					CHAR(10)		NOT NULL,
release_date				DATE			NOT NULL, 
media_type_id				INT				NOT NULL references media_type (media_type_id),
status_id					INT				NOT NULL references status (status_id),
genre_id					INT				NOT NULL references genre (genre_id));

create table media_has_borrower
(media_has_borrower_id		INT				NOT NULL PRIMARY KEY,
borrower_id					INT				NOT NULL references borrower (borrower_id),
media_id					INT				NOT NULL references media (media_id),
borrow_date					DATE			NOT NULL,
return_date					DATE			NULL);

create table media_has_artist
(media_has_artist		INT				NOT NULL PRIMARY KEY,
artist_id				INT				NOT NULL references artist (artist_id),
media_id				INT				NOT NULL references media (media_id));

