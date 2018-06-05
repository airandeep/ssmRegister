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

/**
 * Created by Administrator on 2018/4/27.
 */
@Controller
@RequestMapping("")
public class UpdateControl {

    @Autowired
    CvInfoService cvInfoService;
    @Autowired
    PublicObject myPublicObject;

    @RequestMapping("updateBaseDetail")
    public ModelAndView updateBaseDetail(HttpServletRequest request, HttpServletResponse response) throws Exception{
        ModelAndView mav = new ModelAndView();
        request.setCharacterEncoding("utf-8");


        myPublicObject.getCvInfo().setName(request.getParameter("name"));
        String sex = request.getParameter("sex");
        if(sex.equals("男")){
            myPublicObject.getCvInfo().setSex("男");
        }else{
            myPublicObject.getCvInfo().setSex("女");
        }
        myPublicObject.getCvInfo().setBornTime(request.getParameter("bornTime"));
        myPublicObject.getCvInfo().setWorkTime(request.getParameter("workTime"));
        myPublicObject.getCvInfo().setPhoneNumber(request.getParameter("phoneNumber"));
        myPublicObject.getCvInfo().setBornLocation(request.getParameter("bornLocation"));
        myPublicObject.getCvInfo().setEmail(request.getParameter("email"));
        myPublicObject.getCvInfo().setLiveLocation(request.getParameter("liveLocation"));

        cvInfoService.update(myPublicObject.getCvInfo());

        mav.addObject("CVInfo",myPublicObject.getCvInfo());
        mav.setViewName("CVInfoView");
        return mav;
    }

    @RequestMapping("updateConstellation")
    public ModelAndView updateConstellation(HttpServletRequest request, HttpServletResponse response) throws Exception{
        ModelAndView mav = new ModelAndView();
        request.setCharacterEncoding("utf-8");

        myPublicObject.getCvInfo().setConstellation(request.getParameter("userConstellation"));
        cvInfoService.update(myPublicObject.getCvInfo());

        mav.addObject("CVInfo",myPublicObject.getCvInfo());
        mav.setViewName("CVInfoView");
        return mav;
    }

    @RequestMapping("updateThreeNumber")
    public ModelAndView updateThreeNumber(HttpServletRequest request, HttpServletResponse response) throws Exception{
        ModelAndView mav = new ModelAndView();
        request.setCharacterEncoding("utf-8");

        myPublicObject.getCvInfo().setThreeNumber(request.getParameter("userThreeNumber"));
        cvInfoService.update(myPublicObject.getCvInfo());

        mav.addObject("CVInfo",myPublicObject.getCvInfo());
        mav.setViewName("CVInfoView");
        return mav;
    }

}
