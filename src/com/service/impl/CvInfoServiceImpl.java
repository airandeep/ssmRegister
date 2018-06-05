package com.service.impl;

import com.mapper.CvInfoMapper;
import com.model.CvInfo;
import com.service.CvInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2018/4/19.
 */
@Service
public class CvInfoServiceImpl implements CvInfoService{

    @Autowired
    CvInfoMapper cvInfoMapper;

    public int insert(CvInfo cvInfo){
        return  cvInfoMapper.insert(cvInfo);
    }
    public int update(CvInfo cvInfo){
        return  cvInfoMapper.update(cvInfo);
    }


    public void delete(int array_id[]){
        cvInfoMapper.delete(array_id);
    }
    public  void deleteByNickname(List<String> list_nickname){
        cvInfoMapper.deleteByNickname(list_nickname);
    }

    public List<CvInfo> select(CvInfo cvInfo){
        return  cvInfoMapper.select(cvInfo);
    }
    public List<CvInfo> selectByName(CvInfo cvInfo){
        return  cvInfoMapper.selectByName(cvInfo);
    }

    @Override
    public List<CvInfo> list() {
        return cvInfoMapper.list();
    }
}
