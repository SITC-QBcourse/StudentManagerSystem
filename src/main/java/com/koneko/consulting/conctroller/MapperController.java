package com.koneko.consulting.conctroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.koneko.consulting.mapper.MitUsersMapper;
import com.koneko.consulting.pojo.MITUser;

@Controller
@RequestMapping("/mapper")
public class MapperController {
    
    @Autowired
    private MitUsersMapper mapper;

    @RequestMapping("/test")
    public String test() {
        MITUser user = new MITUser();
        user.setUserId("richyyang1314");
        user.setUserName("杨鸣海");
        user.setUserPassword("Yanyang1314");
        user.setUserEmail("richyyang1314@shirahagi.ac.jp");
        user.setUserPrivilege(1);
        System.out.println("Hello World!");
        int result = mapper.insertUser(user);
        System.out.println("Insert result: " + result);
        return "main";
    }
}
