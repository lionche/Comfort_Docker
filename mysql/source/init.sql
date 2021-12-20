create schema comfort;
use comfort;
create table Table_Function
(
    Id               int auto_increment
        primary key,
    Function_content text not null,
    SourceFun_id     int  null,
    Mutation_method  int  null,
    Remark           text null
);

create table Table_Suspicious_Result
(
    Id          int auto_increment
        primary key,
    Error_type  text null,
    Testcase_id int  null,
    Function_id int  null,
    Testbed_id  int  null,
    Remark      text null
);

create table Table_Testbed
(
    Id               int auto_increment
        primary key,
    Testbed_name     text null,
    Testbed_version  text null,
    Testbed_location text null,
    Remark           text null
);

create table Table_Testcase
(
    Id                int auto_increment
        primary key,
    Testcase_context  text null,
    SourceFun_id      int  null,
    SourceTestcase_id int  null,
    Fuzzing_times     int  null,
    Mutation_method   int  null,
    Mutation_times    int  null,
    Interesting_times int  null,
    Probability       int  null,
    Remark            text null,
    constraint Table_Testcase_Table_Function_Id_fk
        foreign key (SourceFun_id) references Table_Function (Id)
            on update cascade on delete cascade
);

create table Table_Result
(
    Id              int auto_increment
        primary key,
    Testcase_id     int   null,
    Testbed_Id      int   null,
    Returncode      int   null,
    Stdout          text  null,
    Stderr          text  null,
    Duration_ms     float null,
    Seed_coverage   float null,
    Engine_coverage float null,
    Remark          text  null,
    constraint Table_Result_Table_Testbed_Id_fk
        foreign key (Testbed_Id) references Table_Testbed (Id)
            on update cascade on delete cascade,
    constraint Table_Result_Table_Testcase_Id_fk
        foreign key (Testcase_id) references Table_Testcase (Id)
            on update cascade on delete cascade
);

