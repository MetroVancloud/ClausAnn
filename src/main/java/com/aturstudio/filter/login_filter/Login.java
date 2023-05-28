package com.aturstudio.filter.login_filter;

import com.aturstudio.filter.ResultTypeEnum;

import java.lang.annotation.*;

/**
 * @author Fan Yunlong
 * @create 2018/7/5 上午 4:15
 * @update 2018/7/5 上午 4:15
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface Login {
    ResultTypeEnum value() default ResultTypeEnum.page;
}
