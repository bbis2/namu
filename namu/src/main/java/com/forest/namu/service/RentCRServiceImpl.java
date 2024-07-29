package com.forest.namu.service;

import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forest.namu.domain.Point;
import com.forest.namu.domain.RentCR;
import com.forest.namu.mapper.RentCRMapper;

@Service
public class RentCRServiceImpl implements RentCRService {
	
	@Autowired
	private RentCRMapper mapper;

	@Transactional(rollbackOn = Exception.class)
	@Override
	public void insertRentConfirm(RentCR dto, Point point) throws Exception {
		try {
			
			dto.setReqNum(mapper.rentConfirmSeq());
			
			long lastMoney = point.getCurrentPoint() - point.getPointVar();
			if (lastMoney < 0) {
				return;
			}
			point.setDescription("빌려드림 보증금 납입");
			point.setPointCate(2);
			point.setLastMoney(lastMoney);


			mapper.insertRentConfirm(dto);
			mapper.depositProcess(point);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	@Override
	public boolean checkRentOverlap(Map<String, Object> map) throws Exception {
		// 중복 검사 로직 구현
		return mapper.checkRentOverlap(map) > 0;
	}

	@Transactional(rollbackOn = Exception.class)
	@Override
	public void cancelRent(Map<String, Object> map, Point point) throws Exception {
		try {
			// 대여 신청 취소 로직 구현
			long deposit = mapper.getDeposit(map);
			long lastMoney = point.getCurrentPoint() + deposit;
			
			point.setDescription("빌려드림 보증금 반환(취소)");
			point.setPointVar(deposit);
			point.setPointCate(0);
			point.setLastMoney(lastMoney);
			
			mapper.depositProcess(point);
			
			mapper.cancelRent(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	// rentController에서 article로 갈때 신청 상태 확인
	@Override
	public RentCR checkState(Map<String, Object> map) throws Exception {
		RentCR dto = null;
		try {
			dto = mapper.checkState(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return dto;
	}
	
    @Override
    public List<RentCR> getMyApplications(String userId) throws Exception {
        return mapper.selectMyApplications(userId);
    }

    @Override
    public List<RentCR> getReceivedRequests(String userId) throws Exception {
        return mapper.selectReceivedRequests(userId);
    }
    
    @Override
    public void acceptRentRequest(Map<String, Object> map) throws Exception {
        // 1. 해당 신청의 상태를 확인
        RentCR rentCR = mapper.findByReqNum((Long) map.get("reqNum"));
        if (rentCR == null) {
            throw new Exception("해당 신청을 찾을 수 없습니다.");
        }
        
        if (rentCR.getState() != 1) {
            throw new Exception("이미 처리된 신청입니다.");
        }
        
        // 2. 신청 상태를 '수락'으로 변경
        map.put("state", 2);  // 2는 '수락' 상태를 의미
        mapper.updateRentCRState(map);
        
        // 3. 필요한 경우 알림 발송 등의 추가 작업 수행
        // ...
    }

    @Transactional(rollbackOn = Exception.class)
	@Override
	public void rejectRentRequest(Map<String, Object> map) throws Exception {
		try {
			
			Point point = mapper.getPoint((long)map.get("reqNum"));
			
			point.setLastMoney(point.getCurrentPoint() + point.getPointVar());
			point.setDescription("빌려드림 보증금 반환(거절)");
			point.setPointCate(0);
			
			mapper.depositProcess(point);
			
			map.put("state", 3);
			mapper.updateRentCRState(map);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
    
    @Transactional(rollbackOn = Exception.class)
    @Override
    public void finishRentRequest(Map<String, Object> map) throws Exception {
    	try {
    		// 1. 해당 신청의 상태를 확인
    		RentCR rentCR = mapper.findByReqNum((Long) map.get("reqNum"));
    		if (rentCR == null) {
    			throw new Exception("해당 신청을 찾을 수 없습니다.");
    		}
    		
    		if (rentCR.getState() != 2) {
    			throw new Exception("완료할 수 없는 상태입니다.");
    		}
    		
    		// 2. 신청 상태를 '완료'로 변경
    		map.put("state", 5);  // 5는 '완료' 상태를 의미
    		mapper.updateRentCRState(map);
    		
    		// 3. 보증금 반환
    		Point point = mapper.getPoint((long)map.get("reqNum"));
    		point.setLastMoney(point.getCurrentPoint() + point.getPointVar());
    		point.setDescription("빌려드림 보증금 반환(대여종료)");
    		point.setPointCate(0);
    		mapper.depositProcess(point);
    		
    		// 4. 필요한 경우 알림 발송 등의 추가 작업 수행
    		// ...
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
    }
    
    @Override
    public int getRentReviewCount(long rentNum) {
        return mapper.selectRentReviewCount(rentNum);
    }
    
    @Override
    public List<Map<String, Object>> getRentReviews(long rentNum, int page, int pageSize) {
        int offset = (page - 1) * pageSize;
        return mapper.selectRentReviews(rentNum, offset, pageSize);
    }
    
    @Transactional(rollbackOn = Exception.class)
    @Override
    public void submitUserReview(Map<String, String> reviewData) throws Exception {
        try {
            // UserReview 테이블에 데이터 삽입
            mapper.insertUserReview(reviewData);

            // MemberDetail 테이블의 userManner 값 수정
            int mannerChange = calculateMannerChange(reviewData);
            mapper.updateUserManner(reviewData.get("targetUserId"), mannerChange);
            
            if(reviewData.get("writeUser").equals("renter")) {
            	mapper.updateBorrowerReviewed(reviewData);
            } else {
            	mapper.updateUserReviewed(reviewData);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
    }

    @Transactional(rollbackOn = Exception.class)
    @Override
    public void submitRentReview(Map<String, String> reviewData) throws Exception {
        try {
            mapper.insertRentReview(reviewData);
            
            mapper.updateRentReviewed(reviewData);
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
    }

    private int calculateMannerChange(Map<String, String> reviewData) {
        int change = 0;
        String overallRating = reviewData.get("overallRating");
        
        if ("best".equals(overallRating)) {
            change = 2;
        } else if ("good".equals(overallRating)) {
            change = 1;
        } else if ("bad".equals(overallRating)) {
            change = -2;
        }

        // 하위 항목 체크에 따라 추가 점수 부여
        for (String key : reviewData.keySet()) {
            if ((key.startsWith("good") || key.startsWith("soso") || key.startsWith("bad")) 
                && "1".equals(reviewData.get(key))) {
                if (key.startsWith("good")) {
                    change += 1;
                } else if (key.startsWith("bad")) {
                    change -= 1;
                }
            }
        }

        return change;
    }

	@Override
	public String getEmailByRentNum(long rentNum) throws Exception {
		return mapper.getEmailByRentNum(rentNum);
	}

	@Override
	public String getEmailByReqNum(long reqNum) throws Exception {
		return mapper.getEmailByReqNum(reqNum);
	}
    
}
