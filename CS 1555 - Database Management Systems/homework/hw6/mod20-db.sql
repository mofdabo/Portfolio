-- Mouhammadou Dabo (mod20)

-- 1. Create the following views:
-- (a) A views named `PA NOT CUSTOMERS' that lists the full name, phone number, and
-- the city of people who are not customers of P Mobile and live in Pennsylvania state.

create or replace view PA_NOT_CUSTOMERS as
select distinct (d.fname || ' ' || d.lname) as full_name, d.pn, d.state
from directory d
where (d.fname || ' ' || d.lname) not in (select (c.fname || ' ' || c.lname) from customers c)
    and d.state = 'PA';

-- select * from PA_NOT_CUSTOMERS;

-- (b) A materialized view named `MV PA CUSTOMERS' that lists the full name, phone
-- number, and the city of people who are customers of P Mobile and live in Pennsylvania
-- state.
drop materialized view MV_PA_CUSTOMERS;

create materialized view MV_PA_CUSTOMERS as
select (c.fname || ' ' || c.lname) as full_name, c.cell_pn, c.city
from customers c
where c.state = 'PA';

-- select * from MV_PA_CUSTOMERS;

-- (c) A view named `NUMBER OF RECEIVED CALLS' that lists the phone number of customers
-- along with the number of calls they have received.
create or replace view NUMBER_OF_RECEIVED_CALLS as
select c.cell_pn, count(r.to_pn) as num
from customers c join records r on c.cell_pn = r.from_pn
group by c.cell_pn;

-- select * from NUMBER_OF_RECEIVED_CALLS;

-- (d) A materialized view named `MV OUTSTANDING BAL' that lists full name, cell phone,
-- and balance (i.e., the difference between the amount due and amount paid in total) of
-- all customers in a descending order based on the balance. (NULLs are not accepted in
-- the result, if a customer has no balance (NULL balance), then the value should be 0).
drop materialized view MV_OUTSTANDING_BAL;

create materialized view MV_OUTSTANDING_BAL as
select (c.fname || ' ' || c.lname) as full_name, c.cell_pn, (s.amount_due - (sum(p.amount_paid))) as balance
from customers c, statements s, payments p where c.cell_pn = s.cell_pn and s.cell_pn = p.cell_pn
group by c.fname, c.lname, c.cell_pn, s.amount_due
order by balance desc;

-- select * from MV_OUTSTANDING_BAL;

-- 2. Write SQL statements that answer the following queries. Use ONLY the views
-- created above or create your appropriate view. Note that a credit balance means that the
-- customer paid more than what they owe, that is, their balance is less than 0.
-- (a) List the full name and cell phone number of the customer(s) who has the
-- maximum credit (i.e., minimum balance) in their account(s).
select full_name, cell_pn
from (select full_name, cell_pn, balance
      from MV_OUTSTANDING_BAL
      group by full_name, cell_pn, balance
      order by balance asc)
where rownum = 1;

-- (b) List the full name, outstanding balance, and number of received calls of the
-- customer who received the most calls from P Mobile customers.
select full_name, balance
from (select full_name, balance, max(num) as received_calls
        from MV_OUTSTANDING_BAL b join NUMBER_OF_RECEIVED_CALLS c on b.CELL_PN = c.CELL_PN
        group by full_name, balance
        order by received_calls desc)
where rownum = 1;

-- (c) List the full name and cell phone number of the customer(s) who has the
-- lowest outstanding balance excluding the ones that have credit in their accounts.
select full_name, cell_pn
from (select full_name, cell_pn, balance
        from MV_OUTSTANDING_BAL
        group by full_name, cell_pn, balance
        having balance >= 0
        order by balance asc)
where rownum = 1;

-- (d) Find the ratio of number of people who are not P Mobile customers and live
-- in Pittsburgh to the total number of people living in Pittsburgh (i.e., percentage of
-- potential market for P Mobile in Pittsburgh).



-- 3. INSERT the following tuples into your database:
-- (a) A payment of $90 to the account 4124564564 on February 2nd, 2020.
insert into payments (cell_pn, paid_on, amount_paid, payer_SSN)
values (4124564564, '02-FEB-20 12.00.00.000000 AM', 90, 123232343);

-- delete from payments
-- where cell_pn = 4124564564 and paid_on = '02-FEB-20 12.00.00.000000 AM';
-- commit;

-- (b) A person (non customer) with the following information:
--      i. Name: John Do
--      ii. Phone: 1234565089
--      iii. Street: 123 Cool St
--      iv. City: Pittsburgh
--      v. State: PA
--      vi. Zip: 15213
insert into directory (pn, fname, lname, street, city, zip, state)
values (1234565089, 'John', 'Do', '123 Cool St', 'Pittsburgh', 15213, 'PA');

-- delete from directory
-- where pn = 1234565089;
-- commit;


-- 4. Run the following queries:
-- (a) SELECT * FROM MV OUTSTANDING BAL WHERE cell pn = 4124564564;
select * from MV_OUTSTANDING_BAL where cell_pn = 4124564564;

-- (b) SELECT * FROM PA NOT CUSTOMERS WHERE pn = 1234565089;
select * from PA_NOT_CUSTOMERS where pn = 1234565089;

-- Now,
-- 1) refresh the materialized view `MV OUTSTANDING BAL',
begin
DBMS_MVIEW.refresh('MV_OUTSTANDING_BAL');
end;
-- 2) re-run the above SELECT
-- statements, and
select * from MV_OUTSTANDING_BAL where cell_pn = 4124564564;
select * from PA_NOT_CUSTOMERS where pn = 1234565089;

-- 3) record your observations from the run before the refresh, and the
-- run after the refresh. (include your answers as a comment in your `db' script)

-- Before the refresh the first select displayed Kate Stevenson, her cell phone number and having a balance of 100.99,
-- and the second select didn't display any information. After the refresh, the first select displayed Kate Stevenson,
-- her cell phone number and having a balance of 10.99, and the second select displays John Do, his phone number and state.
