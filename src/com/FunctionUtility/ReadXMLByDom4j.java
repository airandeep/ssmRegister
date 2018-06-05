package com.FunctionUtility;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.dom4j.Attribute;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import com.model.UserManage;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2018/4/20.
 */
@Service
public class ReadXMLByDom4j {

    private List<UserManage> userManageList = null;
    private UserManage userManage = null;

    public List<UserManage> getUserManages(File file){
        SAXReader reader = new SAXReader();
        try {
            Document document = reader.read(file);
            Element bookstore = document.getRootElement();
            Iterator storeit = bookstore.elementIterator();

            userManageList = new ArrayList<UserManage>();
            while(storeit.hasNext()){

                userManage = new UserManage();
                Element bookElement = (Element) storeit.next();
                //遍历bookElement的属性
                List<Attribute> attributes = bookElement.attributes();
                for(Attribute attribute : attributes){
                    if(attribute.getName().equals("id")){
                        String id = attribute.getValue();//System.out.println(id);
                        userManage.setId(Integer.parseInt(id));
                    }
                }

                Iterator bookit = bookElement.elementIterator();
                while(bookit.hasNext()){
                    Element child = (Element) bookit.next();
                    String nodeName = child.getName();
                    if(nodeName.equals("name")){
                        //System.out.println(child.getStringValue());
                        String name = child.getStringValue();
                        userManage.setName(name);
                    }else if(nodeName.equals("pwd")){
                        String pwd = child.getStringValue();
                        userManage.setPwd(pwd);
                    }
                }
                userManageList.add(userManage);
                userManage = null;

            }
        } catch (DocumentException e) {

            e.printStackTrace();
        }



        return userManageList;
    }
}
