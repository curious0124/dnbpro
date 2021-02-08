package com.dnb.pro.cust.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

public interface CustDAO {
	public List selectAllFaqList() throws DataAccessException;
}
