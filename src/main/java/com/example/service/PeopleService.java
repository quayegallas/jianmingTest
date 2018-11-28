package com.example.service;

import com.alibaba.fastjson.JSONObject;
import com.example.dao.PeopleDao;
import com.example.entity.People;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class PeopleService {

    @Autowired
    private PeopleDao peopleDao;

    public List<People> list() {
        List<People> peopleList = peopleDao.list();

        return peopleList;
    }

    public boolean remove(Long id) {
        peopleDao.deleteById(id);

        return true;
    }

    public List<JSONObject> listByKeyword(String keyword){
        List<People> peopleList = peopleDao.listByKeywork("%"+keyword+"%");

        return peopleList.stream().map(people -> people.toJson()).collect(Collectors.toList());
    }

    public void save(JSONObject params){

        People people = new People(params);
        peopleDao.save(people);
    }

    public void update(JSONObject params) {
        Long id = params.getLong("id");
        String name = params.getString("name");
        String phoneNum = params.getString("phoneNum");
        peopleDao.updateById(name,phoneNum,id);
    }
}
