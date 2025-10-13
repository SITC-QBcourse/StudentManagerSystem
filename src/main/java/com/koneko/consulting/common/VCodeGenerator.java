package com.koneko.consulting.common;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.util.Random;

import lombok.Data;

/**
 * 项目名称：StudentManagerSystem
 * 类 名 称：VCodeGenerator
 * 类 描 述：验证码生成器
 * 创 建 人：老杨
 * 创建时间：2025年10月12日
 * 
 * @version 1.0
 */
@Data
public class VCodeGenerator {
    private static final String CODE_STRING = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    private static final String FONT_NAMES = "黑体|宋体|Courier|Arial|Verdana|Times|Tahoma|georgia";

    /**
     * 验证码字符集
     */
    private final char[] code = CODE_STRING.toCharArray();

    /**
     * 字体
     */
    private final String[] fontNames = FONT_NAMES.split("\\.");

    /**
     * 字体样式
     * java.awt.Font手动导包或者使用全限定名
     */
    private final int[] fontStyles = new int[] { Font.BOLD, Font.ITALIC | Font.BOLD };

    /**
     * 默认验证码长度 = 4
     */
    private int vcodeLen;

    /**
     * 验证码图片字体大小
     * 默认为17
     */
    private int fontsize;

    /**
     * 验证码图片宽度
     */
    private int width;

    /**
     * 验证码图片高度
     */
    private int height;

    /**
     * 验证码干扰线条数
     * 默认3条
     */
    private int distrubline;

    /**
     * 随机数对象
     */
    private Random ran;

    /**
     * 创建日期：2025年10月12日
     * 创建人员：老杨
     * 方法参数：
     * 方法描述:默认验证码样式
     */
    public VCodeGenerator() {
        this.vcodeLen = 4;
        this.fontsize = 21;
        this.width = (fontsize + 4) * vcodeLen + 15;
        this.height = fontsize + 20;
        this.distrubline = 3;
        ran = new Random();
    }

    /**
     * 创建日期：2025年10月12日
     * 创建人员：老杨
     * 方法参数：@param vcodeLen 验证码长度
     * 方法描述:指定验证码长度
     */
    public VCodeGenerator(int vcodeLen) {
        this();
        this.vcodeLen = vcodeLen;
    }

    /**
     * 创建日期：2025年10月12日
     * 创建人员：老杨
     * 方法参数：@param vcodeLen 验证码长度
     * 方法参数：@param distrubline 干扰线个数
     * 方法描述: 指定验证码长度以及干扰线个数
     */
    public VCodeGenerator(int vcodeLen, int distrubline) {
        this();
        this.vcodeLen = vcodeLen;
        this.distrubline = distrubline;
    }

    /**
     * 创建日期：2025年10月12日
     * 创建人员：老杨
     * 方法参数：@return 验证码字符串
     * 返回类型：String
     * 方法描述: 生成验证码
     */
    public String generatorVCode() {
        int len = code.length;
        StringBuffer sb = new StringBuffer(vcodeLen);
        for (int i = 0; i < vcodeLen; i++) {
            sb.append(code[ran.nextInt(len)]);
        }
        return sb.toString();
    }

    /**
     * 创建日期：2025年10月12日
     * 创建人员：老杨
     * 方法参数：@return
     * 返回类型：Color 颜色集
     * 方法描述: 干扰线颜色集以及背景颜色集
     */
    public Color getRandomColor() {
        return new Color(ran.nextInt(255), ran.nextInt(255), ran.nextInt(255));
    }

    /**
     * 创建日期：2025年10月12日
     * 创建人员：老杨
     * 方法参数：@param g java.awt的绘制工具
     * 返回类型：void
     * 方法描述: 为验证码绘制干扰线
     */
    public void drawDisturbLine(Graphics g) {
        for (int i = 0; i < this.distrubline; i++) {
            int x1 = ran.nextInt(this.width);
            int y1 = ran.nextInt(this.height);
            int x2 = ran.nextInt(this.width);
            int y2 = ran.nextInt(this.height);
            g.setColor(getRandomColor());
            g.drawLine(x1, y1, x2, y2);
        }
    }

    /**
     * 
     * 创建日期：2025年10月12日
     * 创建人员：老杨
     * 方法参数：@param vcode {@link generatorVCode()}
     * 方法参数：@param drawline 是否画干扰线
     * 方法参数：@return 验证码图片
     * 返回类型：BufferedImage 验证码图片对象
     * 方法描述: 生成验证码图片
     */
    public BufferedImage generatorVCodeImage(String vcode, boolean drawline) {
        // 通过三原色绘制图片
        BufferedImage bufferedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        Graphics g = bufferedImage.getGraphics();
        // 填充背景色
        g.setColor(new Color(246, 240, 250));
        g.fillRect(0, 0, width, height);
        if (drawline) {
            drawDisturbLine(g);
        }
        // 图片上层的验证码
        for (int i = 0; i < vcode.length(); i++) {
            // 字体
            g.setFont(new Font(fontNames[ran.nextInt(fontNames.length)], fontStyles[ran.nextInt(fontStyles.length)],
                    fontsize));
            // 颜色
            g.setColor(getRandomColor());
            // 验证码
            g.drawString(String.valueOf(vcode.charAt(i)), i * fontsize + 10, fontsize + 5);
        }
        // 释放上下文以及使用的所有系统资源
        g.dispose();
        return bufferedImage;
    }
}
