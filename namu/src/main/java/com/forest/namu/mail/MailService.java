package com.forest.namu.mail;

import com.forest.namu.domain.RentCR;

public interface MailService {
    public void sendRentRequestMail(RentCR rentCR);
    public void sendRentRejectMail(RentCR rentCR, String rejectReason);
    public void sendRentCancelMail(RentCR rentCR);
    public void sendRentAcceptMail(RentCR rentCR);
    public void sendRentCompleteMail(RentCR rentCR);
}
