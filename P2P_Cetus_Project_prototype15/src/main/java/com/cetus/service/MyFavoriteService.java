package com.cetus.service;

import java.util.List;

import com.cetus.domain.BnoPlusId;
import com.cetus.domain.CatePlusCri;
import com.cetus.domain.MyFavoriteVO;

public interface MyFavoriteService {
	public List<MyFavoriteVO> getListWithPaging(CatePlusCri cpc);
	public List<MyFavoriteVO> getList(String id);
	public int getremove(CatePlusCri cpc);
	public int getinsert(MyFavoriteVO vo);
	public MyFavoriteVO getBno(BnoPlusId bpi);
	public int getTotal(String id);
	public long board_remove(long bno);
}
