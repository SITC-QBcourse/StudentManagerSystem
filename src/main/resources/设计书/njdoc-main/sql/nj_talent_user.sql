/*
nj_talent_user
1	タレントID	talent_id	int auto_increment
2	メールアドレス	email	varchar(64)
3	パスワード	password	varchar(64)
4	権限UID	uid	int
5	ユーザ名（漢字）	name_kj	varchar(64)
6	ユーザ名（かな）	name_kn	varchar(64)
7	性別	sex	varchar(1)
7	郵便番号	post	varchar(8)
8	住所	address	varchar(64)
9	電話番号	tel	varchar(13)
10	タレントアイコン	talent_icon	blob
11	Twitter	twitter	varchar(128)
12	Instagram	instagram	varchar(128)
13	削除フラグ	del_flg	int
14	登録日時	register_time	datetime
15	更新日時	update_time	timestamp
*/
-- 删除nj_talent_user表
drop table if exists nj_talent_user;
-- 创建nj_talent_user表
create table nj_talent_user (
    -- talent_id 主键
    talent_id int primary key auto_increment NOT NULL,
	email varchar(64) NOT NULL,
	password varchar(64) NOT NULL,
	uid	int NOT NULL,
	name_kj	varchar(64) NOT NULL,
	name_kn	varchar(64) NOT NULL,
	sex varchar(1),
	post varchar(8) NOT NULL,
	address	varchar(64) NOT NULL,
	tel	varchar(13) NOT NULL,
	talent_icon	blob,
	twitter	varchar(128),
	instagram	varchar(128),
	del_flg	int NOT NULL,
	register_time datetime NOT NULL,
	update_time	timestamp NOT NULL
);
-- 添加数据
insert into nj_talent_user  (email,password,uid,name_kj,name_kn,sex,post,address,tel,talent_icon,twitter,instagram,del_flg,register_time,update_time)

values 
	("123456789@qq.com", "p123456",1,"田中", "たなか","男","261-0001","東京千葉県1","010-1234-5678","talent_icon1","twitter1","instagram1","0","2023/05/27","2023/05/27"),
	("223456789@qq.com", "p223456",2,"山田", "やまだ","男","261-0002","東京千葉県2","020-1234-5678","talent_icon2","twitter2","instagram2","0","2023/05/27","2023/05/27"),
	("323456789@qq.com", "p323456",3,"佐藤", "さとう","男","261-0003","東京千葉県3","030-1234-5678","talent_icon3","twitter3","instagram3","0","2023/05/27","2023/05/27");
select * from nj_talent_user;


/* 
在 列：Instagram 后 添加如下列数据
言語	language	varchar(3)
*/
select * from nj_talent_user;
alter table nj_talent_user add language varchar(3) after instagram;
update nj_talent_user set language = "1";


/* 
在 列：更新日時/update_time 后 添加前回ログイン時間列数据
前回ログイン時間	lastLogin_time	datetime
*/
select * from nj_talent_user;
alter table nj_talent_user add lastLogin_time datetime after update_time;


/* 
在 列：タレントアイコン/talent_icon 后 添加如下列数据
Youtube	youtube	varchar(3)
*/
select * from nj_talent_user;
alter table nj_talent_user add youtube varchar(128) after talent_icon;
update nj_talent_user set youtube = "youtube1";

/* 
在 列：Instagram 后 添加如下列数据
Tiktok	tiktok	varchar(128)

*/
select * from nj_talent_user;
alter table nj_talent_user add tiktok varchar(128) after instagram;
update nj_talent_user set tiktok = "tiktok1";

/* 
在 列：パスワード/password 后 添加Token列数据
Token token varchar(64)
*/
select * from nj_talent_user;
alter table nj_talent_user add token varchar(64) after password;