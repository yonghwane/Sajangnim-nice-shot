package com.ais.sajangnimniceshot.controllers;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.web.servlet.ModelAndView;

import com.ais.sajangnimniceshot.services.Authentication;

@SpringBootTest
@ExtendWith(MockitoExtension.class)
class SNPControllerTest {

    @Mock
    private Authentication auth;

    @Test
    public void testLogin() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("main");
        mav.addObject("test");
        System.out.println("test: " + mav);
        this.auth.backController("login", mav);
        this.auth.backController("changeHeader", mav);
        assertNotNull(mav);
    }
}



