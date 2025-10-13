/*
nj_order
1	注文ID	order_id	int auto_increment
2	企業ID	company_id	int
3	商品ID	product_id	int
4	タレントID	talent_id	int
5	チャンネルID	channel_id	int
6	送料負担	postage	char(1)
7	割引	discount	varchar(12)
8	価格（税込）	price	int
9	宣伝報酬（税込）	publicize_reward	int
10	区分	kbn	char(1)
11	状態	status	char(1)
12	削除フラグ	del_flg	int
13	登録日時	register_time	datetime
14	更新日時	update_time	timestamp
*/
-- 删除nj_order表
drop table if exists nj_order;
-- 创建nj_order表
create table nj_order (
    -- order_id 主键
	order_id int primary key auto_increment NOT NULL,
	company_id int NOT NULL,
	product_id int NOT NULL,
	talent_id int NOT NULL,
	channel_id int NOT NULL,
	postage	char(1) NOT NULL,
	discount varchar(12) NOT NULL,
	price int NOT NULL,
	publicize_reward int,
	kbn	char(1) NOT NULL,
	status char(1) NOT NULL,
	del_flg	int NOT NULL,
	register_time datetime NOT NULL,
	update_time	timestamp NOT NULL
);
-- 添加数据
insert into nj_order(company_id, product_id, talent_id, channel_id, postage, discount, price, publicize_reward, kbn,status,del_flg,register_time,update_time)
values 
	(1, 11,111,1111,"1","1000",10000,1000,"1","1","0","2023/05/27","2023/05/27"),
	(2, 22,222,2222,"1","2000",20000,1000,"1","1","0","2023/05/27","2023/05/27"),
	(3, 33,333,3333,"1","3000",30000,1000,"1","1","0","2023/05/27","2023/05/27");
select * from nj_order;

/* 
在 列：状態 后 添加如下列数据

注文日	order_date	datetime
承認日	approval_date	datetime
配送希望時間帯	delivery_time	datetime
視聴人数	view_number	int
再生回数	playback_count	int
公開URL	public_url	varchar(128)
*/
alter table nj_order add order_date datetime after status;
update nj_order set order_date = "2023/07/05";
alter table nj_order add approval_date datetime after order_date;
update nj_order set approval_date = "2023/07/06";
alter table nj_order add delivery_time datetime after approval_date;
update nj_order set delivery_time = "2023/07/07/09:00";
alter table nj_order add view_number int after delivery_time;
update nj_order set view_number = "100";
alter table nj_order add playback_count int after view_number;
update nj_order set playback_count = "80";
alter table nj_order add public_url varchar(128) after playback_count;
update nj_order set public_url = "www.njservice.com";

/* 
在 列：状態 后 添加如下列数据

入出金状態	pay_status	char(1)
*/
select * from nj_order;
alter table nj_order add pay_status varchar(1) after status;
update nj_order set pay_status = "0";

/* 
在 列：承認日 后 添加如下列数据

注文公開更新日時	datetime NOT NULL
*/
select * from nj_order;
alter table nj_order add public_date datetime after approval_date;
update nj_order set public_date = "2023/09/15";


/* 
在 列：配送希望時間帯 后 添加如下列数据

登録人数	register_number	int NOT NULL
*/
select * from nj_order;
alter table nj_order add register_number int NOT NULL after delivery_time;
update nj_order set register_number = 100;

/* 
修改列名：
コメント回数	comment_count
いいね回数	good_count
再生回数	view_count
*/

ALTER TABLE nj_order
RENAME COLUMN playback_count TO view_count;

ALTER TABLE nj_order
RENAME COLUMN view_number TO good_count;

ALTER TABLE nj_order
RENAME COLUMN register_number TO comment_count;