package com.forest.namu.mail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forest.namu.domain.RentCR;

@Service
public class MailServiceImpl implements MailService {
	
    @Autowired
    private MailSender mailSender;
    
	@Override
	public void sendRentRequestMail(RentCR rentCR) {
        Mail mail = new Mail();
        mail.setReceiverEmail(rentCR.getEmail());
        mail.setSubject("🌳 나무: 새로운 대여 신청이 도착했습니다");
        
        StringBuilder contentBuilder = new StringBuilder();
        contentBuilder.append("<html><head><style>");
        contentBuilder.append("body { font-family: Arial, sans-serif; line-height: 1.6; color: #333; background-color: #f4f4f4; }");
        contentBuilder.append(".container { max-width: 600px; margin: 20px auto; padding: 20px; background-color: #ffffff; border-radius: 5px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }");
        contentBuilder.append("h1 { color: #2e7d32; } "); // 진한 녹색
        contentBuilder.append("h2 { color: #4caf50; } "); // 밝은 녹색
        contentBuilder.append(".info { background-color: #e8f5e9; padding: 15px; border-radius: 5px; margin-bottom: 20px; }");
        contentBuilder.append(".btn { display: inline-block; padding: 10px 20px; background-color: #4caf50; color: #ffffff; text-decoration: none; border-radius: 3px; }");
        contentBuilder.append("</style></head><body>");
        contentBuilder.append("<div class='container'>");
        contentBuilder.append("<h1>🌳 나무 빌려드림 대여 신청 알림</h1>");
        contentBuilder.append("<p>안녕하세요, 나무을 이용해 주셔서 감사합니다.</p>");
        contentBuilder.append("<p>새로운 대여 신청이 접수되었습니다. 아래 상세 정보를 확인해 주세요.</p>");
        contentBuilder.append("<div class='info'>");
        contentBuilder.append("<h2>📋 대여 신청 상세 정보</h2>");
        contentBuilder.append("<p><strong>글 제목:</strong> ").append(rentCR.getSubject()).append("</p>");
        contentBuilder.append("<p><strong>신청자:</strong> ").append(rentCR.getBorrowName()).append("</p>");
        contentBuilder.append("<p><strong>예정 대여 시작일:</strong> ").append(rentCR.getStrDate()).append("</p>");
        contentBuilder.append("<p><strong>예정 대여 종료일:</strong> ").append(rentCR.getEndDate()).append("</p>");
        contentBuilder.append("<p><strong>총 금액:</strong> ").append(rentCR.getTotalPrice()).append("원</p>");
        contentBuilder.append("</div>");
        contentBuilder.append("<p>자세한 내용은 아래 버튼을 클릭하여 나무마켓 웹사이트에서 확인해 주세요.</p>");
        contentBuilder.append("<a href='http://211.238.142.95:3306/namu/rentcr/list' class='btn'>신청 목록 확인하기</a>");
        contentBuilder.append("<p>나무을 이용해 주셔서 감사합니다. 항상 최상의 서비스를 제공하기 위해 노력하겠습니다.</p>");
        contentBuilder.append("<p>문의사항이 있으시면 언제든 고객센터로 연락 주시기 바랍니다.</p>");
        contentBuilder.append("<p>감사합니다.<br>나무 팀 드림</p>");
        contentBuilder.append("</div></body></html>");
        
        mail.setContent(contentBuilder.toString());
        mailSender.mailSend(mail);
	}

