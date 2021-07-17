package org.pachinko.controller.backend;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lombok.extern.slf4j.Slf4j;
import org.pachinko.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;

@Slf4j
public abstract class PCKBaseController {

    @Autowired
    protected IUserService userService;

    /**
     * 权限校验
     *
     * @param request
     * @param response
     * @return
     */
    public boolean hasLogin(HttpServletRequest request, HttpServletResponse response) {

        return true;
    }

    protected class LoginCheck {
        private boolean notLogin;
        private HttpServletRequest request;
        private ModelAndView mv;
        private String loginId;

        public LoginCheck(HttpServletRequest request, ModelAndView mv) {
            this.request = request;
            this.mv = mv;
        }

        boolean isNotLogin() {return notLogin;}

        public String getLoginId() {
            return loginId;
        }


    }
}