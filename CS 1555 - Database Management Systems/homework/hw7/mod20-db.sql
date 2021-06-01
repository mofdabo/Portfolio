-- Mouhammadou Dabo (mod20)
-- Drop tables so the database does not have pre-existed tables
drop table records cascade constraints;
drop table statements cascade constraints;
drop table payments cascade constraints;
drop table customers cascade constraints;
drop table directory cascade constraints;
drop table company cascade constraints;
drop table comp_bill cascade constraints;

-- 2. Use CREATE TABLE statement to create tables for these five relations. You
-- need to define the primary keys and foreign keys (if any) and entity constraints (if any)
-- in your statement but not alternative keys.
create table directory(
    pn      number(10)      not null,
    fname   varchar2(20)    not null,
    lname   varchar2(20)    not null,
    street  varchar2(40),
    city    varchar2(20),
    zip     number(5),
    state   varchar2(20),
    constraint directory_pk primary key(pn)
        deferrable initially immediate
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
    constraint customers_pk primary key(cell_pn)
        deferrable initially immediate,
    constraint customers_fk1 foreign key(cell_pn) references directory(pn)
        deferrable initially immediate,
    constraint customers_fk2 foreign key(home_pn) references directory(pn)
        deferrable initially immediate,
    constraint customers_uk unique(ssn)
        deferrable initially immediate
);

create table records(
    from_pn         number(10)  not null,
    to_pn           number(10)  not null,
    start_timestamp timestamp   not null,
    duration        number(4),
    type            varchar2(20),
    constraint records_pk primary key(from_pn, start_timestamp)
        deferrable initially immediate,
    constraint records_fk1 foreign key(from_pn) references directory(pn)
        deferrable initially immediate,
    constraint records_fk2 foreign key(to_pn) references directory(pn)
        deferrable initially immediate
);

create table statements(
    cell_pn         number(10)  not null,
    start_date      date        not null,
    end_date        date        not null,
    total_minutes   number,
    total_SMS       number,
    amount_due      number(6,2),
    constraint statements_pk primary key(cell_pn, start_date)
        deferrable initially immediate,
    constraint statements_fk foreign key(cell_pn) references customers(cell_pn)
        deferrable initially immediate,
    constraint statements_uk unique(cell_pn, end_date)
        deferrable initially immediate
);

create table payments(
    cell_pn     number(10),
    paid_on     timestamp,
    amount_paid number(6,2),
    payer_SSN   number(9),
    constraint payments_pk primary key (cell_pn, paid_on)
        deferrable initially immediate,
    constraint payments_fk1 foreign key(cell_pn) references customers(cell_pn)
        deferrable initially immediate,
    constraint payments_fk2 foreign key (payer_SSN) references customers(ssn)
        deferrable initially immediate
);

-- 3. Use ALTER TABLE statement to incorporate the following
-- information/constraints in the P Mobile Database.

-- (a) In each table, add a Unique constraint for every of its alternate keys
alter table records add constraint records_uk unique(to_pn, start_timestamp) deferrable initially immediate;
alter table statements add constraint statements_uk2 unique(end_date, cell_pn) deferrable initially immediate;

-- (b) Add a new attribute free SMS to table CUSTOMERS, which is the number of free
-- SMS a customer can use.
alter table customers add free_SMS number;

-- (c) Add a new attribute previous balance to table STATEMENTS, which is balance
-- carried over from previous statement.
alter table statements add previous_balance number(6,2);

-- (d) In table CUSTOMERS, the free min and free SMS default value should be set to 0.
alter table customers modify free_min default 0;
alter table customers modify free_SMS default 0;

commit;
purge recyclebin;

-- Using the simple SQL SELECT statement, list the content of
-- each table.
-- select t.* from MOD20.CUSTOMERS t;
-- select t.* from MOD20.RECORDS t;
-- select t.* from MOD20.STATEMENTS t;
-- select t.* from MOD20.PAYMENTS t;
-- select t.* from MOD20.DIRECTORY t;
-- commit;

