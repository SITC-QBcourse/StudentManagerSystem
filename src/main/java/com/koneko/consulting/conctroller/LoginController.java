package com.koneko.consulting.conctroller;

import java.awt.image.BufferedImage;
import java.io.IOException;

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
     * @param model Spring MVC模型对象（用于传递用户对象到视图层）
     * @return login 视图名称
     */
    @GetMapping
    public String hello(Model model) {
        // 将用户对象添加到模型，供Thymeleaf模板使用
        model.addAttribute("user", new MITUser());

        // 返回登录页面视图名称
        return "login";
    }

    /**
     * 生成验证码图片并输出到响应流
     * 
     * @param request  HTTP请求对象（用于存储验证码到session）
     * @param response HTTP响应对象（用于输出图片流）
     * @throws IOException 图像输出异常
     */
    @GetMapping("getGeneratorCoode")
    public void createCode(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // 配置响应头防止缓存
        response.setCharacterEncoding("UTF-8");
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        response.setContentType("image/jpeg"); // 虽然使用gif格式输出，但jpeg更通用

        // 生成5位验证码（根据VCodeGenerator构造参数）
        VCodeGenerator vCodeGenerator = new VCodeGenerator(5);
        String vcode = vCodeGenerator.generatorVCode();

        // 存储验证码到session供后续验证
        request.getSession().setAttribute("vcode", vcode);
        log.info("此次生成的验证码为：{}，已保存至session中。", vcode);

        // 生成带干扰线的验证码图片并输出响应流
        BufferedImage bufferedImage = vCodeGenerator.generatorVCodeImage(vcode, true);
        ImageIO.write(bufferedImage, "gif", response.getOutputStream()); // 实际输出gif格式图片
    }

    /**
     * 处理/main路径GET请求，跳转至主页面
     * 
     * @return "main"视图模板名称（需配合模板引擎使用）
     * 
     *         功能说明：
     *         1. 响应/main路径的GET请求
     *         2. 返回jsp模板视图名称
     *         3. 无请求参数处理（纯页面跳转）
     */
    @GetMapping("main")
    public String toMain() {
        // 直接返回视图名称，由模板引擎解析为/main.jsp
        return "main";
    }

    /**
     * 用户登录验证接口
     * 
     * @param user     包含登录邮箱、密码和验证码的用户对象
     * @param model    Spring MVC模型对象
     * @param request  HTTP请求对象（用于获取session验证码）
     * @param response HTTP响应对象
     * @return 验证结果状态字符串（JSON格式）
     * @throws IOException 响应流输出异常
     * 
     *                     验证流程：
     *                     1. 验证码校验 → 2. 邮箱存在性校验 → 3. 密码匹配校验
     *                     状态返回值说明：
     *                     - "vcodeError": 验证码错误
     *                     - "userError": 邮箱不存在或密码错误
     *                     - "success": 登录成功
     */
    @PostMapping(value = "checkLogin", produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String checkLogin(@ModelAttribute MITUser user, Model model,
            HttpServletRequest request, HttpServletResponse response) throws IOException {
        // 从session获取存储的验证码
        String sessionVcode = (String) request.getSession().getAttribute("vcode");
        String loginCode = user.getLoginCode();

        String msg = "";
        // 第一阶段：验证码校验
        if (null == loginCode || !loginCode.equalsIgnoreCase(sessionVcode)) {
            msg = "vcodeError";
        } else {
            // 第二阶段：用户凭证验证
            String userEmail = user.getUserEmail();
            String userPassword = user.getUserPassword();
            MITUser dbUser = mapper.selectUserByEmail(userEmail);

            // 第三阶段：密码匹配校验
            if (null == dbUser || !dbUser.getUserPassword().equals(userPassword)) {
                msg = "userError";
            } else {
                // 登录成功处理
                request.getSession().setAttribute("loginUser", dbUser);
                log.info("用户登录成功：{}", dbUser);
                msg = "success";
            }
        }
        return msg;
    }

    /**
     * 用户注销处理
     * 
     * @param model   Spring MVC模型对象（用于重置登录表单）
     * @param request HTTP请求对象（用于操作session）
     * @return 登录页面视图路径
     * 
     *         功能流程：
     *         1. 清除session中的登录用户信息
     *         2. 重置模型中的用户对象
     *         3. 重定向至登录页面
     * 
     *         安全注意事项：
     *         - 必须清除session防止残留登录状态
     *         - 重置模型对象避免表单重复提交
     */
    @GetMapping("logout")
    public String logout(Model model, HttpServletRequest request) {
        // 清除会话中的用户登录凭证
        request.getSession().removeAttribute("loginUser");

        // 重置模型中的用户对象（防止表单数据残留）
        model.addAttribute("user", new MITUser());

        // 返回登录页面视图（由视图解析器处理为/login.jsp）
        return "login";
    }
}