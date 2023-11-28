package com.ais.sajangnimniceshot.services;

import java.net.URLEncoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.servlet.ModelAndView;

import com.ais.sajangnimniceshot.beans.MemberBean;
import com.ais.sajangnimniceshot.mappers.KDBMapper;
import com.google.gson.Gson;

@Service
public class Authentication implements ServiceRule {

	@Autowired
	private KDBMapper kdbMapper;
	@Autowired
	private Gson gson;

	public void backController(String serviceCode, ModelAndView mav) { // 동기식
		// 로그인 불필요
		switch (serviceCode) {
		case "login":
			this.login(mav);
			return;
		case "changeHeader":
			this.changeHeader(mav);
			return;
		default:
			break;
		}
		switch (serviceCode) {
		}
	}

	public void backController(String serviceCode, Model model) {

	}

	private void login(ModelAndView mav) {
		if (this.getAccessInfo() != null)
			return;
		MemberBean memberBean = (MemberBean) mav.getModel().get("memberBean");
		if (this.kdbMapper.authenticateMember(memberBean)) { // boolean 동일한 닉네임 찾기
			memberBean = this.kdbMapper.getMemberInfo(memberBean.getMemNickname());
			// 프론트에서 입력받은 닉네임으로 해당 멤버 정보 불러와서 담기
			RequestContextHolder.getRequestAttributes().setAttribute("accessInfo", memberBean,
					RequestAttributes.SCOPE_SESSION);
		} else {
			mav.addObject("message", "로그인 실패");
		}
	}

	public MemberBean getAccessInfo() {
		return (MemberBean) RequestContextHolder.getRequestAttributes().getAttribute("accessInfo",
				RequestAttributes.SCOPE_SESSION);
	}

	private void changeHeader(ModelAndView mav) { //
		if (this.getAccessInfo() != null)
			mav.addObject("headerHTML", this.makeHeaderHTML(this.getAccessInfo()));
	}

	private String makeHeaderHTML(MemberBean accessInfo) { // 로그인 성공 시 헤더 생성
		StringBuilder sb = new StringBuilder();

		sb.append("<img id=\"logo\" onclick=\"location.href='/'\" src=\"/img/SNP_LOGO4.png\" />\n");
		sb.append("<div>\n");
		sb.append("<div class=\"login_wrap\">\n");
		sb.append("    <p>환영합니다 " + accessInfo.getMemNickname() + "님！</p>\n");
		sb.append("    <button class=\"login-button\" onclick=\"location.href='/logout'\">로그아웃</button>\n");
		sb.append("</div>\n");
		return sb.toString();
	}

	private String encode(String s) {
		try {
			s = URLEncoder.encode(s, "UTF-8");
		} catch (Exception e) {
		} finally {
			return s;
		}
	}

}
