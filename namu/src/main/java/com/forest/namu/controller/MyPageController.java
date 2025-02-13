package com.forest.namu.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.forest.namu.common.MyUtil;
import com.forest.namu.domain.Badge;
import com.forest.namu.domain.Delivery;
import com.forest.namu.domain.Member;
import com.forest.namu.domain.Point;
import com.forest.namu.domain.Profile;
import com.forest.namu.domain.SessionInfo;
import com.forest.namu.domain.TmOrder;
import com.forest.namu.domain.TmQuestion;
import com.forest.namu.domain.TmReview;
import com.forest.namu.domain.Url;
import com.forest.namu.service.BadgeService;
import com.forest.namu.service.DeliveryService;
import com.forest.namu.service.MypageService;
import com.forest.namu.service.PointService;
import com.forest.namu.service.ScheduleService;
import com.forest.namu.service.TmOrderService;
import com.forest.namu.service.TmQuestionService;
import com.forest.namu.service.TmReviewService;

@Controller
@RequestMapping("/mypage/*")
public class MyPageController {

	@Autowired
	private PointService service;

	@Autowired
	private MypageService myService;

	@Autowired
	private ScheduleService sService;

	@Autowired
	private DeliveryService dService;

	@Autowired
	private BadgeService bService;

	@Autowired
	private TmReviewService tmReviewService;

	@Autowired
	private TmQuestionService tmQuestionService;

	@Autowired
	private TmOrderService tmOrderService;

	@Autowired
	private MyUtil myUtil;

	@GetMapping("list")
	public String list(HttpSession session, Model model, Badge bto) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");

		long point = service.selectPoint(info.getUserId());
		List<Member> list = myService.selectSchedule(info.getUserId());
		List<Badge> blist = bService.selectBadge(info.getUserId());

		Profile userdto = myService.selectProfile(info.getUserId());
		Profile dto = new Profile();
		dto = myService.selectPhoto(info.getUserId());
		long message = myService.selectMessage(info.getUserId());

		model.addAttribute("message", message);

		model.addAttribute("blist", blist);
		model.addAttribute("list", list);
		model.addAttribute("dto", dto);
		model.addAttribute("userdto", userdto);
		model.addAttribute("userId", info.getUserId());
		model.addAttribute("point", point);

