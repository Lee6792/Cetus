package com.cetus.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cetus.domain.BoardVO;
import com.cetus.domain.CatePlusCri;
import com.cetus.domain.Criteria;
import com.cetus.mapper.BoardMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class BoardServiceImpl implements BoardService {

	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
//	@Override
//	public List<BoardVO> getList() {
//		log.info("getList.....");
//		return mapper.getList();
//	}
	
	@Override
	public List<BoardVO> getList(Criteria cri) {
		log.info("getList with criteria................" + cri);
		return mapper.getListWithPaging(cri);
	}

	@Override
	public List<BoardVO> getCategory(CatePlusCri cpc) {
		log.info("getCategory...");
		return mapper.getCateory(cpc);
	}

	@Override
	public List<BoardVO> getSubCategory(CatePlusCri cpc) {
		log.info("getSubCategory...");
		return mapper.getSubCategory(cpc);
	}
	
	@Override
	public void register(BoardVO board) {
		
		log.info("register.........." + board);
		mapper.insertSelectKey(board);

	}

	@Override
	public BoardVO get(long bno) {
		
		log.info("get,,,,,,,," + bno);
	
		return mapper.read(bno);
	}

	@Override
	public boolean modify(BoardVO board) {
		log.info("modify,,,,,,,," + board);
		return mapper.update(board) == 1;
	}

	@Override
	public boolean remove(long bno) {
		log.info("remove,,,,,,,," + bno);
		return mapper.delete(bno) == 1;
	}
	@Override
	public int getTotal() {
		return mapper.getTotal();
	}

	@Override
	public int getCateTotal(CatePlusCri cpc) {
		return mapper.getCateTotal(cpc);
	}

	@Override
	public int getSubCateTotal(CatePlusCri cpc) {
		return mapper.getSubCateTotal(cpc);
	}

	@Override
	public List<BoardVO> getSearch(CatePlusCri cpc) {
		return mapper.getSearch(cpc);
	}

	@Override
	public int getSearchTotal(CatePlusCri cpc) {
		return mapper.getSearchTotal(cpc);
	}
	@Override
	public long updateHitCount(long bno) {
		
		log.info("COUNT");
		
		return mapper.updateHitCount(bno);
		
	}
	@Override
	public long updateRecoCount(long bno){
		log.info("updateRecoCount.....");
		return mapper.updateRecoCount(bno);
	}
	@Override
	public long updateHitDeleteCount(long bno){
		log.info("updateRecoCount.....");
		return mapper.updateHitDeleteCount(bno);
	}

	@Override
	public List<BoardVO> getBestList(Criteria cri) {
		return mapper.getBestList(cri);
	}

	@Override
	public int getBestTotal() {
		return mapper.getBestTotal();
	}
}
