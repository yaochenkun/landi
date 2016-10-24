package org.ld.dao;

import org.ld.model.Invoice;

public interface InvoiceMapper {
    int deleteByPrimaryKey(Integer ID);

    int insert(Invoice record);

    int insertSelective(Invoice record);

    Invoice selectByPrimaryKey(Integer ID);

    int updateByPrimaryKeySelective(Invoice record);

    int updateByPrimaryKey(Invoice record);
}