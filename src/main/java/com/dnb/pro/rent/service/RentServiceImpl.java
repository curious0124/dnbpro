package com.dnb.pro.rent.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.dnb.pro.equip.vo.EquipVO;
import com.dnb.pro.rent.dao.RentDAO;
import com.dnb.pro.rent.vo.RentVO;

@Service("rentService")
	@Transactional(propagation = Propagation.REQUIRED)
	public class RentServiceImpl implements RentService {
		@Autowired
		private RentDAO rentDAO;

		@Override
		public List<RentVO> listlogs() throws Exception {
			List<RentVO> logList = rentDAO.selectAllLogList();
			
			return logList;
		}
		
		
		@Override
		public List<RentVO> listresqs() throws Exception {
			List<RentVO> resqList = rentDAO.selectResqList();
			
			return resqList;
		}
		
		
		@Override
		public List<RentVO> listres() throws Exception {
			List<RentVO> resList = rentDAO.selectAllResList();
			
			return resList;
		}
		
		
		@Override
		public List<RentVO> listrent() throws Exception {
			List<RentVO> rentList = rentDAO.selectAllRentList();
			
			return rentList;
		}
		
		@Override
		public List<RentVO> listreturn() throws Exception {
			List<RentVO> returnList = rentDAO.selectAllReturnList();
			
			return returnList;
		}
		
		@Override
		public void AuthRes(RentVO rentVO) throws Exception {
			int resq_num = rentVO.getResq_num();
		
			rentDAO.insertRes(rentVO);
			rentDAO.authinsertLogres(rentVO);
			rentDAO.deleteResqapply(resq_num);
		}
		
		@Override
		public void CancleResq(RentVO rentVO) throws Exception {
			int resq_num = rentVO.getResq_num();
		
			
			rentDAO.insertLogResqcancle(rentVO);
			rentDAO.deleteResqapplycancle(resq_num);
		}
		
		
		
		@Override
		public void ResStateupdate(Map resmap) throws Exception{
			System.out.println(resmap);
			 rentDAO.Resupdate(resmap);
			 
			 
			
		}
		
		@Override
		public void ResStateinsertLog(Map resmap) throws Exception{
			System.out.println(resmap);
			
			 rentDAO.insertLogResupdate(resmap);
			 
			
		}
		
		
		
		
		
		@Override
		public void CancleRes(RentVO rentVO) throws Exception {
			int res_num = rentVO.getRes_num();
		
			
			rentDAO.insertLogRescancle(rentVO);
			rentDAO.deleteRescancle(res_num);
		}
		
}
