package com.forest.namu.controller;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.forest.namu.common.FileManager;
import com.forest.namu.common.MyUtil;
import com.forest.namu.domain.Borrow;
import com.forest.namu.domain.Member;
import com.forest.namu.domain.SessionInfo;
import com.forest.namu.service.BorrowService;

@Controller
@RequestMapping("/borrow/*")
public class BorrowController {
	
	@Autowired
	private BorrowService service;
	
	@Autowired
	private MyUtil myUtil;
	
	private static final Logger logger = LoggerFactory.getLogger(BorrowController.class);

	
	@RequestMapping(value = "list")
	public String list(
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "0") String categoryNum,
			@RequestParam(defaultValue = "") String kwd,
			@RequestParam(defaultValue = "1") String townNum,
			@RequestParam(defaultValue = "0") String sortNum,
			HttpServletRequest req,
			HttpSession session,
			Model model) throws Exception {

		String cp = req.getContextPath();
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		int size = 10;
		int total_page;
		int dataCount;
		String location;
		
		if (req.getMethod().equalsIgnoreCase("GET")) {
			kwd = URLDecoder.decode(kwd, "utf-8");
		}

		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("userId", info.getUserId());
		map.put("categoryNum", categoryNum);
		map.put("kwd", kwd);
		
		location = townNum.equals("1") ? info.getTown1() : info.getTown2();
		
		map.put("location", location);
		
		dataCount = service.dataCount(map);
		total_page = myUtil.pageCount(dataCount, size);
		
		if (total_page < current_page) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		map.put("sortNum", sortNum);
		
		List<Borrow> list = service.listBorrow(map);
		
		List<Borrow> category = service.listCategory();
		// 카테고리 표시
		String categoryName = "전체";
		for(Borrow categoryList : category) {
			if(categoryList.getCategoryNum() == Integer.parseInt(categoryNum)) {
				categoryName = categoryList.getCategory();
			}
		}
		
		// 시간 표시
		for(Borrow dto : list) {
			dto.setPassedTime(myUtil.returnPassedTime(dto.getRegDate())); 
		}
		
		String query = "";
		String listUrl = cp + "/borrow/list?townNum=" + townNum + "&sortNum=" + sortNum;
		String articleUrl = cp + "/borrow/article?townNum=" + townNum + "&categoryNum=" + categoryNum + "&page=" + current_page + "&sortNum=" + sortNum;
		if (kwd.length() != 0) {
			query = "&kwd=" + URLEncoder.encode(kwd, "utf-8");
		}
		if (query.length() != 0) {
			listUrl = cp + "/borrow/list?townNum=" + townNum + query + "&sortNum=" + sortNum;
			articleUrl = cp + "/borrow/article?townNum=" + townNum + "&categoryNum=" + categoryNum + "&page=" + current_page + query + "&sortNum=" + sortNum;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("paging", paging);
		model.addAttribute("sortNum", sortNum);

		model.addAttribute("townNum", townNum);
		model.addAttribute("location", location);
		model.addAttribute("categoryNum", categoryNum);
		model.addAttribute("kwd", kwd);
		
		model.addAttribute("category", category);
		model.addAttribute("categoryName", categoryName);
		
		return ".borrow.list";
	}
	
	@GetMapping("article")
	public String article(
			@RequestParam long num,
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "0") String categoryNum,
			@RequestParam(defaultValue = "") String kwd,
			@RequestParam(defaultValue = "1") String townNum,
			HttpSession session,
			Model model
			) throws Exception {
		
		try {
			
			service.updateHitCount(num);
			
			Borrow dto = service.findById(num);
			categoryNum = dto.getCategoryNum() + "";
			
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("userId", info.getUserId());
			map.put("num", num);
			dto.setUserLiked(service.userBorrowLiked(map)); 
			
			kwd = URLDecoder.decode(kwd, "utf-8");
			
			String query = "townNum=" + townNum + "&page=" + page + "&categoryNum=" + categoryNum;
			if (kwd.length() != 0) {
				query += "&kwd=" + URLEncoder.encode(kwd, "UTF-8");
			}
			
			// 게시글 등록한지 얼마나 지났는지 계산해서 set
			dto.setPassedTime(myUtil.returnPassedTime(dto.getRegDate()));
			
			// 대여희망시간 날짜형식 변환해서 set
			dto.setStrDate(myUtil.convertDateFormat(dto.getStrDate()));
			dto.setEndDate(myUtil.convertDateFormat(dto.getEndDate()));
			
			dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
			
			// 글쓴이 정보 가져오기
			Member writer = service.borrowWriter(num);
			writer.setRegDate(myUtil.convertDateFormat(writer.getRegDate()).substring(0, 9));
			
	        // 글쓴이의 다른 글 목록 가져오기
	        List<Map<String, Object>> writerOtherPosts = service.getWriterOtherPosts(writer.getUserId(), num);
	        logger.info("Writer's other posts: " + writerOtherPosts);
	        
	        
	        for(Map<String, Object> map2 : writerOtherPosts) {
	        	String boardName = switch ((String)map2.get("TABLENAME")) {
				case "borrow" 			-> "빌려줘요";
				case "rent" 			-> "빌려드림";
				case "delievery" 		-> "배달해요";
				case "daily" 			-> "나무일상";
				case "togetherlist" 	-> "나무모임";
				case "talent" 			-> "재능마켓";
				case "used" 			-> "중고";
				case "auction" 			-> "경매";
				default					-> "오류";
				};
				
				map2.put("boardName", boardName);
	        }
	        
	        model.addAttribute("writerOtherPosts", writerOtherPosts);
			
			// 이미지 파일
			List<Borrow> listImage = service.listBorrowImage(num);
			// 카테고리
			List<Borrow> category = service.listCategory();
			
		    // 동일한 동네, 동일한 카테고리의 다른 글 가져오기
		    map.put("location", dto.getLocation());
		    map.put("categoryNum", dto.getCategoryNum());
		    map.put("borrowNum", num); // 현재 글 제외
		    List<Borrow> otherPosts = service.listOtherPosts(map);
		    
		    int totalPages = Math.max(1, (otherPosts.size() + 4) / 5); // 최소 1페이지
	
		    model.addAttribute("otherPosts", otherPosts);
		    model.addAttribute("totalPages", totalPages);
	
			model.addAttribute("dto", dto);
			model.addAttribute("writer", writer);
			model.addAttribute("listImage", listImage);
			model.addAttribute("category", category);
			model.addAttribute("categoryNum", categoryNum);
			model.addAttribute("kwd", kwd);
			model.addAttribute("townNum", townNum);
			
			model.addAttribute("page", page);
			model.addAttribute("query", query);
			
			return ".borrow.article";
		
	    } catch (Exception e) {
	        logger.error("Error in article method", e);
	        model.addAttribute("errorMessage", "페이지를 불러오는 중 오류가 발생했습니다.");
	        return "error/500"; // 에러 페이지
	    }
	}
	
	@GetMapping("write")
	public String writeForm(@RequestParam String townNum, Model model, Member member) throws Exception {
		
		List<Borrow> category = service.listCategory();
		
		model.addAttribute("category", category);
		model.addAttribute("member", member);
		model.addAttribute("townNum", townNum);
		model.addAttribute("mode", "write");
		
		return ".borrow.write";
	}
	
	@PostMapping("write")
	@ResponseBody
	public String writeSubmit(@ModelAttribute Borrow dto,
	                          @RequestParam(value = "newImages", required = false) List<MultipartFile> newImages,
	                          HttpSession session) throws Exception {
	    String root = session.getServletContext().getRealPath("/");
	    String path = root + "uploads" + File.separator + "album";
	    
	    SessionInfo info = (SessionInfo)session.getAttribute("member");
	    
	    try {
	        dto.setUserId(info.getUserId());
	        dto.setImage(newImages);  // 새로운 이미지 설정
	        service.insertBorrow(dto, path);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return "redirect:/borrow/list";
	}
	
	@GetMapping("update")
	public String updateForm(
			@RequestParam long num,
			@RequestParam String page,
			@RequestParam(defaultValue = "0") String categoryNum,
			@RequestParam(defaultValue = "") String kwd,
			@RequestParam String townNum,
			Model model
			) throws Exception {
		
		Borrow dto = service.findById(num);
		
		// 카테고리
		List<Borrow> category = service.listCategory();
		// 이미지 파일
		List<Borrow> listImage = service.listBorrowImage(num);
		
		model.addAttribute("dto", dto);
		model.addAttribute("mode", "update");
		model.addAttribute("page", page);
		model.addAttribute("categoryNum", categoryNum);
		model.addAttribute("kwd", kwd);
		model.addAttribute("townNum", townNum);
		model.addAttribute("category", category);
		model.addAttribute("listImage", listImage);
		
		return ".borrow.write";
	}
	
	@PostMapping("update")
	@ResponseBody
	public String updateSubmit(
	        @ModelAttribute Borrow dto,
	        @RequestParam(value = "remainingImageNums", required = false) List<Long> remainingImageNums,
	        @RequestParam(value = "newImages", required = false) List<MultipartFile> newImages,
	        @RequestParam String page,
	        @RequestParam(defaultValue = "0") String categoryNum,
	        @RequestParam(defaultValue = "") String kwd,
	        @RequestParam String townNum,
	        HttpSession session
	) throws Exception {
	    String root = session.getServletContext().getRealPath("/");
	    String pathname = root + "uploads" + File.separator + "album";
	    
	    SessionInfo info = (SessionInfo)session.getAttribute("member");
	    
	    try {
	        dto.setUserId(info.getUserId());
	        dto.setImage(newImages);  // 새로운 이미지 설정
	        service.updateBorrow(dto, pathname, remainingImageNums);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
	    return "redirect:/borrow/article?townNum=" + townNum + "&page=" + page + "&categoryNum=" + categoryNum + "&kwd=" + kwd + "&num=" + dto.getBorrowNum();
	}
    
    @GetMapping("delete")
    public String delete(
    		@RequestParam long num,
            @RequestParam String page,
            @RequestParam(defaultValue = "0") String categoryNum,
            @RequestParam(defaultValue = "") String kwd,
            @RequestParam String townNum,
            HttpSession session
    		) throws Exception {
    	
		kwd = URLDecoder.decode(kwd, "utf-8");
		
		String query = "townNum=" + townNum + "&page=" + page + "&categoryNum=" + categoryNum;
		if (kwd.length() != 0) {
			query += "&kwd=" + URLEncoder.encode(kwd, "UTF-8");
		}
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "album";
		
		try {
			service.deleteBorrow(num, pathname);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
    	return "redirect:/borrow/list?" + query;
    }
	
	@PostMapping("insertLike")
	@ResponseBody
	public Map<String, Object> insertLike(
			@RequestParam long num,
			@RequestParam boolean userLiked,
			HttpSession session
			) {
		
		String state = "true";
		int borrowLikeCount = 0;
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("num", num);
		paramMap.put("userId", info.getUserId());
		
		try {
			if(userLiked) {
				service.insertBorrowLike(paramMap);
			} else {
				service.deleteBorrowLike(paramMap);
			}
		} catch (DuplicateKeyException e) {
			state = "liked";
		} catch (Exception e) {
			state = "false";
		}
		
		borrowLikeCount = service.borrowLikeCount(num);
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		model.put("borrowLikeCount", borrowLikeCount);
		
		return model;
	}
	
}




















