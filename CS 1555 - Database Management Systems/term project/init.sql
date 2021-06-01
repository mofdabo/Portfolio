-- Mouhammadou Dabo (mod20)
-- init.sql: the script to initialize the tables

-- USER_ROLE inserts
insert into user_role (role_id, role_name)
    values (1, 'Organizer');
insert into user_role (role_id, role_name)
    values (2, 'Coach');
insert into user_role (role_id, role_name)
    values (3, 'Guest');
commit;

-- USER_ACCOUNT inserts
insert into user_account (user_id, username, passkey, role_id, last_login)
    values(user_account_seq.nextval, 'Carlos Arthur Nuzman', 'Rio', 1,'14-APR-2020');
insert into user_account (user_id, username, passkey, role_id, last_login)
    values(user_account_seq.nextval, 'Gianna Angelopoulos', 'Athens', 1,'14-APR-2020');
insert into user_account (user_id, username, passkey, role_id, last_login)
    values(user_account_seq.nextval, 'Hu Jintao', 'Beijing', 1,'14-APR-2020');
insert into user_account (user_id, username, passkey, role_id, last_login)
    values(user_account_seq.nextval, 'Sebastian Coe', 'London',	1,'14-APR-2020');
insert into user_account (user_id, username, passkey, role_id, last_login)
    values(user_account_seq.nextval, 'USASwimM', 'USAS', 2,'14-APR-2020' );
insert into user_account (user_id, username, passkey, role_id, last_login)
    values(user_account_seq.nextval, 'CROSwimM', 'CROS', 2,'14-APR-2020');
insert into user_account (user_id, username, passkey, role_id, last_login)
    values(user_account_seq.nextval, 'RSASwimM', 'RSAS', 2,'14-APR-2020');
insert into user_account (user_id, username, passkey, role_id, last_login)
    values(user_account_seq.nextval, 'SWESwimM', 'SWES', 2,'14-APR-2020');
insert into user_account (user_id, username, passkey, role_id, last_login)
    values(user_account_seq.nextval, 'AUSSwimM', 'AUSS', 2,'14-APR-2020');
insert into user_account (user_id, username, passkey, role_id, last_login)
    values(user_account_seq.nextval, 'UKRSwimM', 'UKRS', 2,'14-APR-2020');
insert into user_account (user_id, username, passkey, role_id, last_login)
    values(user_account_seq.nextval, 'DZASwimM', 'DZAS', 2,'14-APR-2020');
insert into user_account (user_id, username, passkey, role_id, last_login)
    values(user_account_seq.nextval, 'USATrackM', 'USAT', 2,'14-APR-2020');
insert into user_account (user_id, username, passkey, role_id, last_login)
    values(user_account_seq.nextval, 'PRTTrackM', 'PRTT', 2,'14-APR-2020');
insert into user_account (user_id, username, passkey, role_id, last_login)
    values(user_account_seq.nextval, 'JAMTrackM', 'JAMT', 2,'14-APR-2020');
insert into user_account (user_id, username, passkey, role_id, last_login)
    values(user_account_seq.nextval, 'KNATrackM', 'KNAT', 2,'14-APR-2020');
insert into user_account (user_id, username, passkey, role_id, last_login)
    values(user_account_seq.nextval, 'BRBTrackM', 'BRBT', 2,'14-APR-2020');
insert into user_account (user_id, username, passkey, role_id, last_login)
    values(user_account_seq.nextval, 'BELTennisF', 'BELT', 2,'14-APR-2020');
insert into user_account (user_id, username, passkey, role_id, last_login)
    values(user_account_seq.nextval, 'FRATennisF', 'FRAT', 2,'14-APR-2020');
insert into user_account (user_id, username, passkey, role_id, last_login)
    values(user_account_seq.nextval, 'AUSTennisF', 'AUST', 2,'14-APR-2020');
insert into user_account (user_id, username, passkey, role_id, last_login)
    values(user_account_seq.nextval, 'RUSTennisF', 'RUST', 2,'14-APR-2020');
insert into user_account (user_id, username, passkey, role_id, last_login)
    values(user_account_seq.nextval, 'CHNDivingF', 'CHND', 2,'14-APR-2020');
insert into user_account (user_id, username, passkey, role_id, last_login)
    values(user_account_seq.nextval, 'RUSDivingF', 'RUSD', 2,'14-APR-2020');
insert into user_account (user_id, username, passkey, role_id, last_login)
    values(user_account_seq.nextval, 'AUSDivingF', 'AUSD', 2,'14-APR-2020');
insert into user_account (user_id, username, passkey, role_id, last_login)
    values(user_account_seq.nextval, 'JAMTrackF', 'JAMT', 2,'14-APR-2020');
insert into user_account (user_id, username, passkey, role_id, last_login)
    values(user_account_seq.nextval, 'RUSTrackF', 'RUST', 2,'14-APR-2020');
insert into user_account (user_id, username, passkey, role_id, last_login)
    values(user_account_seq.nextval, 'FRATrackF', 'FRAT', 2,'14-APR-2020');
insert into user_account (user_id, username, passkey, role_id, last_login)
    values(user_account_seq.nextval, 'NLDSwimM', 'NEDS', 2,'14-APR-2020');
insert into user_account (user_id, username, passkey, role_id, last_login)
    values(user_account_seq.nextval, 'BRASwimM','BRAS',	2,'14-APR-2020');
insert into user_account (user_id, username, passkey, role_id, last_login)
    values(user_account_seq.nextval, 'FRASwimM','FRAS',	2,'14-APR-2020');
insert into user_account (user_id, username, passkey, role_id, last_login)
    values(user_account_seq.nextval, 'TTOTrackM','TTOT', 2,'14-APR-2020');
insert into user_account (user_id, username, passkey, role_id, last_login)
    values(user_account_seq.nextval, 'NLDTrackM','NLDT', 2,'14-APR-2020');
insert into user_account (user_id, username, passkey, role_id, last_login)
    values(user_account_seq.nextval, 'CHNTennisF','CHNT', 2,'14-APR-2020');
insert into user_account (user_id, username, passkey, role_id, last_login)
    values(user_account_seq.nextval, 'DEUDivingF','DEUD', 2,'14-APR-2020');
insert into user_account (user_id, username, passkey, role_id, last_login)
    values(user_account_seq.nextval, 'BELTrackF','BELT', 2,'14-APR-2020');
insert into user_account (user_id, username, passkey, role_id, last_login)
    values(user_account_seq.nextval, 'NGATrackF','NGAT', 2,'14-APR-2020');
insert into user_account (user_id, username, passkey, role_id, last_login)
    values(user_account_seq.nextval, 'BRATrackF','BRAT', 2,'14-APR-2020');
insert into user_account (user_id, username, passkey, role_id, last_login)
    values(user_account_seq.nextval, 'FRASwimM2','FRAS2', 2,'14-APR-2020');
insert into user_account (user_id, username, passkey, role_id, last_login)
    values(user_account_seq.nextval, 'TTOSwimM','TTOS',	2,'14-APR-2020');
insert into user_account (user_id, username, passkey, role_id, last_login)
    values(user_account_seq.nextval, 'USATennisF', 'USAT', 2,'14-APR-2020');
insert into user_account (user_id, username, passkey, role_id, last_login)
    values(user_account_seq.nextval, 'BLRTennisF', 'BLRT', 2,'14-APR-2020');
insert into user_account (user_id, username, passkey, role_id, last_login)
    values(user_account_seq.nextval, 'USADivingF', 'USAD', 2,'14-APR-2020');
insert into user_account (user_id, username, passkey, role_id, last_login)
    values(user_account_seq.nextval, 'CANDivingF', 'CAND', 2,'14-APR-2020');
insert into user_account (user_id, username, passkey, role_id, last_login)
    values(user_account_seq.nextval, 'USATrackF', 'USAT', 2,'14-APR-2020');
insert into user_account (user_id, username, passkey, role_id, last_login)
    values(user_account_seq.nextval, 'UKRTrackF', 'UKRT', 2,'14-APR-2020');
insert into user_account (user_id, username, passkey, role_id, last_login)
    values(user_account_seq.nextval, 'RUSSwimM', 'RUSS', 2,'14-APR-2020');
