package com.dnb.pro.equip.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.dnb.pro.equip.vo.Criteria;
import com.dnb.pro.equip.vo.EquipVO;
import com.dnb.pro.equip.vo.SearchCriteria;
import com.dnb.pro.rent.vo.RentVO;








@Repository("EquipDAO")
public class EquipDAOImpl implements  EquipDAO  {

	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List selectAllEquipList(SearchCriteria scri) throws DataAccessException {
//		List<EquipVO> equipList  = sqlSession.selectList("mapper.equip.selectAllEquipList");
		return sqlSession.selectList("mapper.equip.selectAllEquipList",scri);
	}
	
	@Override
	public int listEquipCount(SearchCriteria scri) throws Exception {
		return sqlSession.selectOne("mapper.equip.listEquipCount",scri);
	}
	
	@Override
	public EquipVO selectEquipByCode(String eq_name) throws DataAccessException {
		return sqlSession.selectOne("mapper.equip.EquipDetail", eq_name);
	}
	
	@Override
	public List selectAdminEquipList(SearchCriteria scri) throws DataAccessException {
//		List<EquipVO> adminequipList  = sqlSession.selectList("mapper.equip.selectAdminEquipList");
		return sqlSession.selectList("mapper.equip.selectAdminEquipList",scri);
	}
	
	@Override
	public int listSerialCount(SearchCriteria scri) throws Exception {
		return sqlSession.selectOne("mapper.equip.listSerialCount",scri);
	}
	
	@Override
	public List selectCatenameList() throws DataAccessException {
		List<EquipVO> cateList  = sqlSession.selectList("mapper.equip.selectCatenameList");
		return cateList;
	}
	
	@Override
	public int insertCatename(String cate_name) throws DataAccessException{
		int result = sqlSession.insert("mapper.equip.insertCatename",cate_name);
		return result;
		
	}
	
	@Override
	public EquipVO selectCateByCode(String cate_name) throws DataAccessException{
		return sqlSession.selectOne("mapper.equip.selectCateByCode",cate_name);
		
	}
	
	@Override
	public void deleteCatename(EquipVO equipVO) throws DataAccessException{
		sqlSession.delete("mapper.equip.deleteCatename",equipVO);
		
	}
	
	@Override
	public List selectEqnameList() throws DataAccessException {
		List<EquipVO> eqnameList  = sqlSession.selectList("mapper.equip.selectEqnameList");
		return eqnameList;
	}
	
	
	@Override
	public EquipVO selectEqnameByCode( ) throws DataAccessException{
		return sqlSession.selectOne("mapper.equip.selectEqnameByCode");
		
	}
	
	
//	@Override
//	public int insertEquiplist(EquipVO equipVO) throws DataAccessException {
//		int result = sqlSession.insert("mapper.equip.insertEquiplist", equipVO);
//		return result;
//	}
	
	@Override
	public EquipVO selectCateByCode2(String cate_name) throws DataAccessException {
		return sqlSession.selectOne("mapper.equip.selectCateByCode2",cate_name);
	}
	
	@Override
	public int insertSeriallist(EquipVO equipVO) throws DataAccessException {
		int result = sqlSession.insert("mapper.equip.insertSeriallist", equipVO);
		return result;
	}
	
	@Override
	public List selectonlyEqnameList() throws DataAccessException {
		List<EquipVO> eqnameonlyList  = sqlSession.selectList("mapper.equip.selectonlyEqnameList");
		return eqnameonlyList;
	}
	
	
	@Override
	public void deleteEqname(EquipVO equipVO) throws DataAccessException{
		sqlSession.delete("mapper.equip.deleteEqname",equipVO);
		
	}
	
	@Override
	public void deleteEqserial(EquipVO equipVO) throws DataAccessException{
		sqlSession.delete("mapper.equip.deleteEqserial",equipVO);
		
	}
	
	@Override
	public void updateSerialState(Map statemap) throws DataAccessException{
		
		sqlSession.update("mapper.equip.updateSerialState", statemap); 
//		System.out.println(eq_state);
//		 return result;
		
	}
	
	@Override
	public EquipVO selectSerialById(String eq_serial) throws DataAccessException{

		EquipVO adminequipList  = sqlSession.selectOne("mapper.equip.selectSerialById", eq_serial);

	

		return adminequipList;
	}

	@Override
	public List selectAbleEquipment(Map<String, Object> selectElement) {
		
		List ableEquipment = sqlSession.selectList("mapper.equip.selectAbleEquipList", selectElement);
		return ableEquipment;
	}
	
	
	
	@Override
	public void insertEquiplist(Map eqnamemap) throws DataAccessException {
//		int resNO = selectResnumByCode();
		System.out.println("DAO : "+eqnamemap);
		sqlSession.insert("mapper.equip.insertEquiplist", eqnamemap);
//		return resNO;
		
	}
	
	//선택한 장비와 수량의 이용가능한 시리얼을 가져온다.
	@Override
	public List selectAbleSerial(RentVO rentVO) throws DataAccessException {
		List ableSerialList = sqlSession.selectList("mapper.equip.selectAbleSerial", rentVO);
		return ableSerialList;
	}
	
	

}
