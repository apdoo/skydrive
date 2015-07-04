package com.hexor.util;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

/**
 * Created with IntelliJ IDEA.
 * User: hexor
 * Date: 2015-06-29
 * Time: 21:57
 * 遇到自动注入有问题的情况，可以考虑主动去获取bean。
 建立这样一个工具类，放到Spring容器中，就可以用context.getBean("beanName")的方式去拿了。
 */
public class ContextUtil implements ApplicationContextAware {
    private static ApplicationContext context;

    @Override
    public void setApplicationContext(ApplicationContext applicationContext)
            throws BeansException {
        context = applicationContext;
    }

    public static ApplicationContext getContext(){
        return context;
    }

    public static Object getBean(String beanName) {
        return context.getBean(beanName);
    }

}
