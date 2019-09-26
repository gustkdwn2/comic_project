package com.comic.controller;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.comic.model.CustomerCommentsVO;
import com.comic.service.CustomerCenterCommentsService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@AllArgsConstructor
@RequestMapping("/comments/")
public class CustomerCenterCommentsController {
	
	private CustomerCenterCommentsService service;
	
	@PostMapping(value="/new", consumes="application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody CustomerCommentsVO vo){
		
		log.info("CommentsVO : "+vo);
		
		//int insertCount
		
		return null;
		
	}
	

}
