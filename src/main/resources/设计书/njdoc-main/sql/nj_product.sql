/*
nj_product
1	商品ID	product_id	int auto_increment
2	ブランド名	brand_name	varchar(64)
3	企業ID	company_id	int
4	商品名	product_name	varchar(64)
5	静的URL	static_url	varchar(128)
6	規格	standard	varchar(512)
7	写真1	photo1	blob
8	写真2	photo2	blob
9	写真3	photo3	blob
10	送料負担	postage	char(1)
11	割引	discount	numeric(3,2)
12	価格（税込）	price	int
13	削除フラグ	del_flg	int
14	登録日時	register_time	datetime
15	更新日時	update_time	timestamp
*/
-- 删除nj_product表
drop table if exists nj_product;
-- 创建nj_product表
create table nj_product (
    -- product_id 主键
	product_id int primary key auto_increment NOT NULL,
	brand_name varchar(64) NOT NULL,
	company_id int NOT NULL,
	product_name varchar(64) NOT NULL,
	static_url varchar(128) NOT NULL,
	standard varchar(512),
	photo1	blob,
	photo2	blob,
	photo3	blob,
	postage	char(1) NOT NULL,
	discount numeric(3,2) NOT NULL,
	price int NOT NULL,
	del_flg	int NOT NULL,
	register_time datetime NOT NULL,
	update_time	timestamp NOT NULL
);
-- 添加数据
insert into nj_product(brand_name,company_id,product_name,static_url,standard,photo1,photo2,photo3,postage,discount,price,del_flg,register_time,update_time)
values 
	("ブランド名1", 1,"商品名1","https://www.baidu.com/1","規格1","photo1","photo2","photo3","1",0.23,1000,"0","2023/05/27","2023/05/27"),
	("ブランド名2", 2,"商品名2","https://www.baidu.com/2","規格2","photo1","photo2","photo3","1",0.21,2000,"0","2023/05/27","2023/05/27"),
	("ブランド名3", 3,"商品名3","https://www.baidu.com/3","規格3","photo1","photo2","photo3","1",0.20,3000,"0","2023/05/27","2023/05/27");
select * from nj_product;