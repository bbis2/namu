package com.forest.namu.mail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forest.namu.domain.RentCR;

@Service
public class MailServiceImpl implements MailService {
	
    @Autowired
    private MailSender mailSender;

	@Override
	public void sendRentRequestMail(String to, RentCR rentCR) {
        Mail mail = new Mail();
        mail.setReceiverEmail(to);
        mail.setSubject("새로운 대여 신청이 접수되었습니다");
        
        String content = "대여 신청이 접수되었습니다.\n";
        content += "-----상세정보-----";
        content += "신청자: " + rentCR.getBorrowName() + "\n";
        content += "대여시작: " + rentCR.getStrDate() + "\n";;
        content += "대여종료: " + rentCR.getEndDate() + "\n";;
        content += "총 금액: " + rentCR.getTotalPrice() + "\n";;
        
        content.replaceAll("\n", "<br>");
        
        mail.setContent(content);
        mailSender.mailSend(mail);
	}

	@Override
	public void sendRentRejectMail(String to, RentCR rentCR, String rejectReason) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void sendRentCancelMail(String to, RentCR rentCR) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void sendRentAcceptMail(String to, RentCR rentCR) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void sendRentCompleteMail(String to, RentCR rentCR) {
		// TODO Auto-generated method stub
		
	}

}