insert into user_account (user_id, username, passkey, role_id, last_login)
    values(user_account_seq.nextval, 'Guest', 'GUEST', 3,'14-APR-2020');
commit;


-- OLYMPICS inserts
insert into olympics (olympic_id,olympic_num,host_city,opening_date,closing_date,official_website)
    values(olympics_seq.nextval, 'XXVIII','Athens','13-AUG-04','29-AUG-04','https://www.olympic.org/athens-2004');
insert into olympics (olympic_id,olympic_num,host_city,opening_date,closing_date,official_website)
    values(olympics_seq.nextval, 'XXIX','Beijing','08-AUG-08','24-AUG-08','https://www.olympic.org/beijing-2008');
insert into olympics (olympic_id,olympic_num,host_city,opening_date,closing_date,official_website)
    values(olympics_seq.nextval, 'XXX','London','27-JUL-12', '12-AUG-12','https://www.olympic.org/london-2012');
insert into olympics (olympic_id,olympic_num,host_city,opening_date,closing_date,official_website)
    values(olympics_seq.nextval, 'XXXI','Rio de Janeiro','05-AUG-16','21-AUG-16','https://www.olympic.org/rio-2016');
commit;


-- SPORT inserts
insert into sport (sport_id, sport_name, description, dob, team_size)
    values(sport_seq.nextval,'50-m freestyle','swimming competition in with few limited restrictions on their swimming', '01-JAN-96', 1);
insert into sport (sport_id, sport_name, description, dob, team_size)
    values(sport_seq.nextval,'100-m dash','a sprint race in track and field competitions', '01-JAN-96',1);
insert into sport (sport_id, sport_name, description, dob, team_size)
    values(sport_seq.nextval,'tennis singles','a tennis competition that involves two players competing against each other', '01-JAN-96',	1);
insert into sport (sport_id, sport_name, description, dob, team_size)
    values(sport_seq.nextval, 'synchronized 3m springboard','a sport in which two divers dive at the same time as a team','01-JAN-00',2);
insert into sport (sport_id, sport_name, description, dob, team_size)
    values(sport_seq.nextval,'4x100m relay', 'a track event run in lanes over one lap of the track with four runners','01-JAN-12',4);
insert into sport (sport_id, sport_name, description, dob, team_size)
    values(sport_seq.nextval,'4x100 freestyle relay','a relay event in which each of four swimmers on a team swims in sequence','01-JAN-12',4);
commit;

