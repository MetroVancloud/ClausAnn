package com.aturstudio.controller.home;

import com.aturstudio.dao.AnnUserMapper;
import com.aturstudio.dto.SentenceDTO;
import com.aturstudio.entity.AnnUser;
import com.aturstudio.entity.AnnUserExample;
import com.aturstudio.service.AnnotationDispatchService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author Fan Yunlong
 * @create 2018/7/5 上午 2:58
 * @update 2018/7/5 上午 2:58
 */
@RestController
@RequestMapping("/home")
public class HomeController {

    private Logger logger = Logger.getLogger(HomeController.class);

    @Autowired
    AnnUserMapper annUserMapper;
    @Autowired
    AnnotationDispatchService annotationDispatchService;

    @RequestMapping("/homepage")
    public ModelAndView toLoginPage() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("login");
        return modelAndView;
    }

    @RequestMapping("/verify")
    public ModelAndView login(HttpSession session,
                              AnnUser unVerifiedUser) {
        ModelAndView modelAndView = new ModelAndView();

        AnnUserExample example = new AnnUserExample();
        AnnUserExample.Criteria criteria = example.createCriteria();
        criteria.andPasswordEqualTo(unVerifiedUser.getPassword());
        criteria.andUserNameEqualTo(unVerifiedUser.getUserName());
        try {
            List<AnnUser> userList = annUserMapper.selectByExample(example);
            if (null == userList || userList.size() == 0) {
                modelAndView.setViewName("login");
                modelAndView.addObject("message", "User name or Password might be wrong!");
            } else {
                session.setAttribute("user", userList.get(0));
                List<SentenceDTO> sentenceList = annotationDispatchService.getDispatchedSentenceList(userList.get(0), new SentenceDTO());
                modelAndView.setViewName("clause_segmentation");
                modelAndView.addObject("sentenceList", sentenceList);
            }
        } catch (Exception e) {
            logger.warn(this, e);
            modelAndView.setViewName("login");
            modelAndView.addObject("message", "Verification failed，please retry!");
        }

        return modelAndView;
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
