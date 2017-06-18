package org.ld.dao;

import java.util.HashMap;
import java.util.List;

import org.ld.model.Staff;
import org.ld.model.User;

public interface StaffMapper {
    int deleteByPrimaryKey(Integer ID);

    int insert(Staff record);

    int insertSelective(Staff record);

    Staff selectByPrimaryKey(Integer ID);

    int updateByPrimaryKeySelective(Staff record);

    int updateByPrimaryKey(Staff record);
    //Ôö¼Ó
    List<Staff> selectByDuty(String DUTY);
}