-- PARTICIPANT inserts
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (1,'Gary','Hall','America','Cincinnati Ohio','26-SEP-74');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (2,'Duje','Draganja','Croatia','Split Croatia','27-FEB-83');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (3,'Roland','Schoeman','South Africa','Pretoria South Africa','03-JUL-80');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (4,'Stefan','Nystrand','Sweden','Haninge Sweden','20-OCT-81');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (5,'Jason','Lezak','America','Irvine California','12-NOV-75');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (6,'Brett','Hawke','Australia','Sydney New South Wales','02-JUN-75');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (7,'Oleksandr','Volynets','Ukraine','Ternopil Ukraine','09-OCT-74');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (8,'Salim','Iles','Algeria','Oran Algeria','14-MAY-75');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (9,'USA','SwimM','America','Cincinnati Ohio','29-NOV-60');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (10,'CRO','SwimM','Croatia','Split Croatia','06-SEP-66');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (11,'RSA','SwimM','South Africa','Pretoria South Africa','07-JUL-65');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (12,'SWE','SwimM','Sweden','Haninge Sweden','16-AUG-60');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (13,'AUS','SwimM','Australia','Irvine California','15-SEP-74');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (14,'UKR','SwimM','Ukraine','Ternopil Ukraine','08-SEP-65');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (15,'DZA','SwimM','Algeria','Oran Algeria','18-OCT-69');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (16,'Justin','Gatlin','America','Brooklyn New York','10-FEB-82');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (17,'Francis','Obikwelu','Portugal','Onitsha Nigeria','22-NOV-78');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (18,'Maurice','Greene','America','Kansas City Kansas','23-JUL-74');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (19,'Shawn','Crawford','America','Van Wyck South Carolina','14-JAN-78');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (20,'Asafa','Powell','Jamaica','Spanish Town Jamaica','23-NOV-82');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (21,'Kim','Collins','Saint Kitt and Nevis','Saint Peter Basseterre Parish','05-APR-76');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (22,'Obadele','Thompson','Barbados','Barbados','30-MAR-76');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (23,'USA','TrackM','America','Brooklyn New York','07-APR-65');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (24,'PRT','TrackM','Portugal','Lisbon Portugal','29-NOV-55');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (25,'JAM','TrackM','Jamaica','Spanish Town Jamaica','17-MAR-75');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (26,'KNA','TrackM','Saint Kitt and Nevis','Saint Peter Basseterre Parish','15-SEP-64');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (27,'BRB','TrackM','Barbados','Barbados','24-JUL-66');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (28,'Justine','Henin-Hardenne','Belgium','Liege Belgium','01-JUN-82');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (29,'Amelie','Mauresmo','France','Geneva Switzerland','05-JUL-79');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (30,'Alicia','Molik','Australia','Adelaide South Australia','21-JAN-81');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (31,'Anastasia','Myskina','Russia','Moscow Soviet Union','08-JUL-81');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (32,'BEL','TennisF','Belgium','Liege Belgium','06-FEB-77');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (33,'FRA','TennisF','France','Paris France','14-MAR-65');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (34,'AUS','TennisF','Australia','Adelaide South Australia','08-MAY-67');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (35,'RUS','TennisF','Russia','Moscow Soviet Union','04-APR-66');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (36,'Wu','Minxia','China','Shanghai China','10-NOV-85');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (37,'Guo','Jingjing','China','Baoding China', '15-OCT-81');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (38,'Vera','Ilina','Russia','Soviet Union','20-FEB-74');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (39,'Ioulia','Pakhalina','Russia','Penza Soviet Union','12-SEP-77');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (40,'Irina','Lashko','Australia','Samara Soviet Union','25-JAN-73');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (41,'Chantelle','Newbery','Australia','Melbourne Australia','06-MAY-77');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (42,'CHN','DivingF','China','Shanghai China','15-NOV-75');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (43,'RUS','DivingF','Russia','Penza Soviet Union','29-SEP-67');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (44,'AUS','DivingF','Australia','Melbourne Australia','25-MAY-67');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (45,'Tayna','Lawrence','Jamaica','Spanish Town Jamaica','17-SEP-75');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (46,'Sherone','Simpson','Jamaica','Manchester Parish Jamaica','12-AUG-84');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (47,'Aleen','Bailey','Jamaica','Saint Mary Jamaica','25-NOV-80');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (48,'Veronica','Campbell','Jamaica','Clarks Town Jamaica','15-MAY-82');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (49,'Olga','Fyodorova','Russia','Alapayevsk Russia','14-JUL-83');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (50,'Yuliya','Tabakova','Russia','Russia','01-MAY-80');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (51,'Irina','Khabarova','Russia','Russia','18-MAY-66');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (52,'Larisa','Kruglova','Russia','Russia','27-OCT-72');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (53,'Veronique','Mang','France','Douala Cameroon','15-DEC-84');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (54,'Muriel','Hurtis','France','Bondy France','25-MAR-79');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (55,'Sylviane','Felix','France','Creteil France','31-OCT-77');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (56,'Christine','Arron','France','Les Abymes France','13-SEP-73');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (57,'JAM','TrackF','Jamaica','Spanish Town Jamaica','17-MAR-75');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (58,'RUS','TrackF','Russia','Alapayevsk Russia','14-JUL-73');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (59,'FRA','TrackF','France','Bondy France','25-MAR-69');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (60,'Lyndon','Ferns','South Africa','Polokwane South Africa','24-SEP-83');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (61,'Darian','Townsend','South Africa','Pinetwon South Africa','28-AUG-84');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (62,'Ryk','Neethling','South Africa','Bloemfontein','12-NOV-77');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (63,'Johan','Kenkhuis','Netherlands','Vriezenveen Netherlands','07-MAY-80');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (64,'Mitja','Zastrow','Netherlands','Germany','07-MAR-77');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (65,'Klaas-Erik','Zwering','Netherlands','Eindhoven Netherlands','19-MAY-81');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (66,'Pieter','Hoogenband','Netherlands','Maastricht Netherlands','14-MAR-78');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (67,'Ian','Crocker','United States','Portland Maine','31-AUG-82');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (68,'Michael','Phelps','United States','Baltimore Maryland','30-JUN-85');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (69,'Neil','Walker','United States','Verona Wisconsin','25-JUN-76');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (70,'NLD','SwimM','Netherlands','Vriezenveen Netherlands','07-MAY-60');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (71,'Cesar','Cielo','Brazil','Santa Barbara d''Oeste Brazil','10-JAN-87');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (72,'Amaury','Leveaux','France','Belfort France','02-DEC-85');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (73,'Alain','Bernard','France','Aubagne France','01-MAY-83');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (74,'Ashley','Callus','Australia','Brisbane Queensland','10-MAR-79');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (75,'Ben','Wildman-Tobriner','United States','San Francisco California','21-SEP-84');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (76,'Eamon','Sullivan','Australia','Perth Western Australia','30-AUG-85');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (77,'BRA','SwimM','Brazil','Santa Barbara d''Oeste Brazil','10-JAN-77');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (78,'FRA','SwimM','France','Belfort France','02-DEC-75');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (79,'Usain','Bolt','Jamaica','Sherwood Content Jamaica','21-AUG-86');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (80,'Richard','Thompson','Trinidad and Tobago','Cascade Trinidad & Tobago','07-JUN-85');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (81,'Walter','Dix','United States','Coral Springs Florida','31-JAN-86');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (82,'Churandy','Martina','Netherlands','Willemstad Netherlands','03-JUL-84');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (83,'Michael','Frater','Jamaica','Manchester Jamaica','06-OCT-82');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (84,'Marc','Burns','Trinidad and Tobago','Trinidad and Tobago','07-JAN-83');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (85,'Darvis','Patton','United States','Dallas Texas','04-DEC-77');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (86,'TTO','TrackM','Trinidad and Tobago','Cascade Trinidad & Tobago','07-JUN-75');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (87,'NLD','TrackM','Netherlands','Willemstad Netherlands','03-JUL-84');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (88,'Elena','Dementieva','Russia','Moscow Soviet Union','25-AUG-81');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (89,'Dinara','Safina','Russia','Moscow Soviet Union','27-APR-86');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (90,'Vera','Zvonareva','Russia','Moscow Soviet Union','07-SEP-84');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (91,'Li','Na','China','Wuhan Hubei','26-FEB-82');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (92,'CHN','TennisF','China','Wuhan Hubei','26-FEB-72');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (93,'Julia','Pakhalina','Russia','Penza Soviet Union','12-SEP-77');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (94,'Anastasia','Pozdnyakova','Russia','Elektrostal Soviet Union','11-DEC-85');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (95,'Ditte','Kotzian','Germany','Germany', '09-MAR-79');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (96,'Heike','Fischer','Germany','Demmin Germany','07-SEP-82');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (97,'DEU','DivingF','Germany','Demmin Germany','07-SEP-72');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (98,'Olivia','Borlee','Belgium','Woluwe-Saint-Lambert','10-APR-86');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (99,'Hanna','Marien','Belgium','Herentals Belgium','16-MAY-82');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (100,'Elodie','Ouedraogo','Belgium','Brussels Belgium','27-FEB-81');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (101,'Kim','Gevaert','Belgium','Leuven Belgium','05-AUG-78');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (102,'Franca','Idoko','Nigeria','Benue State Nigeria','15-JUN-85');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (103,'Gloria','Kemasuode','Nigeria','Delta State Nigeria','30-DEC-79');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (104,'Halimat','Ismaila','Nigeria','Ilorin Kwara','03-JUL-84');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (105,'Oludamola','Osayomi','Nigeria','Osun State Nigeria','26-JUN-86');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (106,'Rosemar','Neto','Brazil','Miracatu Brazil','02-JAN-77');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (107,'Lucimar','de Moura','Brazil','Timoteo Brazil','22-MAR-74');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (108,'Thaissa','Presti','Brazil','Sao Paulo Brazil','07-NOV-85');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (109,'Rosangela','Santos','Brazil','Washington DC','20-DEC-90');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (110,'BEL','TrackF','Belgium','Herentals Belgium','16-MAY-72');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (111,'NGA','TrackF','Nigeria','Ilorin Kwara','03-JUL-74');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (112,'BRA','TrackF','Brazil','Sao Paulo Brazil','07-NOV-75');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (113,'Garrett','Weber-Gale','United States','Stevens Point Wisconsin','06-AUG-85');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (114,'Cullen','Jones','Untied States','New York City New York','29-FEB-84');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (115,'Fabien','Gilot','France','Denain France','27-APR-84');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (116,'Frederick','Bousquet','France','Perpignan France','08-APR-81');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (117,'Andrew','Lauterstein','Australia','Melbourne Victoria','22-MAY-87');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (118,'Matt','Targett','Australia','Chertsey England','24-DEC-85');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (119,'FRA','SwimM','France','Denain France','27-APR-74');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (120,'Florent','Manaudou','France','Villeurbanne France','12-NOV-90');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (121,'Bruno','Fratus','Brazil','Macae Brazil','30-JUN-89');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (122,'Anthony','Ervin','United States','Valencia California','26-MAY-81');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (123,'George','Bovell','Trinidad and Tobago','Port of Spain','18-JUL-83');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (124,'TTO','SwimM','Trinidad and Tobago','Port of Spain','18-JUL-73');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (125,'Yohan','Blake','Jamaica','St. James Jamaica','26-DEC-89');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (126,'Ryan','Bailey','United States','Portland Oregon','13-APR-89');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (127,'Tyson','Gay','United States','Lexington Kentucky','09-AUG-82');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (128,'Serena','Williams','United States','Palm Beach Gardens Florida','26-SEP-81');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (129,'Maria','Sharapova','Russia','Nyagan Soviet Union','19-APR-87');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (130,'Victoria','Azarenka','Belarus','Minsk Soviet Union','31-JUL-89');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (131,'Maria','Kirilenko','Russia','Moscow Soviet Union','25-JAN-87');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (132,'USA','TennisF','United States','Palm Beach Gardens Florida','26-SEP-71');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (133,'BLR','TennisF','Belarus','Minsk Soviet Union','31-JUL-79');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (134,'He','Zi','China','Nanning Guangxi','11-DEC-90');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (135,'Kelci','Bryant','United States','Springfield Illinois','15-JAN-89');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (136,'Abigail','Johnston','United States','Upper Arlington Ohio','16-NOV-89');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (137,'Jennifer','Abel','Canada','Montreal Quebec','23-AUG-91');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (138,'Emilie','Heymans','Canada','Brussels Belgium','14-DEC-81');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (139,'USA','DivingF','United States','Springfield Illinois','15-JAN-79');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (140,'CAN','DivingF','Canada','Montreal Quebec','23-AUG-81');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (141,'Tianna','Bartoletta','United States','Elyria Ohio','30-AUG-85');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (142,'Allyson','Felix','United States','Los Angeles California','18-NOV-85');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (143,'Bianca','Knight','United States','Pearl Mississippi','02-JAN-89');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (144,'Carmelita','Jeter','United States','Los Angeles California','24-NOV-79');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (145,'Shelly-Ann','Fraser-Pryce','Jamaica','Kingston Jamaica','27-DEC-86');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (146,'Kerron','Stewart','Jamaica','Jamaica','16-APR-84');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (147,'Olesya','Povh','Ukraine','Ukraine','18-OCT-87');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (148,'Hrystyna','Stuy','Ukraine','Ukraine','03-FEB-88');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (149,'Mariya','Ryemyen','Ukraine','Makiivka Ukraine','02-AUG-87');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (150,'Elyzaveta','Bryzgina','Ukraine','Luhansk Ukraine','28-NOV-89');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (151,'USA','TrackF','United States','Los Angeles California','18-NOV-75');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (152,'UKR','TrackF','Ukraine','Makiivka Ukraine','02-AUG-77');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (153,'Clement','Lefert','France','Nice France','26-SEP-87');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (154,'Yannick','Agnel','France','Nimes France','09-JUN-92');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (155,'Nathan','Adrian','United States','Bremerton Washinton','07-DEC-88');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (156,'Ryan','Lochte','United States','Rochester New York','03-AUG-84');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (157,'Andrey','Grechin','Russia','Barnaul Soviet Union','21-OCT-87');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (158,'Nikita','Lobintsev','Russia','Sverdlovsk Soviet Union','21-NOV-88');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (159,'Vladimir','Morozov','Russia','Novosibirsk Oblast Russia','16-JUN-92');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (160,'Danila','Izotov','Russia','Novouralsk Soviet Union','02-OCT-91');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (161,'RUS','SwimM','Russia','Barnaul Soviet Union','21-OCT-77');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (162,'Benjamin','Proud','Great Britain','London England','21-SEP-94');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (163,'Andriy','Hovorov','Ukraine','Sevastopol Ukraine','10-APR-92');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (164,'Brad','Tandy','South Africa','South Africa','02-MAY-91');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (165,'Simonas','Bilis','Lithuania','Panevezys Lithuania','11-NOV-93');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (166,'GBR','SwimM','Great Britain','London England','21-SEP-84');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (167,'LTU','SwimM','Lithuania','Panevezys Lithuania','11-NOV-83');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (168,'Andre','De Grasse','Canada','Jacksonville Florida','10-NOV-94');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (169,'Akani','Simbine','South Africa','Pretoria South Africa','21-SEP-93');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (170,'Ben','Meite','Ivory Coast','Seguela Ivory Coast','11-NOV-86');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (171,'Jimmy','Vicaut','France','Bondy France','27-FEB-92');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (172,'Trayvon','Bromell','United States','St. Petersburg Florida','10-JUL-95');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (173,'CAN','TrackM','Canada','Montreal Quebec','23-AUG-71');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (174,'RSA','TrackM','South Africa','Pretoria South Africa','21-SEP-83');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (175,'CIV','TrackM','Ivory Coast','Seguela Ivory Coast','11-NOV-76');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (176,'FRA','TrackM','France','Bondy France','27-FEB-82');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (177,'Monica','Puig','Puerto Rico','San Juan Puerto Rico','27-SEP-93');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (178,'Angelique','Kerber','Germany','Bremen West Germany','18-JAN-88');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (179,'Petra','Kvitova','Czech Republic','Bilovec Czechoslovakia','08-MAR-90');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (180,'Madison','Keys','United States','Rock Island Illinois','17-FEB-95');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (181,'PUR','TennisF','Puerto Rico','San Juan Puerto Rico','27-SEP-83');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (182,'GER','TennisF','Germany','Bremen West Germany','18-JAN-78');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (183,'CZE','TennisF','Czech Republic','Bilovec Czechoslovakia','8-MAR-80');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (184,'Shi','Tingmao','China','Chongqing China','31-AUG-91');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (185,'Tania','Cagnotto','Italy','Bolzano Italy','15-MAY-85');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (186,'Francesca','Dallape','Italy','Trento Italy','24-JUN-86');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (187,'Maddison','Keeney','Australia','Auckland New Zealand','23-MAY-96');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (188,'Anabelle','Smith','Australia','Malvern Victoria','03-FEB-93');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (189,'ITA','DivingF','Italy','Bolzano Italy','15-MAY-75');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (190,'English','Gardner','United States','Philadelphia Pennsylvania','22-APR-92');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (191,'Tori','Bowie','United States','Sand Hill Mississippi','27-AUG-90');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (192,'Christania','Williams','Jamaica','Saint Ann Parish Jamaica','17-OCT-94');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (193,'Elaine','Thompson','Jamaica','Manchester Jamaica','28-JUN-92');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (194,'Asha','Philip','Great Britain','Leyton London','25-OCT-90');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (195,'Desiree','Henry','Great Britain','United Kingdom','26-AUG-95');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (196,'Dina','Asher-Smith','Great Britain','Orpington Greater London','04-DEC-95');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (197,'Daryll','Neita','Great Britain','London England','29-AUG-96');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (198,'GBR','TrackF','Great Britain','London England','29-AUG-86');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (199,'Caeleb','Dressel','United States','Green Cove Springs Florida','16-AUG-96');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (200,'Ryan','Held','United States','Springfield Illinois','27-JUN-95');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (201,'Mehdy','Metella','France','Cayenne French Guiana','17-JUL-92');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (202,'Jeremy','Stravius','France','Abbeville France','14-JUL-88');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (203,'James','Roberts','Australia','Tweed Heads New South Wale','11-APR-91');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (204,'Kyle','Chambers','Australia','Port Lincoln South Australia','25-JUN-98');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (205,'James','Magnussen','Australia','Port Macquarie','11-APR-91');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (206,'Cameron','McEvoy','Australia','Gold Coast Queensland','13-MAY-94');
insert into participant(participant_id,fname,lname,nationality,birth_place,dob) values (207,'AUS','SwimM','Australia','Port Lincoln South Australia','25-JUN-88');
commit;


