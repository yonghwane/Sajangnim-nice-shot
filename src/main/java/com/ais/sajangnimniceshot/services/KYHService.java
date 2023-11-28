package com.ais.sajangnimniceshot.services;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.ais.sajangnimniceshot.beans.MemberBean;
import com.ais.sajangnimniceshot.mappers.KDBMapper;
import com.ais.sajangnimniceshot.mappers.KYHMapper;
import com.google.gson.Gson;

@Service
public class KYHService implements ServiceRule {

	@Autowired
	private KYHMapper kyhmapper;
	@Autowired
	private KDBMapper kdbmapper;
	@Autowired
	private Authentication auth;
	@Autowired
	private Gson gson;

	public void backController(String serviceCode, ModelAndView mav) { // 동기식
		// 로그인 불필요
		switch (serviceCode) {
		case "WebCrawlerApplication":
			this.WebCrawlerApplication(mav);
			return;
		default:
			break;
		}
		// 로그인 필요
		MemberBean accessInfo = this.auth.getAccessInfo();
		if (accessInfo == null) {
			mav.setViewName("redirect:/");
			mav.addObject("message", "먼저 로그인해주세요");
			return;
		}
		switch (serviceCode) {
//		case "moveMyPageTransfer":
//			this.moveMyPageTransfer(mav);
//			break;
		case "transferReservation":
			this.transferReservation(mav);
			break;
		}
	}

	public void backController(String serviceCode, Model model) { // 비동기식
		// 로그인 불필요
		switch (serviceCode) {
		default:
			break;
		}
		MemberBean accessInfo = this.auth.getAccessInfo();
		if (accessInfo == null) {
			model.addAttribute("message", this.encode("먼저 로그인해주세요"));
			return;
		}
		// 로그인 필요
		switch (serviceCode) {
		case "":
			break;
		}
	}

//	private void moveMyPageTransfer(ModelAndView mav) {
//		MemberBean accessInfo = this.auth.getAccessInfo();
//		String rsvCode = (String) mav.getModel().get("rsvCode");
//		mav.addObject("");
//	}
	private void transferReservation(ModelAndView mav) {
		MemberBean accessInfo = this.auth.getAccessInfo();
		String memNickName = (String) mav.getModel().get("memNickName");
		String rsvCode = (String) mav.getModel().get("rsvCode");
		if (!kyhmapper.checkNickname(memNickName)) {
			mav.addObject("message", "존재하지 않는 회원입니다.");
			mav.setViewName("myPageTransfer");
			return;
		}
//	if(memNickName == null) {
//		mav.setViewName("redirect:/");
//		mav.addObject("message", "값이 비어있습니다.");
//		return;
//	} 
		if (memNickName.equals(accessInfo.getMemNickname())) {
			mav.setViewName("myPageTransfer");
			mav.addObject("message", "동일한 회원에게는 양도를 할 수 없습니다.");
			return;
		}
		this.kyhmapper.transferReservation(rsvCode, memNickName);
		mav.addObject("getRsvList", this.gson.toJson(this.kdbmapper.getRsvList(accessInfo.getMemNickname())));
		mav.addObject("message", "양도가 완료되었습니다.");
	}

//    @Override
	private void WebCrawlerApplication(ModelAndView mav) {
		// 크롤링할 웹 사이트 주소
		String url = "http://www.jga.or.jp/jga/jsp/index.html";

		try {
			Document document = Jsoup.connect(url).get();
			
			Elements articles = document.select("article.news");
			List<String> newsTitles = new ArrayList<>();
			List<String> newsDates = new ArrayList<>();
			List<String> newsTypes = new ArrayList<>();
			List<String> hrefValues = new ArrayList<>();
			for (Element article : articles) {
				String hrefValue = article.select("a").attr("href");
				String newsTitle = article.select("a.toplink").text();
				String newsType = article.select("div.type-date span.type").text();
				String newsDate = article.select("div.type-date span.date").text();
				newsTitles.add(newsTitle);
				newsDates.add(newsDate);
				newsTypes.add(newsType);
				hrefValues.add(hrefValue);
			}
			mav.addObject("newsTitles", this.gson.toJson(newsTitles));
			mav.addObject("newsDates", this.gson.toJson(newsDates));
			mav.addObject("newsTypes", this.gson.toJson(newsTypes));
			mav.addObject("hrefValues", this.gson.toJson(hrefValues));
		} catch (IOException e) {
			e.printStackTrace();
		}
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
