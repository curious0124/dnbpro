package com.dnb.pro.rent.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.dnb.pro.equip.vo.EquipVO;
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

		

		@Override
		public List selectAllResList() throws DataAccessException {
			List<RentVO> resList = resList = sqlSession.selectList("mapper.rent.selectAllResList");
			return resList;
		}

		
		@Override
		public List selectAllRentList() throws DataAccessException {
			List<RentVO> rentList = rentList = sqlSession.selectList("mapper.rent.selectAllRentList");
			return rentList;
		}
		
		@Override
		public List selectAllReturnList() throws DataAccessException {
			List<RentVO> retrunList = retrunList = sqlSession.selectList("mapper.rent.selectAllReturnList");
			return retrunList;
		}
		
		@Override
		public void insertRes(RentVO rentVO) throws DataAccessException {
			sqlSession.insert("mapper.rent.insertRes", rentVO);
			
		}
		
		@Override
		public void authinsertLogres(RentVO rentVO) throws DataAccessException {
			 sqlSession.insert("mapper.rent.authinsertLogres", rentVO);
			
		}
		
		@Override
		public int deleteResqapply(int resq_num) throws DataAccessException {
			return sqlSession.delete("mapper.rent.deleteResqapply", resq_num);
			
		}
		
		@Override
		public void insertLogResqcancle(RentVO rentVO) throws DataAccessException {
			sqlSession.insert("mapper.rent.insertLogResqcancle", rentVO);
			
		}
		
		@Override
		public int deleteResqapplycancle(int resq_num) throws DataAccessException {
			return sqlSession.delete("mapper.rent.deleteResqapplycancle", resq_num);
			
		}
}
