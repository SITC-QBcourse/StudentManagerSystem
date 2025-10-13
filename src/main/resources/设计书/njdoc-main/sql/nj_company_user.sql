/*
nj_company_user
1	企業ID	company_id	int auto_increment
2	氏名（漢字）	name_kj	varchar(64)
3	氏名（かな）	name_kn	varchar(64)
4	メールアドレス	email	varchar(128)
5	パスワード	password	varchar(16)
6	権限UID	uid	int
7	企業名（漢字）	company_kj	varchar(64)
8	企業名（かな）	company_kn	varchar(64)
9	郵便番号	post	varchar(8)
10	住所	address	varchar(64)
11	電話番号	tel	varchar(13)
12	削除フラグ	del_flg	int
13	登録日時	register_time	datetime
14	更新日時	update_time	timestamp
*/
-- 删除nj_company_user表
drop table if exists nj_company_user;
-- 创建nj_company_user表
create table nj_company_user (
    -- company_id 主键
	company_id	int primary key auto_increment NOT NULL,
	name_kj varchar(64) NOT NULL,
	name_kn varchar(64) NOT NULL,
	email varchar(128) NOT NULL,
	password varchar(16) NOT NULL,
	uid int NOT NULL,
	company_kj varchar(64) NOT NULL,
	company_kn varchar(64) NOT NULL,
	post varchar(8) NOT NULL,
	address varchar(64) NOT NULL,
	tel varchar(13) NOT NULL,
	del_flg int NOT NULL,
	register_time datetime NOT NULL,
	update_time	timestamp NOT NULL
);
-- 添加数据
insert into nj_company_user (name_kj,name_kn,email,password,uid,company_kj,company_kn,post,address,tel,del_flg,register_time,update_time)
values 
	("田中", "たなか","123456789@qq.com", "p123456",1,"●●株式会社1","●●かぶしきかいしゃ1","261-0001","東京千葉県1","010-1234-5678","0","2023/05/27","2023/05/27"),
	("山田", "やまだ","223456789@qq.com", "p223456",1,"●●株式会社2","●●かぶしきかいしゃ2","261-0002","東京千葉県2","020-1234-5678","0","2023/05/27","2023/05/27"),
	("佐藤", "さとう","323456789@qq.com", "p323456",1,"●●株式会社3","●●かぶしきかいしゃ3","261-0003","東京千葉県3","030-1234-5678","0","2023/05/27","2023/05/27");
select * from nj_company_user;

/* 
在 列：電話番号/tel 后 添加如下列数据
言語	language	varchar(3)
*/
select * from nj_company_user;
alter table nj_company_user add language varchar(3) after tel;
update nj_company_user set language = "1";

/* 
在 列：更新日時/update_time 后 添加前回ログイン時間列数据
前回ログイン時間	lastLogin_time	datetime
*/
select * from nj_company_user;
alter table nj_company_user add lastLogin_time datetime after update_time;

/* 
在 列：パスワード/password 后 添加Token列数据
Token token varchar(64)
*/
select * from nj_company_user;
alter table nj_company_user add token varchar(64) after password;
