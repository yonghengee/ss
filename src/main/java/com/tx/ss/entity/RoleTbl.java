package com.tx.ss.entity;/**
 * Created by wyh in 2019/11/20 10:44
 **/

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.experimental.Accessors;
import org.springframework.security.core.GrantedAuthority;

import java.io.Serializable;

/**
 * @program:
 * @description:
 * @author: forever-wang
 * @create: 2019-11-20 10:44
 **/
@Data
@Accessors(chain = true)
@TableName("t_role_tbl")
public class RoleTbl implements Serializable, GrantedAuthority {

    @TableId
    private Integer roleId;

    private String  roleName;

    private String  roleCode;

    @Override
    public String getAuthority() {
        return getRoleCode();
    }
}