-- 2. Create the COMPANY table and specify its primary key, alternate key(s), and
-- foreign key(s) to be all INITIALLY DEFERRED DEFERRABLE.
create table company(
    comp_ID      number          not null,
    comp_name    varchar2(20)    not null,
    street       varchar2(40),
    city         varchar2(20),
    zip          number(5),
    state        varchar2(20),
    constraint company_pk primary key(comp_ID)
        initially deferred deferrable
);

-- 3. Create the COMP BILL table and specify its primary key, alternate key(s), and
-- foreign key(s) to be all INITIALLY DEFERRED DEFERRABLE.
create table comp_bill(
    comp_ID         number    not null,
    start_date      date      not null,
    end_date        date      not null,
    total_minutes   number(10,2),
    amount_due      number(10,2),
    constraint compbill_pk primary key(comp_ID, start_date)
        initially deferred deferrable,
    constraint compbill_fk foreign key(comp_ID) references company(comp_ID)
        initially deferred deferrable
);

-- 4. Add a new attribute called comp ID to table DIRECTORY that references the comp ID
-- of the COMPANY table. Note that each phone should have a company specified, it cannot be NULL.
alter table directory add comp_ID number;
alter table directory add constraint directory_fk foreign key(comp_ID) references company(comp_ID);

-- 5. Add a new attribute called charge rate to table COMPANY, which is how much
-- per minute does P Mobile charges the company. Set the default value to be 20 cents. Note
-- that each company should have a charge rate that can not be less than 0.
alter table company add charge_rate number(6,2);
alter table company modify charge_rate default 0.20;
alter table company add constraint chargerate_constraint check(charge_rate >= 0);

