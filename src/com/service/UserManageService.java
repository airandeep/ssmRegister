package com.service;

import com.model.UserManage;

import java.util.List;

/**
 * Created by Administrator on 2018/4/20.
 */
public interface UserManageService {

    List<UserManage> select(UserManage userManage);

}
