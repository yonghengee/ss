package com.tx.ss.service;/**
 * Created by wyh in 2019/11/20 16:59
 **/

import com.tx.ss.entity.PermissionTbl;

import java.util.List;

/**
 * @program:
 * @description:
 * @author: forever-wang
 * @create: 2019-11-20 16:59
 **/
public interface SysUserService {
    List<PermissionTbl> findAllRolePermission();
}
