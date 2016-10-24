package org.ld.dao;

import org.ld.model.InvoiceDetail;

public interface InvoiceDetailMapper {
    int deleteByPrimaryKey(Integer ID);

    int insert(InvoiceDetail record);

    int insertSelective(InvoiceDetail record);

    InvoiceDetail selectByPrimaryKey(Integer ID);

    int updateByPrimaryKeySelective(InvoiceDetail record);

    int updateByPrimaryKey(InvoiceDetail record);
}