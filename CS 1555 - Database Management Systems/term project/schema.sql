-- Mouhammadou Dabo (mod20)
-- schema.sql: the script to create the tables

-- Drop all tables
drop table user_account cascade constraints;
drop table user_role cascade constraints;
drop table olympics cascade constraints;
drop table sport cascade constraints;
drop table participant cascade constraints;
drop table country cascade constraints;
drop table team cascade constraints;
drop table team_member cascade constraints;
drop table medal cascade constraints ;
drop table scoreboard cascade constraints;
drop table venue cascade constraints;
drop table event cascade constraints ;
drop table event_participation cascade constraints;

-- Drop all sequences
drop sequence user_account_seq;
drop sequence olympics_seq;
drop sequence sport_seq;
drop sequence team_seq;
drop sequence venue_seq;
drop sequence event_seq;

-- USER ROLE (role id, role name)
-- Stores the roles as an enumeration. The roles are Organizer, Coach and Guest (The password
-- for the guest user is GUEST).
create table user_role(
    role_id     integer not null,
    role_name   varchar2(20) not null,
    constraint user_role_pk
        primary key (role_id)
            deferrable initially immediate,
    constraint role_name_check
        check (role_name = 'Organizer' or role_name = 'Coach' or role_name = 'Guest')
            deferrable initially immediate
);

-- USER ACCOUNT (user id, username, passkey, role id, last login)
-- Stores the credentials for each user registered in the system.
create table user_account(
    user_id     integer not null,
    username    varchar2(20) not null,
    passkey     varchar2(20) not null,
    role_id     integer not null,
    last_login  date not null,
    constraint user_account_pk
        primary key (user_id)
            deferrable initially immediate,
    constraint user_role_fk
        foreign key (role_id) references user_role (role_id)
            deferrable initially immediate,
    constraint user_account_uk
        unique (username)
            deferrable initially immediate
);
create sequence user_account_seq start with 1 increment by 1;

-- OLYMPICS (olympic id, olympic num, host city, opening date, closing date, official website)
-- Stores each Olympics Game along with its information, where olympic num is the unique number
-- for the Olympic games (e.g., V, VI, VII, etc).
create table olympics(
    olympic_id          integer not null,
    olympic_num         varchar2(30) not null,
    host_city           varchar2(30) not null,
    opening_date        date not null,
    closing_date        date not null,
    official_website    varchar2(50),
    constraint olympics_pk
        primary key (olympic_id)
            deferrable initially immediate,
    constraint olympics_uk
        unique (olympic_num)
            deferrable initially immediate
);
create sequence olympics_seq start with 1 increment by 1;

-- SPORT (sport id, sport name, description, dob, team size)
-- Stores the information for each sport, where dob records the year it became an Olympic sport.
-- The team size could be 1 for an atomic sport or more than 1 for team sports (e.g., 5 for basketball,
-- 11 for soccer and 4 for 4x4 relay).
create table sport(
    sport_id        integer not null,
    sport_name      varchar2(30) not null,
    description     varchar2(80),
    dob             date not null,
    team_size       integer not null,
    constraint sport_pk
        primary key (sport_id)
            deferrable initially immediate,
    constraint sport_check
        check (team_size >= 1)
            deferrable initially immediate
);
create sequence sport_seq start with 1 increment by 1;

-- PARTICIPANT (participant id, fname, lname, nationality, birth place, dob)
-- Stores participants in the olympics (i.e., athletes and coaches) along with their information.
create table participant(
    participant_id  integer not null,
    fname           varchar2(30) not null,
    lname           varchar2(30) not null,
    nationality     varchar2(20) not null,
    birth_place     varchar2(40) not null,
    dob             date,
    constraint participant_pk
        primary key (participant_id)
            deferrable initially immediate
--  constraint participant_fk
--      foreign key () references ()
--          deferrable initially immediate
);

-- COUNTRY (country id, country, country code)
-- Stores the countries as an enumeration.
create table country(
    country_id      integer not null,
    country         varchar2(20) not null,
    country_code    varchar2(3) not null,
    constraint country_pk
        primary key (country_id)
            deferrable initially immediate,
    constraint country_uk1
        unique (country)
            deferrable initially immediate,
    constraint country_uk2
        unique (country_code)
            deferrable initially immediate
);

