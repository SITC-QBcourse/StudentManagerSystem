/*
nj_user_actor
1	ユーザID	user_id	int
2	アクターID	actor_id	int
*/
-- 删除nj_user_actor表
drop table if exists nj_user_actor;
-- 创建nj_user_actor表
create table nj_user_actor (
    -- user_id 主键
    user_id int NOT NULL,
    actor_id int NOT NULL, 
    primary key(user_id,actor_id)
);
-- 添加数据
insert into nj_user_actor (user_id, actor_id)
values 
       (1,1),
       (2,2),
       (3,3);
select * from nj_user_actor;