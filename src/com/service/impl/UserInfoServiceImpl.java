package com.service.impl;

import com.mapper.UserInfoMapper;
import com.model.UserInfo;
import com.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.jws.soap.SOAPBinding;
import java.util.List;

/**
 * Created by Administrator on 2018/4/19.
 */
@Service
public class UserInfoServiceImpl implements UserInfoService{
    @Autowired
    UserInfoMapper userInfoMapper;

    public int insert(UserInfo userinfo){
        return userInfoMapper.insert(userinfo);
    }

    public void delete(int[] array_id){
        userInfoMapper.delete(array_id);
    }

    public List<UserInfo> select(UserInfo userInfo){
        return  userInfoMapper.select(userInfo);
    }

    public List<UserInfo> selectById(UserInfo userInfo){
        return  userInfoMapper.selectById(userInfo);
    }

    public List<UserInfo> list(){
        return  userInfoMapper.list();
    }
}
