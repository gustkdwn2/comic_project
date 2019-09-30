package com.comic.controller;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.comic.service.ManagerPosService;
import com.comic.service.SettlementService;
import com.comic.service.impl.ManagerPosServiceImpl;

import lombok.AllArgsConstructor;
import net.sf.json.JSONArray;

/**
 * Handles requests for the application home page.
 */

@Controller
@RequestMapping("/managerpos/")
  @AllArgsConstructor//생성자함수
 public class ManagerController {
	//ManagerController managerController;
	
	private ManagerPosServiceImpl managerposService;
	/*=new ManagerPosServiceImpl();*/
	/**
	 * Simply selects the home view to render by returning its name.
	 */

	@RequestMapping(value = { "/managerpos", "/Managerpos" }, method = RequestMethod.GET)
	public String younghakpos(Locale locale, Model model) {
		// logger.info("Welcome home! The client locale is {}.", locale);

		// Date date = new Date();
		// DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG,
		// DateFormat.LONG, locale);

		// String formattedDate = dateFormat.format(date);

		// model.addAttribute("serverTime", formattedDate );

		return "/younghak/Managerpos";
	}

	@GetMapping("importdetail")
	public String younghakimportdetail(Model model) {
		return "/younghak/importdetail";
	}

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String younghakworklogin(Model model) {

		return "younghak/login";
	}

	
	
	@ResponseBody
	@RequestMapping(value = "room_start2", method = { RequestMethod.GET, RequestMethod.POST })
	public void room_start(@RequestBody HashMap<String, Object> map// 배열 받기 traditional: true
	) {
		JSONArray jsonArray = new JSONArray(); // object 타입
		//roomuse_id, roomuse_num,roomuse_status
		String roomuse_id= jsonArray.fromObject(map.get("list")).get(0).toString();
		String roomuse_num = jsonArray.fromObject(map.get("list")).get(1).toString();
		String roomuse_status = jsonArray.fromObject(map.get("list")).get(2).toString();

		try {
			
			System.out.println("room_id = "+roomuse_id);
			System.out.println("room_num = "+roomuse_num);			
			System.out.println("room_status = "+roomuse_status);

			
			if(roomuse_status.equals("on")) {
				managerposService.start_room(roomuse_id, roomuse_num,roomuse_status);	
			}else if(roomuse_status.equals("off")) {
				managerposService.stop_room(roomuse_num);
			}
			
			System.out.println("데이터가 들어옴!");

		} catch (Exception ex) {
			ex.printStackTrace();
		}


	}

}
