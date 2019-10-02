package com.comic.service;

import com.comic.model.LoginVO;
import com.comic.model.MemberVO;

public interface LoginService {

	MemberVO memberlogin(LoginVO loginVO) throws Exception;
}
