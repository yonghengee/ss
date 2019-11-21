package com.tx.ss.controller;/**
 * Created by wyh in 2019/11/19 15:24
 **/

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
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
@RequestMapping("/user")
public class NormalController {
    @RequestMapping("/info")
    @ResponseBody
    public String productInfo(){
        String username="";
        System.out.println(SecurityContextHolder.getContext().getAuthentication());
        System.out.println(SecurityContextHolder.getContext().getAuthentication().getAuthorities());
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof UserDetails){
             username = ((UserDetails) principal).getUsername();
        }else {
            username = principal.toString();
        }
        return " user info page "+username;
    }
}
