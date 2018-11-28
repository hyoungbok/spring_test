create table img(
  no		number			not null,
  name		varchar(20)		not null,
  title		varchar(800)	not null,
  passwd	varchar(20)		not null,
  mdate		date			not null,
  fname		varchar(50)		default 'member.jpg',
  grpno		number			default 0,
  indent	number			default	0,
  ansnum	number			default	0,
  PRIMARY KEY (no) 
);

alter table img
add (refnum number default 0)

insert into img(no, name, title,passwd, mdate,fname, grpno, indent,ansnum)
values((select nvl(max(no),0)+1 from img),
'몰라','몰라','1234',sysdate,'man.jpg','0','0','0');

select *from img

delete from img

select count(no) from IMG
where refnum=1

alter table img
add(content varchar(4000) );

alter table img
add(viewcnt number(5)		default 0 );


ALTER TABLE img DROP COLUMN content


 insert into img(no, name, title,passwd, mdate,fname, grpno, content)
values((select nvl(max(no),0)+1 from img), 1,2,3,sysdate,4,(select nvl(max(grpno),0)+1 from img),5)





