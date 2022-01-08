package com.cetus.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cetus.domain.CateVO;
import com.cetus.domain.UserRegVO;
import com.cetus.mapper.CateMapper;
import com.cetus.service.UserRegService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/info/*")
public class MyInfoController {
	
	@Setter(onMethod_ = @Autowired)
	private UserRegService service;
	
	@Setter(onMethod_ = @Autowired)
	private CateMapper c_service;
	
	// 내 정보 보기
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/myInfo")
	public void info(Model model, String id) {
		log.info("============================myInfo");
		log.info(id);
		UserRegVO user = service.getInfo(id);
		List<CateVO> clist = c_service.getList();
		model.addAttribute("user", user);
		model.addAttribute("clist",clist);
		model.addAttribute("id",id);
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/myUpdate")
	public void myUpdate(Model model, String id) {
		log.info("myUpdate======================");
		UserRegVO user = service.getInfo(id);
		List<CateVO> clist = c_service.getList();
		model.addAttribute("clist",clist);
		model.addAttribute("user", user);
	}
	
	// 내 정보 수정
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/myUpdate")
	public String update(Model model, UserRegVO vo, RedirectAttributes rttr) {
		log.info(vo.getId());
		List<UserRegVO> list = service.getList();
		List<CateVO> clist = c_service.getList();
		UserRegVO user = service.getInfo(vo.getId());
		rttr.addFlashAttribute("list", list);
		rttr.addFlashAttribute("clist", clist);
		rttr.addFlashAttribute("user", user);
		log.info(vo);
		int result = service.update(vo);
		log.info(result);
		if(result > 0) {
			rttr.addFlashAttribute("result",result);
		}
		return "redirect:/info/myInfo?id=" + vo.getId();
	}
}
