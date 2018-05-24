package com.lixiang.ssm.utils;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

public class PropertiesUtil {
    public static Properties getProperties(String file) {
        Properties prop = new Properties();
        FileInputStream in = null;
        try {
            in = new FileInputStream(file);
            prop.load(in);

        } catch (IOException e) {
            // TODO: handle exception
            if (e instanceof FileNotFoundException) {
                System.out.println("找不到指定路径");
            } else {
                System.out.println("属性文件加载错误");
            }
        } finally {
            try {
                in.close();
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        return prop;

    }
}
