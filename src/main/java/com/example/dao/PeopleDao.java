package com.example.dao;

import com.example.entity.People;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.List;

public interface PeopleDao extends PagingAndSortingRepository<People,String>, JpaSpecificationExecutor<People> {

    @Query(value = "SELECT * FROM  people",nativeQuery = true)
    List<People> list();

    @Query(value = "SELECT * FROM  people WHERE name LIKE ?1 OR phone_num LIKE ?1",nativeQuery = true)
    List<People> listByKeywork(String keyword);

    @Modifying
    @Query(value = "UPDATE people SET name = ?1 AND phone_num = ?2 WHERE id = ?3",nativeQuery = true)
    void updateById(String name,String phoneNum,Long id);
}
