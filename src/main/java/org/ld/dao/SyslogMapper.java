package org.ld.dao;

import org.ld.model.Syslog;

public interface SyslogMapper {
    int deleteByPrimaryKey(Integer ID);

    int insert(Syslog record);

    int insertSelective(Syslog record);

    Syslog selectByPrimaryKey(Integer ID);

    int updateByPrimaryKeySelective(Syslog record);

    int updateByPrimaryKey(Syslog record);
}