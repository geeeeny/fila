select * from members;

DROP TABLE IMAGES;

create table IMAGES(
	image_id	number primary key,
	title		varchar2(100),
	description	varchar2(500),
	file_name	varchar2(100),
	thumb_name	varchar2(100),
	file_size	number,
	mime_type	varchar2(30),
	reg_date	date	default sysdate
);

select * from IMAGES;
create sequence images_seq;