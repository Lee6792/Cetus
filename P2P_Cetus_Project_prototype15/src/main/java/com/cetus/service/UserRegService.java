package com.cetus.service;

import java.util.List;

import com.cetus.domain.UserRegVO;

public interface UserRegService {
	public int insert(UserRegVO user);
	public List<UserRegVO> getList();
	public int idCheck(String id);
	public int emailCheck(String email);
	public UserRegVO getInfo(String id);
	public int update(UserRegVO userReg);
	public int insertAuth(String id);
}
