package com.dnb.pro.education.service;

import java.util.List;
import java.util.Map;

import com.dnb.pro.education.vo.educationVO;

public interface educationService {

	public List listeducation() throws Exception;
	public educationVO vieweducation(int edu_num) throws Exception;
}