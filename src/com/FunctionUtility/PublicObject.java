package com.FunctionUtility;

import org.springframework.stereotype.Service;
import com.model.*;
/**
 * Created by Administrator on 2018/4/20.
 */
@Service
public class PublicObject {

    private static PublicObject instance;
    private PublicObject(){}//故意定义成私有防止外部通过此构造函数实例化此对象
    // 使用单例模式的目的是为了是内存中一直存在唯一实例化对象存储数据
    public static PublicObject getInstance(){
        if(instance == null){
            synchronized (PublicObject.class){
                if(instance == null){
                    instance = new PublicObject();
                }
            }
        }
        return  instance;
    }

    private CvInfo cvInfo = new CvInfo();

    public CvInfo getCvInfo() {
        return cvInfo;
    }

    public void setCvInfo(CvInfo cvInfo) {
        this.cvInfo = cvInfo;
    }
}
