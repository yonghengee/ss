package com.tx.ss.entity;/**
 * Created by wyh in 2019/11/20 9:39
 **/

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;

/**
 * @program:
 * @description:
 * @author: forever-wang
 * @create: 2019-11-20 09:39
 **/
@Data
@TableName("t_user_tbl")
public class User implements Serializable, UserDetails {

    @TableId
    Integer userId;

    String userName;

    String password;

    Integer isStop ;

    //角色列表
    List<RoleTbl> roles;

//    List<>

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return roles;
    }

    @Override
    public String getUsername() {
        return userName;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        if (isStop == 1){
            return true;
        }
        return false;
    }
}
