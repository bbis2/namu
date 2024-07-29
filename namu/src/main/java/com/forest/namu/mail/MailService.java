package com.forest.namu.mail;

import com.forest.namu.domain.RentCR;

public interface MailService {
    public void sendRentRequestMail(String to, RentCR rentCR);
    public void sendRentRejectMail(String to, RentCR rentCR, String rejectReason);
    public void sendRentCancelMail(String to, RentCR rentCR);
    public void sendRentAcceptMail(String to, RentCR rentCR);
    public void sendRentCompleteMail(String to, RentCR rentCR);
}
