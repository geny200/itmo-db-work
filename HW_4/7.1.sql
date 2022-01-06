create table "Lecturers"
(
    "LecturerId"   int       not null,
    "LecturerName" varchar(255) not null,
    constraint "pk_Lecturers" primary key ("LecturerId")
);

create table "Courses"
(
    "CourseId"   int         not null,
    "CourseName" varchar(63) not null,
    constraint "pk_Courses" primary key ("CourseId")
);

create table "Groups"
(
    "GroupId"   int       not null,
    "GroupName" char(31) not null,
    constraint "pk_Groups" primary key ("GroupId"),
    constraint "uc_Groups_GroupName" unique ("GroupName")
);

create table "Students"
(
    "StudentId"   int          not null,
    "StudentName" varchar(255) not null,
    "GroupId"     int          not null,
    constraint "pk_Students" primary key ("StudentId"),
    constraint "fk_Students_GroupId" foreign key ("GroupId")
        references "Groups" ("GroupId")
);

create table "Marks"
(
    "CourseId"  int not null,
    "StudentId" int not null,
    "Mark"      int not null,
    constraint "pk_Marks" primary key (
        "CourseId",
        "StudentId"
    ),
    constraint "fk_Marks_CourseId" foreign key ("CourseId")
        references "Courses" ("CourseId"),
    constraint "fk_Marks_StudentId" foreign key ("StudentId")
        references "Students" ("StudentId")
);

create table "Plan"
(
    "GroupId"    int not null,
    "CourseId"   int not null,
    "LecturerId" int not null,
    constraint "pk_Plan" primary key (
        "GroupId",
        "CourseId"
    ),
    constraint "fk_Plan_GroupId" foreign key ("GroupId")
        references "Groups" ("GroupId"),
    constraint "fk_Plan_CourseId" foreign key ("CourseId")
        references "Courses" ("CourseId"),
    constraint "fk_Plan_LecturerId" foreign key ("LecturerId")
        references "Lecturers" ("LecturerId")
);