-- COUNTRY inserts
insert into country(country_id,country,country_code) values (1,'United States', 'USA');
insert into country(country_id,country,country_code) values (2,'Australia','AUS');
insert into country(country_id,country,country_code) values (3,'Japan','JPN');
insert into country(country_id,country,country_code) values (4,'Netherlands','NLD');
insert into country(country_id,country,country_code) values (5,'Ukraine','UKR');
insert into country(country_id,country,country_code) values (6,'France','FRA');
insert into country(country_id,country,country_code) values (7,'Poland','POL');
insert into country(country_id,country,country_code) values (8,'South Africa','RSA');
insert into country(country_id,country,country_code) values (9,'Croatia','CRO');
insert into country(country_id,country,country_code) values (10,'Sweden','SWE');
insert into country(country_id,country,country_code) values (11,'Algeria','DZA');
insert into country(country_id,country,country_code) values (12,'Portugal','PRT');
insert into country(country_id,country,country_code) values (13,'Jamaica','JAM');
insert into country(country_id,country,country_code) values (14,'Saint Kitt and Nevis','KNA');
insert into country(country_id,country,country_code) values (15,'Barbados','BRB');
insert into country(country_id,country,country_code) values (16,'Belgium','BEL');
insert into country(country_id,country,country_code) values (17,'Russia','RUS');
insert into country(country_id,country,country_code) values (18,'China','CHN');
insert into country(country_id,country,country_code) values (19,'Brazil','BRA');
insert into country(country_id,country,country_code) values (20,'Trinidad and Tobago','TTO');
insert into country(country_id,country,country_code) values (21,'Germany','DEU');
insert into country(country_id,country,country_code) values (22,'Nigeria','NGA');
insert into country(country_id,country,country_code) values (23,'Belarus','BLR');
insert into country(country_id,country,country_code) values (24,'Canada','CAN');
insert into country(country_id,country,country_code) values (25,'Great Britain','GBR');
insert into country(country_id,country,country_code) values (26,'Lithuania','LTU');
insert into country(country_id,country,country_code) values (27,'Ivory Coast','CIV');
insert into country(country_id,country,country_code) values (28,'Puerto Rico','PUR');
insert into country(country_id,country,country_code) values (29,'Czech Republic','CZE');
insert into country(country_id,country,country_code) values (30,'Italy','ITA');
commit;

