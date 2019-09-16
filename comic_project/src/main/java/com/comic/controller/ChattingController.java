/*
 * package com.comic.controller;
 * 
 * import java.util.Date;
 * 
 * import javax.servlet.http.HttpServletRequest;
 * 
 * import org.springframework.stereotype.Controller; import
 * org.springframework.ui.Model; import
 * org.springframework.web.bind.annotation.RequestMapping; import
 * org.springframework.web.bind.annotation.RequestMethod; import
 * org.springframework.web.servlet.mvc.support.RedirectAttributes;
 * 
 * import lombok.AllArgsConstructor; import lombok.extern.log4j.Log4j;
 * 
 * @Controller
 * 
 * @RequestMapping("/comic/chatting/*")
 * 
 * @Log4j
 * 
 * @AllArgsConstructor public class ChattingController {
 * 
 * private ChattingService chattingService;
 * 
 * @RequestMapping(value = "chat.co", method = {RequestMethod.GET,
 * RequestMethod.POST}) public String chat(RedirectAttributes rttr,
 * HttpServletRequest requset) throws Exception {
 * log.info("chat.co RUN! / Run Time : " + new Date()); MemberVO login =
 * (MemberVO)requset.getSession().getAttribute("login"); if(login == null) {
 * return "redirect:/login.co"; }
 * 
 * ChatMemberVO chatM = chattingService.addRoomMember }
 * 
 * }
 */