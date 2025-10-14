DROP TABLE IF EXISTS mit_user;
CREATE TABLE mit_user (
    user_id VARCHAR(32) PRIMARY KEY, -- 用户ID 邮箱用户名
    user_name VARCHAR(50) NOT NULL,-- 用户名 用户真实姓名
    user_email VARCHAR(50) NOT NULL DEFAULT 'shirahagi' UNIQUE,-- 用户邮箱 登录用邮箱
    user_password VARCHAR(50) NOT NULL,-- 用户密码 登录用密码
    user_privilege INT NOT NULL DEFAULT 0,-- 用户权限 1-管理员 2-非常勤讲师 3-常勤职员 4-学生 0-未分配
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,-- 创建时间 创建时间
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP-- 更新时间 修改时间
);