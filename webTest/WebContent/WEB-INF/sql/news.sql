drop table news;
create table news(
newsno int not null,
title varchar(100) not null,
media varchar(50) not null,
author varchar(30) not null,
rdate date not null,
primary key(newsno)
);

INSERT INTO news(newsno, title, media, author, rdate)
VALUES(1, "MS, 2016년 구형 'IE' 브라우저 지원 중단", 'ZDNet', '가길동', sysdate);
 
-- MySQL 가능
INSERT INTO news(newsno, title, media, author, rdate)
VALUES(1, 'MS, 2016년 구형 \'IE\' 브라우저 지원 중단', 'ZDNet', '가길동', sysdate);
 
-- Oracle, single quotation의 추가
INSERT INTO news(newsno, title, media, author, rdate)
VALUES(2, 'MS, 2016년 구형 ''IE'' 브라우저 지원 중단', 'ZDNet', '가길동', sysdate);
 