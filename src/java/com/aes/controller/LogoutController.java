package com.aes.controller;

import com.aes.model.UserBean;
import java.io.IOException;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author RCBG
 */
@Controller
@RequestMapping("/logout")
public class LogoutController {
    
    @RequestMapping(method=RequestMethod.GET)
    public void invalidateSessionAndViewLogin(Map<String, Object> map,
            HttpServletRequest request, HttpServletResponse response) throws IOException{
        HttpSession session=request.getSession();
        session.removeAttribute("user");
        session.invalidate();
        response.sendRedirect("login.htm");
    }
}
