package com.comic.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import com.comic.model.EmployeeVO;
import com.comic.model.LoginVO;
import com.comic.model.MemberVO;
import com.comic.service.MemberService;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/member")
@AllArgsConstructor
public class LoginController {
	
	private MemberService service;
	private BCryptPasswordEncoder passEncoder;
	
	//멤버 회원가입 페이지 이동
	@GetMapping("/MemberRegister")
	public void MemberRegister() {
		
	}
	
	//멤버 회원가입
	@PostMapping("/MemberRegister")
	public String MemberRegister(MemberVO vo, RedirectAttributes redirectAttributes) throws Exception {
		service.memberRegister(vo);
		redirectAttributes.addFlashAttribute("msg", "REGISTERED");
		return "redirect:/member/MemberLogin";
	}
	
	// 멤버 로그인 페이지
	@GetMapping("/MemberLogin")
	public String MemberloginGET(@ModelAttribute("loginVO") LoginVO loginVO) {
		return "/member/MemberLogin";
	}
	
	// 멤버 로그인
	@PostMapping("/MemberLoginPost")
	public void MemberLoginPOST(LoginVO loginVO, HttpSession httpSession, Model model) throws Exception {
		MemberVO memberVO = service.memberLogin(loginVO);
		model.addAttribute("roomNum", httpSession.getAttribute("roomNum"));
		
		if (memberVO == null) {
			return;
		} else {
			boolean passMatch = passEncoder.matches(loginVO.getMEMBER_PWD(), memberVO.getMEMBER_PWD());
			
			if (!passMatch) {
				return;
			} else {
				model.addAttribute("member", memberVO);
				model.addAttribute("memberid", memberVO.getMEMBER_ID());
			}
		}
		service.roomuse(memberVO.getMEMBER_ID(),Integer.parseInt((String) httpSession.getAttribute("roomNum")));
	}
	
	// 멤버 로그아웃 처리
	@GetMapping("/MemberLogout")
	public String Memberlogout(HttpServletRequest request,
			HttpServletResponse response,
			HttpSession httpSession) throws Exception {
		System.out.println("로그아웃을 타나 ????");
		Object object = httpSession.getAttribute("Memberlogin");
		if (object != null) {
			httpSession.removeAttribute("Memberlogin");
			httpSession.removeAttribute("memberid");
		}
		return "/member/Logout";
	}
	
	// 멤버 관리 페이지 멤버 정보 뿌리기
	@GetMapping("/MemberData")
	public ResponseEntity<List<MemberVO>> memberData() {
		return new ResponseEntity<List<MemberVO>>(service.MemberGetList(), HttpStatus.OK);
	}
	
	// 멤버 관리 페이지
	@GetMapping("/MemberList")
	public void memberGetList() {
		
	}
	
	// 멤버 모달창 띄우기
	@GetMapping("/MemberModify")
	public @ResponseBody Map<String, MemberVO> MemberGetModify(@RequestParam("MEMBER_ID") String MEMBER_ID) {
		Map<String, MemberVO> map = new HashMap<String, MemberVO>();
		map.put("getModify", service.MemberModifyGet(MEMBER_ID));
		return map;
	}
	
	//관리자 멤버 정보 수정
	@PostMapping("/MemberModify")
	public String MemberModify(MemberVO vo) {
		service.MemberModify(vo);
		return "redirect:/member/MemberList";
	}
	
	@PostMapping("/MemberModify2")
	public String MemberModify2(MemberVO vo) throws Exception {
		service.MemberModify2(vo);
		return "redirect:/userView/main";
	}
	
	//멤버 정보 삭제
	@PostMapping("/MemberRemove")
	public String MemberRemove(@RequestParam("removeBtn") String MEMBER_ID) {
		service.MemberRemove(MEMBER_ID);
		return "redirect:/member/MemberList";
	}
	
	// 멤버 비밀번호 찾기 (임시 비밀번호 발급)
	@PostMapping("/MemberPasswordModify")
	@ResponseBody
	public String MemberPasswordModify(MemberVO vo, RedirectAttributes redirectAttributes) throws Exception {
		return service.MemberPasswordModify(vo);
	}
	// 멤버 회원가입 아이디 중복 체크
	@GetMapping("/MemberCheck")
	@ResponseBody
    public int idCheck(MemberVO vo,ModelAndView mav) {
        int result=0;
        MemberVO member=service.getMember(vo);
        if(member!=null) result=1;
        else System.out.println("아이디사용가능");
        return result;
    }
	// 멤버 헤더 회원수정 비밀번호 체크
	@GetMapping("/MembermodifyCheck")
	@ResponseBody
	public int Membermodifypasswordcheck(@RequestParam("MEMBER_ID") String MEMBER_ID, @RequestParam("MEMBER_PWD") String MEMBER_PWD) {
		int result = 0;
		if(passEncoder.matches(MEMBER_PWD,service.membermodifypasswordcheck(MEMBER_ID))) {
			result = 1;
		}
		return result;
	}

//	//직원 추가 페이지 이동
//	@GetMapping("/EmployeeRegister")
//	public void EmployeeRegister() {
//		
//	}
//	
//	//직원 추가
//	@PostMapping("/EmployeeRegister")
//	public String EmployeeRegister(EmployeeVO vo) {
//		service.employeeRegister(vo);
//		return "redirect:/member/EmployeeLogin";
//	}
//	
//	
//	// 직원 로그인 페이지
//	@GetMapping("/EmployeeLogin")
//	public String EmployeeloginGET(@ModelAttribute("loginVO") LoginVO loginVO) {
//		return "/member/EmployeeLogin";
//	}
//		
//	// 직원 로그인 
//	@PostMapping("/EmployeeLoginPost")
//	public void EmployeeLoginPOST(LoginVO loginVO, HttpSession httpSession, Model model) throws Exception {
//			
//		EmployeeVO employeeVO = service.employeeLogin(loginVO);
//		boolean passMatch = passEncoder.matches(loginVO.getEMPLOYEE_PWD(), employeeVO.getEMPLOYEE_PWD());
//			
//		if(employeeVO == null || !passMatch) {
//			return;
//		}
//			
//		model.addAttribute("employee", employeeVO);
//			
//		if(loginVO.isUseCookie()) {
//			int amount = 60 * 60 * 24 * 7;
//			Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount));
//			service.EmployeekeepLogin(employeeVO.getEMPLOYEE_NUM(), httpSession.getId(), sessionLimit);
//		}
//	}
//		
//	// 직원 로그아웃 처리
//	@GetMapping("/EmployeeLogout")
//	public String Employeelogout(HttpServletRequest request,
//						 HttpServletResponse response,
//						 HttpSession httpSession) throws Exception {
//			
//		Object object = httpSession.getAttribute("Employeelogin");
//		if (object != null) {
//			EmployeeVO employeeVO = (EmployeeVO) object;
//			httpSession.removeAttribute("Employeelogin");
//			httpSession.invalidate();
//			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
//			if (loginCookie != null) {
//				loginCookie.setPath("/");
//	            loginCookie.setMaxAge(0);
//	            response.addCookie(loginCookie);
//	            service.EmployeekeepLogin(employeeVO.getEMPLOYEE_NUM(), "none", new Date());
//			}
//		}
//		return "/member/Logout";
//	}
}
