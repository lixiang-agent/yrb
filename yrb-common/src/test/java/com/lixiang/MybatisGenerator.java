package com.lixiang;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.mybatis.generator.api.MyBatisGenerator;
import org.mybatis.generator.config.Configuration;
import org.mybatis.generator.config.xml.ConfigurationParser;
import org.mybatis.generator.exception.InvalidConfigurationException;
import org.mybatis.generator.exception.XMLParserException;
import org.mybatis.generator.internal.DefaultShellCallback;

public class MybatisGenerator {
	
	public static void main(String[] args) {
		//用来封装警告信息
		List<String> warnings = new ArrayList<>();
		//是否覆盖
		boolean overwrite = true;

		// 类路径下面
		InputStream is = MybatisGenerator.class.getClassLoader().getResourceAsStream("mybatis-generator.xml");
		
	
		System.out.println(is);
		
		ConfigurationParser cp = new ConfigurationParser(warnings);
		Configuration config;
		try {
			//解析配置文件
			config = cp.parseConfiguration(is);
			DefaultShellCallback callback = new DefaultShellCallback(overwrite);
			MyBatisGenerator myBatisGenerator = new MyBatisGenerator(config, callback, warnings);
			myBatisGenerator.generate(null);
			System.out.println("打印警告信息....................");
			for(String warn:warnings){
				System.out.println(warn);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} catch (XMLParserException e) {
			e.printStackTrace();
		} catch (InvalidConfigurationException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}

}
