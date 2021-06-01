--=======================================================
-- INSERT THE DATA AFTER Q#6 AND BEFORE Q#7
--=======================================================

INSERT INTO COMPANY(comp_ID,comp_name,street,city,zip,state,charge_rate) values(1,'P_Mobile','210 Sennott Square','Pittsburgh',15260,'PA',0);
INSERT INTO COMPANY(comp_ID,comp_name,street,city,zip,state,charge_rate) values(2,'K_tele','22 2nd Ave','Philadelphia',22222,'PA',0.15);
INSERT INTO COMPANY(comp_ID,comp_name,street,city,zip,state,charge_rate) values(3,'L_tele','33 3rd Ave','Tridelphia',16161,'WV',0.20);
INSERT INTO COMPANY(comp_ID,comp_name,street,city,zip,state,charge_rate) values(4,'M_tele','44 4th Ave','Butler',13421,'PA',0.15);
INSERT INTO COMPANY(comp_ID,comp_name,street,city,zip,state,charge_rate) values(5,'D_tele','55 5th Ave','Harrisburgh',33333,'PA',0.10);
INSERT INTO COMPANY(comp_ID,comp_name,street,city,zip,state,charge_rate) values(6,'D_Mobile','66 6th Ave','Harrisburgh',33333,'PA',0.10);
INSERT INTO COMPANY(comp_ID,comp_name,street,city,zip,state,charge_rate) values(7,'H_tele','67 Center Ave','Harrisburgh',33333,'PA',0.10);
INSERT INTO COMPANY(comp_ID,comp_name,street,city,zip,state,charge_rate) values(8,'M_Mobile','46 6th Ave','Butler',13421,'PA',0.15);

INSERT INTO COMP_BILL(comp_ID,start_date,end_date,total_minutes,amount_due) values(2,'01-APR-19','31-MAY-19',16500,002475.00);
INSERT INTO COMP_BILL(comp_ID,start_date,end_date,total_minutes,amount_due) values(3,'01-APR-19','31-MAY-19',26771,005354.20);
INSERT INTO COMP_BILL(comp_ID,start_date,end_date,total_minutes,amount_due) values(4,'01-APR-19','31-MAY-19',16500,002475.00);
INSERT INTO COMP_BILL(comp_ID,start_date,end_date,total_minutes,amount_due) values(5,'01-APR-19','31-MAY-19',26771,002677.10);
INSERT INTO COMP_BILL(comp_ID,start_date,end_date,total_minutes,amount_due) values(6,'01-APR-19','31-MAY-19',26771,002677.10);
INSERT INTO COMP_BILL(comp_ID,start_date,end_date,total_minutes,amount_due) values(7,'01-APR-19','31-MAY-19',26771,002677.10);
INSERT INTO COMP_BILL(comp_ID,start_date,end_date,total_minutes,amount_due) values(8,'01-APR-19','31-MAY-19',16500,002475.00);
INSERT INTO COMP_BILL(comp_ID,start_date,end_date,total_minutes,amount_due) values(2,'01-JUN-19','31-JUL-19',17394,002609.10);
INSERT INTO COMP_BILL(comp_ID,start_date,end_date,total_minutes,amount_due) values(3,'01-JUN-19','31-JUL-19',28456,005691.20);
INSERT INTO COMP_BILL(comp_ID,start_date,end_date,total_minutes,amount_due) values(4,'01-JUN-19','31-JUL-19',17394,002609.10);
INSERT INTO COMP_BILL(comp_ID,start_date,end_date,total_minutes,amount_due) values(5,'01-JUN-19','31-JUL-19',28456,002845.60);
INSERT INTO COMP_BILL(comp_ID,start_date,end_date,total_minutes,amount_due) values(6,'01-JUN-19','31-JUL-19',28456,002845.60);
INSERT INTO COMP_BILL(comp_ID,start_date,end_date,total_minutes,amount_due) values(7,'01-JUN-19','31-JUL-19',28456,002845.60);
INSERT INTO COMP_BILL(comp_ID,start_date,end_date,total_minutes,amount_due) values(8,'01-JUN-19','31-JUL-19',17394,002609.10);

COMMIT;
