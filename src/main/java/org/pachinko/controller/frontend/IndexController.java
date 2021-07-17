package org.pachinko.controller.frontend;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lombok.extern.slf4j.Slf4j;
import org.pachinko.controller.backend.PCKBaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/")
@Slf4j
public class IndexController extends PCKBaseController {

    @RequestMapping(value = "/index.htm", method = RequestMethod.GET)
    public ModelAndView index(HttpServletRequest request, HttpServletResponse response) {


        String url ="/cproduct/list-AXIE-2-0-0-1-1.htm";
        //重定向到列表页面
        ModelAndView mv = new ModelAndView("redirect:"+url);
        //todo
        return mv;
    }
}