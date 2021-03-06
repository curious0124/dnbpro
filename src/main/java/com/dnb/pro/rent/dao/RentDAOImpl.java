package com.dnb.pro.rent.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;


import com.dnb.pro.equip.vo.EquipVO;
import com.dnb.pro.rent.vo.Criteria;
import com.dnb.pro.rent.vo.RentVO;
import com.dnb.pro.rent.vo.SearchCriteria;



@Repository("RentDAO")
public class RentDAOImpl implements  RentDAO {

		@Autowired
		private SqlSession sqlSession;

		@Override
		public List selectAllLogList(SearchCriteria scri) throws DataAccessException {
			return  sqlSession.selectList("mapper.rent.selectAllLogList",scri);
			
		}

		@Override
		public List selectResqList() throws DataAccessException {
			List<RentVO>  resqList = sqlSession.selectList("mapper.rent.selectResqList");
			return resqList;
		}

		

		@Override
		public List selectAllResList() throws DataAccessException {
			List<RentVO>  resList = sqlSession.selectList("mapper.rent.selectAllResList");
			return resList;
		}

		
		@Override
		public List selectAllRentList() throws DataAccessException {
			List<RentVO>  rentList = sqlSession.selectList("mapper.rent.selectAllRentList");
			return rentList;
		}
		
		@Override
		public List selectAllReturnList() throws DataAccessException {
			List<RentVO>  retrunList = sqlSession.selectList("mapper.rent.selectAllReturnList");
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
		
		@Override
		public void Resupdate(Map resmap) throws DataAccessException{
			
			sqlSession.update("mapper.rent.Resupdate", resmap); 
//			System.out.println(res_Status);
//			 return result;
			
		}
		
		@Override
		public void insertLogResupdate(Map resmap) throws DataAccessException {
//			int resNO = selectResnumByCode();
			System.out.println("DAO : "+resmap);
			sqlSession.insert("mapper.rent.insertLogResupdate", resmap);
//			return resNO;
			
		}
		

		
		
		@Override
		public void insertLogRescancle(RentVO rentVO) throws DataAccessException {
			sqlSession.insert("mapper.rent.insertLogRescancle", rentVO);
			
		}
		
		@Override
		public int deleteRescancle(int res_num) throws DataAccessException {
			return sqlSession.delete("mapper.rent.deleteRescancle", res_num);
			
		}
		
		
		@Override
		public void insertLogResreturn(RentVO rentVO) throws DataAccessException {
			sqlSession.insert("mapper.rent.insertLogResreturn", rentVO);
			
		}
		
		@Override
		public int deleteRenting(int res_num) throws DataAccessException {
			return sqlSession.delete("mapper.rent.deleteRenting", res_num);
			
		}
		
		
		@Override
		public void insertLogExpressreturn(RentVO rentVO) throws DataAccessException {
			sqlSession.insert("mapper.rent.insertLogExpressreturn", rentVO);
			
		}
		
		@Override
		public int deleteExpressReturn(int return_num) throws DataAccessException {
			return sqlSession.delete("mapper.rent.deleteExpressReturn", return_num);
			
		}
		
		@Override
		public int deleteExpressReturnRenting(int res_num) throws DataAccessException {
			return sqlSession.delete("mapper.rent.deleteExpressReturnRenting", res_num);
			
		}
		
		
//		@Override
//		public List selectLogList(Criteria cri) throws DataAccessException {
//			List<RentVO> logList = sqlSession.selectList("mapper.rent.selectLogList",cri);
//			return logList;
//		}
		@Override
		public int listlogCount(SearchCriteria scri) throws Exception {
			return sqlSession.selectOne("mapper.rent.listlogCount",scri);
		}

		//예약신청
		@Override
		public void insertAskRent(RentVO rentVO) throws Exception {
			System.out.println("DAO 확인 : "+rentVO.getResq_start());
			sqlSession.insert("mapper.rent.insertAskRent", rentVO);
			sqlSession.insert("mapper.rent.insertAskRentLog",rentVO);
			
		}
		
		// 예약신청승인 중복체크
		@Override
		public List selectResoverlap(RentVO rentVO) throws Exception {
		     System.out.println("sfs" + rentVO.getResq_start());
		     System.out.println("sfs" + rentVO.getResq_end());
		     List checkList = sqlSession.selectList("mapper.rent.selectResoverlap", rentVO);
		     System.out.println("DAO check : "+checkList);
		     return  checkList;
	 }
		
		
}