	@Override
	public void sendRentRejectMail(RentCR rentCR, String rejectReason) {
        Mail mail = new Mail();
        mail.setReceiverEmail(rentCR.getEmail());
        mail.setSubject("🌳 나무: 나의 대여 신청이 거절되었습니다.");
        
        StringBuilder contentBuilder = new StringBuilder();
        contentBuilder.append("<html><head><style>");
        contentBuilder.append("body { font-family: Arial, sans-serif; line-height: 1.6; color: #333; background-color: #f4f4f4; }");
        contentBuilder.append(".container { max-width: 600px; margin: 20px auto; padding: 20px; background-color: #ffffff; border-radius: 5px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }");
        contentBuilder.append("h1 { color: #2e7d32; } "); // 진한 녹색
        contentBuilder.append("h2 { color: #4caf50; } "); // 밝은 녹색
        contentBuilder.append(".info { background-color: #e8f5e9; padding: 15px; border-radius: 5px; margin-bottom: 20px; }");
        contentBuilder.append(".btn { display: inline-block; padding: 10px 20px; background-color: #4caf50; color: #ffffff; text-decoration: none; border-radius: 3px; }");
        contentBuilder.append("</style></head><body>");
        contentBuilder.append("<div class='container'>");
        contentBuilder.append("<h1>🌳 나무 빌려드림 대여 거절 알림</h1>");
        contentBuilder.append("<p>안녕하세요, 나무을 이용해 주셔서 감사합니다.</p>");
        contentBuilder.append("<p>대여 신청이 거절되었습니다. 아래 상세 정보를 확인해 주세요.</p>");
        contentBuilder.append("<div class='info'>");
        contentBuilder.append("<h2>📋 대여 거절 상세 정보</h2>");
        contentBuilder.append("<p><strong>글 제목:</strong> ").append(rentCR.getSubject()).append("</p>");
        contentBuilder.append("<p><strong>제공자:</strong> ").append(rentCR.getRentName()).append("</p>");
        contentBuilder.append("<p><strong>예정 대여 시작일:</strong> ").append(rentCR.getStrDate()).append("</p>");
        contentBuilder.append("<p><strong>예정 대여 종료일:</strong> ").append(rentCR.getEndDate()).append("</p>");
        contentBuilder.append("<p><strong>총 금액:</strong> ").append(rentCR.getTotalPrice()).append("원</p>");
        contentBuilder.append("<p><strong>보증금:</strong> ").append(rentCR.getDeposit()).append("원</p>");
        contentBuilder.append("<p><strong>거절사유:</strong> ").append(rejectReason).append("</p>");
        contentBuilder.append("</div>");
        contentBuilder.append("<p>자세한 내용은 아래 버튼을 클릭하여 나무마켓 웹사이트에서 확인해 주세요.</p>");
        contentBuilder.append("<a href='http://211.238.142.95:3306/namu/rentcr/list' class='btn'>신청 목록 확인하기</a>");
        contentBuilder.append("<p>나무을 이용해 주셔서 감사합니다. 항상 최상의 서비스를 제공하기 위해 노력하겠습니다.</p>");
        contentBuilder.append("<p>문의사항이 있으시면 언제든 고객센터로 연락 주시기 바랍니다.</p>");
        contentBuilder.append("<p>감사합니다.<br>나무 팀 드림</p>");
        contentBuilder.append("</div></body></html>");
        
        mail.setContent(contentBuilder.toString());
        mailSender.mailSend(mail);
	}

