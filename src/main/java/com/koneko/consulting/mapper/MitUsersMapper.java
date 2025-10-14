package com.koneko.consulting.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.koneko.consulting.pojo.MITUser;

@Mapper
public interface MitUsersMapper {
    public int insertUser(MITUser user);
}
