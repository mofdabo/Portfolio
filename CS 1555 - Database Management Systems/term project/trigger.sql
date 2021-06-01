-- Mouhammadou Dabo (mod20)
-- trigger.sql: the trigger to create other database objects

-- ASSIGN MEDAL: This trigger is responsible to assign the appropriate medal based on the
-- position when new records are inserted or updated in the SCOREBOARD.
create or replace trigger assign_medal
before insert or update
on scoreboard
for each row

begin
    if :new.position = 1
        then :new.medal_id := 1;
    elsif :new.position = 2
        then :new.medal_id := 2;
    elsif :new.position = 3
        then :new.medal_id := 3;
    else
        :new.medal_id := null;
    end if;
end;
/

-- ATHLETE DISMISSAL: This trigger is responsible for deleting all the data of an athlete who
-- was dismissed because of a violation. If the athlete is a member of a team sport, then the team
-- is also dismissed by setting the status not eligible (n) in participating in any event. If the athlete
-- participates in an atomic sport, then the corresponding teams are removed from the events.
create or replace trigger athlete_dismissal
before delete
on participant
for each row
declare
    dismissed_athlete_id integer;
begin
    select participant_id into dismissed_athlete_id from participant where participant_id = :old.participant_id;

    delete from scoreboard where scoreboard.participant_id in
        (select participant_id from team_member where team_id in
            (select team_id from team_member where participant_id = dismissed_athlete_id));

    update event_participation
        set status = 'n'
            where team_id in (select team_id from team_member where participant_id = dismissed_athlete_id)
                and (select team_size from sport natural join team where team_id in
                    (select team_id from team_member where participant_id = dismissed_athlete_id)) > 1;

    delete from event_participation
        where team_id in (select team_id from team_member where participant_id = dismissed_athlete_id)
            and (select team_size from sport natural join team where team_id in
                (select team_id from team_member where participant_id = dismissed_athlete_id)) = 1;

    delete from team
        where team_id in (select team_id from team_member where participant_id = dismissed_athlete_id)
            and (select team_size from sport natural join team where team_id in
                (select team_id from team_member where participant_id = dismissed_athlete_id)) = 1;

    delete from team_member where (participant_id = dismissed_athlete_id);
end;
/

-- ENFORCE CAPACITY: This trigger should check the maximum possible venue capacity before
-- the event is associated with it. In case the capacity is exceeded, an exception should be thrown.
create or replace trigger enforce_capacity
before insert
on event
for each row
declare
    current_capacity integer;
    maximum_capacity integer;
begin
    select capacity into maximum_capacity from venue where venue_id = :new.venue_id;
    select count(*) into current_capacity from event where venue_id = :new.venue_id;
    if(current_capacity >= maximum_capacity)
        then raise_application_error(-20001, 'The venue is at maximum capacity. The event can not be inserted.');
    end if;
end;
/
