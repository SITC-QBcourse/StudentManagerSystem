/*
nj_company_favorite
1	企業ID company_id int auto_increment
2	タレントID talent_id int
*/
-- 删除nj_company_favorite表
drop table if exists nj_company_favorite;
-- 创建nj_company_favorite表
create table nj_company_favorite (
    -- company_id 主键
    company_id int NOT NULL,
    talent_id int NOT NULL, 
    primary key(company_id,talent_id)
);
-- 添加数据
insert into nj_company_favorite (talent_id)
values 
       (1),
       (1),
       (1);
select * from nj_company_favorite;