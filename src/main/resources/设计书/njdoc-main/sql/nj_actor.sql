/*
nj_actor
1	アクターID	actor_id	int
2	アクター名	actor_name	varchar(64)
3	アクター説明	actor_explanation	varchar(512)

*/
-- 删除nj_actor表
drop table if exists nj_actor;
-- 创建nj_actor表
create table nj_actor (
    -- actor_id 主键
    actor_id int primary key auto_increment NOT NULL,
    actor_name varchar(64) NOT NULL,   
    actor_explanation varchar(512) NOT NULL
);
-- 添加数据
insert into nj_actor (actor_id, actor_name, actor_explanation)
values 
       (1, "管理者", "アクター説明1"),
       (2, "企業", "アクター説明2"),
       (3, "タレント", "アクター説明3");
select * from nj_actor;