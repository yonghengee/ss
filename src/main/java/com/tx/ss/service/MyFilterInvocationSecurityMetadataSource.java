package com.tx.ss.service;/**
 * Created by wyh in 2019/11/20 16:04
 **/

import com.tx.ss.entity.PermissionTbl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

/**
 * @program:
 * @description:
 * @author: forever-wang
 * @create: 2019-11-20 16:04
 **/
@Component
public class MyFilterInvocationSecurityMetadataSource implements FilterInvocationSecurityMetadataSource {

    @Autowired
    private SysUserService sysUserService;

    private static HashMap<String, Collection<ConfigAttribute>> map =null;


    //初始化 所有资源 对应的角色
    public void loadResourceDefine(){
        map = new HashMap<>();
        //权限资源 和 角色对应的表  也就是 角色 权限中间表
        List<PermissionTbl> rolePermissions = sysUserService.findAllRolePermission();

        //每个资源 所需要的角色
        for (PermissionTbl rolePermission : rolePermissions) {

            String name = rolePermission.getPermissionUrl();
            String roleName = rolePermission.getRoleTbl().getRoleCode();
            ConfigAttribute role = new SecurityConfig(roleName);

            if(map.containsKey(name)){
                map.get(name).add(role);
            }else{
                map.put(name,new ArrayList<ConfigAttribute>(){{
                    add(role);
                }});
            }
        }
    }

    @Override
    public Collection<ConfigAttribute> getAttributes(
        Object object) throws IllegalArgumentException {

        if (map==null){
            loadResourceDefine();
        }

        //object 中包含用户请求的request 信息
        HttpServletRequest request = ((FilterInvocation) object).getHttpRequest();
        for(Iterator<String> iter = map.keySet().iterator(); iter.hasNext(); ) {
            String name = iter.next();
            if(new AntPathRequestMatcher(name).matches(request)) {
                return map.get(name);
            }
        }
        return null;

    }

    @Override
    public Collection<ConfigAttribute> getAllConfigAttributes() {
        return null;
    }

    @Override
    public boolean supports(Class<?> aClass) {
        return true;
    }
}
