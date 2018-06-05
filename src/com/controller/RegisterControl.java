package com.controller;

import com.FunctionUtility.PublicObject;
import com.model.CvInfo;
import com.service.CvInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by Administrator on 2018/4/20.
 */
@Controller
@RequestMapping("")
public class RegisterControl {
    @Autowired
    PublicObject myPublicObject;//如果从其他jsp页面跳到此controller层则此模块级变量被销毁
    @Autowired
    CvInfoService myCvInfoService;

    @RequestMapping("CV1.action")
    public ModelAndView cv1(HttpServletRequest request, HttpServletResponse response) throws Exception{
        ModelAndView mav = new ModelAndView();
        request.setCharacterEncoding("utf-8");
        myPublicObject.getCvInfo().setName(request.getParameter("userName"));
        String sex = request.getParameter("sex");
        if(sex.equals("男")){
            myPublicObject.getCvInfo().setSex("男");
        }else{
            myPublicObject.getCvInfo().setSex("女");
        }
        myPublicObject.getCvInfo().setBornTime(request.getParameter("userBornTime"));
        myPublicObject.getCvInfo().setWorkTime(request.getParameter("userWorkTime"));

        myPublicObject.getCvInfo().setPhoneNumber(request.getParameter("userPhoneNumber"));
        myPublicObject.getCvInfo().setEmail(request.getParameter("userEmail"));
        mav.addObject("cs",2);
        mav.setViewName("CVRegisterView");
        return  mav;
    }

    @RequestMapping("CV2.action")
    public ModelAndView cv2(HttpServletRequest request, HttpServletResponse response) throws Exception{
        ModelAndView mav = new ModelAndView();
        request.setCharacterEncoding("utf-8");

        myPublicObject.getCvInfo().setLiveLocation(request.getParameter("userLifeCity"));
        myPublicObject.getCvInfo().setConstellation(request.getParameter("userConstellation"));
        mav.addObject("cs",3);
        mav.setViewName("CVRegisterView");
        return  mav;
    }

    @RequestMapping("CV3.action")
    public ModelAndView cv3(HttpServletRequest request, HttpServletResponse response) throws Exception{
        ModelAndView mav = new ModelAndView();
        request.setCharacterEncoding("utf-8");
        myPublicObject.getCvInfo().setBornLocation(request.getParameter("userBornLocation"));
        myPublicObject.getCvInfo().setThreeNumber(request.getParameter("threeNumber"));


        List<CvInfo> listCvInfo = myCvInfoService.select(myPublicObject.getCvInfo());
        int n = listCvInfo.size();
        if(n == 0){
            myCvInfoService.insert(myPublicObject.getCvInfo());
        }
        mav.addObject("CVInfo",myPublicObject.getCvInfo());
        mav.setViewName("CVInfoView");
        return mav;
    }



}
