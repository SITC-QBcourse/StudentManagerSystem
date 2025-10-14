package com.koneko.consulting.conctroller;

import org.springframework.beans.factory.annotation.Autowired;

import com.koneko.consulting.mapper.MitUsersMapper;
import com.koneko.consulting.pojo.MITUser;

public class main {
    @Autowired
    private static MitUsersMapper mapper;

    public static void main(String[] args) {
        MITUser user = new MITUser();
        user.setUserId("tmc24072");
        user.setUserName("wang shuqing");
        user.setUserPassword("Qinghai1314");
        user.setUserEmail("tmc24072@shirahagi.ac.jp");
        user.setUserPrivilege(1);
        System.out.println("Hello World!");
        int result = mapper.insertUser(user);
        System.out.println("Insert result: " + result);
    }
}
