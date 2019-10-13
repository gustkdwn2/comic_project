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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.comic.model.ProductVO;
import com.comic.model.RoomuseVO;
import com.comic.model.WorkrecordVO;
import com.comic.service.impl.ManagementServiceImpl;
import com.comic.service.impl.ManagerPosServiceImpl;
import com.comic.service.impl.MngCalendarServiceImpl;

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
	private MngCalendarServiceImpl mngCalendarService;// 캘린더(직원관리)

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
		//List<RoomuseVO> list = managerposService.roomuselist2();

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
				usetimearr[0] += 24;//시작시간보다 끝난시간이 적으면 24시간 추가해서  계산
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
	@PostMapping("EmployeeDelete")
	public String employeeDelete(Model model, @RequestParam("EMPLOYEE_PWD") String emppwd,
			@RequestParam("EMPLOYEE_mngnum") String mngnum) {
		
		//List<ProductVO> current = settleService.settlementList(); // 현재 재고 가져옴
		
		System.out.println("emppwd = "+emppwd+"\nmngnum = "+mngnum);
		managementService.deletemng(emppwd,mngnum);
				
		model.addAttribute("managerList", managementService.managerList()); // 재고테이블
		return "/younghak/Manager_management";
	}
	
	@PostMapping("workonoff")
	public String workonoff(Model model, @RequestParam("employeenum") String empnum,
			@RequestParam("employeepwd") String emppwd) {
		
		System.out.println("empnum = "+empnum);
		
		//List<ProductVO> current = settleService.settlementList(); // 현재 재고 가져옴
		int logincount = managementService.managerlogin(empnum,emppwd);

		if(logincount==0) {//1이 아니면 에러
			model.addAttribute("errormsg", "아이디와 비밀번호가 일치하지 않습니다."); // 재고테이블
			//System.out.println("tmp로 보내기전");
			return "/younghak/login";
		}
		
		SimpleDateFormat format = new SimpleDateFormat ("yyMMdd");
		String format_time = format.format (System.currentTimeMillis()); 
		//만약 19년4월 11일이면 190411로 출력이된다.
		
		int recordcount =managementService.managerloginrecord(empnum,emppwd,format_time);
		if(recordcount==0) {
			managementService.managerattendance(empnum); //출근
			System.out.println("출근 완료");
			model.addAttribute("succecssmsg", "출근완료"); // 재고테이블
			return "/younghak/login";
		}else if(recordcount==1){
			managementService.managerleavework(empnum,format_time); //퇴근
			System.out.println("퇴근 완료");
			model.addAttribute("succecssmsg", "퇴근완료"); // 재고테이블
			return "/younghak/login";
		}
		
			
		//System.out.println("emppwd = "+emppwd+"\nmngnum = "+mngnum);
		//managementService.deletemng(emppwd,mngnum);
				
		//model.addAttribute("managerList", "이거 아님"); // 재고테이블
		
		return "/younghak/login";
	}
	
	@RequestMapping(value = "workhourcalendar", method = { RequestMethod.GET, RequestMethod.POST })
	public String workhourcalendar(@RequestParam("empname") String empname,
			@RequestParam("empnum") String empnum,Model model) {
		
		System.out.println("empname = "+empname+"\nempnum"+empnum);
		
		model.addAttribute("empname",empname);
		model.addAttribute("empnum",empnum);//empnum으로 계속하려다 그냥 empname
		
		return "/younghak/WorkhourCalendar";

	}
	
	@ResponseBody
	@RequestMapping(value = "getempworkrecord", method = { RequestMethod.GET, RequestMethod.POST })
	public List<Object> getempworkrecord(@RequestBody HashMap<String, Object> map,Model model// 배열 받기 traditional: true
	) {
		
		System.out.println("getempworkrecord오긴옴");
		JSONArray jsonArray = new JSONArray(); //object 타입
		// roomuse_id, roomuse_num,roomuse_status
		String startday = jsonArray.fromObject(map.get("list")).get(0).toString();
		//jsp ajax에서 통신에서 받아온 값
		String endday= jsonArray.fromObject(map.get("list")).get(1).toString();
		String empnum= jsonArray.fromObject(map.get("list")).get(2).toString();
		
		System.out.println("startday = "+startday+"\nendday = "+endday+"\nempnum = "+empnum);
		List<WorkrecordVO> list = mngCalendarService.workrecordmonth(startday,endday,empnum); //해당달의 출근기록을 list로 가져옴
		//model.addAttribute("list",list);
		
		JSONArray replydataArray = new JSONArray();// json으로 보내기 위한 작업
		for (int i = 0; i < list.size(); i++) {
			
			JSONObject workinghour = new JSONObject(); // json으로 보내기위한작업
			
			workinghour.put("starttime", list.get(i).getStarttime());
			workinghour.put("endtime", list.get(i).getEndtime());
			workinghour.put("workingday", list.get(i).getWorkday());
			
			
//			JSONObject workingdata = new JSONObject(); // json으로 보내기위한작업
//			
//			workingdata.put(list.get(i).getWorkday(), workinghour);
						
			replydataArray.add(workinghour);
			
			/*
			 * System.out.println(i+"번째 데이터");
			 * System.out.println(list.get(i).getStarttime());
			 * System.out.println(list.get(i).getEndtime());
			 * System.out.println(list.get(i).getWorkday()+"\n");
			 */
		}
		System.out.println(replydataArray);
		
		
	return replydataArray;
	}
}
