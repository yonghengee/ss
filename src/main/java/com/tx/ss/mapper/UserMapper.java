package com.tx.ss.mapper;/**
 * Created by wyh in 2019/11/20 9:45
 **/

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.tx.ss.entity.PermissionTbl;
import com.tx.ss.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @program:
 * @description:
 * @author: forever-wang
 * @create: 2019-11-20 09:45
 **/
public interface UserMapper extends BaseMapper {
   User findOneByUserName(@Param("userName") String userName);

   List<String> findRoleById(@Param("userId")Integer userId);

   List<PermissionTbl> findAllRolePermission();
}
