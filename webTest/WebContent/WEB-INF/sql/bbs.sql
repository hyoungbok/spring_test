drop table bbs purge;

create table bbs(

	bbsno		number(7)		not null,
	wname		varchar(20)		not null,
	title		varchar(100)	not null,
	content		varchar(4000)	not null,
	passwd		varchar(15)		not null,
	viewcnt		number(5)		default 0,
	wdate		date			not null,
	grpno		number(7)		default 0,	--부모글 언어
	indent		number(2)		default 0,
	ansnum		number(5)		default 0,
	primary	key(bbsno)
);

--부모글 삭제 못하게 하기 위한 컬럼
alter table bbs
add(refnum		number		default 0);


alter table bbs
add(filename 	varchar(30),
	filesize	number default 0 );

select * from bbs

--create
select nvl(max(bbsno),0)+1 as max from bbs;


insert into bbs(bbsno,wname,title, content, passwd, wdate,grpno)
values((select nvl(max(bbsno),0)+1 as max from bbs),
		'왕눈이','제목','내용','123',sysdate,
		(select nvl(max(grpno),0)+1 as max from bbs)
		);
		
--list
SELECT bbsno, wname, title,  viewcnt, wdate,
		grpno, indent, ansnum , r
from(
	SELECT bbsno, wname, title,  viewcnt, wdate,
		grpno, indent, ansnum ,rownum as r
	from (
		SELECT bbsno, wname, title,  viewcnt, 
		to_char(wdate,'yyyy-mm-dd') as wdate,
		grpno, indent, ansnum 
		FROM bbs  
		ORDER BY bbsno DESC
	)
) where r>=1 and r<=5

--조회수증가 update 
update bbs 
set viewcnt=viewcnt+1
where bbsno=1;

--read
select bbsno,wname,title,content,viewcnt,wdate,grpno,indent,ansnum
from bbs
where bbsno=1;

--update
update bbs
set wname='왕눈이', title='비오는날', content='개구리 연못'
where bbsno=1;

--패스워드 검사
select count(bbsno) as cnt
from bbs
where bbsno=1
and passwd='123';

select *from bbs;
--delete
delete from bbs 
where bbsno=6;


select bbsno, passwd from bbs;


delete from BBS;


select bbsno, grpno, indent, ansnum,refnum
from BBS
order by grpno desc, ansnum








