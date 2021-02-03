package com.dnb.pro.education.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dnb.pro.education.service.educationService;
import com.dnb.pro.education.vo.educationVO;

@Controller
@RequestMapping("/education")
public class educationControllerImpl {
    
    @Autowired
    private educationService service;
 
    @RequestMapping(value="/educationList.do", method=RequestMethod.GET)
    public String educationList(educationVO educationVO, Model model) {
        
        List<educationVO> list = service.selectEducationList(educationVO);
        model.addAttribute("list", list);
        
        return "education/educationlist";
    }
}
