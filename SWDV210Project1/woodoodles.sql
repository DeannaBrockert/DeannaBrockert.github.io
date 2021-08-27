#***********************************************************************
# Script to create woodoodles database & add test data
# Name		Date		Description
# Deanna	8/27/21	Initial deployment.
#
#***********************************************************************
drop DATABASE if exists woodoodles;
create DATABASE woodoodles;
use woodoodles; 
# create objects
create table if not exists employee 
(
	employee_id	INT not null primary key auto_increment, 
	first_name	varchar(255) not null, 
	last_name	varchar(255) not null, 
	email_address	varchar(255) not null unique
);

create table if not exists contact
(
	contact_id	int not null primary key auto_increment,
	name		varchar(255) not null,
	email_address	varchar(255) not null, 
	message	varchar(500) not null,
	contact_date	datetime     not null,
	employee_id	int not null,
	foreign key (employee_id) references employee(employee_id)
);

# insert statements for employee table
insert into employee
	(first_name, last_name, email_address)
values
	('Amanda', 'Mitchell', 'amandamitchell@gmail.com');
insert into employee
	(first_name, last_name, email_address)
values
	('Deanna', 'Brockert', 'deannabrockert@gmail.com');
insert into employee
	(first_name, last_name, email_address)
values
	('Howl', 'Pendragon', 'howlpendragon@gmail.com');
insert into employee
	(first_name, last_name, email_address)
values
	('Sophie', 'Hatter', 'sophiehatter@gmail.com');
insert into employee
	(first_name, last_name, email_address)
values
	('Leon', 'Kennedy', 'leonkennedy@gmail.com');	
insert into employee
	(first_name, last_name, email_address)
values
	('Chris', 'Redfield', 'chrisredfield@gmail.com');	
insert into employee
	(first_name, last_name, email_address)
values
	('Clair', 'Redfield', 'clairredfield@gmail.com');	
insert into employee
	(first_name, last_name, email_address)
values
	('Ada', 'Wong', 'adawong@gmail.com');	
insert into employee
	(first_name, last_name, email_address)
values
	('Albert', 'Wesker', 'albertwesker@gmail.com');
insert into employee
	(first_name, last_name, email_address)
values
	('Jill', 'Valentine', 'jillvalentine@gmail.com');	
insert into employee
	(first_name, last_name, email_address)
values
	('Sherry', 'Birkin', 'sherrybirkin@gmail.com');	
insert into employee
	(first_name, last_name, email_address)
values
	('Annette', 'Birkin', 'annettebirkin@gmail.com');	
insert into employee
	(first_name, last_name, email_address)
values
	('Piers', 'Nivans', 'piersnivans@gmail.com');	
insert into employee
	(first_name, last_name, email_address)
values
	('Ethan', 'Winters', 'ethanwinters@gmail.com');	
insert into employee
	(first_name, last_name, email_address)
values
	('Sheva', 'Alomar', 'shevaalomar@gmail.com');	
insert into employee
	(first_name, last_name, email_address)
values
	('Ingrid', 'Hunnigan', 'ingridhunnigan@gmail.com');		
insert into employee
	(first_name, last_name, email_address)
values
	('Jack', 'Krauser', 'jackkrauser@gmail.com');	
insert into employee
	(first_name, last_name, email_address)
values
	('Jake', 'Muller', 'jakemuller@gmail.com');
insert into employee
	(first_name, last_name, email_address)
values
	('Ashley', 'Graham', 'ashleygraham@gmail.com');
		
insert into employee
	(first_name, last_name, email_address)
values
	('Luis', 'Sera', 'luissera@gmail.com');		

# insert statements for contact table	
insert into contact	
	(name, email_address, message, contact_date, employee_id)
values
	('Howl Pendragon', 'howlpendragon@gmail.com',	'How are you', now(), 1);
insert into contact	
	(name, email_address, message, contact_date, employee_id)
values
	('Sophie Hatter', 'sophiehatter@gmail.com', 'What time is it now?', now(), 1);
insert into contact	
	(name, email_address, message, contact_date, employee_id)
values
	('Cloud Strife', 'cloudstrife@gmail.com', 'How much does this cost?', now(), 1);
insert into contact	
	(name, email_address, message, contact_date, employee_id)
values
	('Barret Wallace', 'barretwallace@gmail.com', 'Hello', now(), 1);
insert into contact	
	(name, email_address, message, contact_date, employee_id)
values
	('Tifa Lockhart', 'tifalockhart@gmail.com', 'Goodbye', now(), 1);	
insert into contact	
	(name, email_address, message, contact_date, employee_id)
values
	('Aerith Gainsborough', 'aerithgainsborough@gmail.com', 'Who are you?', now(), 1);	
insert into contact	
	(name, email_address, message, contact_date, employee_id)
values
	('Yuffie Kisaragi', 'yuffiekisaragi@gmail.com', 'Welcome', now(), 1);	
insert into contact	
	(name, email_address, message, contact_date, employee_id)
values
	('Vincent Valentine', 'vincentvalentine@gmail.com', 'Can we talk?', now(), 1);
insert into contact	
	(name, email_address, message, contact_date, employee_id)
values
	('Cid Highwind', 'cidhighwind@gmail.com', 'Are you ready?', now(), 1);
insert into contact	
	(name, email_address, message, contact_date, employee_id)
values
	('Zack Fair', 'zackfair@gmail.com', 'This is my 10th entry.', now(), 1);	
insert into contact	
	(name, email_address, message, contact_date, employee_id)
values
	('Rufus Shinra', 'rufusshinra@gmail.com', 'Not much more now', now(), 1);	
insert into contact	
	(name, email_address, message, contact_date, employee_id)
values
	('Angeal Hewley', 'angealhewley@gmail.com', 'My shirt is blue', now(), 1);	
insert into contact	
	(name, email_address, message, contact_date, employee_id)
values
	('Lucrecia Crescent', 'lucreciacrescent@gmail.com', 'I am going to go now', now(), 1);		
insert into contact	
	(name, email_address, message, contact_date, employee_id)
values
	('Squall Leonhart', 'squallleonhart@gmail.com', 'How many people are here?', now(), 1);	
insert into contact	
	(name, email_address, message, contact_date, employee_id)
values
	('Andrew Ryan', 'andrewryan@gmail.com', 'Would you kindly?', now(), 1);
insert into contact	
	(name, email_address, message, contact_date, employee_id)
values
	('Sander Cohen', 'sandercohen@gmail.com', 'It has been a long day', now(), 1);
insert into contact	
	(name, email_address, message, contact_date, employee_id)
values
	('Frank Fontaine', 'Frank Fontaine@gmail.com', 'When are we going?', now(), 1);
insert into contact	
	(name, email_address, message, contact_date, employee_id)
values
	('Rosalind Lutece', 'rosalindlutece@gmail.com', 'Welcome back', now(), 1);		
insert into contact	
	(name, email_address, message, contact_date, employee_id)
values
	('Booker DeWitt', 'bookerdewitt@gmail.com', 'It is time to go home', now(), 1);	
insert into contact	
	(name, email_address, message, contact_date, employee_id)
values
	('Zachary Comstock', 'zacharycomstock@gmail.com', 'Lets go!', now(), 1);