-- 6. Add the local constraint that a start date cannot be greater or equal with an end
-- date in all applicable tables. Now, go ahead and run the INSERT statements provided in the
-- file `hw7-company-inserts.sql'.
alter table statements add constraint statementdate_constraint check(start_date < end_date);
alter table comp_bill add constraint compdate_constraint check(start_date < end_date);

insert into company(comp_ID, comp_name, street, city, zip, state, charge_rate)
    values(1,'P_Mobile','210 Sennott Square','Pittsburgh',15260,'PA',0);
insert into company(comp_ID, comp_name, street, city, zip, state, charge_rate)
    values(2,'K_tele','22 2nd Ave','Philadelphia',22222,'PA',0.15);
insert into company(comp_ID, comp_name, street, city, zip, state, charge_rate)
    values(3,'L_tele','33 3rd Ave','Tridelphia',16161,'WV',0.20);
insert into company(comp_ID, comp_name, street, city, zip, state, charge_rate)
    values(4,'M_tele','44 4th Ave','Butler',13421,'PA',0.15);
insert into company(comp_ID, comp_name, street, city, zip, state, charge_rate)
    values(5,'D_tele','55 5th Ave','Harrisburgh',33333,'PA',0.10);
insert into company(comp_ID, comp_name, street, city, zip, state, charge_rate)
    values(6,'D_Mobile','66 6th Ave','Harrisburgh',33333,'PA',0.10);
insert into company(comp_ID, comp_name, street, city, zip, state, charge_rate)
    values(7,'H_tele','67 Center Ave','Harrisburgh',33333,'PA',0.10);
insert into company(comp_ID, comp_name, street, city, zip, state, charge_rate)
    values(8,'M_Mobile','46 6th Ave','Butler',13421,'PA',0.15);

insert into comp_bill(comp_ID, start_date, end_date, total_minutes, amount_due)
    values(2,'01-APR-19','31-MAY-19',16500,002475.00);
insert into comp_bill(comp_ID, start_date, end_date, total_minutes, amount_due)
    values(3,'01-APR-19','31-MAY-19',26771,005354.20);
insert into comp_bill(comp_ID, start_date, end_date, total_minutes, amount_due)
    values(4,'01-APR-19','31-MAY-19',16500,002475.00);
insert into comp_bill(comp_ID, start_date, end_date, total_minutes, amount_due)
    values(5,'01-APR-19','31-MAY-19',26771,002677.10);
insert into comp_bill(comp_ID, start_date, end_date, total_minutes, amount_due)
    values(6,'01-APR-19','31-MAY-19',26771,002677.10);
insert into comp_bill(comp_ID, start_date, end_date, total_minutes, amount_due)
    values(7,'01-APR-19','31-MAY-19',26771,002677.10);
insert into comp_bill(comp_ID, start_date, end_date, total_minutes, amount_due)
    values(8,'01-APR-19','31-MAY-19',16500,002475.00);
insert into comp_bill(comp_ID, start_date, end_date, total_minutes, amount_due)
    values(2,'01-JUN-19','31-JUL-19',17394,002609.10);
insert into comp_bill(comp_ID, start_date, end_date, total_minutes, amount_due)
    values(3,'01-JUN-19','31-JUL-19',28456,005691.20);
insert into comp_bill(comp_ID, start_date, end_date, total_minutes, amount_due)
    values(4,'01-JUN-19','31-JUL-19',17394,002609.10);
insert into comp_bill(comp_ID, start_date, end_date, total_minutes, amount_due)
    values(5,'01-JUN-19','31-JUL-19',28456,002845.60);
insert into comp_bill(comp_ID, start_date, end_date, total_minutes, amount_due)
    values(6,'01-JUN-19','31-JUL-19',28456,002845.60);
insert into comp_bill(comp_ID, start_date, end_date, total_minutes, amount_due)
    values(7,'01-JUN-19','31-JUL-19',28456,002845.60);
insert into comp_bill(comp_ID, start_date, end_date, total_minutes, amount_due)
    values(8,'01-JUN-19','31-JUL-19',17394,002609.10);

commit;

-- 7. A new company Q Mobile just went into the tele-communication business. It is
-- located at 1111 Fifth Ave, Pittsburgh, PA 15213 and has just signed with P Mobile a contract
-- to be charged 10 cents per minute of calls and unlimited free SMS. Note that without such
-- an agreement, Q Mobile cannot be part of P Mobile's database. Also, it started with the
-- following two customers:
--      Phone: 724-888-1212, Name: James Kennedy, Address: 5550 Fifth Avenue, Pittsburgh,
--      PA 15216
--      Phone: 724-888-4545, Name: Robin Gates, Address: 6660 Sixth St, Pittsburgh, PA
--      15666
-- Write the appropriate statements in SQL to record these facts in the database in atomic
-- fashion. After that, run the INSERT statements provided in the file `hw7-q7-inserts.sql'.
begin
    insert into company(comp_ID, comp_name, street, city, zip, state, charge_rate)
        values(9, 'Q_Mobile', '1111 Fifth Ave', 'Pittsburgh', 15213, 'PA', 0.10);
    insert into directory(pn, fname, lname, street, city, zip, state)
        values(7248881212, 'James', 'Kennedy', '5550 Fifth Avenue', 'Pittsburgh', 15216, 'PA');
    insert into directory(pn, fname, lname, street, city, zip, state)
        values(7248884545, 'James', 'Kennedy', '5550 Fifth Avenue', 'Pittsburgh', 15216, 'PA');
end;
commit;

