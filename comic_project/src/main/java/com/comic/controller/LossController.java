package com.comic.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.comic.model.LossVO;
import com.comic.service.LossService;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/loss")
@AllArgsConstructor
public class LossController {
	
	private LossService lossService;
	
	@GetMapping("losslist")
	public void lossList(Model model) {
		model.addAttribute("lossList", lossService.lossList()); // 손실테이블
	}
	
	@PostMapping("lossRegister")
	public String lossRegister(LossVO vo) {
		lossService.lossRegister(vo);
		return "redirect:/loss/losslist";
	}
	
	@PostMapping("lossRemove")
	public String productRemove(@RequestParam("loss_num") int loss_num) {
		lossService.lossRemove(loss_num);
		return "redirect:/loss/losslist";
	}
	
	@GetMapping("lossModify")
	public @ResponseBody Map<String, LossVO> lossGetModify(@RequestParam("loss_num") int loss_num) {
		Map<String, LossVO> map = new HashMap<String, LossVO>();
		map.put("getModify", lossService.lossGet(loss_num));
		return map;
	}
	
	@PostMapping("lossModify")
	public String lossModify(LossVO vo) {
		lossService.lossModify(vo);
		return "redirect:/loss/losslist";
	}
}
