package com.mapper;

import java.util.List;
import com.model.UserInfo;
/**
 * Created by Administrator on 2018/4/19.
 */
//接口类的方法不需要权限修饰符//接口默认就是public
public interface UserInfoMapper {
    int insert(UserInfo userinfo);

    void delete(int[] array_id);

    //实体类中name作为查询参数
    List<UserInfo> select(UserInfo userInfo);
    //依据实体类中的id作为查询参数
    List<UserInfo> selectById(UserInfo userInfo);

    List<UserInfo> list();
}
