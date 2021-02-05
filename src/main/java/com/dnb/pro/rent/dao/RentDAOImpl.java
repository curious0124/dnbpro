package com.dnb.pro.rent.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.dnb.pro.rent.vo.RentVO;



@Repository("RentDAO")
public class RentDAOImpl implements  RentDAO {

		@Autowired
		private SqlSession sqlSession;

		@Override
		public List selectAllLogList() throws DataAccessException {
			List<RentVO> logList = logList = sqlSession.selectList("mapper.rent.selectAllLogList");
			return logList;
		}

		@Override
		public List selectResqList() throws DataAccessException {
			List<RentVO> resqList = resqList = sqlSession.selectList("mapper.rent.selectResqList");
			return resqList;
		}

		


}
