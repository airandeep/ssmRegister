package com.mapper;

import com.model.CvInfo;

import java.util.List;

/**
 * Created by Administrator on 2018/4/19.
 */
public interface CvInfoMapper {

    int insert(CvInfo cvInfo);
    int update(CvInfo cvInfo);

    void delete(int array_id[]);
    void deleteByNickname(List<String> list_nickname);

    List<CvInfo> select(CvInfo cvInfo);
    List<CvInfo> selectByName(CvInfo cvInfo);

    List<CvInfo> list();
}
