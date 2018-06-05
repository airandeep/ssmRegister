package com.service.impl;

import com.mapper.UserManageMapper;
import com.model.UserManage;
import com.service.UserManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2018/4/20.
 */
@Service
public class UserManageServiceImpl implements UserManageService {

    @Autowired
    UserManageMapper userManageMapper;
    public List<UserManage> select(UserManage userManage){
        return userManageMapper.select(userManage);
    }
}
