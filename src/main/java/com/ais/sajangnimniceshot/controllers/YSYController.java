package com.ais.sajangnimniceshot.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ais.sajangnimniceshot.beans.ReserveBean;
import com.ais.sajangnimniceshot.mappers.YSYMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class YSYController {
	
	@Autowired
	private YSYMapper ysyMapper;
	
    @GetMapping("/main1")
    public ModelAndView main(ModelAndView mav, ReserveBean reserveBean) {
    	mav.setViewName("main1");
    	mav.addObject("reserveBean", reserveBean);
    	return mav;
    }
    
    
	// 로그아웃
    @GetMapping("logout")
    public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        return "redirect:/";
    }
    

    //달력기본화면
//    @RequestMapping(value = "/src/main/webapp/WEB-INF/views/main1.js")
//    public String calendar(RedirectAttributes redirectAttributes, HttpServletRequest request
//    						@ModelAttribute("sys") ReserveBean rsvBean, ModelMap model)
//    						throws Exception {
//        
//        int userRsvd = 0;
//     
//        ReserveBean rsvBean = loginService.getLoginInfo();
//          if(loginVO.getAuthCode().contentEquals("1")) isAdm =1;
//          model.addAttribute("userRsvd", userRsvd);
//     
//        return "/";
//    }
}
