package com.tx.ss.controller;/**
 * Created by wyh in 2019/11/19 15:24
 **/

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * @program:
 * @description:
 * @author: forever-wang
 * @create: 2019-11-19 15:24
 **/
@RestController
@RequestMapping("/admin")
public class AdminController {

    @RequestMapping("/home")
    @ResponseBody
    public String productInfo() {
        return " admin home page ";
    }
}