	@Override
	public void sendRentCancelMail(RentCR rentCR) {
        Mail mail = new Mail();
        mail.setReceiverEmail(rentCR.getEmail());
        mail.setSubject("🌳 나무: 대여 신청이 취소되었습니다.");
        
        StringBuilder contentBuilder = new StringBuilder();
        contentBuilder.append("<html><head><style>");
        contentBuilder.append("body { font-family: Arial, sans-serif; line-height: 1.6; color: #333; background-color: #f4f4f4; }");
        contentBuilder.append(".container { max-width: 600px; margin: 20px auto; padding: 20px; background-color: #ffffff; border-radius: 5px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }");
        contentBuilder.append("h1 { color: #2e7d32; } "); // 진한 녹색
        contentBuilder.append("h2 { color: #4caf50; } "); // 밝은 녹색
        contentBuilder.append(".info { background-color: #e8f5e9; padding: 15px; border-radius: 5px; margin-bottom: 20px; }");
        contentBuilder.append(".btn { display: inline-block; padding: 10px 20px; background-color: #4caf50; color: #ffffff; text-decoration: none; border-radius: 3px; }");
        contentBuilder.append("</style></head><body>");
        contentBuilder.append("<div class='container'>");
        contentBuilder.append("<h1>🌳 나무 빌려드림 대여 취소 알림</h1>");
        contentBuilder.append("<p>안녕하세요, 나무을 이용해 주셔서 감사합니다.</p>");
        contentBuilder.append("<p>대여 신청이 취소되었습니다. 아래 상세 정보를 확인해 주세요.</p>");
        contentBuilder.append("<div class='info'>");
        contentBuilder.append("<h2>📋 대여 취소 상세 정보</h2>");
        contentBuilder.append("<p><strong>글 제목:</strong> ").append(rentCR.getSubject()).append("</p>");
        contentBuilder.append("<p><strong>신청자:</strong> ").append(rentCR.getBorrowName()).append("</p>");
        contentBuilder.append("<p><strong>예정 대여 시작일:</strong> ").append(rentCR.getStrDate()).append("</p>");
        contentBuilder.append("<p><strong>예정 대여 종료일:</strong> ").append(rentCR.getEndDate()).append("</p>");
        contentBuilder.append("<p><strong>총 금액:</strong> ").append(rentCR.getTotalPrice()).append("원</p>");
        contentBuilder.append("</div>");
        contentBuilder.append("<p>자세한 내용은 아래 버튼을 클릭하여 나무마켓 웹사이트에서 확인해 주세요.</p>");
        contentBuilder.append("<a href='http://211.238.142.95:3306/namu/rentcr/list' class='btn'>신청 목록 확인하기</a>");
        contentBuilder.append("<p>나무을 이용해 주셔서 감사합니다. 항상 최상의 서비스를 제공하기 위해 노력하겠습니다.</p>");
        contentBuilder.append("<p>문의사항이 있으시면 언제든 고객센터로 연락 주시기 바랍니다.</p>");
        contentBuilder.append("<p>감사합니다.<br>나무 팀 드림</p>");
        contentBuilder.append("</div></body></html>");
        
        mail.setContent(contentBuilder.toString());
        mailSender.mailSend(mail);
	}

	@Override
	public void sendRentAcceptMail(RentCR rentCR) {
        Mail mail = new Mail();
        mail.setReceiverEmail(rentCR.getEmail());
        mail.setSubject("🌳 나무: 대여 신청이 수락되었습니다.");
        
        StringBuilder contentBuilder = new StringBuilder();
        contentBuilder.append("<html><head><style>");
        contentBuilder.append("body { font-family: Arial, sans-serif; line-height: 1.6; color: #333; background-color: #f4f4f4; }");
        contentBuilder.append(".container { max-width: 600px; margin: 20px auto; padding: 20px; background-color: #ffffff; border-radius: 5px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }");
        contentBuilder.append("h1 { color: #2e7d32; } "); // 진한 녹색
        contentBuilder.append("h2 { color: #4caf50; } "); // 밝은 녹색
        contentBuilder.append(".info { background-color: #e8f5e9; padding: 15px; border-radius: 5px; margin-bottom: 20px; }");
        contentBuilder.append(".btn { display: inline-block; padding: 10px 20px; background-color: #4caf50; color: #ffffff; text-decoration: none; border-radius: 3px; }");
        contentBuilder.append("</style></head><body>");
        contentBuilder.append("<div class='container'>");
        contentBuilder.append("<h1>🌳 나무 빌려드림 대여 수락 알림</h1>");
        contentBuilder.append("<p>안녕하세요, 나무을 이용해 주셔서 감사합니다.</p>");
        contentBuilder.append("<p>대여 신청이 수락되었습니다. 아래 상세 정보를 확인해 주세요.</p>");
        contentBuilder.append("<div class='info'>");
        contentBuilder.append("<h2>📋 대여 수락 상세 정보</h2>");
        contentBuilder.append("<p><strong>글 제목:</strong> ").append(rentCR.getSubject()).append("</p>");
        contentBuilder.append("<p><strong>제공자:</strong> ").append(rentCR.getRentName()).append("</p>");
        contentBuilder.append("<p><strong>대여 시작일:</strong> ").append(rentCR.getStrDate()).append("</p>");
        contentBuilder.append("<p><strong>대여 종료일:</strong> ").append(rentCR.getEndDate()).append("</p>");
        contentBuilder.append("<p><strong>총 금액:</strong> ").append(rentCR.getTotalPrice()).append("원</p>");
        contentBuilder.append("<p><strong>보증금:</strong> ").append(rentCR.getDeposit()).append("원</p>");
        contentBuilder.append("</div>");
        contentBuilder.append("<p>아래 버튼을 클릭하여 제공자님과 채팅으로 약속을 잡아보세요!</p>");
        contentBuilder.append("<a href='http://211.238.142.95:3306/namu/rentcr/list' class='btn'>채팅하러가기</a>");
        contentBuilder.append("<p>나무을 이용해 주셔서 감사합니다. 항상 최상의 서비스를 제공하기 위해 노력하겠습니다.</p>");
        contentBuilder.append("<p>문의사항이 있으시면 언제든 고객센터로 연락 주시기 바랍니다.</p>");
        contentBuilder.append("<p>감사합니다.<br>나무 팀 드림</p>");
        contentBuilder.append("</div></body></html>");
        
        mail.setContent(contentBuilder.toString());
        mailSender.mailSend(mail);
	}

