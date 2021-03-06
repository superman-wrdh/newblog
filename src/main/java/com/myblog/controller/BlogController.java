package com.myblog.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;
import com.myblog.model.Blog;
import com.myblog.model.Category;
import com.myblog.model.Tag;
import com.myblog.service.IBlogService;
import com.myblog.service.ICategoryService;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Set;

/**
 * Created by Zephery on 2016/8/5.
 */
@Controller
public class BlogController {
    private final static Logger logger = LoggerFactory.getLogger(BlogController.class);
    @Resource
    private IBlogService blogService;
    @Resource
    private ICategoryService categoryService;


    @RequestMapping("tech")
    public ModelAndView to_show_article(HttpServletRequest request) {       //博客主页
        ModelAndView modelAndView = new ModelAndView();
        String page = request.getParameter("pagenum");
        String categoryid = request.getParameter("categoryid");
        String t_id = request.getParameter("tid");
        Integer pagenum;
        if (StringUtils.isEmpty(page)) {
            pagenum = 1;
        } else {
            pagenum = Integer.parseInt(page);
        }
        PageHelper.startPage(pagenum, 15);
        List<Blog> lists;
        if (StringUtils.isNotEmpty(categoryid)) {
            lists = blogService.getByCategoryId(Integer.parseInt(categoryid));
            Category category = categoryService.selectByPrimaryKey(Integer.parseInt(categoryid));
            modelAndView.addObject("category", category);
        } else if (StringUtils.isNotEmpty(t_id)) {
            lists = blogService.getBlogByTagId(Integer.parseInt(t_id));
            Tag tag = blogService.getTagByTid(Integer.parseInt(t_id));
            modelAndView.addObject("tag", tag);
        } else {
            lists = blogService.getAllTechBlog();
        }
        for (int i = 0; i < lists.size(); i++) {
            try {
                int category_id = lists.get(0).getCategoryid();
                lists.get(i).setCategory(categoryService.selectByPrimaryKey(category_id));
            } catch (Exception e) {
                logger.error("datetimeparse error" + e);
            }
        }
        PageInfo<Blog> blogs = new PageInfo<>(lists);
        Integer startpage, endpage;
        if (blogs.getPages() < 6) {
            startpage = 1;
            endpage = blogs.getPages();
        } else {
            if (pagenum > 3) {
                startpage = blogs.getPageNum() - 3;
                endpage = blogs.getPageNum() + 3 > blogs.getPages() ? blogs.getPages() : pagenum + 3;
            } else {
                startpage = 1;
                endpage = blogs.getPageNum() + 4 > blogs.getPages() ? blogs.getPages() : pagenum + 4;
            }
        }
        modelAndView.addObject("startpage", startpage);
        modelAndView.addObject("endpage", endpage);
        modelAndView.addObject("blogs", blogs.getList());
        modelAndView.addObject("totalpages", blogs.getPages());
        modelAndView.addObject("pageNum", blogs.getPageNum());
        modelAndView.setViewName("tech");
        return modelAndView;
    }


    @RequestMapping(method = RequestMethod.GET, path = "getblogdetail")
    public ModelAndView getBlogDetail(Integer blogid) {       //博客具体内容
        ModelAndView modelAndView = new ModelAndView();
        Blog blog = blogService.getBlogDetail(blogid);
        Blog preblog = blogService.getBlogDetail(blogid - 1);
        if (preblog != null) {
            modelAndView.addObject("preblog", preblog);
        }
        Blog nextblog = blogService.getBlogDetail(blogid + 1);
        if (nextblog != null) {
            modelAndView.addObject("nextblog", nextblog);
        }
        modelAndView.addObject("blog", blog);
        modelAndView.setViewName("blogdetail");
        return modelAndView;
    }

    @RequestMapping(method = RequestMethod.GET, path = "getcategory")
    public ModelAndView getcategory() {
        ModelAndView modelAndView = new ModelAndView();//TODO 类别获取
        return modelAndView;
    }

    @RequestMapping(value = "/search")
    public ModelAndView search(
            @RequestParam(value = "keyword", required = false) String keyword,
            @RequestParam(value = "pagenum", required = false) Integer pagenum) {
        ModelAndView modelAndView = new ModelAndView();
        try {
            if (pagenum == null) {
                pagenum = 1;
            }
            List<Blog> lists = blogService.getLuceneBlog(pagenum, keyword, 10);
            PageHelper.startPage(pagenum, 10);
            List<Category> categories = categoryService.getAllCategory();
            modelAndView.addObject("categories", categories);
            PageInfo<Blog> blogs = new PageInfo<>(lists);
            blogs.setPageSize(10);
            blogs.setSize(10);
            blogs.setPages(lists.size() / 10 == 0 ? lists.size() / 10 : lists.size() / 10 + 1);
            Integer startpage, endpage;
            if (blogs.getPages() < 6) {
                startpage = 1;
                endpage = blogs.getPages();
            } else {
                if (pagenum > 3) {
                    startpage = blogs.getPageNum() - 3;
                    endpage = blogs.getPageNum() + 3;
                } else {
                    startpage = 1;
                    endpage = blogs.getPageNum() + 4;
                }
            }
            modelAndView.addObject("startpage", startpage);
            modelAndView.addObject("endpage", endpage);
            modelAndView.addObject("blogs", blogs.getList());
            modelAndView.addObject("totalpages", blogs.getPages());
            modelAndView.addObject("pageNum", pagenum);
            modelAndView.addObject("keyword", keyword);
            modelAndView.setViewName("searchresult");
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("search" + e);
        }
        return modelAndView;
    }

    @RequestMapping(method = RequestMethod.GET, path = "/board")
    public ModelAndView getboard() {
        ModelAndView modelAndView = new ModelAndView();
        try {
            modelAndView.setViewName("board");
        } catch (Exception e) {
            logger.error("getboard" + e);
        }
        return modelAndView;
    }

    @RequestMapping(method = RequestMethod.GET, path = "test")
    public ModelAndView test() {
        ModelAndView modelAndView = new ModelAndView();
        String md = "# hello world";
        modelAndView.addObject("md", md);
        modelAndView.setViewName("test");
        return modelAndView;
    }

    @RequestMapping("ajaxbuild")
    public void buildsearch(HttpServletResponse response) throws IOException {
        blogService.ajaxbuild();
        response.getWriter().write("success");

    }

    @RequestMapping("ajaxsearch")
    public void ajaxsearch(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String keyword = request.getParameter("keyword");
        if (StringUtils.isEmpty(keyword)) {
            return;
        }
        Set<String> set = blogService.ajaxsearch(keyword);
        Gson gson = new Gson();
        response.getWriter().write(gson.toJson(set));
    }
}
