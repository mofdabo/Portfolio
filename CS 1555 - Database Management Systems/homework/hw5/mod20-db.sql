-- Mouhammadou Dabo (mod20)
-- Drop tables so the database does not have pre-existed tables
drop table directory cascade constraints;
drop table customers cascade constraints;
drop table records cascade constraints;
drop table statements cascade constraints;
drop table payments cascade constraints;


-- 1. Alter the tables created from the sample solutions of Q2 and Q3 in HW2,
-- such that (incorporate your ALTER statements in your `db' script):
create table directory(
    pn      number(10)      not null,
    fname   varchar2(20)    not null,
    lname   varchar2(20)    not null,
    street  varchar2(40),
    city    varchar2(20),
    zip     number(5),
    state   varchar2(20),
    constraint directory_pk primary key(pn)
);

create table customers (
    SSN        number(9)    not null,
    fname      varchar2(20) not null,
    lname      varchar2(20) not null,
    cell_pn    number(10)   not null,
    home_pn    number(10),
    street     varchar2(40),
    city       varchar2(20),
    zip        number(5),
    state      varchar2(20),
    free_min   number,
    dob        date,
    constraint customers_pk primary key(cell_pn),
    constraint customers_fk1 foreign key(cell_pn) references directory(pn),
    constraint customers_fk2 foreign key(home_pn) references directory(pn),
    constraint customers_uk unique(ssn)
);

create table records(
    from_pn         number(10)  not null,
    to_pn           number(10)  not null,
    start_timestamp timestamp   not null,
    duration        number(4),
    type            varchar2(20),
    constraint records_pk primary key(from_pn, start_timestamp),
    constraint records_fk1 foreign key(from_pn) references directory(pn),
    constraint records_fk2 foreign key(to_pn) references directory(pn)
);

create table statements(
    cell_pn         number(10)  not null,
    start_date      date        not null,
    end_date        date        not null,
    total_minutes   number,
    total_SMS       number,
    amount_due      number(6,2),
    constraint statements_pk primary key(cell_pn, start_date),
    constraint statements_fk foreign key(cell_pn) references customers(cell_pn),
    constraint statements_uk unique(cell_pn, end_date)
);

-- (a) Add a new attribute to the relation PAYMENTS called `payer SSN' of type number(9).
-- (b) Add a foreign key constraint to the relation PAYMENTS on the newly created attribute
-- `payer SSN', and make it references the attribute `SSN' in the relation CUSTOMERS.
create table payments(
    cell_pn     number(10),
    paid_on     timestamp,
    amount_paid number(6,2),

    payer_SSN   number(9),
    constraint payments_pk primary key (cell_pn, paid_on),
    constraint payments_fk1 foreign key(cell_pn) references customers(cell_pn),
    constraint payments_fk2 foreign key (payer_SSN) references customers(ssn)
);

alter table records add constraint records_uk unique(to_pn, start_timestamp);
alter table statements add constraint statements_uk2 unique(end_date, cell_pn);

alter table customers add free_SMS number;

alter table statements add previous_balance number(6,2);

alter table customers modify free_min default 0;
alter table customers modify free_SMS default 0;

-- Run all the INSERT statements from the sample solution for Q4 in HW2
-- except the last 5 INSERTs for PAYMENTS relation. Then, modify the INSERTs for PAYMENTS,
-- such that we can insert them with respect to the changes in Q1. (incorporate your
-- modified INSERT statements in your `query' script).

insert into directory (pn, fname, lname, street, city, zip, state)
    values (4121231231, 'Michael', 'Johnson', '320 Fifth Avenue', 'Pittsburgh', 15213, 'PA');
insert into directory (pn, fname, lname, street, city, zip, state)
    values (4121232131, 'Michael', 'Johnson', '320 Fifth Avenue', 'Pittsburgh', 15213, 'PA');
insert into directory (pn, fname, lname, street, city, zip, state)
    values (4124564564, 'Kate',	'Stevenson', '310 Fifth Avenue', 'Pittsburgh', 15213, 'PA');
insert into directory (pn, fname, lname, street, city, zip, state)
    values (4127897897, 'Bill', 'Stevenson', '310 Fifth Avenue', 'Pittsburgh', 15213, 'PA');
insert into directory (pn, fname, lname, street, city, zip, state)
    values (4123121231, 'Bill',	'Stevenson', '310 Fifth Avenue', 'Pittsburgh', 15213, 'PA');
insert into directory (pn, fname, lname, street, city, zip, state)
    values (4127417417, 'Richard', 'Hurson', '340 Fifth Avenue', 'Pittsburgh', 15213, 'PA');
insert into directory (pn, fname, lname, street, city, zip, state)
    values (4127417612, 'Richard', 'Hurson', '340 Fifth Avenue', 'Pittsburgh', 15213, 'PA');
insert into directory (pn, fname, lname, street, city, zip, state)
    values (4122582582, 'Mary', 'Davis', '350 Fifth Avenue', 'Pittsburgh', 15217, 'PA');
insert into directory (pn, fname, lname, street, city, zip, state)
    values (4122581324, 'Mary',	'Davis', '350 Fifth Avenue', 'Pittsburgh', 15217, 'PA');
insert into directory (pn, fname, lname, street, city, zip, state)
    values (7247779797, 'Julia', 'Hurson', '3350 Fifth Avenue', 'Philadelphia', 22221, 'PA');
insert into directory (pn, fname, lname, street, city, zip, state)
    values (7247778787, 'Chris', 'Lyn', '62 Sixth St', 'Philadelphia', 22222, 'PA');
insert into directory (pn, fname, lname, street, city, zip, state)
    values (7243413412, 'Chris', 'Lyn', '62 Sixth St', 'Philadelphia', 22222, 'PA');
insert into directory (pn, fname, lname, street, city, zip, state)
    values (7248889898, 'Jones', 'Steward', '350 Fifth Avenue', 'Philadelphia', 22222, 'PA');
insert into directory (pn, fname, lname, street, city, zip, state)
    values (7249879879, 'James', 'Sam', '1210 Forbes Avenue', 'Philadelphia', 22132, 'PA');
insert into directory (pn, fname, lname, street, city, zip, state)
    values (7249871253, 'James', 'Sam', '1210 Forbes Avenue', 'Philadelphia', 22132, 'PA');
insert into directory (pn, fname, lname, street, city, zip, state)
    values (6243780132, 'Harry', 'Lee', '3721 Craig Street', 'Tridelphia', 16161, 'WV');
insert into directory (pn, fname, lname, street, city, zip, state)
    values (6241121342, 'Kate', 'Lee', '3721 Craig Street', 'Tridelphia', 16161, 'WV');
insert into directory (pn, fname, lname, street, city, zip, state)
    values (6242311322, 'Jack', 'Barry', '3521 Craig Street', 'Tridelphia', 16161, 'WV');
insert into directory (pn, fname, lname, street, city, zip, state)
    values (6241456123, 'Neil', 'Jackson', '2134 Seventh St', 'Tridelphia', 16161, 'WV');
insert into directory (pn, fname, lname, street, city, zip, state)
    values (4843504021, 'Frank', 'Shaw', '23 Fifth Avenue', 'Allentown', 14213, 'PA');
insert into directory (pn, fname, lname, street, city, zip, state)
    values (4843504245, 'Frank', 'Shaw', '23 Fifth Avenue', 'Allentown', 14213, 'PA');
insert into directory (pn, fname, lname, street, city, zip, state)
    values (4846235161, 'Liam',	'Allen', '345 Craig Street', 'Allentown', 14213, 'PA');
insert into directory (pn, fname, lname, street, city, zip, state)
    values (4846452231, 'Justin', 'Blosser', '231 Tenth Street', 'Allentown', 14213, 'PA');
insert into directory (pn, fname, lname, street, city, zip, state)
    values (4846452124, 'Justin', 'Blosser', '231 Tenth Street', 'Allentown', 14213, 'PA');

insert into customers (SSN, fname, lname, cell_pn, home_pn, street, city, zip, state, free_min, dob, free_SMS)
    values (123456789, 'Michael', 'Johnson', 4121231231, 4121232131, '320 Fifth Avenue', 'Pittsburgh', 15213, 'PA', 300, '01-JAN-91', 100);
insert into customers (SSN, fname, lname, cell_pn, home_pn, street, city, zip, state, free_min, dob, free_SMS)
    values (123232343, 'Kate', 'Stevenson', 4124564564, 4123121231, '310 Fifth Avenue', 'Pittsburgh', 15213, 'PA', 300, '05-FEB-90', 100);
insert into customers (SSN, fname, lname, cell_pn, home_pn, street, city, zip, state, free_min, dob, free_SMS)
    values (445526754, 'Bill', 'Stevenson', 4127897897, 4123121231, '310 Fifth Avenue', 'Pittsburgh', 15213, 'PA', 600, '11-DEC-92', 500);
insert into customers (SSN, fname, lname, cell_pn, home_pn, street, city, zip, state, free_min, dob, free_SMS)
    values (254678898, 'Richard', 'Hurson', 4127417417, 4127417612, '340 Fifth Avenue', 'Pittsburgh', 15213, 'PA', 600, '03-OCT-89', 500);
insert into customers (SSN, fname, lname, cell_pn, home_pn, street, city, zip, state, free_min, dob, free_SMS)
    values (256796533, 'Mary', 'Davis', 4122582582, 4122581324, '350 Fifth Avenue', 'Pittsburgh', 15217, 'PA', 100, '04-MAR-93', 500);
insert into customers (SSN, fname, lname, cell_pn, home_pn, street, city, zip, state, free_min, dob, free_SMS)
    values (245312567, 'Frank', 'Shaw', 4843504021, 4843504245, '23 Fifth Avenue', 'Allentown', 14213, 'PA', 0, '05-JUN-87', 0);
insert into customers (SSN, fname, lname, cell_pn, street, city, zip, state, free_min, dob, free_SMS)
    values (251347682, 'Jones', 'Steward', 7248889898, '350 Fifth Avenue', 'Philadelphia', 22222, 'PA', 150, '04-JAN-90',0);
insert into customers (SSN, fname, lname, cell_pn, home_pn, street, city, zip, state, free_min, dob, free_SMS)
    values (312567834, 'James', 'Sam', 7249879879, 7249871253, '1210 Forbes Avenue', 'Philadelphia', 22132, 'PA', 100, '15-AUG-88', 500);
insert into customers (SSN, fname, lname, cell_pn, street, city, zip, state, free_min, dob, free_SMS)
    values (421356312, 'Liam', 'Allen', 4846235161, '345 Craig Street', 'Allentown', 14213, 'PA', 0, '16-SEP-92', 0);
insert into customers (SSN, fname, lname, cell_pn, home_pn, street, city, zip, state, free_min, dob, free_SMS)
    values (452167351, 'Justin', 'Blosser', 4846452231, 4846452124, '231 Tenth Street', 'Allentown', 14213, 'PA', 300, '01-MAY-90', 100);

insert into records (from_pn, to_pn, start_timestamp, duration, type)
    values (4121231231, 4124564564, '01-JAN-19 11.05.00.000000 AM', 300, 'call');
insert into records (from_pn, to_pn, start_timestamp, duration, type)
    values (4121231231, 7247779797, '01-JAN-19 05.10.00.000000 PM',	300, 'call');
insert into records (from_pn, to_pn, start_timestamp, duration, type)
    values (4121231231, 7247779797, '01-JAN-19 05.15.00.000000 PM',	0, 'sms');
insert into records (from_pn, to_pn, start_timestamp, duration, type)
    values (6243780132, 6242311322, '02-AUG-19 09.35.00.000000 PM',	0, 'sms');
insert into records (from_pn, to_pn, start_timestamp, duration, type)
    values (6243780132, 6242311322, '02-AUG-19 11.12.00.000000 PM',	200, 'call');
insert into records (from_pn, to_pn, start_timestamp, duration, type)
    values (4124564564, 7247778787, '08-AUG-19 11.05.00.000000 AM',	300, 'call');
insert into records (from_pn, to_pn, start_timestamp, duration, type)
    values (4127417417, 7248889898, '02-AUG-19 05.32.00.000000 AM',	0, 'sms');
insert into records (from_pn, to_pn, start_timestamp, duration, type)
    values (7248889898, 7247779797, '15-AUG-19 02.17.00.000000 PM',	60, 'call');
insert into records (from_pn, to_pn, start_timestamp, duration, type)
    values (7248889898, 7247778787, '01-SEP-19 11.03.00.000000 AM',	300, 'call');
insert into records (from_pn, to_pn, start_timestamp, duration, type)
    values (7249879879, 7248889898, '03-SEP-19 05.24.00.000000 PM',	100, 'call');
insert into records (from_pn, to_pn, start_timestamp, duration, type)
    values (4127417417, 7249879879, '05-SEP-19 06.24.00.000000 PM',	123, 'call');
insert into records (from_pn, to_pn, start_timestamp, duration, type)
    values (6243780132, 4846235161, '06-AUG-19 08.15.00.000000 PM',	0, 'sms');
insert into records (from_pn, to_pn, start_timestamp, duration, type)
    values (4843504021, 4846235161, '07-SEP-19 03.23.00.000000 PM',	50, 'call');
insert into records (from_pn, to_pn, start_timestamp, duration, type)
    values (4846235161, 4846452231, '23-SEP-19 12.23.00.000000 PM', 120, 'call');
insert into records (from_pn, to_pn, start_timestamp, duration, type)
    values (4846452231, 4846235161, '25-SEP-19 01.34.00.000000 PM', 200, 'call');
insert into records (from_pn, to_pn, start_timestamp, duration, type)
    values (4121231231, 6242311322, '02-AUG-19 08.30.00.000000 PM', 0, 'sms');
insert into records (from_pn, to_pn, start_timestamp, duration, type)
    values (7247778787, 6242311322, '02-AUG-19 08.31.00.000000 PM', 0, 'sms');
insert into records (from_pn, to_pn, start_timestamp, duration, type)
    values (6243780132, 6242311322, '02-AUG-19 08.32.00.000000 PM', 0, 'sms');
insert into records (from_pn, to_pn, start_timestamp, duration, type)
    values (6243780132, 6242311322, '26-SEP-19 11.12.00.000000 PM', 200, 'call');
insert into records (from_pn, to_pn, start_timestamp, duration, type)
    values (6241456123, 6241121342, '29-SEP-19 11.11.00.000000 PM', 100, 'call');
insert into records (from_pn, to_pn, start_timestamp, duration, type)
    values (4121231231, 6241121342, '30-SEP-19 11.11.00.000000 PM', 200, 'call');

insert into statements (cell_pn, start_date, end_date, total_minutes, total_SMS, amount_due, previous_balance)
    values (4121231231, '01-SEP-19', '30-SEP-19', 250, 0, 0, 39.99);
insert into statements (cell_pn, start_date, end_date, total_minutes, total_SMS, amount_due, previous_balance)
    values (4124564564, '01-SEP-19', '30-SEP-19', 600, 30, 200.99, 299.99);
insert into statements (cell_pn, start_date, end_date, total_minutes, total_SMS, amount_due, previous_balance)
    values (4127897897, '01-SEP-19', '30-SEP-19', 650, 27, 0, 59.99);
insert into statements (cell_pn, start_date, end_date, total_minutes, total_SMS, amount_due, previous_balance)
    values (4127417417, '01-SEP-19', '30-SEP-19', 517, 96, 49.99, 49.99);
insert into statements (cell_pn, start_date, end_date, total_minutes, total_SMS, amount_due, previous_balance)
    values (4122582582, '01-SEP-19', '30-SEP-19', 500, 270, 39.99, 139.99);
insert into statements (cell_pn, start_date, end_date, total_minutes, total_SMS, amount_due, previous_balance)
    values (4843504021, '01-SEP-19', '30-SEP-19', 230, 403, 0, 59.99);
insert into statements (cell_pn, start_date, end_date, total_minutes, total_SMS, amount_due, previous_balance)
    values (7248889898, '01-SEP-19', '30-SEP-19', 50, 0, 25.99, 25.99);
insert into statements (cell_pn, start_date, end_date, total_minutes, total_SMS, amount_due, previous_balance)
    values (7249879879, '01-SEP-19', '30-SEP-19', 700, 7, 50, 159.99);
insert into statements (cell_pn, start_date, end_date, total_minutes, total_SMS, amount_due, previous_balance)
    values (4846235161, '01-SEP-19', '30-SEP-19', 200, 83, 100, 199.99);
insert into statements (cell_pn, start_date, end_date, total_minutes, total_SMS, amount_due, previous_balance)
    values (4846452231, '01-SEP-19', '30-SEP-19', 500, 12, 59.99, 179.99);

insert into payments (cell_pn, paid_on, amount_paid, payer_SSN)
    values (4121231231, '05-AUG-19 12.00.00.000000 AM', 39.99, 123456789);
insert into payments (cell_pn, paid_on, amount_paid, payer_SSN)
    values (4121231231, '04-SEP-19 12.00.00.000000 AM', 39.99, 123456789);
insert into payments (cell_pn, paid_on, amount_paid, payer_SSN)
    values (4124564564, '03-AUG-19 12.00.00.000000 AM', 100, 123232343);
insert into payments (cell_pn, paid_on, amount_paid, payer_SSN)
    values (4127897897, '06-AUG-19 12.00.00.000000 AM', 39.99, 445526754);
insert into payments (cell_pn, paid_on, amount_paid, payer_SSN)
    values (4127417417, '06-AUG-19 12.00.00.000000 AM',	10, 254678898);

commit;
