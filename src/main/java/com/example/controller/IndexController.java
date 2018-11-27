package com.example.controller;

import com.alibaba.fastjson.JSONObject;
import com.example.entity.People;
import com.example.service.PeopleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class IndexController {

    @Autowired
    private PeopleService peopleService;

    @RequestMapping({"/index"})
    public String getIndex(ModelMap map){
        List<People> peopleList = peopleService.list();
        map.put("list",peopleList);

        return "page/index";
    }

    @RequestMapping({"/remove"})
    public String list(@RequestBody JSONObject params){
        Long id = params.getLong("id");
        if(peopleService.remove(id)){
            return "删除成功";
        }
        return "删除失败";
    }
}