-- TEAM inserts
insert into team(team_id,olympic_id,team_name,country_id,sport_id,coach_id) values (team_seq.nextval,1,'USASwimM',1,1,9);
insert into team(team_id,olympic_id,team_name,country_id,sport_id,coach_id) values (team_seq.nextval,1,'CROSwimM',9,1,10);
insert into team(team_id,olympic_id,team_name,country_id,sport_id,coach_id) values (team_seq.nextval,1,'RSASwimM',8,1,11);
insert into team(team_id,olympic_id,team_name,country_id,sport_id,coach_id) values (team_seq.nextval,1,'SWESwimM',10,1,12);
insert into team(team_id,olympic_id,team_name,country_id,sport_id,coach_id) values (team_seq.nextval,1,'AUSSwimM',2,1,13);
insert into team(team_id,olympic_id,team_name,country_id,sport_id,coach_id) values (team_seq.nextval,1,'UKRSwimM',5,1,14);
insert into team(team_id,olympic_id,team_name,country_id,sport_id,coach_id) values (team_seq.nextval,1,'DZASwimM',11,1,15);
insert into team(team_id,olympic_id,team_name,country_id,sport_id,coach_id) values (team_seq.nextval,1,'USATrackM',1,2,23);
insert into team(team_id,olympic_id,team_name,country_id,sport_id,coach_id) values (team_seq.nextval,1,'PRTTrackM',12,2,24);
insert into team(team_id,olympic_id,team_name,country_id,sport_id,coach_id) values (team_seq.nextval,1,'JAMTrackM',13,2,25);
insert into team(team_id,olympic_id,team_name,country_id,sport_id,coach_id) values (team_seq.nextval,1,'KNATrackM',14,2,26);
insert into team(team_id,olympic_id,team_name,country_id,sport_id,coach_id) values (team_seq.nextval,1,'BRBTrackM',15,2,27);
insert into team(team_id,olympic_id,team_name,country_id,sport_id,coach_id) values (team_seq.nextval,1,'BELTennisF',16,3,32);
insert into team(team_id,olympic_id,team_name,country_id,sport_id,coach_id) values (team_seq.nextval,1,'FRATennisF',6,3,33);
insert into team(team_id,olympic_id,team_name,country_id,sport_id,coach_id) values (team_seq.nextval,1,'AUSTennisF',2,3,34);
insert into team(team_id,olympic_id,team_name,country_id,sport_id,coach_id) values (team_seq.nextval,1,'RUSTennisF',17,3,35);
insert into team(team_id,olympic_id,team_name,country_id,sport_id,coach_id) values (team_seq.nextval,1,'CHNDivingF',18,4,42);
insert into team(team_id,olympic_id,team_name,country_id,sport_id,coach_id) values (team_seq.nextval,1,'RUSDivingF',17,4,43);
insert into team(team_id,olympic_id,team_name,country_id,sport_id,coach_id) values (team_seq.nextval,1,'AUSDivingF',2,4,44);
insert into team(team_id,olympic_id,team_name,country_id,sport_id,coach_id) values (team_seq.nextval,1,'JAMTrackF',13,5,57);
insert into team(team_id,olympic_id,team_name,country_id,sport_id,coach_id) values (team_seq.nextval,1,'RUSTrackF',17,5,58);
insert into team(team_id,olympic_id,team_name,country_id,sport_id,coach_id) values (team_seq.nextval,1,'FRATrackF',6,5,59);
insert into team(team_id,olympic_id,team_name,country_id,sport_id,coach_id) values (team_seq.nextval,1,'RSASwimM',8,6,11);
insert into team(team_id,olympic_id,team_name,country_id,sport_id,coach_id) values (team_seq.nextval,1,'NLDSwimM',4,6,70);
insert into team(team_id,olympic_id,team_name,country_id,sport_id,coach_id) values (team_seq.nextval,1,'USASwimM',1,6,9);
insert into team(team_id,olympic_id,team_name,country_id,sport_id,coach_id) values (team_seq.nextval,2,'BRASwimM',19,1,77);
insert into team(team_id,olympic_id,team_name,country_id,sport_id,coach_id) values (team_seq.nextval,2,'FRASwimM',6,1,78);
insert into team(team_id,olympic_id,team_name,country_id,sport_id,coach_id) values (team_seq.nextval,2,'AUSSwimM',2,1,13);
insert into team(team_id,olympic_id,team_name,country_id,sport_id,coach_id) values (team_seq.nextval,2,'USASwimM',1,1,9);
insert into team(team_id,olympic_id,team_name,country_id,sport_id,coach_id) values (team_seq.nextval,2,'RSASwimM',8,1,8);
insert into team(team_id,olympic_id,team_name,country_id,sport_id,coach_id) values (team_seq.nextval,2,'SWESwimM',10,1,10);
insert into team(team_id,olympic_id,team_name,country_id,sport_id,coach_id) values (team_seq.nextval,2,'JAMTrackM',13,2,25);
insert into team(team_id,olympic_id,team_name,country_id,sport_id,coach_id) values (team_seq.nextval,2,'TTOTrackM',20,2,86);
insert into team(team_id,olympic_id,team_name,country_id,sport_id,coach_id) values (team_seq.nextval,2,'USATrackM',1,2,23);
insert into team(team_id,olympic_id,team_name,country_id,sport_id,coach_id) values (team_seq.nextval,2,'NLDTrackM',4,2,87);
insert into team(team_id,olympic_id,team_name,country_id,sport_id,coach_id) values (team_seq.nextval,2,'RUSTennisF',17,3,35);
insert into team(team_id,olympic_id,team_name,country_id,sport_id,coach_id) values (team_seq.nextval,2,'CHNTennisF',18,3,92);
insert into team(team_id,olympic_id,team_name,country_id,sport_id,coach_id) values (team_seq.nextval,2,'CHNDivingF',18,4,42);
insert into team(team_id,olympic_id,team_name,country_id,sport_id,coach_id) values (team_seq.nextval,2,'RUSDivingF',17,4,43);
insert into team(team_id,olympic_id,team_name,country_id,sport_id,coach_id) values (team_seq.nextval,2,'DEUDivingF',21,4,97);
insert into team(team_id,olympic_id,team_name,country_id,sport_id,coach_id) values (team_seq.nextval,2,'BELTrackF',16,5,110);
insert into team(team_id,olympic_id,team_name,country_id,sport_id,coach_id) values (team_seq.nextval,2,'NGATrackF',22,5,111);
insert into team(team_id,olympic_id,team_name,country_id,sport_id,coach_id) values (team_seq.nextval,2,'BRATrackF',19,5,112);
insert into team(team_id,olympic_id,team_name,country_id,sport_id,coach_id) values (team_seq.nextval,2,'USASwimM',1,6,9);
insert into team(team_id,olympic_id,team_name,country_id,sport_id,coach_id) values (team_seq.nextval,2,'FRASwimM',6,6,119);
insert into team(team_id,olympic_id,team_name,country_id,sport_id,coach_id) values (team_seq.nextval,2,'AUSSwimM',2,6,13);
insert into team(team_id,olympic_id,team_name,country_id,sport_id,coach_id) values (team_seq.nextval,3,'FRASwimM',6,1,78);
insert into team(team_id,olympic_id,team_name,country_id,sport_id,coach_id) values (team_seq.nextval,3,'USASwimM',1,1,9);
insert into team(team_id,olympic_id,team_name,country_id,sport_id,coach_id) values (team_seq.nextval,3,'BRASwimM',19,1,77);
insert into team(team_id,olympic_id,team_name,country_id,sport_id,coach_id) values (team_seq.nextval,3,'RSASwimM',8,1,11);
insert into team(team_id,olympic_id,team_name,country_id,sport_id,coach_id) values (team_seq.nextval,3,'TTOSwimM',20,1,124);
insert into team(team_id,olympic_id,team_name,country_id,sport_id,coach_id) values (team_seq.nextval,3,'AUSSwimM',2,1,13);
insert into team(team_id,olympic_id,team_name,country_id,sport_id,coach_id) values (team_seq.nextval,3,'JAMTrackM',13,2,25);
insert into team(team_id,olympic_id,team_name,country_id,sport_id,coach_id) values (team_seq.nextval,3,'USATrackM',1,2,23);
insert into team(team_id,olympic_id,team_name,country_id,sport_id,coach_id) values (team_seq.nextval,3,'NLDTrackM',4,2,87);
insert into team(team_id,olympic_id,team_name,country_id,sport_id,coach_id) values (team_seq.nextval,3,'TTOTrackM',20,2,86);
insert into team(team_id,olympic_id,team_name,country_id,sport_id,coach_id) values (team_seq.nextval,3,'USATennisF',1,3,132);
insert into team(team_id,olympic_id,team_name,country_id,sport_id,coach_id) values (team_seq.nextval,3,'RUSTennisF',17,3,35);
insert into team(team_id,olympic_id,team_name,country_id,sport_id,coach_id) values (team_seq.nextval,3,'BLRTennisF',23,3,133);
insert into team(team_id,olympic_id,team_name,country_id,sport_id,coach_id) values (team_seq.nextval,3,'CHNDivingF',18,4,42);
insert into team(team_id,olympic_id,team_name,country_id,sport_id,coach_id) values (team_seq.nextval,3,'USADivingF',1,4,139);
insert into team(team_id,olympic_id,team_name,country_id,sport_id,coach_id) values (team_seq.nextval,3,'CANDivingF',24,4,140);
insert into team(team_id,olympic_id,team_name,country_id,sport_id,coach_id) values (team_seq.nextval,3,'USATrackF',1,5,151);
insert into team(team_id,olympic_id,team_name,country_id,sport_id,coach_id) values (team_seq.nextval,3,'JAMTrackF',13,5,57);
insert into team(team_id,olympic_id,team_name,country_id,sport_id,coach_id) values (team_seq.nextval,3,'UKRTrackF',5,5,152);
insert into team(team_id,olympic_id,team_name,country_id,sport_id,coach_id) values (team_seq.nextval,3,'FRASwimM',6,6,119);
insert into team(team_id,olympic_id,team_name,country_id,sport_id,coach_id) values (team_seq.nextval,3,'USASwimM',1,6,9);
insert into team(team_id,olympic_id,team_name,country_id,sport_id,coach_id) values (team_seq.nextval,3,'RUSSwimM',17,6,161);

