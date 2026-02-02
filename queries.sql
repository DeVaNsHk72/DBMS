CREATE DATABASE College;
USE College;
CREATE TABLE Students (
    name char(30) not null,
    usn char(9) not null,
    branch char(10) not null default 'CSE',
    cgpa float not null check(cgpa>4 and cgpa<=10),
    CONSTRAINT usn_pk PRIMARY KEY (usn)
);

CREATE TABLE Department(
    d_id int not null,
    d_name char(25) not null,
    PRIMARY KEY(d_id)
);

ALTER TABLE Department
ADD CONSTRAINT dname_uk UNIQUE (d_name);

ALTER TABLE Students
ADD CONSTRAINT branch_fk
FOREIGN KEY (branch)
REFERENCES Department(d_name);
