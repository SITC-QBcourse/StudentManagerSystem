/*
nj_register_user
1	ユーザID	user_id	int auto_increment
2	権限UID	uid int
3	メールアドレス email varchar(64)
4	Token	token	varchar(64)
5	削除フラグ	del_flg	int
6	登録日時	register_time	datetime
7	有効日時	activation_time	datetime
*/
-- 删除nj_register_user表
drop table if exists nj_register_user;
-- 创建nj_register_user表
create table nj_register_user (
    -- user_id 主键
    user_id int primary key auto_increment NOT NULL,
    uid int NOT NULL,  
    email varchar(64) NOT NULL,  
    token varchar(64) NOT NULL,  
    del_flg int NOT NULL, 
    register_time datetime NOT NULL, 
    activation_time	datetime NOT NULL
);
-- 添加数据
insert into nj_register_user (uid,email,token,del_flg,register_time,activation_time)
values 
       (1, "a@a.a","token1","0","2023/05/27","2023/05/27"),
       (2, "c@c.c","token2","0","2023/05/27","2023/05/27"),
       (3, "t@t.t","token3","0","2023/05/27","2023/05/27");
select * from nj_register_user;