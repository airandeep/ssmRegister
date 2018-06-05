package com.controller;

import com.FunctionUtility.PublicObject;
import com.model.CvInfo;
import com.model.UserInfo;
import com.model.UserManage;
import com.service.CvInfoService;
import com.service.UserInfoService;
import com.service.UserManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;


/**
 * Created by Administrator on 2018/4/17.
 */
@Controller
@RequestMapping("")
public class LoginController {
    @Autowired
    UserInfoService userInfoService;
    @Autowired
    CvInfoService cvInfoService;
    @Autowired
    UserManageService userManageService;
    @Autowired
    PublicObject myPublicObject;
//    @Autowired
//    ReadXMLByDom4j readXMLByDom4j;

    @RequestMapping("LoginView")
    public ModelAndView login(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("LoginView");
        return mav;
    }

    @RequestMapping("RegisterView")
    public ModelAndView register(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("RegisterView");
        return mav;
    }

    //传进来的参数中需要将用户名首尾空格字符去除
    @RequestMapping("judgeRegister")
    public ModelAndView judgeRegister(HttpServletRequest request, HttpServletResponse response) throws Exception{
        ModelAndView mav = new ModelAndView();
        request.setCharacterEncoding("utf-8");
        String userName = request.getParameter("username");
        userName = userName.trim();
        String userPwd = request.getParameter("password");


        UserInfo myUserInfo = new UserInfo();
        myUserInfo.setName(userName);
        myUserInfo.setPwd(userPwd);
        List<UserInfo> jus = userInfoService.select(myUserInfo);
        int n = jus.size();
        String target;
        if(n == 0){//注册界面情况下，用户列表中未查询到当前姓名文本框中内容
            userInfoService.insert(myUserInfo);
            target = "LoginView";
            mav.addObject("cFlagLogin",3);
        }else{
            target = "RegisterView";
            mav.addObject("cFlagRegister",1);
        }

        mav.setViewName(target);
        return mav;
    }

    @RequestMapping("judgeLogin")
    public ModelAndView judgeLogin(HttpServletRequest request, HttpServletResponse response) throws Exception{
        ModelAndView mav = new ModelAndView();
        request.setCharacterEncoding("utf-8");
        //获取form表单中姓名与密码框中内容，其中姓名去除首尾空字符
        String userName = request.getParameter("username");
        userName = userName.trim();
        String userPwd = request.getParameter("password");

        String target;

        UserManage myUserManage = new UserManage();
        myUserManage.setName(userName);
        List<UserManage> myUserManageList = userManageService.select(myUserManage);

        if(myUserManageList.size() > 0  && myUserManageList.get(0).getPwd().equals(userPwd)){//当前用户属于超级管理员，且密码无误
            List<CvInfo> listCvInfo = cvInfoService.list();
            List<UserInfo> listUserInfo = userInfoService.list();
            target = "ManagerEditView";
            mav.addObject("listsUser",listUserInfo);
            mav.addObject("listCvInfo",listCvInfo);
        }else{
            UserInfo myUserInfo = new UserInfo();
            myUserInfo.setName(userName);
            List<UserInfo> jus = userInfoService.select(myUserInfo);
            int n = jus.size();

            if(n == 0) {//用户列表中未查询到当前用户列表
                target = "LoginView";
                mav.addObject("cFlagLogin",1);

            }else{
                UserInfo test = jus.get(0);
                if(!test.getPwd().equals(userPwd)){//密码与数据库用户表中密码不相同
                    target = "LoginView";
                    mav.addObject("cFlagLogin",2);
                }else{//匹配进入下一界面
                    CvInfo cvInfo = new CvInfo();//判断当前用户名是否已经注册简历，注册的话直接显示
                    cvInfo.setNickName(userName);
                    List<CvInfo> cvInfoList = cvInfoService.select(cvInfo);
                    int n1 = cvInfoList.size();

                    if(n1 == 0){
                        target="CVRegisterView";
                        myPublicObject.getCvInfo().setNickName(userName);
                    }else{
                        myPublicObject.setCvInfo(cvInfoList.get(0));
                        target="CVInfoView";
                        mav.addObject("CVInfo",myPublicObject.getCvInfo());
                    }



                }
            }
        }

        mav.setViewName(target);
        return  mav;
    }


    @RequestMapping("deleteUserInfo")
    public ModelAndView deleteUserInfo(HttpServletRequest request, HttpServletResponse response) throws Exception{
        ModelAndView mav = new ModelAndView();
        request.setCharacterEncoding("utf-8");

        String[] test = request.getParameterValues("test");

        UserInfo tempUserInfo = new UserInfo();
        if(test != null){
            List<String> listNickName = new ArrayList<>();
            int len = test.length;
            int[] test2 = new int[len];
            for(int i = 0;i<len;i++){
                test2[i] = Integer.parseInt(test[i]);
                tempUserInfo.setId(test2[i]);
                //将查到的链表第一个元素(UserInfo)赋值为UserInfo类局部变量
                tempUserInfo = userInfoService.selectById(tempUserInfo).get(0);
                listNickName.add(tempUserInfo.getName());
            }
            userInfoService.delete(test2);
            cvInfoService.deleteByNickname(listNickName);
        }

        //刷新表
        List<CvInfo> listCvInfo = cvInfoService.list();
        List<UserInfo> listUserInfo = userInfoService.list();
        mav.addObject("listsUser",listUserInfo);
        mav.addObject("listCvInfo",listCvInfo);

        mav.setViewName("ManagerEditView");
        return mav;
    }

    @RequestMapping("deleteCvInfo")
    public ModelAndView deleteCvInfo(HttpServletRequest request, HttpServletResponse response) throws Exception{
        ModelAndView mav = new ModelAndView();
        request.setCharacterEncoding("utf-8");

        String[] test = request.getParameterValues("test2");

        if(test != null){
            int len = test.length;
            int[] test2 = new int[len];
            for(int i = 0;i<len;i++){
                test2[i] = Integer.parseInt(test[i]);
            }
            cvInfoService.delete(test2);
        }

        //刷新表
        List<CvInfo> listCvInfo = cvInfoService.list();
        List<UserInfo> listUserInfo = userInfoService.list();
        mav.addObject("listsUser",listUserInfo);
        mav.addObject("listCvInfo",listCvInfo);

        mav.setViewName("ManagerEditView");
        return mav;
    }

    @RequestMapping("returnLogin")
    public ModelAndView returnLogin(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("LoginView");
        return mav;
    }

}
