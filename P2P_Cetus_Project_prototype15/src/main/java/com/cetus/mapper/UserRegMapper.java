package com.cetus.mapper;

import java.util.List;

import com.cetus.domain.UserRegVO;

public interface UserRegMapper {
	public int insert(UserRegVO userReg);
	public List<UserRegVO> getList();
	public int idCheck(String id);
	public int emailCheck(String email);
	public UserRegVO getInfo(String id);
	public int update(UserRegVO userReg);
	public int insertAuth(String id);
}
