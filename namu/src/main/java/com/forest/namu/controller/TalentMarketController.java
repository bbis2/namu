package com.forest.namu.controller;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.forest.namu.common.MyUtil;
import com.forest.namu.domain.Member;
import com.forest.namu.domain.Profile;
import com.forest.namu.domain.SessionInfo;
import com.forest.namu.domain.Summary;
import com.forest.namu.domain.TalentMarket;
import com.forest.namu.domain.TmOrder;
import com.forest.namu.service.MypageService;
import com.forest.namu.service.TalentMarketService;
import com.forest.namu.service.TmOrderService;
import com.forest.namu.service.TmReviewService;






@Controller
@RequestMapping("/talent/*")
public class TalentMarketController {
	@Autowired
	private TalentMarketService service;
	
	@Autowired
	private TmOrderService orderService;
	
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private MypageService mypageService;
	
	@Autowired
	private TmReviewService reviewService;
	
	
	@RequestMapping("list")
	public String list(Member member,TalentMarket dto, HttpSession session,
			@RequestParam(defaultValue = "0") long categoryNum,
			@RequestParam(defaultValue = "0") long typeNum,
			@RequestParam(defaultValue = "1") int talentShow,
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,		
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(value = "town", required = false) String town,
			HttpServletRequest req,
			Model model) throws Exception{
		
		String cp = req.getContextPath();
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		 if (info==null||town == null || town.isEmpty()) {
	            if (info != null) {
	                town = info.getTown1(); 
	            }
	        }
		
		int size = 40;
		int total_page=0;
		int dataCount=0;
		TalentMarket category=service.findByCategory(categoryNum);
		
		List<TalentMarket> listCategory = service.listCategory(); 
		
		if (req.getMethod().equalsIgnoreCase("GET")) {
			kwd = URLDecoder.decode(kwd, "UTF-8");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		if (info != null) {
			map.put("likeUserId", info.getUserId());
        }
		map.put("talentShow", talentShow);
		map.put("schType", schType);
		map.put("kwd", kwd);
		map.put("town", town);
		map.put("categoryNum", categoryNum);
		
		dataCount= service.dataCount(map);
		total_page = myUtil.pageCount(dataCount, size);
		if(current_page > total_page) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		
		List<TalentMarket> list = service.listTalentMarket(map);
		
		
		String listUrl = cp + "/talent/list";
		String articleUrl = cp + "/talent/article?page=" + current_page;
		
		String query ="";
		if (kwd.length() != 0) {
			query += "schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "UTF-8");
		}
		
		if(query.length()!=0) {
		listUrl += "?" + query;
		articleUrl += "&"+query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("listCategory", listCategory);
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("town", town);
		model.addAttribute("category",category);
		
		model.addAttribute("talentShow", talentShow);
		model.addAttribute("type", typeNum);
		model.addAttribute("categoryNum", categoryNum);
		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);

		model.addAttribute("articleUrl", articleUrl);
				model.addAttribute("page", current_page);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		return ".talentMarket.list";
	}
	
	@GetMapping("write")
	public String talentWrite(Member member,TalentMarket dto, HttpSession session, Model model) {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		member.setNickName(info.getNickName());
		
		model.addAttribute("member",member);
		
		List<TalentMarket> listCategory = service.listCategory();
		List<TalentMarket> listType = service.listType();
		
		model.addAttribute("mode", "write");
		model.addAttribute("listCategory",listCategory);
		model.addAttribute("listType",listType);
		
		return ".talentMarket.write";
	}
	
	@PostMapping("write")
	public String talentSubmit(TalentMarket dto,HttpSession session, Model model) {
		
		String root = session.getServletContext().getRealPath("/");
		String path = root + "uploads" + File.separator + "photo";
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		try {
			dto.setUserId(info.getUserId());
			service.insertTalent(dto, path);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String url = "redirect:/talent/list";
		
		return url;
	}
	
	@GetMapping("update")
	public String updateTalent(Member member, HttpSession session, Model model,
			@RequestParam String page,
			@RequestParam long tboardNum
			) {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		
		TalentMarket dto=service.findById(tboardNum);
		
		if(dto == null || !info.getUserId().equals(dto.getUserId())) {
			String query = "num=" + tboardNum + "&page=" + page;
			return "redirect:/talent/article/"+ query;
		}
		
		List<TalentMarket> listCategory = service.listCategory();
		List<TalentMarket> listType = service.listType();
		List<TalentMarket> listFile = service.listTalentMarketFile(tboardNum);
		
		List<TalentMarket> listOption = service.listTalentOption(tboardNum);
		
		List<TalentMarket> listOptionDetail = null;
		List<TalentMarket> listOptionDetail2 = null;
		if(listOption.size() > 0) {
			dto.setOptionNum(listOption.get(0).getOptionNum());
			dto.setOptionName(listOption.get(0).getOptionName());
			listOptionDetail = service.listOptionDetail(listOption.get(0).getOptionNum());
		}
		if(listOption.size() > 1) {
			dto.setOptionNum2(listOption.get(1).getOptionNum());
			dto.setOptionName2(listOption.get(1).getOptionName());
			listOptionDetail2 = service.listOptionDetail(listOption.get(1).getOptionNum());
		}
		model.addAttribute("dto", dto);
		model.addAttribute("mode", "update");
		
		model.addAttribute("listFile", listFile);
		model.addAttribute("listOptionDetail", listOptionDetail);
		model.addAttribute("listOptionDetail2", listOptionDetail2);
		model.addAttribute("listType",listType);
		model.addAttribute("listCategory", listCategory);
		
		model.addAttribute("page",page);
		
		return ".talentMarket.write";
	}
	
	@PostMapping("update")
	public String updateSubmit(TalentMarket dto, HttpSession session, Model model,
			@RequestParam String page) {
		
		String root = session.getServletContext().getRealPath("/");
		String path = root + "uploads" + File.separator + "photo";
		
		try {
			service.updateTalent(dto, path);
		} catch (Exception e) {
		}
		
		String query = "num=" + dto.getTboardNum() + "&page=" + page;
		
		return "redirect:/talent/article?" + query ;
	}
	
	
	
	@GetMapping("article")
	public String article(@RequestParam long num,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,
			HttpSession session,
			Model model)  throws Exception{
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		kwd = URLDecoder.decode(kwd, "utf-8");
		
		
		
		String query = "page=" + page;
		if(kwd.length() != 0) {
			query += "schType=" + schType + 
					"&kwd=" + URLEncoder.encode(kwd, "utf-8");
		}
		
		
		TalentMarket dto = service.findById(num);
		if(dto==null) {
			return "redirect:/talent/list?"+query;
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("tboardNum", num);
		if(info!=null) {
			map.put("likeUserId", info.getUserId());
			}
		
		dto.setUserLiked(service.userTalentLiked(map));
		
		Profile profile = mypageService.selectProfile(dto.getUserId());
		
		int reviewCount = 0;
		Summary summary = reviewService.findByReviewSummary(map);
		
		if(summary != null) {
			reviewCount = summary.getCount();
		}
		
		
		
		List<TmOrder> orderList =null;
		if(info!=null) {
		Map<String, Object> ordermap = new HashMap<String, Object>();
		ordermap.put("userId", info.getUserId());
		ordermap.put("tboardNum", num);
		
		orderList = orderService.listTmOrderByUserId(ordermap);
		}
		
		List<TalentMarket> listFile = service.listTalentMarketFile(num);
		dto.setFileName(dto.getThumbnail());
		listFile.add(0,dto);
		
		List<TalentMarket> listOption = service.listTalentOption(num);
		List<TalentMarket> listOptionDetail =null;
		if(listOption.size() > 0) {
			listOptionDetail = service.listOptionDetail(listOption.get(0).getOptionNum());
		}
		
		List<TalentMarket> listOptionDetail2 =null;
		if(listOption.size() > 1) {
			listOptionDetail2 = service.listOptionDetail(listOption.get(1).getOptionNum());
		}
		
		service.updateHitCount(num);
		
	
		model.addAttribute("profile",profile);
		model.addAttribute("dto",dto);
		model.addAttribute("reviewCount",reviewCount);
		model.addAttribute("page",page);
		model.addAttribute("listOption", listOption);
		model.addAttribute("listOptionDetail", listOptionDetail);
		model.addAttribute("listOptionDetail2", listOptionDetail2);
		model.addAttribute("query",query);
		model.addAttribute("listFile",listFile);
		model.addAttribute("orderList",orderList);
		
		
		return ".talentMarket.article";
	}
	
	
	
	@PostMapping("deleteFile")
	@ResponseBody
	public Map<String, Object> deleteFile(@RequestParam long fileNum, 
			@RequestParam String filename,
			HttpSession session) throws Exception {

		String state = "true";
		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + "uploads" + File.separator + "product" + File.separator + filename;

			service.deleteTalentFile(fileNum, pathname);
		} catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}
	
	@PostMapping("deleteOptionDetail")
	@ResponseBody
	public Map<String, Object> deleteOptionDetail(@RequestParam long detailNum) throws Exception {
		
		String state = "true";
		try {
			service.deleteOptionDetail(detailNum);
		} catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}
	
	@GetMapping("profile")
	public String profile() {
		return ".talentMarket.profile";
	}
	
	@GetMapping("delete")
	public String deleteTalent(TalentMarket dto, HttpSession session, Model model,
			@RequestParam String page,
			@RequestParam long num) {
		
		try {
			service.deleteTalent(num);
		} catch (Exception e) {
		}
		
		String query = "page=" + page;
		
		return "redirect:/talent/list?" + query ;
	}
	
	@GetMapping("order")
	public String order(Member member, HttpSession session, Model model,
			@RequestParam Optional<String> option1,
            @RequestParam Optional<String> option2,
			@RequestParam long tboardNum) {
		
		
		TalentMarket dto=service.findById(tboardNum);
		List<TalentMarket> listOption = service.listTalentOption(tboardNum);
		
		String opt1 = option1.orElse("0");
	    String opt2 = option2.orElse("0");
		
		model.addAttribute("dto",dto);
		model.addAttribute("listOption",listOption);
		model.addAttribute("option1",opt1);
		model.addAttribute("option2",opt2);
		
		return ".talentMarket.order";
	}
	
	@GetMapping("ordercomplete")
	public String ordercomplete () {
		
		return ".talentMarket.ordercomplete";
	}
	
	@PostMapping("insertLike")
	@ResponseBody
	public Map<String, Object> insertLike(
			@RequestParam long tboardNum,
			@RequestParam boolean userLiked,
			HttpSession session
			) {
		
		String state = "true";
		int talentLikeCount = 0;
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("tboardNum", tboardNum);
		paramMap.put("userId", info.getUserId());
		
		try {
			if(userLiked) {
				service.insertTalentLike(paramMap);
			} else {
				service.deleteTalentLike(paramMap);
			}
		} catch (DuplicateKeyException e) {
			state = "liked";
		} catch (Exception e) {
			state = "false";
		}
		
		talentLikeCount = service.talentLikeCount(tboardNum);
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		model.put("talentLikeCount", talentLikeCount);
		
		return model;
	}
	
}
	

