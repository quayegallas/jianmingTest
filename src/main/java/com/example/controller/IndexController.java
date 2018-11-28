package com.example.controller;

import com.alibaba.fastjson.JSONObject;
import com.example.entity.People;
import com.example.service.PeopleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class IndexController {

    @Autowired
    private PeopleService peopleService;

    @RequestMapping(value = "/index")
    public String getIndex(ModelMap map){
        List<People> peopleList = peopleService.list();
        map.put("list",peopleList);

        return "page/index";
    }

    @ResponseBody
    @RequestMapping(value ="/remove",method= RequestMethod.POST)
    public String remove(@RequestBody JSONObject params){
        Long id = params.getLong("id");
        if(peopleService.remove(id)){
            return "删除成功";
        }
        return "删除失败";
    }

    @ResponseBody
    @RequestMapping(value ="/list",method= RequestMethod.POST)
    public List<JSONObject> list(@RequestBody JSONObject params){
        String keyword = params.getString("keyword");
        List<JSONObject> peopleList = peopleService.listByKeyword(keyword);

        return peopleList;
    }

    @ResponseBody
    @RequestMapping(value ="/save",method= RequestMethod.POST)
    public String save(@RequestBody JSONObject params){
        peopleService.save(params);

        return "保存成功";
    }

    @ResponseBody
    @RequestMapping(value ="/update",method= RequestMethod.POST)
    public String update(@RequestBody JSONObject params){
        peopleService.update(params);

        return "保存成功";
    }
}
