package com.service;
import com.model.UserInfo;
import com.model.UserManage;

import java.util.List;

/**
 * Created by Administrator on 2018/4/19.
 */
public interface UserInfoService {
    int insert(UserInfo userinfo);
    void delete(int[] array_id);


    List<UserInfo> select(UserInfo userInfo);
    List<UserInfo> selectById(UserInfo userInfo);
    List<UserInfo> list();
}
