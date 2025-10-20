package com.koneko.consulting.conctroller;

import java.io.IOException;
import java.util.Locale;

import javax.imageio.ImageIO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koneko.consulting.common.VCodeGenerator;
import com.koneko.consulting.mapper.MitUsersMapper;
import com.koneko.consulting.pojo.MITUser;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/")
public class LoginController {
    @Autowired
    private MitUsersMapper mapper;

    /**
     * 处理根路径GET请求，返回登录页面视图
     * 
     * @param model  Spring MVC模型对象（用于传递用户对象到视图层）
     * @param locale 本地化对象（当前未使用，保留用于后续国际化支持）
     * @return login 视图名称
     */
    @GetMapping
    public String hello(Model model, Locale locale) {
        // 将用户对象添加到模型，供Thymeleaf模板使用
        model.addAttribute("user", new MITUser());

        // 返回登录页面视图名称
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
        log.info("此次生成的验证码为：{}，已保存至session中。", vcode);
        java.awt.image.BufferedImage bufferedImage = vCodeGenerator.generatorVCodeImage(vcode, true);
        ImageIO.write(bufferedImage, "gif", response.getOutputStream());
    }

    @GetMapping("main")
    public String toMain() {
        return "main";
    }

    @PostMapping(value = "checkLogin", produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String checkLogin(@ModelAttribute MITUser user, Model model,
            HttpServletRequest request, HttpServletResponse response) throws IOException {
        String sessionVcode = (String) request.getSession().getAttribute("vcode");
        String loginCode = user.getLoginCode();
        String msg = "";
        if (null == loginCode || !loginCode.equalsIgnoreCase(sessionVcode)) {
            msg = "vcodeError";
        } else {
            String userEmail = user.getUserEmail();
            String userPassword = user.getUserPassword();
            MITUser dbUser = mapper.selectUserByEmail(userEmail);
            if (null == dbUser || !dbUser.getUserPassword().equals(userPassword)) {
                msg = "userError";
            } else {
                request.getSession().setAttribute("loginUser", dbUser);
                log.info("用户信息：{}", dbUser);
                msg = "success";
            }
        }
        return msg;
    }

    @GetMapping("logout")
    public String logout(Model model, HttpServletRequest request) {
        request.getSession().removeAttribute("loginUser");
        model.addAttribute("user", new MITUser());
        return "login";
    }
}