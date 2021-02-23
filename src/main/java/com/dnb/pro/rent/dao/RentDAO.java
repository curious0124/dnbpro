package com.dnb.pro.rent.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;


import com.dnb.pro.equip.vo.EquipVO;
import com.dnb.pro.rent.vo.Criteria;
import com.dnb.pro.rent.vo.RentVO;



public interface RentDAO {
	
	public List selectAllLogList(Criteria cri) throws DataAccessException;
	public List selectResqList() throws DataAccessException;
	public List selectAllResList() throws DataAccessException;
	public List selectAllRentList() throws DataAccessException;
	public List selectAllReturnList() throws DataAccessException;
	
	public void insertRes(RentVO rentVO) throws DataAccessException;
	public void authinsertLogres(RentVO rentVO) throws DataAccessException;
	public int deleteResqapply(int resq_num) throws DataAccessException;
	
	public void insertLogResqcancle(RentVO rentVO) throws DataAccessException;
	public int deleteResqapplycancle(int resq_num) throws DataAccessException;

	public void Resupdate(Map resmap) throws DataAccessException;
	public void insertLogResupdate(Map resmap) throws DataAccessException;
//	public int selectResnumByCode() throws DataAccessException;
	

	public void insertLogRescancle(RentVO rentVO) throws DataAccessException;
	public int deleteRescancle(int res_num) throws DataAccessException;
	
	public void insertLogResreturn(RentVO rentVO) throws DataAccessException;
	public int deleteRenting(int res_num) throws DataAccessException;
	
	public void insertLogExpressreturn(RentVO rentVO) throws DataAccessException;
	public int deleteExpressReturn(int return_num) throws DataAccessException;
	public int deleteExpressReturnRenting(int res_num) throws DataAccessException;
	
	
//	public List selectLogList(Criteria cri) throws DataAccessException;
	public int listlogCount() throws Exception;
	
//	public void reservationrequest1(RentVO vo) throws DataAccessException;
	
//	public void reservationrequest2(RentVO vo) throws DataAccessException;
//	public void reqationauthor1(RentVO vo) throws DataAccessException;
//	public void reqationauthor2(RentVO vo) throws DataAccessException;
//
//	public void reqationauthor3(int resq_num ) throws DataAccessException;

	
//  public void selectReservation() throws DataAccessException;
//	public void reservationauthor1(Map resMap) throws DataAccessException;
//	public void reservationauthor2(RentVO vo) throws DataAccessException;
//	public void returnauthor1(RentVO vo) throws DataAccessException;
//	public void returnauthor2(RentVO vo) throws DataAccessException;
//	public void returnauthor3(int res_num ) throws DataAccessException;
//	
//	public void reqcancle(RentVO vo) throws DataAccessException;
//	public void rescancle(RentVO vo) throws DataAccessException;
	

	
	
}
