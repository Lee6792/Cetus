package com.cetus.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cetus.domain.BoardVO;
import com.cetus.domain.CatePlusCri;
import com.cetus.domain.CateVO;
import com.cetus.domain.Criteria;
import com.cetus.domain.MyFavoriteVO;
import com.cetus.domain.PageDTO;
import com.cetus.mapper.CateMapper;
import com.cetus.service.BoardService;
import com.cetus.service.CateService;
import com.cetus.service.MyFavoriteService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import oracle.jdbc.proxy.annotation.Post;

@Log4j
@Controller
@AllArgsConstructor
@RequestMapping("/info/*")
public class FavoriteController {
	private MyFavoriteService service;
	private BoardService b_service;
	private CateService c_service;
	
	@GetMapping("/myFavorite")
	public void insert3(Model model, Principal pri, Criteria cri) {
		/* model.addAttribute("f_list",service.getList(pri.getName())); */
		CatePlusCri cpc = new CatePlusCri();
		cpc.setAmount(cri.getAmount());
		cpc.setPageNum(cri.getPageNum());
		cpc.setId(pri.getName());
		log.info(cpc.getId());
		model.addAttribute("Paginglist", service.getListWithPaging(cpc));
		List<CateVO> clist = c_service.getList();
		model.addAttribute("clist",clist);
		model.addAttribute("pageMaker", new PageDTO(cri, service.getTotal(cpc.getId())));
	}
	
	@GetMapping("/myFavorite2")
	public void insert2(Model model, Criteria cri) {
		List<CateVO> clist = c_service.getList();
		model.addAttribute("clist",clist);
		model.addAttribute("pageMaker", new PageDTO(cri, 1));
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("favorch") String[] favorchs, ModelMap modelMap, Principal pri,@ModelAttribute("cri") Criteria cri,RedirectAttributes rttr) throws Exception{
		CatePlusCri cpc = new CatePlusCri();
		cpc.setId(pri.getName());
		for ( String favorch : favorchs) {
			cpc.setSearch(favorch);
			int result = service.getremove(cpc);
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		return "redirect:/info/myFavorite";
	}
	
	@GetMapping("/favorite")
	public void favorite(Model model,Principal pri,MyFavoriteVO vo,@RequestParam("bno") long bno,@ModelAttribute("cri") Criteria cri) {
		log.info("찜목록"+vo);
		vo.setId(pri.getName());
		int result = service.getinsert(vo);
		model.addAttribute("board", b_service.get(bno));
	}
}