-- TEAM_MEMBER inserts
insert into team_member(team_id,participant_id) values (1,1);
insert into team_member(team_id,participant_id) values (2,2);
insert into team_member(team_id,participant_id) values (3,3);
insert into team_member(team_id,participant_id) values (4,4);
insert into team_member(team_id,participant_id) values (1,5);
insert into team_member(team_id,participant_id) values (5,6);
insert into team_member(team_id,participant_id) values (6,7);
insert into team_member(team_id,participant_id) values (7,8);
insert into team_member(team_id,participant_id) values (8,16);
insert into team_member(team_id,participant_id) values (9,17);
insert into team_member(team_id,participant_id) values (8,18);
insert into team_member(team_id,participant_id) values (8,19);
insert into team_member(team_id,participant_id) values (10,20);
insert into team_member(team_id,participant_id) values (11,21);
insert into team_member(team_id,participant_id) values (12,22);
insert into team_member(team_id,participant_id) values (13,28);
insert into team_member(team_id,participant_id) values (14,29);
insert into team_member(team_id,participant_id) values (15,30);
insert into team_member(team_id,participant_id) values (16,31);
insert into team_member(team_id,participant_id) values (17,36);
insert into team_member(team_id,participant_id) values (17,37);
insert into team_member(team_id,participant_id) values (18,38);
insert into team_member(team_id,participant_id) values (18,39);
insert into team_member(team_id,participant_id) values (19,40);
insert into team_member(team_id,participant_id) values (19,41);
insert into team_member(team_id,participant_id) values (20,45);
insert into team_member(team_id,participant_id) values (20,46);
insert into team_member(team_id,participant_id) values (20,47);
insert into team_member(team_id,participant_id) values (20,48);
insert into team_member(team_id,participant_id) values (21,49);
insert into team_member(team_id,participant_id) values (21,50);
insert into team_member(team_id,participant_id) values (21,51);
insert into team_member(team_id,participant_id) values (21,52);
insert into team_member(team_id,participant_id) values (22,53);
insert into team_member(team_id,participant_id) values (22,54);
insert into team_member(team_id,participant_id) values (22,55);
insert into team_member(team_id,participant_id) values (22,56);
insert into team_member(team_id,participant_id) values (23,3);
insert into team_member(team_id,participant_id) values (23,60);
insert into team_member(team_id,participant_id) values (23,61);
insert into team_member(team_id,participant_id) values (23,62);
insert into team_member(team_id,participant_id) values (24,63);
insert into team_member(team_id,participant_id) values (24,64);
insert into team_member(team_id,participant_id) values (24,65);
insert into team_member(team_id,participant_id) values (24,66);
insert into team_member(team_id,participant_id) values (25,67);
insert into team_member(team_id,participant_id) values (25,68);
insert into team_member(team_id,participant_id) values (25,69);
insert into team_member(team_id,participant_id) values (25,5);
insert into team_member(team_id,participant_id) values (26,71);
insert into team_member(team_id,participant_id) values (27,72);
insert into team_member(team_id,participant_id) values (27,73);
insert into team_member(team_id,participant_id) values (28,74);
insert into team_member(team_id,participant_id) values (29,75);
insert into team_member(team_id,participant_id) values (28,76);
insert into team_member(team_id,participant_id) values (30,3);
insert into team_member(team_id,participant_id) values (31,4);
insert into team_member(team_id,participant_id) values (32,79);
insert into team_member(team_id,participant_id) values (33,80);
insert into team_member(team_id,participant_id) values (34,81);
insert into team_member(team_id,participant_id) values (35,82);
insert into team_member(team_id,participant_id) values (32,20);
insert into team_member(team_id,participant_id) values (32,83);
insert into team_member(team_id,participant_id) values (33,84);
insert into team_member(team_id,participant_id) values (34,85);
insert into team_member(team_id,participant_id) values (36,88);
insert into team_member(team_id,participant_id) values (36,89);
insert into team_member(team_id,participant_id) values (36,90);
insert into team_member(team_id,participant_id) values (37,91);
insert into team_member(team_id,participant_id) values (38,37);
insert into team_member(team_id,participant_id) values (38,36);
insert into team_member(team_id,participant_id) values (39,93);
insert into team_member(team_id,participant_id) values (39,94);
insert into team_member(team_id,participant_id) values (40,95);
insert into team_member(team_id,participant_id) values (40,96);
insert into team_member(team_id,participant_id) values (41,98);
insert into team_member(team_id,participant_id) values (41,99);
insert into team_member(team_id,participant_id) values (41,100);
insert into team_member(team_id,participant_id) values (41,101);
insert into team_member(team_id,participant_id) values (42,102);
insert into team_member(team_id,participant_id) values (42,103);
insert into team_member(team_id,participant_id) values (42,104);
insert into team_member(team_id,participant_id) values (42,105);
insert into team_member(team_id,participant_id) values (43,106);
insert into team_member(team_id,participant_id) values (43,107);
insert into team_member(team_id,participant_id) values (43,108);
insert into team_member(team_id,participant_id) values (43,109);
insert into team_member(team_id,participant_id) values (44,68);
insert into team_member(team_id,participant_id) values (44,113);
insert into team_member(team_id,participant_id) values (44,114);
insert into team_member(team_id,participant_id) values (44,5);
insert into team_member(team_id,participant_id) values (45,72);
insert into team_member(team_id,participant_id) values (45,115);
insert into team_member(team_id,participant_id) values (45,116);
insert into team_member(team_id,participant_id) values (45,73);
insert into team_member(team_id,participant_id) values (46,76);
insert into team_member(team_id,participant_id) values (46,117);
insert into team_member(team_id,participant_id) values (46,74);
insert into team_member(team_id,participant_id) values (46,118);
insert into team_member(team_id,participant_id) values (47,120);
insert into team_member(team_id,participant_id) values (48,114);
insert into team_member(team_id,participant_id) values (49,71);
insert into team_member(team_id,participant_id) values (49,121);
insert into team_member(team_id,participant_id) values (48,122);
insert into team_member(team_id,participant_id) values (50,3);
insert into team_member(team_id,participant_id) values (51,123);
insert into team_member(team_id,participant_id) values (52,76);
insert into team_member(team_id,participant_id) values (53,79);
insert into team_member(team_id,participant_id) values (53,125);
insert into team_member(team_id,participant_id) values (54,16);
insert into team_member(team_id,participant_id) values (54,126);
insert into team_member(team_id,participant_id) values (55,82);
insert into team_member(team_id,participant_id) values (56,80);
insert into team_member(team_id,participant_id) values (53,20);
insert into team_member(team_id,participant_id) values (54,127);
insert into team_member(team_id,participant_id) values (57,128);
insert into team_member(team_id,participant_id) values (58,129);
insert into team_member(team_id,participant_id) values (59,130);
insert into team_member(team_id,participant_id) values (58,131);
insert into team_member(team_id,participant_id) values (60,134);
insert into team_member(team_id,participant_id) values (60,36);
insert into team_member(team_id,participant_id) values (61,135);
insert into team_member(team_id,participant_id) values (61,136);
insert into team_member(team_id,participant_id) values (62,137);
insert into team_member(team_id,participant_id) values (62,138);
insert into team_member(team_id,participant_id) values (63,141);
insert into team_member(team_id,participant_id) values (63,142);
insert into team_member(team_id,participant_id) values (63,143);
insert into team_member(team_id,participant_id) values (63,144);
insert into team_member(team_id,participant_id) values (64,145);
insert into team_member(team_id,participant_id) values (64,46);
insert into team_member(team_id,participant_id) values (64,48);
insert into team_member(team_id,participant_id) values (64,146);
insert into team_member(team_id,participant_id) values (65,147);
insert into team_member(team_id,participant_id) values (65,148);
insert into team_member(team_id,participant_id) values (65,149);
insert into team_member(team_id,participant_id) values (65,150);
insert into team_member(team_id,participant_id) values (66,72);
insert into team_member(team_id,participant_id) values (66,115);
insert into team_member(team_id,participant_id) values (66,153);
insert into team_member(team_id,participant_id) values (66,154);
insert into team_member(team_id,participant_id) values (67,155);
insert into team_member(team_id,participant_id) values (67,68);
insert into team_member(team_id,participant_id) values (67,114);
insert into team_member(team_id,participant_id) values (67,156);
insert into team_member(team_id,participant_id) values (68,157);
insert into team_member(team_id,participant_id) values (68,158);
insert into team_member(team_id,participant_id) values (68,159);
insert into team_member(team_id,participant_id) values (68,160);
commit;


