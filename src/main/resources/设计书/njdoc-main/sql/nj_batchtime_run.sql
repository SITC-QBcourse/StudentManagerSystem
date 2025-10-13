/* 
nj_batchtime_run		
バッチID	batch_id
前回バッチ開始日時	lastBatch_startTime
実行中フラグ	running_flag
更新日時	update_time
*/
-- 删除nj_batchtime_run表
drop table if exists nj_batchtime_run;
-- 创建nj_batchtime_run表
create table nj_batchtime_run (
    -- batch_id 主键
    batch_id int primary key auto_increment NOT NULL,
    lastBatch_startTime timestamp NOT NULL,
    running_flag char(1) NOT NULL,
    update_time	timestamp NOT NULL
);
-- 添加数据
insert into nj_batchtime_run (lastBatch_startTime, running_flag, update_time)
values 
       ("2023/07/01", "0","2023/07/01"),
       ("2023/07/02", "1","2023/07/02"),
       ("2023/07/03", "1","2023/07/03"),
       ("2023/07/04", "1","2023/07/04"),
       ("2023/07/05", "1","2023/07/05");
select * from nj_batchtime_run;