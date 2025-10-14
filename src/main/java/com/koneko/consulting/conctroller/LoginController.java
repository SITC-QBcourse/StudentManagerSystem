package com.koneko.consulting.conctroller;

import java.io.IOException;
import java.util.Locale;
import java.util.ResourceBundle;

import javax.imageio.ImageIO;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.koneko.consulting.common.VCodeGenerator;
import com.koneko.consulting.pojo.MITUser;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/")
public class LoginController {
    private ResourceBundle rb;

    @GetMapping
    public String hello(Model model, Locale locale) {
        rb = ResourceBundle.getBundle("i18n/i18n", locale);
        MITUser user = new MITUser();
        // user.setUserName("laoyang");
        // user.setPassword("123456");
        model.addAttribute("user", user);
        return "login";
    }

    @GetMapping("getGeneratorCoode")
    public void createCode(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // 设置response响应
        response.setCharacterEncoding("UTF-8");
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        response.setContentType("image/jpeg");

        VCodeGenerator vCodeGenerator = new VCodeGenerator(5);
        String vcode = vCodeGenerator.generatorVCode();
        request.getSession().setAttribute("vcode", vcode);
        java.awt.image.BufferedImage bufferedImage = vCodeGenerator.generatorVCodeImage(vcode, true);
        ImageIO.write(bufferedImage, "gif", response.getOutputStream());
    }

    @PostMapping("checkLogin")
    public String checkLogin(@ModelAttribute MITUser user, Model model, HttpServletRequest request) {
        log.info("用户信息：{}", user);
        String vcode = (String) request.getSession().getAttribute("vcode");
        if (vcode.equalsIgnoreCase(user.getLoginCode())) {
            return "main";
        } else {
            model.addAttribute("msg", rb.getString("login.msg.error"));
            return "login";
        }
    }
}
