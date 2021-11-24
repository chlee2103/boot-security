create table ds_user
(
    seq         bigint auto_increment comment '시퀀스'
        primary key,
    user_id     varchar(320)                        not null comment '계정',
    user_pw     char(60)                            not null comment '패스워드',
    user_nick   varchar(10)                         not null comment '닉네임',
    user_name   varchar(10)                         not null comment '사용자이름',
    authorize   varchar(10)                         not null comment '권한',
    user_phone  varchar(11)                         not null comment '휴대폰',
    is_off      char      default 'N'               not null comment '차단여부',
    is_adm      char      default 'N'               not null comment '관리자여부',
    dlt_yn      char      default 'N'               not null comment '삭제여부',
    branch_type varchar(5)                          null comment '지사타입',
    description varchar(1000)                       null comment '메모(노출X)',
    reg_dtm     timestamp default CURRENT_TIMESTAMP null comment '생성일자',
    udt_dtm     timestamp                           null comment '수정일자'
)
    comment '사용자';

create table ds_board
(
    board_seq     bigint auto_increment comment '게시글순번'
        primary key,
    board_title   varchar(100) charset utf8             not null comment '게시글제목',
    reg_id        varchar(60)  charset utf8             not null comment '게시글작성자',
    board_content longtext                                  null comment '게시글내용',
    file_path     varchar(200) charset utf8                 null comment '첨부파일',
    reg_dtm       timestamp    default current_timestamp    null comment '작성일시',
    last_upt_dtm  timestamp                                 null comment '마지막수정일시',
    dlt_yn        char default 'N'                          null comment '삭제여부'
    read_count     int           default 0                   null
)
    comment '게시글';