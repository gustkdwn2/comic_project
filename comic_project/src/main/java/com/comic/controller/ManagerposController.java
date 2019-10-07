package com.comic.controller;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.comic.model.RoomuseVO;
import com.comic.service.impl.ManagementServiceImpl;
import com.comic.service.impl.ManagerPosServiceImpl;

import lombok.AllArgsConstructor;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Handles requests for the application home page.
 */

@Controller
@RequestMapping("/managerpos/")
@AllArgsConstructor // 생성자함수
public class ManagerposController {
	// ManagerController managerController;

	private ManagerPosServiceImpl managerposService;// 매니저포스화면(포스화면관리)
	private ManagementServiceImpl managementService;// 매니저(직원관리)

	/* =new ManagerPosServiceImpl(); */
	/**
	 * Simply selects the home view to render by returning its name.
	 */

	@RequestMapping(value = { "/managerpos", "/Managerpos" }, method = RequestMethod.GET)
	public String younghakpos(Locale locale, Model model) {

		return "/younghak/Managerpos";
	}

	@RequestMapping(value = { "/Manager_management" }, method = RequestMethod.GET)
	public String managermanagerment(Locale locale, Model model) {
		model.addAttribute("managerList", managementService.managerList()); // 재고테이블
		return "younghak/Manager_management";
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
		// roomuse_id, roomuse_num,roomuse_status
		String roomuse_id = jsonArray.fromObject(map.get("list")).get(0).toString();
		String roomuse_num = jsonArray.fromObject(map.get("list")).get(1).toString();
		String roomuse_status = jsonArray.fromObject(map.get("list")).get(2).toString();

		try {

			System.out.println("room_id = " + roomuse_id);
			System.out.println("room_num = " + roomuse_num);
			System.out.println("room_status = " + roomuse_status);

			if (roomuse_status.equals("on")) {
				managerposService.start_room(roomuse_id, roomuse_num, roomuse_status);
			} else if (roomuse_status.equals("off")) {
				managerposService.stop_room(roomuse_num);
			}

			System.out.println("데이터가 들어옴!");

		} catch (Exception ex) {
			ex.printStackTrace();
		}

	}

	@ResponseBody
	@RequestMapping(value = "get_room_uselist", method = { RequestMethod.GET, RequestMethod.POST })
	public List<Object> get_room_uselist() {
		List<RoomuseVO> list = managerposService.roomuselist();

		JSONArray replydataArray = new JSONArray();// json으로 보내기 위한 작업

		for (int i = 0; i < list.size(); i++) {

			JSONObject replydata = new JSONObject(); // json으로 보내기위한작업

			String starttime = list.get(i).getStarttime();

			SimpleDateFormat format = new SimpleDateFormat("HH:mm:ss");
			String currenttime = format.format(System.currentTimeMillis());

			String starttimearr[] = starttime.split(":");
			String curtimearr[] = currenttime.split(":");
			int usetimearr[] = new int[3];

			int time = 0;
			for (int j = 0; j < curtimearr.length; j++) {
				usetimearr[j] = (Integer.parseInt(curtimearr[j])) - (Integer.parseInt(starttimearr[j]));
			}
			System.out.println("usetimearr[0] = " + usetimearr[0]);
			System.out.println("roomuse_num = " + list.get(i).getRoomuse_num());
			if (usetimearr[0] < 0) {
				usetimearr[0] += 24;
			}

			time += usetimearr[0] * 3600;// 시
			time += usetimearr[1] * 60;// 분
			time += usetimearr[2];// 초
			list.get(i).setStarttime(String.valueOf(time));

			replydata.put("roomuse_id", list.get(i).getRoomuse_id());
			replydata.put("roomuse_num", list.get(i).getRoomuse_num());
			replydata.put("starttime", list.get(i).getStarttime());
			replydata.put("roomuse_status", list.get(i).getRoomuse_status());

			replydataArray.add(replydata);

		}
		return replydataArray;

	}
}
