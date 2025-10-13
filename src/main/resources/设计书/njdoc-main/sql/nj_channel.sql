/*
nj_channel
1	チャンネルID	channel_id	int auto_increment
2	タレントID	talent_id	int
3	チャンネル名	channel_name	varchar(64)
4	URL	url	varchar(128)
5	登録者数	register_number	int
6	チャンネルアイコン	channel_icon	blob
7	宣伝報酬（税込）	publicize_reward	int
8	削除フラグ	del_flg	int
9	登録日時	register_time	datetime
10	更新日時	update_time	timestamp
*/
-- 删除nj_channel表
drop table if exists nj_channel;
-- 创建nj_channel表
create table nj_channel (
    -- channel_id 主键
	channel_id int primary key auto_increment NOT NULL,
	talent_id int NOT NULL,
	channel_name varchar(64) NOT NULL,
	url	varchar(128) NOT NULL,
	register_number	int,
	channel_icon blob,
	publicize_reward int,
	del_flg	int NOT NULL,
	register_time datetime NOT NULL,
	update_time	timestamp NOT NULL
);
-- 添加数据
insert into nj_channel (talent_id,channel_name,url,register_number,channel_icon,publicize_reward,del_flg,register_time,update_time)
values 
	(1, "チャンネル名1","https://www.baidu.com/1",10,"channel_icon1",10000,"0","2023/05/27","2023/05/27"),
	(2, "チャンネル名2","https://www.baidu.com/2",20,"channel_icon2",20000,"0","2023/05/27","2023/05/27"),
	(3, "チャンネル名3","https://www.baidu.com/3",30,"channel_icon3",30000,"0","2023/05/27","2023/05/27");
select * from nj_channel;