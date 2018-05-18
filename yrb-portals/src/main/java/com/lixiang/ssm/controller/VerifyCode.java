package com.lixiang.ssm.controller;

import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.lixiang.ssm.utils.VerifyCodeUtils;

/*
 * 验证码
 * 
 */

@Controller
@RequestMapping("/verifyCode")
public class VerifyCode {
	
	@RequestMapping("/code")
	public void findAllWhere(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 获得 当前请求 对应的 会话对象
		HttpSession session = request.getSession();
		// 从请求中获得 URI ( 统一资源标识符 )
		String uri = request.getRequestURI();
		System.out.println("hello : " + uri);
		final int width = 180; // 图片宽度
		final int height = 40; // 图片高度
		final String imgType = "jpeg"; // 指定图片格式 (不是指MIME类型)
		final OutputStream output = response.getOutputStream(); // 获得可以向客户端返回图片的输出流
		// (字节流)
		// 创建验证码图片并返回图片上的字符串
		String code = VerifyCodeUtils.create(width, height, imgType, output);
		
		session.removeAttribute("code");
		
		// 建立 uri 和 相应的 验证码 的关联 ( 存储到当前会话对象的属性中 )
		session.setAttribute(uri, code); 
		
		session.setAttribute("code", code);
		
	}
	
	//验证验证码
	@ResponseBody
	@RequestMapping("/isCode")
	public int isyanzhengma(HttpServletRequest request,String code) {
		
		HttpSession session = request.getSession(true); 
		String codes = (String) session.getAttribute("code");
		
		int flag=0;
		if(codes !=null && codes.equalsIgnoreCase(code)){
			flag=1;
		}
		return flag;
	}

}
