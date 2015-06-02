package com.aes.controller;

import com.aes.dao.UDao;
import com.aes.dao.UserDao;
import com.aes.model.Course;
import com.aes.model.UserBean;
import com.aes.model.UserDetails;
import com.aes.service.UService;
import java.io.IOException;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author RCBG
 */
@Controller
@RequestMapping("/login")
public class LoginController {
	@Autowired
	private UService service;
	
    @RequestMapping(method=RequestMethod.GET)
    public String viewLogin(Map<String, Object> map){
        UserBean userBean=new UserBean();
        map.put("userBean", userBean);
        return "../../login";
    }
    
    @RequestMapping(method = RequestMethod.POST)
    public void processLogin(@RequestParam("username") String username, @RequestParam("password") String password,
            Map<String, Object> model, HttpServletRequest request, HttpServletResponse response) throws IOException {
            UserDetails user = new UserDetails();
            user.setUserName(username);
            user.setPassword(password);
        int isUserValid=service.isValid(user);
        if(isUserValid!=0){
            HttpSession session=request.getSession();
            user.setUserId(isUserValid);
            user=service.getUserDetails(user);
            session.setAttribute("user", user);
            session.setAttribute("userID", user.getUserId());
            session.setAttribute("courses", service.getAllCoursesAssigned(user));
            session.setAttribute("userName",user.getUserName());
						
            if(user.getUserType().getUserTypeId() == 0 || user.getUserType().getUserTypeId() == 1){
                response.sendRedirect("admin/home.htm");
            }else if(user.getUserType().getUserTypeId() == 2){
                response.sendRedirect("user/home.htm");
            }else{
                response.sendRedirect("login.htm");
            }
        }else{
            response.sendRedirect("login.htm");
        }
    }
}
