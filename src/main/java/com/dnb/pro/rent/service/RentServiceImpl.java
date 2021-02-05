package com.dnb.pro.rent.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

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
}