insert into directory values(4121231231, 'Michael', 'Johnson'  , '320 Fifth Avenue'  , 'Pittsburgh'   ,15213, 'PA',1);
insert into directory values(4121232131, 'Michael', 'Johnson'  , '320 Fifth Avenue'  , 'Pittsburgh'   ,15213, 'PA',1);
insert into directory values(4124564564, 'Kate'   , 'Stevenson', '310 Fifth Avenue'  , 'Pittsburgh'   ,15213, 'PA',1);
insert into directory values(4127897897, 'Bill'   , 'Stevenson', '310 Fifth Avenue'  , 'Pittsburgh'   ,15213, 'PA',1);
insert into directory values(4123121231, 'Bill'   , 'Stevenson', '310 Fifth Avenue'  , 'Pittsburgh'   ,15213, 'PA',1);
insert into directory values(4127417417, 'Richard', 'Hurson'   , '340 Fifth Avenue'  , 'Pittsburgh'   ,15213, 'PA',1);
insert into directory values(4127417612, 'Richard', 'Hurson'   , '340 Fifth Avenue'  , 'Pittsburgh'   ,15213, 'PA',1);
insert into directory values(4122582582, 'Mary'   , 'Davis'    , '350 Fifth Avenue'  , 'Pittsburgh'   ,15217, 'PA',1);
insert into directory values(4122581324, 'Mary'   , 'Davis'    , '350 Fifth Avenue'  , 'Pittsburgh'   ,15217, 'PA',1);
insert into directory values(7247779797, 'Julia'  , 'Hurson'   , '3350 Fifth Avenue' , 'Philadelphia' ,22221, 'PA',2);
insert into directory values(7247778787, 'Chris'  , 'Lyn'      , '62 Sixth St'       , 'Philadelphia' ,22222, 'PA',2);
insert into directory values(7243413412, 'Chris'  , 'Lyn'      , '62 Sixth St'       , 'Philadelphia' ,22222, 'PA',2);
insert into directory values(7248889898, 'Jones'  , 'Steward'  , '350 Fifth Avenue'  , 'Philadelphia' ,22222, 'PA',1);
insert into directory values(7249879879, 'James'  , 'Sam'      , '1210 Forbes Avenue', 'Philadelphia' ,22132, 'PA',1);
insert into directory values(7249871253, 'James'  , 'Sam'      , '1210 Forbes Avenue', 'Philadelphia' ,22132, 'PA',1);
insert into directory values(6243780132, 'Harry'  , 'Lee'      , '3721 Craig Street' , 'Tridelphia'   ,16161, 'WV',3);
insert into directory values(6241121342, 'Kate'   , 'Lee'      , '3721 Craig Street' , 'Tridelphia'   ,16161, 'WV',3);
insert into directory values(6242311322, 'Jack'   , 'Barry'    , '3521 Craig Street' , 'Tridelphia'   ,16161, 'WV',3);
insert into directory values(6241456123, 'Neil'   , 'Jackson'  , '2134 Seventh St'   , 'Tridelphia'   ,16161, 'WV',3);
insert into directory values(4843504021, 'Frank'  , 'Shaw'     , '23 Fifth Avenue'   , 'Allentown'    ,14213, 'PA',1);
insert into directory values(4843504245, 'Frank'  , 'Shaw'     , '23 Fifth Avenue'   , 'Allentown'    ,14213, 'PA',1);
insert into directory values(4846235161, 'Liam'   , 'Allen'    , '345 Craig Street'  , 'Allentown'    ,14213, 'PA',1);
insert into directory values(4846452231, 'Justin' , 'Blosser'  , '231 Tenth Street'  , 'Allentown'    ,14213, 'PA',1);
insert into directory values(4846452124, 'Justin' , 'Blosser'  , '231 Tenth Street'  , 'Allentown'    ,14213, 'PA',1);
insert into directory values(2133504021, 'Patrick', 'Araon'    , '44 4th Avenue'     , 'Butler'    ,13421, 'PA',4);
insert into directory values(2133504245, 'Abby'   , 'Red'      , '444 Fifth Avenue'  , 'Butler'    ,13421, 'PA',4);
insert into directory values(2136235161, 'Reed'   , 'Michaels' , '345 Liberty Street', 'Butler'    ,13421, 'PA',4);
insert into directory values(2136452231, 'Kristy' , 'Ray'      , '231 Liberty Street', 'Butler'    ,13421, 'PA',4);
insert into directory values(2136452124, 'Kristy' , 'Ray'      , '231 Liberty Street', 'Butler'    ,13421, 'PA',4);
insert into directory values(7773504021, 'Reese'  , 'Carter'   , '55 Fifth Avenue'   , 'Harrisburgh',33333, 'PA',5);
insert into directory values(7773504245, 'Rubben' , 'Carter'   , '55 Fifth Avenue'   , 'Harrisburgh',33333, 'PA',5);
insert into directory values(7776235161, 'Chris'  , 'Wynn'     , '125 Liberty Street', 'Harrisburgh',33333, 'PA',5);
insert into directory values(7776452231, 'Zack'   , 'Wilson'   , '231 May Street'    , 'Harrisburgh',33333, 'PA',5);
insert into directory values(7776452124, 'Alex'   , 'Casper'   , '111 May Street'    , 'Harrisburgh',33333, 'PA',5);
insert into directory values(7783504021, 'Sophie' , 'Harper'   , '556 Fifth Avenue'  , 'Harrisburgh',33333, 'PA',6);
insert into directory values(7783504245, 'Rachel' , 'Hanna'    , '557 Fifth Avenue'  , 'Harrisburgh',33333, 'PA',6);
insert into directory values(7786235161, 'Jack'   , 'Steven'   , '12 Liberty Street' , 'Harrisburgh',33333, 'PA',6);
insert into directory values(7786452231, 'Britney', 'Cook'     , '231 June Street'   , 'Harrisburgh',33333, 'PA',6);
insert into directory values(7686452124, 'Anna'   , 'Nilson'   , '111 June Street'   , 'Harrisburgh',33333, 'PA',7);
insert into directory values(7686452231, 'Katie'  , 'Jackson'  , '89  June Street'   , 'Harrisburgh',33333, 'PA',7);
insert into directory values(7686452345, 'Clare'  , 'Green'    , '24  June Street'   , 'Harrisburgh',33333, 'PA',7);
insert into directory values(2146452231, 'Bree'   , 'Julia'    , '11  Center Ave'   , 'Butler',13421, 'PA',8);
insert into directory values(2146452345, 'Ben'    , 'Cooper'   , '14  Center Ave'   , 'Butler',13421, 'PA',8);

