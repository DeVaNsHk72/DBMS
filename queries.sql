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

-- selecting only unique entries from the table
SELECT DISTINCT author_id as id FROM Views where author_id = viewer_id 
ORDER BY id ASC;

-- If a row in the parent table is deleted, all matching rows in the child table are also deleted.
FOREIGN KEY (d_id)
REFERENCES Department(d_id)
ON DELETE CASCADE;

-- If a row in the parent table is deleted, all matching rows in the child table are set to NULL.
FOREIGN KEY (d_id)
REFERENCES Department(d_id)
ON DELETE SET NULL;

-- If a row in the parent table is deleted, all matching rows in the child table are set to the default value.
-- default value must exist in the child table
FOREIGN KEY (d_id)
REFERENCES Department(d_id)
ON DELETE SET DEFAULT;

-- If a row in the parent table is updated, all matching rows in the child table are also updated.
FOREIGN KEY (d_id)
REFERENCES Department(d_id)
ON UPDATE CASCADE;

-- If a row in the parent table is updated, all matching rows in the child table are set to NULL.
FOREIGN KEY (d_id)
REFERENCES Department(d_id)
ON UPDATE SET NULL;

-- If a row in the parent table is updated, all matching rows in the child table are set to the default value.
-- default value must exist in the child table
FOREIGN KEY (d_id)
REFERENCES Department(d_id)
ON UPDATE SET DEFAULT;
