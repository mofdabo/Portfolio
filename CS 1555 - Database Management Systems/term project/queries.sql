-- Mouhammadou Dabo (mod20)
-- trigger.sql: queries used in java file

-- ORGANIZER
-- 1. createUser
INSERT INTO user_account (user_id, username, passkey, role_id, last_login) values (user_account_seq.nextval, 'Test', 'TEST', 1, '25-APR-2020');
-- 2. dropUser
DELETE FROM user_account where username = 'Test';
-- 3. createEvent
INSERT INTO event (event_id, sport_id, venue_id, gender, event_time) values (event_seq.nextval, 3, 3, 'w', '25-AUG-2004');
-- 4. addEventOutcome
INSERT INTO scoreboard (olympic_id, event_id, team_id, participant_id, position) values (1, 1, 26, 9, 9);

-- COACH
-- 5. createTeam
SELECT olympic_id from olympics where host_city = 'Athens';
SELECT country_id from country where country = 'United States';
SELECT sport_id from sport where sport_name = '100-m dash';
INSERT INTO team (team_id, olympic_id, team_name, country_id, sport_id, coach_id) values (team_seq.nextval, 1, 'USADash', 1, 2, 9);
-- 6. registerTeam
INSERT INTO event_participation (event_id, team_id, status) values (2, 1, 'e');
-- 7. addParticipant
SELECT count(*) from participant; -- count++ received is the participant id (208)
INSERT INTO participant (participant_id, fname, lname, nationality, birth_place) values (208, 'John', 'Doe', 'America', 'New York, NY');
-- 8. addTeamMember
INSERT INTO team_member (team_id, participant_id) values (1, 16);
-- 9. dropTeamMember
DELETE FROM participant WHERE fname = 'John' and lname = 'Doe';

-- ALL
-- 10. login
SELECT user_id, username, passkey, role_id FROM user_account; -- result table in a loop until username and passkey is found
-- 11. displaySport
SELECT sport_id, dob FROM sport WHERE sport_name = '100-m dash'; -- result is 2 (used in next query)
SELECT event_id, gender FROM event WHERE sport_id = 2; -- used to display event ids and gender of sport
SELECT fname, lname, country, medal_title, opening_date
		FROM (SELECT medal_id, event_id, olympic_id, participant_id, team_id FROM scoreboard)
		NATURAL JOIN (select event_id, sport_id FROM event)
		NATURAL JOIN (select sport_id, sport_name FROM sport)
		NATURAL JOIN (select fname, lname, participant_id FROM participant)
	    NATURAL JOIN (select medal_id, medal_title FROM medal)
		NATURAL JOIN (select team_id, country_id, country FROM country NATURAL JOIN team)
		NATURAL JOIN (select olympic_id, opening_date FROM olympics)
		WHERE sport_name = '100-m dash' ORDER BY medal_id ASC, opening_date ASC;
-- 12. displayEvent
SELECT DISTINCT fname, lname, position, medal_title, sport_name
		FROM scoreboard NATURAL JOIN olympics NATURAL JOIN event NATURAL JOIN participant NATURAL JOIN medal NATURAL JOIN (team NATURAL JOIN sport)" +
		WHERE host_city =  and event_id = " + event_id + " ORDER BY position ASC;

-- 13. countryRanking
-- 14. topkAthletes
-- 15. connectedAthletes

-- 16. logout
UPDATE user_account SET last_login = systimestamp WHERE user_id = 1;


