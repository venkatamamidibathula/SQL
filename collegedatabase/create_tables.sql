CREATE TABLE College (
    cname VARCHAR(50) PRIMARY KEY,
    state CHAR(2),
    enrollment INT
);

CREATE TABLE Student (
    sid INT PRIMARY KEY,
    sname VARCHAR(50),
    GPA DECIMAL(2,1),
    sizehs INT
);

CREATE TABLE Apply (
    sid INT,
    cname VARCHAR(50),
    major VARCHAR(50),
    decision CHAR(1),
    PRIMARY KEY (sid, cname, major),
    FOREIGN KEY (sid) REFERENCES Student(sid),
    FOREIGN KEY (cname) REFERENCES College(cname)
);