-- MEDAL inserts
insert into medal (medal_id,medal_title,points)
    values(1,'Gold',5);
insert into medal (medal_id,medal_title,points)
    values(2,'Silver',3);
insert into medal (medal_id,medal_title,points)
    values(3, 'Bronze', 1);
commit;


-- VENUE inserts
insert into venue(venue_id,olympic_id,venue_name,capacity) values (venue_seq.nextval,1,'Olympic Aquatic Centre',3);
insert into venue(venue_id,olympic_id,venue_name,capacity) values (venue_seq.nextval,1,'Athens Olympic Stadium',8);
insert into venue(venue_id,olympic_id,venue_name,capacity) values (venue_seq.nextval,1,'Athens Olympic Tennis Centre',2);
insert into venue(venue_id,olympic_id,venue_name,capacity) values (venue_seq.nextval,2,'Beijing National Aquatics',3);
insert into venue(venue_id,olympic_id,venue_name,capacity) values (venue_seq.nextval,2,'Beijing National Stadium',8);
insert into venue(venue_id,olympic_id,venue_name,capacity) values (venue_seq.nextval,2,'Olympic Green Tennis Centre',2);
insert into venue(venue_id,olympic_id,venue_name,capacity) values (venue_seq.nextval,3,'London Aquatics Centre',3);
insert into venue(venue_id,olympic_id,venue_name,capacity) values (venue_seq.nextval,3,'Olympic Stadium',8);
insert into venue(venue_id,olympic_id,venue_name,capacity) values (venue_seq.nextval,3,'All England Lawn Tennis',2);
insert into venue(venue_id,olympic_id,venue_name,capacity) values (venue_seq.nextval,4,'Olympic Aquatics Stadium',3);
insert into venue(venue_id,olympic_id,venue_name,capacity) values (venue_seq.nextval,4,'Olympic Stadium',8);
insert into venue(venue_id,olympic_id,venue_name,capacity) values (venue_seq.nextval,4,'Olympic Tennis Centre',2);
commit;


-- EVENT inserts
insert into event(event_id,sport_id,venue_id,gender,event_time) values (event_seq.nextval,1,1,'m','20-AUG-04');
insert into event(event_id,sport_id,venue_id,gender,event_time) values (event_seq.nextval,2,2,'m','22-AUG-04');
insert into event(event_id,sport_id,venue_id,gender,event_time) values (event_seq.nextval,3,3,'w','22-AUG-04');
insert into event(event_id,sport_id,venue_id,gender,event_time) values (event_seq.nextval,4,1,'w','16-AUG-04');
insert into event(event_id,sport_id,venue_id,gender,event_time) values (event_seq.nextval,5,2,'w','27-AUG-04');
insert into event(event_id,sport_id,venue_id,gender,event_time) values (event_seq.nextval,6,1,'m','15-AUG-04');
insert into event(event_id,sport_id,venue_id,gender,event_time) values (event_seq.nextval,1,4,'m','16-AUG-08');
insert into event(event_id,sport_id,venue_id,gender,event_time) values (event_seq.nextval,2,5,'m','16-AUG-08');
insert into event(event_id,sport_id,venue_id,gender,event_time) values (event_seq.nextval,3,6,'w','17-AUG-08');
insert into event(event_id,sport_id,venue_id,gender,event_time) values (event_seq.nextval,4,4,'w','17-AUG-08');
insert into event(event_id,sport_id,venue_id,gender,event_time) values (event_seq.nextval,5,5,'w','22-AUG-08');
insert into event(event_id,sport_id,venue_id,gender,event_time) values (event_seq.nextval,6,4,'m','11-AUG-08');
insert into event(event_id,sport_id,venue_id,gender,event_time) values (event_seq.nextval,1,7,'m','03-AUG-12');
insert into event(event_id,sport_id,venue_id,gender,event_time) values (event_seq.nextval,2,8,'m','05-AUG-12');
insert into event(event_id,sport_id,venue_id,gender,event_time) values (event_seq.nextval,3,9,'w','05-AUG-12');
insert into event(event_id,sport_id,venue_id,gender,event_time) values (event_seq.nextval,4,7,'w','05-AUG-12');
insert into event(event_id,sport_id,venue_id,gender,event_time) values (event_seq.nextval,5,8,'w','10-AUG-12');
insert into event(event_id,sport_id,venue_id,gender,event_time) values (event_seq.nextval,6,7,'m','29-JUL-12');
insert into event(event_id,sport_id,venue_id,gender,event_time) values (event_seq.nextval,1,10,'m','12-AUG-16');
insert into event(event_id,sport_id,venue_id,gender,event_time) values (event_seq.nextval,2,11,'m','14-AUG-16');
insert into event(event_id,sport_id,venue_id,gender,event_time) values (event_seq.nextval,3,12,'w','14-AUG-16');
insert into event(event_id,sport_id,venue_id,gender,event_time) values (event_seq.nextval,4,10,'w','14-AUG-16');
insert into event(event_id,sport_id,venue_id,gender,event_time) values (event_seq.nextval,5,11,'w','19-AUG-16');
insert into event(event_id,sport_id,venue_id,gender,event_time) values (event_seq.nextval,6,10,'m','07-AUG-16');
commit;