-- TEAM (team id, olympic id, team name, country id, sport id, coach id)
-- Stores the information of each team with the Olympics game during which they were contributing.
-- Also, the sport and the coach of the team. A team can not exist without a coach.
create table team(
    team_id     integer not null,
    olympic_id  integer not null,
    team_name   varchar2(50) not null,
    country_id  integer not null,
    sport_id    integer not null,
    coach_id    integer not null,
    constraint team_pk
        primary key (team_id)
            deferrable initially immediate,
    constraint team_uk
        unique (team_id, olympic_id)
            deferrable initially immediate,
    constraint team_fk1
        foreign key (olympic_id) references olympics (olympic_id)
            deferrable initially immediate,
    constraint team_fk2
        foreign key (country_id) references country (country_id)
            deferrable initially immediate,
    constraint team_fk3
        foreign key (sport_id) references sport (sport_id)
            deferrable initially immediate,
    constraint team_fk4
        foreign key (coach_id) references participant (participant_id)
            deferrable initially immediate
);
create sequence team_seq start with 1 increment by 1;

-- TEAM MEMBER (team id, participant id)
-- Stores each athlete with their team.
create table team_member(
    team_id         integer not null,
    participant_id  integer not null,
    constraint team_member_pk
        primary key (team_id, participant_id)
            deferrable initially immediate,
    constraint team_member_fk1
        foreign key (team_id) references team (team_id)
            deferrable initially immediate,
    constraint team_member_fk2
        foreign key (participant_id) references participant (participant_id)
            deferrable initially immediate
);

-- MEDAL (medal id, medal title, points)
-- Stores the medals (gold, silver, bronze) as an enumeration.
create table medal(
    medal_id    integer not null,
    medal_title varchar2(6) not null,
    points      integer not null,
    constraint medal_pk
        primary key (medal_id)
            deferrable initially immediate,
    constraint medal_uk
        unique (medal_title)
            deferrable initially immediate
);

-- VENUE (venue id, olympic id, venue name, capacity)
-- Stores the information of venues at which the games will take place with their maximum events
-- capacity. We assume that a venue is used in only one Olympic game.
create table venue(
    venue_id    integer not null,
    olympic_id  integer not null,
    venue_name  varchar2(30) not null,
    capacity    integer not null,
    constraint venue_pk
        primary key (venue_id)
            deferrable initially immediate,
    constraint venue_uk
        unique (venue_id, olympic_id)
            deferrable initially immediate,
    constraint venue_fk1
        foreign key (olympic_id) references olympics (olympic_id)
            deferrable initially immediate
);
create sequence venue_seq start with 1 increment by 1;

-- EVENT (event id, sport id, venue id, gender, event time)
-- Stores each event with its information, where gender declares whether it is a men’s or woman’s
-- event.
create table event(
    event_id    integer not null,
    sport_id    integer not null,
    venue_id    integer not null,
    gender      char not null,
    event_time  date,
    constraint event_pk
        primary key (event_id)
            deferrable initially immediate,
    constraint event_fk1
        foreign key (sport_id) references sport (sport_id)
            deferrable initially immediate,
    constraint event_fk2
        foreign key (venue_id) references venue (venue_id)
            deferrable initially immediate,
    constraint event_check
        check (gender = 'm' or gender = 'w')
            deferrable initially immediate
);
create sequence event_seq start with 1 increment by 1;


-- EVENT PARTICIPATION (event id, team id, status)
-- Stores the teams competing to an event. The status is eligible (e) or not eligible (n)
create table event_participation(
    event_id    integer not null,
    team_id     integer not null,
    status      char,
    constraint event_participation_pk
        primary key (event_id, team_id)
            deferrable initially immediate,
    constraint event_participation_fk1
        foreign key (event_id) references event (event_id)
            deferrable initially immediate,
    constraint event_participation_fk2
        foreign key (team_id) references team (team_id)
            deferrable initially immediate,
    constraint event_participation_check
        check (status = 'e' or status = 'n')
            deferrable initially immediate
);

-- SCOREBOARD (olympic id, event id, team id, participant id, position, medal id)
-- Stores the standings of the athletes in particular events along with the earned medal in case any
-- were earned. The position is the order of finishing at the event.
create table scoreboard(
    olympic_id      integer not null,
    event_id        integer not null,
    team_id         integer not null,
    participant_id  integer not null,
    position        integer not null,
    medal_id        integer,
    constraint scoreboard_pk
        primary key (olympic_id, event_id, team_id, participant_id)
            deferrable initially immediate,
    constraint scoreboard_fk1
        foreign key (olympic_id) references olympics (olympic_id)
            deferrable initially immediate,
    constraint scoreboard_fk2
        foreign key (event_id) references event (event_id)
            deferrable initially immediate,
    constraint scoreboard_fk3
        foreign key (team_id) references team (team_id)
            deferrable initially immediate,
    constraint scoreboard_fk4
        foreign key (participant_id) references participant (participant_id)
            deferrable initially immediate
    --constraint scoreboard_fk5
       -- foreign key (medal_id) references medal (medal_id)
         --   deferrable initially immediate
);