insert into customers values(123456789, 'Michael', 'Johnson',  4121231231, 4121232131,'320 Fifth Avenue', 'Pittsburgh', 15213,'PA',300,'01-JAN-91',100);
insert into customers values(123232343, 'Kate'   , 'Stevenson',4124564564, 4123121231,'310 Fifth Avenue', 'Pittsburgh', 15213,'PA',300,'05-FEB-90',100);
insert into customers values(445526754, 'Bill'   , 'Stevenson',4127897897, 4123121231,'310 Fifth Avenue', 'Pittsburgh', 15213,'PA',600,'11-DEC-92',50);
insert into customers values(254678898, 'Richard', 'Hurson'   ,4127417417, 4127417612,'340 Fifth Avenue', 'Pittsburgh', 15213,'PA',600,'03-OCT-89',500);
insert into customers values(256796533, 'Mary'   , 'Davis'    ,4122582582, 4122581324,'350 Fifth Avenue', 'Pittsburgh', 15217,'PA',100,'04-MAR-93',1000);
insert into customers values(245312567, 'Frank'  , 'Shaw'     ,4843504021, 4843504245,'23 Fifth Avenue' , 'Allentown' , 14213,'PA',0,'05-JUN-87',50);
insert into customers values(251347682, 'Jones'  , 'Steward'  ,7248889898, null, '350 Fifth Avenue' , 'Philadelphia' ,  22222,'PA',150,'04-JAN-90',500);
insert into customers values(312567834, 'James'  , 'Sam'      ,7249879879, 7249871253,'1210ForbesAvenue','Philadelphia',22132,'PA',100,'15-AUG-88',100);
insert into customers values(421356312, 'Liam'   , 'Allen'    ,4846235161, null, '345 Craig Street' , 'Allentown'    ,  14213,'PA',0  ,'16-SEP-92',100);
insert into customers values(452167351, 'Justin' , 'Blosser'  ,4846452231, 4846452124,'231 Tenth Street' , 'Allentown', 14213,'PA',300,'01-MAY-90',100);

