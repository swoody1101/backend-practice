drop table memeber;
drop table board;
drop sequence seq_board_num;

create table member (
    id varchar2(10) not null,
    pass varchar2(10) not null,
    name varchar2(30) not null,
    regidate date default sysdate not null,
    primary key (id)
);

create table board (
    num number primary key,
    title varchar2(200) not null,
    content varchar2(2000) not null,
    id varchar2(10) not null,
    postdate date default sysdate not null,
    visitcount number(6)
);

alter table board
    add constraint board_mem_fk foreign key (id)
    references member (id);

create sequence seq_board_num 
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache;

insert into member (id, pass, name) values ('swoody', '1234', '이상우');

insert into board (num, title, content, id, postdate, visitcount)
    values (seq_board_num.nextval, '제목1입니다', '내용1입니다.', 'swoody', sysdate, 0);
