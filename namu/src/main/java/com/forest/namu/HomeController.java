package com.forest.namu;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.forest.namu.domain.Borrow;
import com.forest.namu.domain.TalentMarket;
import com.forest.namu.domain.Used;
import com.forest.namu.service.BorrowService;
import com.forest.namu.service.TalentMarketService;
import com.forest.namu.service.UsedService;

@Controller
public class HomeController {
	
	@Autowired
	private UsedService service;
	
	@Autowired
	private BorrowService service2;
	
	@Autowired
	private TalentMarketService service3;
	

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String home(Locale locale, Model model, HttpSession session) {
    	
    	// 중고거래
		Map<String, Object> map = new HashMap<String, Object>();
    	map.put("cnum", 0);
    	map.put("town", 0);
    	map.put("offset", 0);
    	map.put("size", 4);
    	List<Used> list = service.listUsed(map);
    	
    	
    	// 빌려줘요
    	Map<String, Object> map2 = new HashMap<String, Object>();
    	map2.put("categoryNum", 0);
    	map2.put("location", "서울 마포구"); // 로그인 전 - 전체, 로그인 - town1 로 불러오기 () 
    	map2.put("offset", 0);
    	map2.put("size", 4);
    	List<Borrow> list2 = service2.listBorrow(map2);
    	
    	
    	// 재능마켓
    	Map<String, Object> map3 = new HashMap<String, Object>();
    	map3.put("categoryNum", 0);
    	map3.put("town", 0);
    	map3.put("talentShow", 0);
    	map3.put("offset", 0);
    	map3.put("size", 4);
    	List<TalentMarket> list3 = service3.listTalentMarket(map3);
    	
    	
		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		model.addAttribute("list3", list3);
		
        return ".home";
    }
}