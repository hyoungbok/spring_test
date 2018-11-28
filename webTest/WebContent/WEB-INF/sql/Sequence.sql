create table sequence(
	no 			number 			not null,
	primary key(no)
);


CREATE SEQUENCE seq_person
MINVALUE 1
START WITH 1
INCREMENT BY 1
CACHE 10;


select seq_person.currval from dual;

select seq_person.nextval from dual;
