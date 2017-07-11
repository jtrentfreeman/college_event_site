# setting up the person-university-event database
drop database if exists pue;
create database pue;
use pue;

# stores user info
create table user (
  userId      int(10) auto_increment not null,      /* automatic id */
  uName       varchar(30)            not null,      /* stores username */
  pass        varchar(30)            not null,      /* stores users password */
  acLevel     int(1)                 not null,      /* access level 0: User, 1: Admin, 2: Super Admin */
  fName       varchar(30)            not null,      /* users first name */
  lName       varchar(30)            not null,      /* users last name */
  email       varchar(50),                          /* email for admins */
  phone       varchar(20),                          /* phone for admins */
  uniId       int(10),                              /* users university id */
  primary key (userId),
  unique key uName (uName)
);

# stores university info
create table university (
  uniId       int(10) auto_increment not null,      /* automatic integer id for the university */
  uniName     varchar(50),                          /* name of university */
  location    varchar(50),                          /* location of university */
  uDescr      varchar(100),                         /* brief description */
  numStud     int(10),                              /* contains number of students */
  photo       longblob,                             /* photos of university should be contained in a blob */
  primary key (uniId),
  unique key uniName (uniName)
);

# stores event info
create table event (
  eveId       int(10) auto_increment,               /* automatic integer id for the event */
  eName       varchar(30),                          /* name for event */
  category    varchar(30),                          /* category for the event */
  eDescr      varchar(500),                         /* social, fundraising, tech talks, etc. */
  eTime       varchar(30),                          /* time of event */
  eDate       date,                                 /* date for event (YEAR/MO/DAY format) */
  location    varchar(50),                          /* where event is located */
  uniId       int(10),                              /* id of university where event is held */
  email       varchar(50),                          /* email of user that created the event */
  primary key (eveId),
  unique key eName (eName)         
);

# registed student organization
create table rso (
  rsoId       int(10) auto_increment,              /* automatic integer id for the rso */
  name        varchar(50),                         /* name of specific rso */
  rDescr      varchar(50),                         /* description of the rso */
  email       varchar(50),                         /* email of the head of the rso */
  phone       varchar(50),                         /* phone of the head of the rso */
  head        int(10),                             /* id of the head of the rso, id of a user */
  uniId       int(10),                             /* id of the university the rso is from */
  primary key (rsoId)
); 

create table review (
  revId       int(10) auto_increment,              /* automatic integer id for the review */
  eveId       int(10),                             /* id of the event the review is for */
  rating      int(1),                              /* 1 - 5 star rating, input by the user */
  eComment    varchar(100),                        /* Feed back, provided by the user */
  primary key (revId)
);


# insert into user(uName, pass, acLevel, fName, lName, email, phone, uniId) values

insert into user(uName, pass, acLevel, fName, lName, email, phone, uniId) values ('Super Admin', 'adminpass', '2', 'Super', 'Admin', 'superadmin@knights.ucf.edu', '1238888888', '1'); 

insert into user(uName, pass, acLevel, fName, lName, email, phone, uniId) values ('Admin_1', 'adOne', '1', 'Admin', 'One', 'adminOne@knights.ucf.edu', '1239999999', '1');

insert into user(uName, pass, acLevel, fName, lName, email, phone, uniId) values ('Admin_0', 'adZero', '1', 'Admin', 'Zero', 'adminZero@knights.ucf.edu', '1240000000', '2');

insert into user(uName, pass, acLevel, fName, lName, email, phone, uniId) values ('Arts Admin', 'art', '1', 'Molly', 'Reilly', 'Molly.Reilly@ucf.edu', '4071111111' , '1');

insert into user(uName, pass, acLevel, fName, lName, email, phone, uniId) values ('Health Admin', 'health', '1', 'Pamela', 'Mills', 'Pamela.mills@ucf.edu', '4078235841', '1');

insert into user(uName, pass, acLevel, fName, lName, email, phone, uniId) values ('Workshop Admin', 'workshopconf', '1', 'Robert', 'Dwyer', 'Robert.Dwyer@ucf.edu', '4078232811', '1');

# insert into university(uniName, location, uDescr, numStud, photo) values

insert into university(uniName, location, uDescr, numStud, photo) values ('UCF', 'Orlando, FL', 'University of Central Florida', '60000', null);

insert into university(uniName, location, uDescr, numStud, photo) values ('UF', 'Gainesville, FL', 'University of Florida', '50000', null);

insert into university(uniName, location, uDescr, numStud, photo) values ('FSU', 'Talahassee, Florida', 'Florida State', '50000', null);

# insert into event(eName, category, eDescr, eTime, eDate, location, uniId, email) values

insert into event(eName, category, eDescr, eTime, eDate, location, uniId, email) values ('Hack@UCF', 'Club', 'First meeting for the Cyber Security Club @ UCF', '16:00', '2017/08/25', 'HEC 101 @ UCF', '1', 'adminOne@knights.ucf.edu');

insert into event(eName, category, eDescr, eTime, eDate, location, uniId, email) values ('Identity: An Exhibition of You', 'Arts Exhibit', 'This exhibit challenges our notions of personal identity using the familiar.', '10 a.m.', '2017/07/03', 'Orlando Science Center', '1', 'Molly.Reilly@ucf.edu');

insert into event(eName, category, eDescr, eTime, eDate, location, uniId, email) values ('Ted Talk and Tea Tuesdays', 'Health', 'Come to the Wellness and Health Promotions Services office every Tuesday during summer B.', '10 a.m. - 2 p.m.', '2017/07/11', 'Recreation and Wellness Center: 111', '1', 'Pamela.Mills@ucf.edu');

insert into event(eName, category, eDescr, eTime, eDate, location, uniId, email) values ('Grief and Loss Workshop', 'Workshop/Conference', 'This workshop provides a safe and supportive space for students to learn about different responses to loss.', '11 a.m. - 12 p.m.', '2017/07/11', 'Counseling and Psychological Services: Group Room', '1', 'Robert.Dwyer@ucf.edu');

# insert into rso (name, rDescr, email, phone, head, uniId) values 

insert into rso (name, rDescr, email, phone, head, uniId) values ('Student Org One', 'The first student organization', 'adminOne@knights.ucf.edu', '1239999999', '2', '1');

insert into rso (name, rDescr, email, phone, head, uniId) values ('Student Org Zero', 'The zeroth student organization', 'adminZero@knights.ucf.edu', '1240000000', '3', '2');

# insert into review(eveId, rating, eComment) values 

insert into review(eveId, rating, eComment) values ('1', '5', 'Good event');

insert into review(eveId, rating, eComment) values ('1', '1', 'Bad event');

select * from user;
select * from university;
select * from event;
select * from rso;
select * from review;


