package com.ais.sajangnimniceshot.services;

import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

public interface ServiceRule {
    public abstract void backController(String serviceCode, ModelAndView mav);
    public abstract void backController(String serviceCode, Model model);
}