create table Persons
(
    PersonID  int          not null,
    FirstName varchar(128) not null,
    FullName  varchar(256) null,
    Gender    bit          not null,
    BirthDate date         not null,
    Email     varchar(255) not null,
    constraint PK_Persons primary key (PersonID),
    constraint UK_Persons_Email unique (Email)
);

create table Teachers
(
    PersonID  int         not null,
    TeacherID int         not null,
    JobTitle  varchar(64) not null,
    Salary    int         not null,
    constraint PK_Teachers primary key (TeacherID),
    constraint UK_Teachers_PersonID unique (PersonID),
    constraint FK_Teachers_PersonID foreign key (PersonID)
        references Persons (PersonID)
        on delete cascade
        on update cascade
);

create table Students
(
    PersonID  int not null,
    StudentID int not null,
    GroupID   int not null,
    constraint PK_Students primary key (StudentID),
    constraint UK_Students_PersonID unique (PersonID),
    constraint UK_Students_StudentID_GroupID unique (GroupID, StudentID),
    constraint FK_Students_PersonID foreign key (PersonID)
        references Persons (PersonID)
        on delete cascade
        on update cascade
);

create table Groups
(
    GroupID   int         not null,
    GroupName varchar(64) not null,
    StudentID int         not null,
    LessonID  int         not null,
    constraint PK_Groups primary key (GroupID),
    constraint UK_Groups_StudentID unique (StudentID),
    constraint UK_Groups_LessonID unique (LessonID),
    constraint FK_Groups_GroupID_StudentID foreign key (GroupID, StudentID)
        references Students (GroupID, StudentID)
        on delete cascade
        on update cascade
);

create table Subjects
(
    SubjectID   int         not null,
    SubjectName varchar(64) not null,
    constraint PK_Subjects primary key (SubjectID)
);

create table Lessons
(
    LessonID  int not null,
    Semester  int not null,
    TeacherID int not null,
    GroupID   int not null,
    SubjectID int not null,
    constraint PK_Lessons primary key (
        Semester, TeacherID, GroupID, SubjectID
    ),
    constraint UK_Lessons_LessonID unique (LessonID),
    constraint UK_Lessons_GroupID_LessonID unique (GroupID, LessonID),
    constraint FK_Lessons_TeacherID foreign key (TeacherID)
        references Teachers (TeacherID),
    constraint FK_Lessons_GroupID foreign key (GroupID)
        references Groups (GroupID),
    constraint FK_Lessons_SubjectID foreign key (SubjectID)
        references Subjects (SubjectID)
);

create table Marks
(
    Mark      decimal(5, 2) not null,
    StudentID int           not null,
    LessonID  int           not null,
    constraint PK_Marks primary key (StudentID, LessonID),
    constraint FK_Marks_StudentID foreign key (StudentID)
        references Students (StudentID)
        on delete cascade
        on update cascade,
    constraint FK_Marks_LessonID foreign key (LessonID)
        references Lessons (LessonID)
        on delete cascade
        on update cascade
);

alter table Students
    add constraint FK_Students_GroupID foreign key (GroupID)
        references Groups (GroupID) deferrable initially deferred;

alter table Groups
    add constraint FK_Groups_GroupID_LessonID foreign key (GroupID, LessonID)
        references Lessons (GroupID, LessonID) deferrable initially deferred;
