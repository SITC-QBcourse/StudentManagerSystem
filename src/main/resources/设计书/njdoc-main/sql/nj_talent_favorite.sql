/*
nj_talent_favorite
1	タレントID talent_id int auto_increment
2	企業ID company_id int
*/
-- 删除nj_talent_favorite表
drop table if exists nj_talent_favorite;
-- 创建nj_company_favorite表
create table nj_talent_favorite (
    -- talent_id 主键
    talent_id int NOT NULL,
    company_id int NOT NULL, 
    primary key(talent_id,company_id)
);
-- 添加数据
insert into nj_talent_favorite (company_id)
values 
       (1),
       (1),
       (1);
select * from nj_talent_favorite;