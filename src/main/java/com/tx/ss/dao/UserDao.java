package com.tx.ss.dao;/**
 * Created by wyh in 2019/11/20 9:49
 **/

import com.tx.ss.entity.PermissionTbl;
import com.tx.ss.entity.User;
import com.tx.ss.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @program:
 * @description:
 * @author: forever-wang
 * @create: 2019-11-20 09:49
 **/
@Component
public class UserDao {
    @Autowired
    private UserMapper userMapper;


    public User findOneByLogin(String login) {
       return userMapper.findOneByUserName(login);
    }

    public List<String> findRoleById(Integer userId){
        return userMapper.findRoleById(userId);
    }

    public List<PermissionTbl> findAllRolePermission(){
        return userMapper.findAllRolePermission();
    }

}
