package com.example.dao;

import com.example.entity.People;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.List;

public interface PeopleDao extends PagingAndSortingRepository<People,String>, JpaSpecificationExecutor<People> {

    @Query(value = "SELECT * FROM  people",nativeQuery = true)
    List<People> list();
}
