-- Mouhammadou Dabo (mod20)
-- Drop tables so the database does not have pre-existed tables
drop table directory cascade constraints;
drop table customers cascade constraints;
drop table records cascade constraints;
drop table statements cascade constraints;
drop table payments cascade constraints;


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
    constraint statements_fk_pn foreign key(cell_pn) references customers(cell_pn),
    constraint statements_uk unique(cell_pn, end_date)
);

create table payments(
    cell_pn     number(10),
    paid_on     timestamp,
    amount_paid number(6,2),
    constraint payments_pk primary key (cell_pn, paid_on),
    constraint payments_fk_pn foreign key(cell_pn) references customers(cell_pn)
);

-- 3. Use ALTER TABLE statement to incorporate the following
-- information/constraints in the P Mobile Database.

-- (a) In each table, add a Unique constraint for every of its alternate keys
alter table records add constraint records_uk unique(to_pn, start_timestamp);
alter table statements add constraint statements_uk2 unique(end_date, cell_pn);

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