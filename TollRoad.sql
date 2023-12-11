/*

Tasks:

1. Build database to store all information about the customers, exits, transmitters and trips
2. Each Category should have its own table and should primary and foreign keys
3. Populate database with at least 3 accounts, 4 transmitters and 5 sample trips


*/


/* Table to hold information about various exits on the toll road */
create table exits
(
	exit_id smallint not null,  				/* id, primary key            */
	exit_num varchar(5),        				/* exit number, e.g. 18A, 18B */
	mile_marker smallint,                    	/* mile marker from the western border of the state */
	near_town varchar(30),      				/* nearest town to exit       */

	constraint pk_exit_id primary key(exit_id)
);

/* Table to hold information about various customers with transmitters */
create table customer
(
	customer_id smallint not null,           /* id, primary key                      */
	name varchar(20) not null,               /* customer's name                      */
	address_L1 varchar(20) not null,         /* 1st line of customer's address       */
	address_L2 varchar(20),                  /* 2nd line of customer's address       */
	city varchar(20) not null,               /* customer's city                      */
	state varchar(15) not null,              /* customer's state                     */
	zip smallint not null,                   /* customer's zip-code                  */

	constraint pk_customer_id primary key(customer_id)
);

/* Table to hold information about various transmitters */
create table transmitters
(
	trans_id smallint not null,              /* id, primary key                 */
	customer_id smallint,                    /* customer id                     */
	license_pl varchar(10) not null,         /* license plate numbers           */
	balance double not null,                 /* balance of the account, in USD  */

	constraint pk_trans_id primary key(trans_id),
	constraint fk_customer_id foreign key(customer_id) references customer(customer_id)
);

/* Table to hold information about every trip logged on the toll road system */
create table trips
(
	trip_id smallint not null,               /* id, primary key                                   */
	trans_id smallint,                       /* id for transmitter used                           */
	start_exit smallint not null,            /* the exit where the trip started between 2 and 359 */
	end_exit smallint,                       /* the exit where the trip ended  between 2 and 359  */
	trip_date date not null,                 /* date of the trip                                  */
	payment_type varchar(10),                /* type of payment e.g. “ticket” or “account”        */
	trip_status varchar(30),                 /* status of the trip e.g. “On-going”, 
                                                “completed and paid”, “completed and not paid”    */
	vehicle_type varchar(10),                /* type of vehicle, e.g. car, truck                  */

	constraint pk_trip_id primary key(trip_id),
	constraint fk_trans_id foreign key(trans_id) references transmitters(trans_id),
      constraint fk_start_exit foreign key(start_exit) references exits(exit_id),
      constraint fk_end_exit foreign key(end_exit) references exits(exit_id)

);


-- SQL code to Populate database tables:

/* 	20 inserts into the exits table */

 insert into exits
       (exit_id, exit_num, mile_marker, near_town)
       values (1, '2', 2, 'Gateway (Ohio Conn.)' );

 insert into exits
       (exit_id, exit_num, mile_marker, near_town)
       values (2, '10', 10, 'New Castle' );

 insert into exits
       (exit_id, exit_num, mile_marker, near_town)
       values (3, '201', 201, 'Blue Mountain');

 insert into exits
       (exit_id, exit_num, mile_marker, near_town)
       values (4, '226', 206, 'Carlisle');

 insert into exits
       (exit_id, exit_num, mile_marker, near_town)
       values (5, '236', 236, 'Gettysburg Pike');

 insert into exits
       (exit_id, exit_num, mile_marker, near_town)
       values (6, '242', 242, 'Harrisburg West Shores');

 insert into exits
       (exit_id, exit_num, mile_marker, near_town)
       values (7, '247', 247, 'Harrisburg East');

 insert into exits
       (exit_id, exit_num, mile_marker, near_town)
       values (8, '266A', 266, 'Lebanon');

 insert into exits
       (exit_id, exit_num, mile_marker, near_town)
       values (9, '266B', 266, 'Lancaster' );

 insert into exits
       (exit_id, exit_num, mile_marker, near_town)
       values (10, '286', 286, 'Reading');

 insert into exits
       (exit_id, exit_num, mile_marker, near_town)
       values (11, '298', 298, 'Morgantown');

 insert into exits
       (exit_id, exit_num, mile_marker, near_town)
       values (12, '312', 312, 'Downingtown');

 insert into exits
       (exit_id, exit_num, mile_marker, near_town)
       values (13, '326', 326, 'Valley Forge');

 insert into exits
       (exit_id, exit_num, mile_marker, near_town)
       values (14, '333', 333, 'Norristown');

 insert into exits
       (exit_id, exit_num, mile_marker, near_town)
       values (15, '20', 333, 'North East Ext.');

 insert into exits
       (exit_id, exit_num, mile_marker, near_town)
       values (16, '339', 3339, 'Fort Washington');

 insert into exits
       (exit_id, exit_num, mile_marker, near_town)
       values (17, '343', 343, 'Willow Grove');

 insert into exits
       (exit_id, exit_num, mile_marker, near_town)
       values (18, '351', 351, 'Bensalem');

insert into exits
       (exit_id, exit_num, mile_marker, near_town)
       values (19, '358', 358, 'Delaware Valley');

 insert into exits
       (exit_id, exit_num, mile_marker, near_town)
       values (20, '359', 359, 'Delaware River Bridge');

/*	Customer table  */

 insert into customer
       (customer_id, name, address_L1, city, state, zip)
       values (0, 'Joseph Bones', '180 Pleasant Rd', 'Philadelphia', 'PA', 19134);

 insert into customer
       (customer_id, name, address_L1, address_L2, city, state, zip)
       values (1, 'Gregory Smells', '7654 1st Street', ' Suite 100', 'Mountain View', 'CA', 14043);

 insert into customer
       (customer_id, name, address_L1, city, state, zip)
       values (3, 'Dennis Stoner', '5632 Michigam Ave', 'Dearborn', 'MI', 28127);

/*	4 transmitters */

 insert into transmitters
       (trans_id, customer_id, license_pl, balance)
       values (0, 0, 'CHZ2697', 2.30);

 insert into transmitters
       (trans_id, customer_id, license_pl, balance)
       values (1, 1, '4CVU806', 0.00);

 insert into transmitters
       (trans_id,customer_id, license_pl, balance)
       values (2, 1, '5BBM299', 5.00);

 insert into transmitters
       (trans_id, customer_id, license_pl, balance)
       values (3, 3, '10SNE1', 7.98);

/*	5 sample trips */

 insert into trips
       (trip_id, start_exit, end_exit, trip_date, payment_type, trip_status, vehicle_type)
       values (0, 5, 10, '2010-03-13','ticket', 'Completed but not paid', 'Car' );

 insert into trips
       (trip_id, trans_id, start_exit, trip_date, payment_type, trip_status, vehicle_type)
       values (1, 2, 10, '2010-01-26', 'account', 'On-going', 'Car' );

 insert into trips
       (trip_id, trans_id, start_exit, end_exit, trip_date, payment_type, trip_status, vehicle_type)
       values (2, 1, 1, 17, '2009-10-22', 'account', 'Completed and paid', 'Truck' );

 insert into trips
       (trip_id, start_exit, end_exit, trip_date, payment_type, trip_status, vehicle_type)
       values (3, 6, 16,'2008-06-15', 'ticket', 'Completed and paid ', 'Truck' );

 insert into trips
       (trip_id, start_exit, trip_date, payment_type, trip_status, vehicle_type)
       values (4, 10, '2007-03-25' , 'ticket', 'On-going', 'Car');

select * from exits;
select * from customer;
select * from transmitters;
select * from trips;

