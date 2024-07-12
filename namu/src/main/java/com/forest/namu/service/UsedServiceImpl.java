package com.forest.namu.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.forest.namu.domain.Used;

@Controller
@RequestMapping("/used/*")
public class UsedServiceImpl implements UsedService {

	@GetMapping("list")
	public String list() {
		return ".used.list";
	}
	
	@GetMapping("write")
	public String write() {
		return ".used.write";
	}
	
	@GetMapping("article")
	public String article() {
		return ".used.article";
	}

	@Override
	public void insertUsed(Used dto, String pathname) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateUsed(Used dto, String pathname) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteUsed(long num, String pathname, String userId, int membership) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Used> listUsed(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void updateHitCount(long num) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Used findById(long num) {
		// TODO Auto-generated method stub
		return null;
	}
}