-- EVENT_PARTICIPATION inserts
insert into event_participation(event_id,team_id,status) values (1,1,'e');
insert into event_participation(event_id,team_id,status) values (1,2,'e');
insert into event_participation(event_id,team_id,status) values (1,3,'e');
insert into event_participation(event_id,team_id,status) values (1,4,'e');
insert into event_participation(event_id,team_id,status) values (1,5,'e');
insert into event_participation(event_id,team_id,status) values (1,6,'e');
insert into event_participation(event_id,team_id,status) values (1,7,'e');
insert into event_participation(event_id,team_id,status) values (2,8,'e');
insert into event_participation(event_id,team_id,status) values (2,9,'e');
insert into event_participation(event_id,team_id,status) values (2,10,'e');
insert into event_participation(event_id,team_id,status) values (2,11,'e');
insert into event_participation(event_id,team_id,status) values (2,12,'e');
insert into event_participation(event_id,team_id,status) values (3,13,'e');
insert into event_participation(event_id,team_id,status) values (3,14,'e');
insert into event_participation(event_id,team_id,status) values (3,15,'e');
insert into event_participation(event_id,team_id,status) values (3,16,'e');
insert into event_participation(event_id,team_id,status) values (4,17,'e');
insert into event_participation(event_id,team_id,status) values (4,18,'e');
insert into event_participation(event_id,team_id,status) values (4,19,'e');
insert into event_participation(event_id,team_id,status) values (5,20,'e');
insert into event_participation(event_id,team_id,status) values (5,21,'e');
insert into event_participation(event_id,team_id,status) values (5,22,'e');
insert into event_participation(event_id,team_id,status) values (6,23,'e');
insert into event_participation(event_id,team_id,status) values (6,24,'e');
insert into event_participation(event_id,team_id,status) values (6,25,'e');
insert into event_participation(event_id,team_id,status) values (7,26,'e');
insert into event_participation(event_id,team_id,status) values (7,27,'e');
insert into event_participation(event_id,team_id,status) values (7,28,'e');
insert into event_participation(event_id,team_id,status) values (7,29,'e');
insert into event_participation(event_id,team_id,status) values (7,30,'e');
insert into event_participation(event_id,team_id,status) values (7,31,'e');
insert into event_participation(event_id,team_id,status) values (8,32,'e');
insert into event_participation(event_id,team_id,status) values (8,33,'e');
insert into event_participation(event_id,team_id,status) values (8,34,'e');
insert into event_participation(event_id,team_id,status) values (8,35,'e');
insert into event_participation(event_id,team_id,status) values (9,36,'e');
insert into event_participation(event_id,team_id,status) values (9,37,'e');
insert into event_participation(event_id,team_id,status) values (10,38,'e');
insert into event_participation(event_id,team_id,status) values (10,39,'e');
insert into event_participation(event_id,team_id,status) values (10,40,'e');
insert into event_participation(event_id,team_id,status) values (11,41,'e');
insert into event_participation(event_id,team_id,status) values (11,42,'e');
insert into event_participation(event_id,team_id,status) values (11,43,'e');
insert into event_participation(event_id,team_id,status) values (12,44,'e');
insert into event_participation(event_id,team_id,status) values (12,45,'e');
insert into event_participation(event_id,team_id,status) values (12,46,'e');
insert into event_participation(event_id,team_id,status) values (13,47,'e');
insert into event_participation(event_id,team_id,status) values (13,48,'e');
insert into event_participation(event_id,team_id,status) values (13,49,'e');
insert into event_participation(event_id,team_id,status) values (13,50,'e');
insert into event_participation(event_id,team_id,status) values (13,51,'e');
insert into event_participation(event_id,team_id,status) values (13,52,'e');
insert into event_participation(event_id,team_id,status) values (14,53,'e');
insert into event_participation(event_id,team_id,status) values (14,54,'e');
insert into event_participation(event_id,team_id,status) values (14,55,'e');
insert into event_participation(event_id,team_id,status) values (14,56,'e');
insert into event_participation(event_id,team_id,status) values (15,57,'e');
insert into event_participation(event_id,team_id,status) values (15,58,'e');
insert into event_participation(event_id,team_id,status) values (15,59,'e');
insert into event_participation(event_id,team_id,status) values (16,60,'e');
insert into event_participation(event_id,team_id,status) values (16,61,'e');
insert into event_participation(event_id,team_id,status) values (16,62,'e');
insert into event_participation(event_id,team_id,status) values (17,63,'e');
insert into event_participation(event_id,team_id,status) values (17,64,'e');
insert into event_participation(event_id,team_id,status) values (17,65,'e');
insert into event_participation(event_id,team_id,status) values (18,66,'e');
insert into event_participation(event_id,team_id,status) values (18,67,'e');
insert into event_participation(event_id,team_id,status) values (18,68,'e');
commit;

-- SCOREBOARD inserts
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (1,1,1,1,1,1);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (1,1,2,2,2,2);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (1,1,3,3,3,3);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (1,1,4,4,4,4);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (1,1,1,5,5,4);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (1,1,5,6,6,4);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (1,1,6,7,7,4);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (1,1,7,8,8,4);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (1,2,8,16,1,1);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (1,2,9,17,2,2);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (1,2,8,18,3,3);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (1,2,8,19,4,4);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (1,2,10,20,5,4);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (1,2,11,21,6,4);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (1,2,12,22,7,4);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (1,3,13,28,1,1);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (1,3,14,29,2,2);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (1,3,15,30,3,3);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (1,3,16,31,4,4);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (1,4,17,36,1,1);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (1,4,17,37,1,1);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (1,4,18,38,2,2);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (1,4,18,39,2,2);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (1,4,19,40,3,3);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (1,4,19,41,3,3);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (1,5,20,45,1,1);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (1,5,20,46,1,1);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (1,5,20,47,1,1);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (1,5,20,48,1,1);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (1,5,21,49,2,2);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (1,5,21,50,2,2);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (1,5,21,51,2,2);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (1,5,21,52,2,2);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (1,5,22,53,3,3);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (1,5,22,54,3,3);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (1,5,22,55,3,3);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (1,5,22,56,3,3);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (1,6,23,3,1,1);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (1,6,23,60,1,1);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (1,6,23,61,1,1);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (1,6,23,62,1,1);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (1,6,24,63,2,2);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (1,6,24,64,2,2);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (1,6,24,65,2,2);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (1,6,24,66,2,2);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (1,6,25,67,3,3);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (1,6,25,68,3,3);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (1,6,25,69,3,3);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (1,6,25,5,3,3);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (2,7,26,71,1,1);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (2,7,27,72,2,2);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (2,7,27,73,3,3);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (2,7,28,74,4,4);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (2,7,29,75,5,4);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (2,7,28,76,6,4);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (2,7,30,3,7,4);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (2,7,31,4,8,4);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (2,8,32,79,1,1);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (2,8,33,80,2,2);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (2,8,34,81,3,3);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (2,8,35,82,4,4);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (2,8,32,20,5,4);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (2,8,32,83,6,4);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (2,8,33,84,7,4);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (2,8,34,85,8,4);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (2,9,36,88,1,1);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (2,9,36,89,2,2);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (2,9,36,90,3,3);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (2,9,37,91,4,4);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (2,10,38,37,1,1);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (2,10,38,36,1,1);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (2,10,39,93,2,2);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (2,10,39,94,2,2);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (2,10,40,95,3,3);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (2,10,40,96,3,3);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (2,11,41,98,1,1);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (2,11,41,99,1,1);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (2,11,41,100,1,1);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (2,11,41,101,1,1);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (2,11,42,102,2,2);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (2,11,42,103,2,2);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (2,11,42,104,2,2);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (2,11,42,105,2,2);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (2,11,43,106,3,3);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (2,11,43,107,3,3);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (2,11,43,108,3,3);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (2,11,43,109,3,3);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (2,12,44,68,1,1);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (2,12,44,113,1,1);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (2,12,44,114,1,1);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (2,12,44,5,1,1);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (2,12,45,72,2,2);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (2,12,45,115,2,2);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (2,12,45,116,2,2);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (2,12,45,73,2,2);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (2,12,46,76,3,3);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (2,12,46,117,3,3);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (2,12,46,74,3,3);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (2,12,46,118,3,3);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (3,13,47,120,1,1);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (3,13,48,114,2,2);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (3,13,49,71,3,3);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (3,13,49,121,4,4);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (3,13,48,122,5,4);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (3,13,50,3,6,4);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (3,13,51,123,7,4);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (3,13,52,76,8,4);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (3,14,53,79,1,1);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (3,14,53,125,2,2);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (3,14,54,16,3,3);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (3,14,54,126,4,4);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (3,14,55,82,5,4);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (3,14,56,80,6,4);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (3,14,53,20,7,4);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (3,14,54,127,8,4);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (3,15,57,128,1,1);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (3,15,58,129,2,2);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (3,15,59,130,3,3);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (3,15,58,131,4,4);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (3,16,60,134,1,1);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (3,16,60,36,1,1);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (3,16,61,135,2,2);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (3,16,61,136,2,2);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (3,16,62,137,3,3);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (3,16,62,138,3,3);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (3,17,63,141,1,1);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (3,17,63,142,1,1);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (3,17,63,143,1,1);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (3,17,63,144,1,1);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (3,17,64,145,2,2);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (3,17,64,46,2,2);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (3,17,64,48,2,2);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (3,17,64,146,2,2);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (3,17,65,147,3,3);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (3,17,65,148,3,3);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (3,17,65,149,3,3);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (3,17,65,150,3,3);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (3,18,66,72,1,1);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (3,18,66,115,1,1);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (3,18,66,153,1,1);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (3,18,66,154,1,1);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (3,18,67,155,2,2);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (3,18,67,68,2,2);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (3,18,67,114,2,2);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (3,18,67,156,2,2);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (3,18,68,157,3,3);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (3,18,68,158,3,3);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (3,18,68,159,3,3);
insert into scoreboard(olympic_id,event_id,team_id,participant_id,position,medal_id) values (3,18,68,160,3,3);
commit;