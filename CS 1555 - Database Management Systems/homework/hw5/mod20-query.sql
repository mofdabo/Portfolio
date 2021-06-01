-- Mouhammadou Dabo (mod20)

-- Express the following queries in SQL and answer them using the database
-- you have created above. Do not use any views.
-- (a) List the full names (as one attribute) of P Mobile customers who live in Pittsburgh and
-- whose free SMSs is more than 100.
select (fname || ' ' || lname) as full_name
from customers
where city = 'Pittsburgh' and free_SMS > 100;

-- (b) List the first name, last name and phone number of all customers who owe more than
-- $90. List them in ascending order of amount due.
select c.fname, c.lname, c.cell_pn
from customers c join statements s on c.cell_pn = s.cell_pn
where amount_due > 90
order by amount_due asc;

-- (c) For each customer, list all phone numbers of people who sent SMSs to that customer in
-- a descending order of the SMS timestamp.
select c.fname, c.lname, r.from_pn
from customers c join records r on c.cell_pn = r.to_pn
where r.type = 'sms'
order by r.start_timestamp desc;

-- (d) Calculate the average length of a phone call in September 2019.
select round(avg(r.duration), 3) as avg_length
from statements s join records r on s.cell_pn = r.from_pn
where s.start_date = '01-SEP-19' and r.type = 'call';

-- (e) Calculate the total amount of payments due for the month of September 2019 for each
-- zip code. List them in an ascending order.
select c.zip, count(s.amount_due) as total_payments
from customers c join statements s on c.cell_pn = s.cell_pn
group by zip
order by count(s.amount_due) asc;

-- (f) Find the first and last name of the customer who made the longest phone call on Jan
-- 1st, 2019.
select distinct c.fname, c.lname
from customers c join records r on c.cell_pn = r.from_pn
where r.type = 'call'
  and r.start_timestamp >= to_timestamp('2019-01-01', 'yyyy-mm-dd')
  and r.start_timestamp < to_timestamp('2019-01-02', 'yyyy-mm-dd')
  and r.duration = (select max(r.duration) from customers c join records r on c.cell_pn = r.from_pn);

-- (g) List the number of P Mobile customers in each state.
select state, count(state) as num_customers
from customers
group by state;

-- (h) List the full names of P Mobile customers who has not made any calls for the last 7
-- months.
select distinct (fname || ' ' || lname) as full_name
from customers c join records r on c.cell_pn = r.from_pn
where r.type = 'call' and months_between(current_date, r.start_timestamp) > 7;

-- (i) List the top 2 cities with the highest local traffic (i.e., maximum number of local calls).
-- A local call is one where both the caller and dialed numbers are in the same city.