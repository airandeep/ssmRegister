package com.mapper;

import com.model.UserManage;

import java.util.List;

/**
 * Created by Administrator on 2018/4/20.
 */
public interface UserManageMapper {

    //传入实体类，依据实体类中name字段查询
    List<UserManage> select(UserManage userManage);
}
