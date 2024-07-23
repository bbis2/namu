package com.forest.namu;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.forest.namu.domain.Used;
import com.forest.namu.service.UsedService;

@Controller
public class HomeController {
	
	@Autowired
	private UsedService service;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String home(Locale locale, Model model) {
    	
		Map<String, Object> map = new HashMap<String, Object>();
    	map.put("cnum", 0);
    	map.put("town", 0);
    	map.put("offset", 0);
    	map.put("size", 4);
    	List<Used> list = service.listUsed(map);
    	
    	
		model.addAttribute("list", list);
    	
    	
        return ".home";
    }
}