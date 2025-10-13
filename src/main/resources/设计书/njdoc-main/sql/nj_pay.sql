/*
nj_pay
1	入出金ID	pay_id	int auto_increment
2	企業ID	company_id	int
3	タレントID	talent_id	int
4	注文IDS	order_ids	varchar(512)
5	区分	kbn	char(1)
6	金額	amount	int
7	削除フラグ	del_flg	int
8	登録日時	register_time	datetime
9	更新日時	update_time	timestamp
*/
-- 创建nj_pay表
drop table if exists nj_pay;
-- 创建nj_pay表
create table nj_pay (
    -- pay_id 主键
	pay_id int primary key auto_increment NOT NULL,
	company_id int NOT NULL,
	talent_id int NOT NULL,
	order_ids varchar(512) NOT NULL,
	kbn	char(1) NOT NULL,
	amount int NOT NULL,
	del_flg	int NOT NULL,
	register_time datetime NOT NULL,
	update_time	timestamp NOT NULL
);
-- 添加数据
insert into nj_pay (company_id, talent_id, order_ids, kbn,amount,del_flg,register_time,update_time)
values 
	(1, 111,"注文IDS1","1",10000,"0","2023/05/27","2023/05/27"),
	(2, 222,"注文IDS2","1",20000,"0","2023/05/27","2023/05/27"),
	(3, 333,"注文IDS2","1",30000,"0","2023/05/27","2023/05/27");
select * from nj_pay;


/* 
在 列：金額/amount 后 添加如下列数据
支払状態	payment_status	char(1)
*/
select * from nj_pay;
alter table nj_pay add payment_status char(1) after amount;
update nj_pay set payment_status = "0";