package com.tx.ss.service;/**
 * Created by wyh in 2019/11/20 9:43
 **/

import com.tx.ss.dao.UserDao;
import com.tx.ss.entity.PermissionTbl;
import com.tx.ss.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @program:
 * @description:
 * @author: forever-wang
 * @create: 2019-11-20 09:43
 **/
@Service
public class MyUserDetailsService implements UserDetailsService,SysUserService {
    @Autowired
    private UserDao userDao;

    @Override
    public UserDetails loadUserByUsername(String login) throws UsernameNotFoundException {

        User userLogin = userDao.findOneByLogin(login);

        if (userLogin == null) {
            //log.warn("User: {} not found", login);
            throw new UsernameNotFoundException("User " + login + " was not found in db");
            //这里找不到必须抛异常
        }

        return userLogin;
    }

    @Override
    public List<PermissionTbl> findAllRolePermission(){
        return  userDao.findAllRolePermission();
    }
}