insert into records values(4121231231, 4124564564, to_timestamp('25-DEC-17:11:05','DD-MON-RR:HH24:MI'), 300,'CALL');
insert into records values(4121231231, 7247779797, to_timestamp('25-DEC-17:17:10','DD-MON-RR:HH24:MI'), 300,'CALL');
insert into records values(4124564564, 7247778787, to_timestamp('08-AUG-19:11:05','DD-MON-RR:HH24:MI'), 300,'CALL');
insert into records values(7248889898, 7247779797, to_timestamp('15-AUG-19:14:17','DD-MON-RR:HH24:MI'), 60,'CALL');
insert into records values(7248889898, 7247778787, to_timestamp('01-SEP-19:11:03','DD-MON-RR:HH24:MI'), 300,'CALL');
insert into records values(7249879879, 7248889898, to_timestamp('03-SEP-19:17:24','DD-MON-RR:HH24:MI'), 100,'CALL');
insert into records values(4127417417, 7249879879, to_timestamp('05-SEP-19:18:24','DD-MON-RR:HH24:MI'), 123,'CALL');
insert into records values(4843504021, 4846235161, to_timestamp('07-SEP-19:15:23','DD-MON-RR:HH24:MI'), 50,'CALL');
insert into records values(4846235161, 4846452231, to_timestamp('23-SEP-19:12:23','DD-MON-RR:HH24:MI'), 120,'CALL');
insert into records values(4846452231, 7248884545, to_timestamp('25-SEP-19:13:34','DD-MON-RR:HH24:MI'), 200,'CALL');
insert into records values(6243780132, 6242311322, to_timestamp('26-SEP-19:23:12','DD-MON-RR:HH24:MI'), 200,'CALL');
insert into records values(6241456123, 6241121342, to_timestamp('30-SEP-19:23:11','DD-MON-RR:HH24:MI'), 100,'CALL');
insert into records values(4121231231, 6241121342, to_timestamp('02-OCT-19:11:22','DD-MON-RR:HH24:MI'), 200,'CALL');
insert into records values(4121231231, 7773504021, to_timestamp('01-AUG-19:23:05','DD-MON-RR:HH24:MI'), 300,'CALL');
insert into records values(4121231231, 7773504245, to_timestamp('02-AUG-19:13:10','DD-MON-RR:HH24:MI'), 300,'CALL');
insert into records values(4124564564, 7776235161, to_timestamp('08-AUG-19:14:05','DD-MON-RR:HH24:MI'), 300,'CALL');
insert into records values(7776452231, 4121231231, to_timestamp('15-AUG-19:21:17','DD-MON-RR:HH24:MI'), 60,'CALL');
insert into records values(7248889898, 7776452231, to_timestamp('01-SEP-19:13:03','DD-MON-RR:HH24:MI'), 300,'CALL');
insert into records values(7776235161, 7248889898, to_timestamp('03-SEP-19:15:24','DD-MON-RR:HH24:MI'), 100,'CALL');
insert into records values(4127417417, 2133504021, to_timestamp('05-SEP-19:16:24','DD-MON-RR:HH24:MI'), 123,'CALL');
insert into records values(2133504245, 4122582582, to_timestamp('07-SEP-19:11:23','DD-MON-RR:HH24:MI'), 50,'CALL');
insert into records values(2136452231, 4122582582, to_timestamp('23-SEP-19:14:23','DD-MON-RR:HH24:MI'), 120,'CALL');
insert into records values(4846452231, 2136452231, to_timestamp('25-SEP-19:21:34','DD-MON-RR:HH24:MI'), 200,'CALL');
insert into records values(4846452231, 2136235161, to_timestamp('26-SEP-19:22:12','DD-MON-RR:HH24:MI'), 200,'CALL');
insert into records values(2133504021, 4846452231, to_timestamp('30-SEP-19:12:11','DD-MON-RR:HH24:MI'), 100,'CALL');
insert into records values(4121231231, 2133504021, to_timestamp('02-OCT-19:18:22','DD-MON-RR:HH24:MI'), 200,'CALL');
insert into records values(7686452231, 4122582582, to_timestamp('23-SEP-19:16:23','DD-MON-RR:HH24:MI'), 230,'CALL');
insert into records values(4846452231, 7686452124, to_timestamp('25-SEP-19:22:34','DD-MON-RR:HH24:MI'), 120,'CALL');
insert into records values(4846452231, 7686452231, to_timestamp('26-SEP-19:23:12','DD-MON-RR:HH24:MI'), 300,'CALL');
insert into records values(7686452231, 4846452231, to_timestamp('01-OCT-19:12:11','DD-MON-RR:HH24:MI'), 160,'CALL');
insert into records values(4121231231, 7686452345, to_timestamp('04-OCT-19:18:22','DD-MON-RR:HH24:MI'), 550,'CALL');
insert into records values(4121231231, 7783504245, to_timestamp('04-AUG-19:18:22','DD-MON-RR:HH24:MI'), 400,'CALL');
insert into records values(7783504021, 4122582582, to_timestamp('25-SEP-19:22:23','DD-MON-RR:HH24:MI'), 250,'CALL');
insert into records values(4846452231, 7786235161, to_timestamp('05-OCT-19:16:34','DD-MON-RR:HH24:MI'), 130,'CALL');
insert into records values(4121231231, 2146452231, to_timestamp('06-AUG-19:18:22','DD-MON-RR:HH24:MI'), 100,'CALL');
insert into records values(2146452231, 4122582582, to_timestamp('27-SEP-19:19:23','DD-MON-RR:HH24:MI'), 550,'CALL');
insert into records values(4846452231, 2146452345, to_timestamp('10-OCT-19:20:34','DD-MON-RR:HH24:MI'), 150,'CALL');
insert into records values(4843504021, 4846235161, to_timestamp('13-OCT-19:15:23','DD-MON-RR:HH24:MI'), 50,'CALL');
insert into records values(4846235161, 4846452231, to_timestamp('13-OCT-19:12:23','DD-MON-RR:HH24:MI'), 120,'CALL');
insert into records values(4846452231, 4846235161, to_timestamp('25-OCT-19:13:34','DD-MON-RR:HH24:MI'), 200,'CALL');
insert into records values(6243780132, 6242311322, to_timestamp('01-NOV-19:23:12','DD-MON-RR:HH24:MI'), 200,'CALL');
insert into records values(6241456123, 6241121342, to_timestamp('05-NOV-19:23:11','DD-MON-RR:HH24:MI'), 100,'CALL');
insert into records values(7248889898, 7247779797, to_timestamp('25-DEC-19:10:17','DD-MON-RR:HH24:MI'), 60,'CALL');
insert into records values(7248889898, 7247779797, to_timestamp('25-DEC-19:15:17','DD-MON-RR:HH24:MI'), 120,'CALL');

