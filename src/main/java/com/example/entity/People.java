package com.example.entity;

import com.alibaba.fastjson.JSONObject;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "people")
public class People  implements Serializable {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Long id;
    private String name;
    private String workUnit;
    private String phoneNum;
    private String email;

    public People (){

    }

    public People(JSONObject params) {
        String name = params.getString("name");
        String phoneNum = params.getString("phoneNum");
        String workUnit = params.getString("workUnit");
        String email = params.getString("email");
        this.name = name;
        this.phoneNum = phoneNum;
        this.workUnit = workUnit;
        this.email = email;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getWorkUnit() {
        return workUnit;
    }

    public void setWorkUnit(String workUnit) {
        this.workUnit = workUnit;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public JSONObject toJson(){
        JSONObject result = new JSONObject();
        result.put("id",this.id);
        result.put("name",this.name);
        result.put("workUnit",this.workUnit);
        result.put("phoneNum",this.phoneNum);
        result.put("email",this.email);

        return result;
    }
}
