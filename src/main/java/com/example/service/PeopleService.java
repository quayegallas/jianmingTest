package com.example.service;

import com.example.dao.PeopleDao;
import com.example.entity.People;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PeopleService {

    @Autowired
    private PeopleDao peopleDao;

    public List<People> list() {
        List<People> peopleList = peopleDao.list();

        return peopleList;
    }

    public boolean remove(Long id) {
        peopleDao.deleteById(id.toString());

        return true;
    }
}
