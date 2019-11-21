package com.tx.ss.controller;/**
 * Created by wyh in 2019/11/19 15:01
 **/

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * @program:
 * @description:
 * @author: forever-wang
 * @create: 2019-11-19 15:01
 **/
@RestController
public class TestController {
    @RequestMapping("test")
    @ResponseBody
    public String test(){
        return "hello world";
    }
}
