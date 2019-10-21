package com.comic.controller;


import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.comic.service.KaKaoPayService;
import com.google.gson.JsonElement;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/pay/")
@AllArgsConstructor
public class KakaoPayController {
	
	
	private KaKaoPayService kakaoPayService;
	
	@GetMapping("kakao")
	public @ResponseBody Map<String, String> kakaoPay(@RequestParam("room_num") int room_num, @RequestParam("id") String id, @RequestParam("totalprice") int totalprice) {
		JsonElement element = kakaoPayService.kakaoPay(room_num, id, totalprice);
		Map<String, String> jsonMap = new HashMap<String, String>();
		jsonMap.put("payUrl", element.getAsJsonObject().get("next_redirect_pc_url").toString().replace("\"", ""));
		return jsonMap;
	}
	
	@GetMapping("successpay")
	public String kakaoPaySuccess(@RequestParam("id") String id) {
		kakaoPayService.insertSale(id);
		return "redirect:/userView/success";
	}
}