	@Override
	public void sendRentCompleteMail(RentCR rentCR) {
        Mail mail = new Mail();
        mail.setReceiverEmail(rentCR.getEmail());
        mail.setSubject("🌳 나무: 대여가 종료되었습니다.");
        
        StringBuilder contentBuilder = new StringBuilder();
        contentBuilder.append("<html><head><style>");
        contentBuilder.append("body { font-family: Arial, sans-serif; line-height: 1.6; color: #333; background-color: #f4f4f4; }");
        contentBuilder.append(".container { max-width: 600px; margin: 20px auto; padding: 20px; background-color: #ffffff; border-radius: 5px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }");
        contentBuilder.append("h1 { color: #2e7d32; } "); // 진한 녹색
        contentBuilder.append("h2 { color: #4caf50; } "); // 밝은 녹색
        contentBuilder.append(".info { background-color: #e8f5e9; padding: 15px; border-radius: 5px; margin-bottom: 20px; }");
        contentBuilder.append(".btn { display: inline-block; padding: 10px 20px; background-color: #4caf50; color: #ffffff; text-decoration: none; border-radius: 3px; }");
        contentBuilder.append("</style></head><body>");
        contentBuilder.append("<div class='container'>");
        contentBuilder.append("<h1>🌳 나무 빌려드림 대여 종료 알림</h1>");
        contentBuilder.append("<p>안녕하세요, 나무을 이용해 주셔서 감사합니다.</p>");
        contentBuilder.append("<p>대여가 종료되었습니다. 아래 상세 정보를 확인해 주세요.</p>");
        contentBuilder.append("<div class='info'>");
        contentBuilder.append("<h2>📋 대여 종료 상세 정보</h2>");
        contentBuilder.append("<p><strong>글 제목:</strong> ").append(rentCR.getSubject()).append("</p>");
        contentBuilder.append("<p><strong>제공자:</strong> ").append(rentCR.getRentName()).append("</p>");
        contentBuilder.append("<p><strong>대여 시작일:</strong> ").append(rentCR.getStrDate()).append("</p>");
        contentBuilder.append("<p><strong>대여 종료일:</strong> ").append(rentCR.getEndDate()).append("</p>");
        contentBuilder.append("<p><strong>총 금액:</strong> ").append(rentCR.getTotalPrice()).append("원</p>");
        contentBuilder.append("</div>");
        contentBuilder.append("<p>아래 버튼을 클릭하여 따뜻한 후기를 남겨주세요.</p>");
        contentBuilder.append("<a href='http://211.238.142.95:3306/namu/rentcr/list' class='btn'>후기 남기러가기</a>");
        contentBuilder.append("<p>나무을 이용해 주셔서 감사합니다. 항상 최상의 서비스를 제공하기 위해 노력하겠습니다.</p>");
        contentBuilder.append("<p>문의사항이 있으시면 언제든 고객센터로 연락 주시기 바랍니다.</p>");
        contentBuilder.append("<p>감사합니다.<br>나무 팀 드림</p>");
        contentBuilder.append("</div></body></html>");
        
        mail.setContent(contentBuilder.toString());
        mailSender.mailSend(mail);
	}

}