insert into statements values(4121231231, '01-AUG-19','31-AUG-19', 250, 0, 39.99,  0);
insert into statements values(4124564564, '01-AUG-19','31-AUG-19', 600, 0, 299.99, 200.99);
insert into statements values(4127897897, '01-AUG-19','31-AUG-19', 650, 0, 59.99,  0);
insert into statements values(4127417417, '01-AUG-19','31-AUG-19', 517, 0, 49.99,  49.99);
insert into statements values(4122582582, '01-AUG-19','31-AUG-19', 500, 0, 139.99, 39.99);
insert into statements values(4843504021, '01-AUG-19','31-AUG-19', 230, 0, 59.99,  0);
insert into statements values(7248889898, '01-AUG-19','31-AUG-19', 50,  0, 25.99,  25.99);
insert into statements values(7249879879, '01-AUG-19','31-AUG-19', 700, 0, 159.99, 50);
insert into statements values(4846235161, '01-AUG-19','31-AUG-19', 200, 0, 199.99, 100);
insert into statements values(4846452231, '01-AUG-19','31-AUG-19', 500, 0, 179.99, 59.99);

insert into payments values(4121231231, '05-AUG-19', 39.99, 123456789);
insert into payments values(4121231231, '04-SEP-19', 39.99, 123456789);
insert into payments values(4124564564, '03-AUG-19', 100, 123232343);
insert into payments values(4127897897, '06-AUG-19', 39.99, 445526754);
insert into payments values(4127417417, '06-AUG-19', 10.00, 254678898);
insert into payments values(4121231231, '05-Aug-18', 39.99, 123456789);
insert into payments values(4121231231, '04-Sep-18', 39.99, 123456789);
insert into payments values(4124564564, '03-Aug-18', 100, 123232343);
insert into payments values(4127897897, '06-Aug-18', 39.99, 445526754);
insert into payments values(4127417417, '06-Aug-18', 10.00, 254678898);

commit;

-- commit;

