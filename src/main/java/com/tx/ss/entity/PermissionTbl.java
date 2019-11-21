package com.tx.ss.entity;/**
 * Created by wyh in 2019/11/20 15:23
 **/

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

/**
 * @program:
 * @description: 权限-资源
 * @author: forever-wang
 * @create: 2019-11-20 15:23
 **/
@Data
@TableName("t_permission")
public class PermissionTbl implements Serializable {
    @TableId
    private Integer permissionId;
    private String  alias;
    private String  name;
    private Integer pid;
    private Integer level;
    private String  permissionUrl;
    private String  viewIcon;
    private Integer isButton;

    @TableField(exist = false)
    private RoleTbl roleTbl;//对应的角色

}
