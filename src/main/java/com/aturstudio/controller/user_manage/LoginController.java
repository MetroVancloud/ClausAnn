package com.aturstudio.controller.user_manage;

import com.aturstudio.dao.AnnUserMapper;
import com.aturstudio.dto.SentenceDTO;
import com.aturstudio.entity.AnnUser;
import com.aturstudio.entity.AnnUserExample;
import com.aturstudio.service.AnnotationDispatchService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * @author Fan Yunlong
 * @create 2018/7/5 上午 2:58
 * @update 2018/7/5 上午 2:58
 */
@RestController
@RequestMapping("/login")
public class LoginController {

    private Logger logger = Logger.getLogger(LoginController.class);

    @Autowired
    AnnUserMapper annUserMapper;
    @Autowired
    AnnotationDispatchService annotationDispatchService;

    @RequestMapping("/in")
    public ModelAndView toLoginPage() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("login");
        return modelAndView;
    }

    @RequestMapping("/verify")
    public ModelAndView login(HttpSession session, AnnUser unVerifiedUser) {
        ModelAndView modelAndView = new ModelAndView();

        AnnUserExample example = new AnnUserExample();
        AnnUserExample.Criteria criteria = example.createCriteria();
        criteria.andPasswordEqualTo(unVerifiedUser.getPassword());
        criteria.andUserNameEqualTo(unVerifiedUser.getUserName());
        try {
            List<AnnUser> userList = annUserMapper.selectByExample(example);
            if (null == userList || userList.size() == 0) {
                //modelAndView.addObject("message", "User name or Password might be wrong!");
                //String message = "用户名或密码错误！";
                modelAndView = new ModelAndView("login");
                modelAndView.addObject("message", "用户名或密码错误！");
                return modelAndView;
            } else {
                session.setAttribute("user", userList.get(0));
                modelAndView = new ModelAndView("redirect:/clause_segmentation/to_segmentation_page.do");
                modelAndView.addObject("annotationSeq", 1);
                return modelAndView;
                //return "redirect:/clause_segmentation/to_segmentation_page.do?sentenceId=25";
            }
        } catch (Exception e) {
            logger.warn(this, e);
            //String message = "Verification failed，please retry!";
            modelAndView = new ModelAndView("login");
            modelAndView.addObject("message", "验证失败，请重试！");
            return modelAndView;
            //return "redirect:/login/in.do?message="+message;
        }
    }

    @RequestMapping("/out")
    public ModelAndView logOut(
            HttpSession session
    ) {
        session.invalidate();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("login");
        return modelAndView;
    }
}