-- 8. Write the following SQL queries.
-- (a) Retrieve full name, cell phone, and the corrected total amount due for each customer,
-- such that customers who live in Pittsburgh city get a credit of $20, and customers who
-- live in Philadelphia get a credit of $15. (Refer to HW#6 Q1d for hints).
select (c.fname || ' ' || c.lname) as full_name, c.cell_pn,
       case
        when total_due is null and total_paid is not null and city = 'Pittsburgh' then -total_paid + 20
        when total_due is null and total_paid is not null and city = 'Philadelphia' then -total_paid + 15
        when total_paid is null and total_due is not null and city = 'Pittsburgh' then total_due + 20
        when total_paid is null and total_due is not null and city = 'Philadelphia' then total_due + 15
        when (total_due - total_paid) is null and city = 'Pittsburgh' then 20
        when (total_due - total_paid) is null and city = 'Philadelphia' then 15
        else (total_due - total_paid ) end as balance
from customers c
    left outer join
    (select c1.cell_pn, sum(amount_due)/count(c1.cell_pn) as total_due, sum(amount_paid) as total_paid
    from customers c1
        left join payments p on c1.cell_pn = p.cell_pn
        join statements s on c1.cell_pn = s.cell_pn
        group by c1.cell_pn) CTDP on c.cell_pn = ctdp.cell_pn
order by balance desc;

-- (b) Retrieve company name, company state, and company amount due for the period be-
-- tween April 1, 2019 and July 31, 2019, such that companies located in PA have a $0.05
-- decrease in their charge rate, and the rest have an increase of $0.10 increase in their
-- charge rate. (For companies other than P Mobile, the minimum charge rate possible is
-- $0.01, and no negative values are accepted). That is:
--      i. If the state is Pennsylvania and the company is not P Mobile, decrease the rate by
--          S0.05 (negative charge rates are not valid).
--      ii. If the state other than Pennsylvania, increase the rate by 0.10.
select c.comp_name, c.state,
       case
        when b.start_date = '01-APR-19' and b.end_date = '31-JUL-19' and c.state = 'PA' and c.comp_id != 1
            then (c.charge_rate - 0.05) * b.amount_due
        when b.start_date = '01-APR-19' and b.end_date = '31-JUl-19' and c.state != 'PA' and c.comp_id != 1
            then (c.charge_rate + 0.10) * b.amount_due
        else (0.01 * b.amount_due) end as amount_due
from company c left outer join comp_bill b on c.comp_ID = b.comp_ID;

-- 9. Write the following triggers. You are encouraged to create views
-- in order to help you write your triggers.
-- (a) Write a trigger called DISPLAY LATEST DUES that whenever the charge rate fields
-- in the COMPANY table is about to be changed, it displays the latest amount due for
-- that company.
create or replace trigger display_latest_dues
    after insert or update of charge_rate
    on company
    for each row
    begin
        select c.comp_name, b.amount_due
        from company c left outer join comp_bill b on c.comp_ID = b.comp_ID;
    end;

-- (b) Write a trigger called BILLING that updates the statement total minutes whenever a
-- call is done.
create or replace trigger billing
    after insert or update of duration
    on records
    for each row
    begin
        update statements
        set total_minutes = total_minutes + duration
        where from_pn = cell_pn;
    end;


-- 11. Verify the triggers you created above.
-- (a) Test the trigger DISPLAY LATEST DUES in 3 steps:
--      i. Display the content of COMPANY.
        select t.* from MOD20.COMPANY t;
--      ii. Update the charge rate for a certain company through your created procedure.
        update company set charge_rate = 0.5 where comp_ID = 1;
--      iii. Display the content of COMPANY.
        select t.* from MOD20.COMPANY t;


-- (b) Test the trigger BILLING in 3 steps:
--      i. Display the content of RECORED.
        select t.* from MOD20.RECORDS t;
--      ii. Add a record that reflects a call.
        insert into records values(7248889898, 7247779797, to_timestamp('25-DEC-19:20:17','DD-MON-RR:HH24:MI'), 120,'CALL')
--      iii. Display the content of STATEMETNS.
        select t.* from MOD20.RECORDS t;