		return ".mypage.list";
	}

	@PostMapping("pointCharge")
	@ResponseBody
	public Map<String, Object> insertPoint(Point dto, HttpSession session) throws Exception {

		String state = "true";
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		try {
			dto.setUserId(info.getUserId());
			service.insertPoint(dto);
		} catch (Exception e) {
			state = "false";
		}
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		return model;
	}

	@PostMapping("selectSeq")
	@ResponseBody
	public Map<String, Object> selectSequence() throws Exception {

		String state = "true";
		long sequence = 0;

		try {
			sequence = service.selectSeq();

		} catch (Exception e) {
			state = "false";
		}
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		model.put("sequence", sequence);

		return model;
	}

	@GetMapping("selectCharge")
	@ResponseBody
	public Map<String, Object> selectCharge(HttpSession session) throws Exception {

		String state = "true";
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		List<Point> list = service.selectCharge(info.getUserId());

		if (list.isEmpty()) {
			state = "false";
		}

		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		model.put("list", list);

		return model;
	}

	@GetMapping("selectAll")
	@ResponseBody
	public Map<String, Object> selectAll(HttpSession session) throws Exception {

		String state = "true";
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		List<Point> listAll = service.selectAll(info.getUserId());

		if (listAll.isEmpty()) {
			state = "false";
		}

		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		model.put("listAll", listAll);

		return model;
	}

	// 환불 테이블에 저장하기
	@PostMapping("insertRefund")
	@ResponseBody
	public Map<String, Object> insertRefund(Point dto, HttpSession session) throws Exception {

		String state = "true";
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		try {
			dto.setUserId(info.getUserId());
			service.insertRefund(dto);
		} catch (Exception e) {
			state = "false";
		}
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		return model;
	}

	// 포인트 테이블에 저장하기
	@PostMapping("refundPoint")
	@ResponseBody
	public Map<String, Object> refundPoint(Point dto, HttpSession session) throws Exception {

		String state = "true";
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		try {
			long seq = service.selectSeq();

			dto.setUserId(info.getUserId());
			dto.setPointNum(seq);
			service.refundPoint(dto);
		} catch (Exception e) {
			state = "false";
		}
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		return model;
	}

	@PostMapping("insertPhoto")
	public String saveImage(Profile dto, HttpSession session, Model model) {
		String root = session.getServletContext().getRealPath("/");
		String path = root + "uploads" + File.separator + "photo";
		System.out.println("***" + path + "***");
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		try {
			dto.setUserId(info.getUserId());
			myService.insertPhoto(dto, path);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/mypage/list";
	}

	@GetMapping("update")
	public String nalmug(Model model) {

		model.addAttribute("mode", "update");

		return "/mypage/memberUpdate";
	}

	@PostMapping("whoRider")
	@ResponseBody
	public Map<String, Object> selectRider(HttpSession session) throws Exception {

		String state = "true";
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		List<Delivery> list = myService.selectRider(info.getUserId());

		if (list.isEmpty()) {
			state = "false";
		}

		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		model.put("Rlist", list);
		return model;
	}

	@PostMapping("myRider")
	public String myRider(@RequestParam long num, @RequestParam long num2, HttpSession session, Delivery dto)
			throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		try {
			dto.setNum(num);
			dto.setNum2(num2);

			myService.updateRider(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/mypage/list";
	}

	@PostMapping("okMoney")
	public String okMoney(@RequestParam long num, @RequestParam long current, @RequestParam long num2,
			@RequestParam long point, HttpSession session, Delivery dto, Point pto) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		try {
			dto.setNum(num);
			dto.setNum2(num2);

			myService.updateRider2(dto);

			pto.setCurrentPoint(current);
			pto.setUserId(info.getUserId());
			pto.setPointVar(point);
			pto.setDescription("배달 적립");
			service.insertPoint2(pto);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/mypage/list";
	}

	@PostMapping("badgeInsert")
	@ResponseBody
	public Map<String, Object> badgeInsert(Badge bto, HttpSession session) throws Exception {

		String state = "true";
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		try {
			List<Badge> list = bService.selectBadge(info.getUserId());
			long count = bService.dailyCount(info.getUserId());
			if ((list.isEmpty() || list == null) && count > 5) {

				bto.setUserId(info.getUserId());
				bService.insertBadge1(bto);
			}

		} catch (Exception e) {
			state = "false";
		}
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		return model;
	}

	@GetMapping("myWrite")
	@ResponseBody
	public Map<String, Object> myWrite(HttpSession session) throws Exception {

		String state = "true";
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		List<Url> list = myService.myWrite(info.getUserId());
		List<Url> list2 = myService.myWrite2(info.getUserId());

		if (list.isEmpty()) {
			state = "false";
		}

		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		model.put("Wlist1", list);
		model.put("Wlist2", list2);
		return model;
	}

	@GetMapping("myGGim")
	@ResponseBody
	public Map<String, Object> myGGim(HttpSession session) throws Exception {

		String state = "true";
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		List<Url> list = myService.myGGim(info.getUserId());
		List<Url> list2 = myService.myGGim2(info.getUserId());

		if (list.isEmpty()) {
			state = "false";
		}

		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		model.put("Glist1", list);
		model.put("Glist2", list2);
		return model;
	}

	@GetMapping("mytalent")
	@ResponseBody
	public Map<String, Object> talentList(HttpSession session) throws Exception {

		String state = "true";
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		List<TmOrder> tmoderList = tmOrderService.listTmOrderByUserIdAll(info.getUserId());

		if (tmoderList.isEmpty()) {
			state = "false";
		}

		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		model.put("tmoderList", tmoderList);

		return model;
	}

	@PostMapping("confirmed")
	@ResponseBody
	public Map<String, Object> confirmedDate(@RequestParam long num) throws Exception {
		String state = "true";
		try {
			tmOrderService.updateComplete(num);
		} catch (Exception e) {
			state = "false";
		}

		Map<String, Object> model = new HashMap<String, Object>();

		model.put("state", state);
		return model;
	}

	@GetMapping("mytalentshop")
	@ResponseBody
	public Map<String, Object> mytalentShop(HttpSession session) throws Exception {

		String state = "true";
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		List<TmOrder> myShopList = tmOrderService.listTmOrderMyshop(info.getUserId());

		if (myShopList.isEmpty()) {
			state = "false";
		}

		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		model.put("myShopList", myShopList);

		return model;
	}
	
	@GetMapping("mytalentshopQna")
	@ResponseBody
	public Map<String, Object> questionList(
	        @RequestParam(value = "page", defaultValue = "1") int current_page,
	        @RequestParam(defaultValue = "1") int mode,
	        HttpServletRequest req, HttpSession session) throws Exception {
	    
	    SessionInfo info = (SessionInfo) session.getAttribute("member");
	    
	    Map<String, Object> model = new HashMap<>();

	    try {
	        Map<String, Object> map = new HashMap<>();
	        int size = 10;
	        int dataCount = 0;

	        map.put("mode", mode);
	        map.put("userId", info.getUserId());
	        
	        dataCount = tmQuestionService.dataCount2(map);
	        int total_page = myUtil.pageCount(dataCount, size);
	        if (current_page > total_page) {
	            current_page = total_page;
	        }

	        int offset = (current_page - 1) * size;
	        if (offset < 0) offset = 0;

	        map.put("offset", offset);
	        map.put("size", size);

	        List<TmQuestion> list = tmQuestionService.listQuestion2(map);
	        
	        // 문의 내용에서 줄바꿈 태그(<br>)를 공백으로 대체
	        for (TmQuestion question : list) {
	            question.setQuestion(question.getQuestion().replace("<br>", ""));
	        }

	        model.put("list", list);
	        model.put("dataCount", dataCount);
	        model.put("size", size);
	        model.put("page", current_page);
	        model.put("total_page", total_page);
	        model.put("mode", mode);
	        
	    } catch (Exception e) {
	        // 예외가 발생한 경우 로그를 남기고 에러 메시지 반환
	        e.printStackTrace();
	        model.put("error", "An error occurred while fetching the questions.");
	    }

	    return model;
	}
	
	@PostMapping("mytalentshopQna/answer")
	@ResponseBody
	public Map<String, Object> questionAnswer(@RequestBody TmQuestion dto, HttpSession session) {
	    Map<String, Object> model = new HashMap<>();
	    SessionInfo info = (SessionInfo) session.getAttribute("member");
	    
	    try {
	        dto.setAnswerId(info.getUserId());
	        tmQuestionService.updateQuestion(dto);

	        model.put("status", "success");
	        model.put("message", "답변이 성공적으로 등록되었습니다.");
	    } catch (Exception e) {
	        e.printStackTrace();
	        model.put("status", "error");
	        model.put("message", "답변 등록 중 오류가 발생했습니다.");
	    }
	    
	    return model;
	}
	
	@PostMapping("mytalentshopQna/delete")
	@ResponseBody
	public Map<String, Object> questionDelete(@RequestParam long num, HttpSession session) {
	    Map<String, Object> model = new HashMap<>();
	  
	    
	    try {
	        tmQuestionService.deleteQuestion(num);
	        model.put("status", "success");
	        model.put("message", "질문이 성공적으로 삭제되었습니다.");
	    } catch (Exception e) {
	        model.put("status", "error");
	        model.put("message", "질문 삭제 중 오류가 발생했습니다.");
	        e.printStackTrace(); 
	    }
	    
	    return model;
	}
	
	
}
