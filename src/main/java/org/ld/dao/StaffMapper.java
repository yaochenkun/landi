package org.ld.dao;

import org.ld.model.Staff;

import java.util.List;

public interface StaffMapper {
    int deleteByPrimaryKey(Integer ID);

    int insert(Staff record);

    int insertSelective(Staff record);

    Staff selectByPrimaryKey(Integer ID);

    int updateByPrimaryKeySelective(Staff record);

    int updateByPrimaryKey(Staff record);

    List<Staff> selectByDuty(String DUTY);
}
