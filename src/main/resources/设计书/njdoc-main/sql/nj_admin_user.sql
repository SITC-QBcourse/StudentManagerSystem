/* 
nj_admin_user		
1	管理者ID	admin_id	int auto_increment
2	氏名（漢字）	name_kj	varchar(64)
3	氏名（かな）	name_kn	varchar(64)
4	メールアドレス	email	varchar(64)
5	パスワード	password	varchar(16)
6	Token	token	varchar(64)
7	権限	uid	int
8	郵便番号	post	varchar(8)
9	住所	address	varchar(64)
10	電話番号	tel	varchar(13)
11	言語	language	varchar(3)
12	削除フラグ	del_flg	int
13	登録日時	register_time	datetime
14	更新日時	update_time	timestamp
15	前回ログイン時間	lastLogin_time	datetime
*/
-- 删除nj_admin_user表
drop table if exists nj_admin_user;
-- 创建nj_admin_user表
create table nj_admin_user (
    -- admin_id 主键
    admin_id int primary key auto_increment NOT NULL,
    name_kj varchar(64) NOT NULL,
    name_kn varchar(64) NOT NULL,
    email varchar(64) NOT NULL,
    password varchar(128) NOT NULL,
    token varchar(64),
    uid int NOT NULL,   
    tel	varchar(13) NOT NULL,
    del_flg	int NOT NULL,
    register_time datetime NOT NULL,
    update_time	timestamp NOT NULL
);
-- 添加数据
insert into nj_admin_user (name_kj, name_kn, uid,email,password,tel,del_flg,register_time,update_time)
values 
       ("田中", "たなか",1,"123456789@qq.com", "p123456","010-1234-5678","0","2023/05/27","2023/05/27"),
       ("山田", "やまだ",2,"223456789@qq.com", "p223456","020-1234-5678","1","2023/05/27","2023/05/27"),
       ("佐藤", "さとう",3,"323456789@qq.com", "p323456","030-1234-5678","0","2023/05/27","2023/05/27");
select * from nj_admin_user;

/* 
在 列：電話番号/tel 后 添加如下列数据
言語	language	varchar(3)
*/
select * from nj_admin_user;
alter table nj_admin_user add language varchar(3) after tel;
update nj_admin_user set language = "1";


/* 
在 列：更新日時/update_time 后 添加前回ログイン時間列数据
前回ログイン時間	lastLogin_time	datetime
*/
select * from nj_admin_user;
alter table nj_admin_user add lastLogin_time datetime after update_time;

/* 
在 列：パスワード/password 后 添加郵便番号列数据
郵便番号 post varchar(8)
*/
select * from nj_admin_user;
alter table nj_admin_user add post varchar(8) after password;


在 列：郵便番号/post 后 添加住所列数据
住所 address varchar(64)
*/
select * from nj_admin_user;
alter table nj_admin_user add address varchar(64) after post;

在 列：パスワード/password 后 添加Token列数据
Token token varchar(64)
*/
select * from nj_admin_user;
alter table nj_admin_user add token varchar(64) after password;