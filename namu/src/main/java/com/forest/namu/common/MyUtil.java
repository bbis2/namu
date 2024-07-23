package com.forest.namu.common;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public abstract class MyUtil {
	/**
	* 전체 페이지수를 구하는 메소드
	* 
	* @param dataCount		총 데이터 개수
	* @param size			한 화면에 출력할 데이터 개수
	* @return				총 페이지 수
	*/
	public int pageCount(int dataCount, int size) {
		if(dataCount <= 0) {
			return 0;
		}
	
		return dataCount / size + (dataCount % size > 0 ? 1 : 0);
	}
	
	/**
	 * 페이징(paging) 처리를 하는 메소드(GET 방식, a 태그를 이용하여 해당 페이지의 URL로 이동)
	 * 
	 * @param current_page	화면에 출력할 페이지 번호
	 * @param total_page	총 페이지 수
	 * @param list_url		페이지 번호에 link를 설정할 URL
	 * @return				페이징 처리 결과
	 */
	public abstract String paging(int current_page, int total_page, String list_url);

	/**
	 * javascript를 이용하여 페이징 처리를하는 메소드 : javascript의 지정한 함수(methodName)를 호출
	 * 
	 * @param current_page	화면에 출력할 페이지 번호
	 * @param total_page	총 페이지 수
	 * @param methodName	호출할 자바스크립트 함수명
	 * @return				페이징 처리 결과
	 */
    public abstract String pagingMethod(int current_page, int total_page, String methodName);

	public abstract String pagingUrl(int current_page, int total_page, String list_url);
	public abstract String pagingFunc(int current_page, int total_page, String methodName);
    
	/**
	* 문자열에서 HTML 태그를 제거하는 메소드
	* 
	* @param str		HTML 태그를 제거할 문자열
	* @return			HTML 태그가 제거된 문자열
	*/
	public String removeHtmlTag(String str) {
		if(str == null || str.length() == 0) {
			return "";
		}

		String regex = "<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>";
		String result = str.replaceAll(regex, "");
		
		return result;
    }

	/**
	* HTML 문서에서 img 태그의 src 속성값을 추출하는 메소드
	* 
	* @param html		html 문자열
	* @return			추출된 src 속성값을 가지고 있는 List 객체 
	*/
	public List<String> getImgSrc(String html) {
		List<String> result = new ArrayList<String>();
		
		if(html == null || html.length() == 0) {
			return result;
		}

		String regex = "<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>";
		Pattern nonValidPattern = Pattern.compile(regex);

		Matcher matcher = nonValidPattern.matcher(html);
		while (matcher.find()) {
			result.add(matcher.group(1));
		}
		
		return result;
    }

	/**
	* 특수 문자를 HTML 문자로 변경 및 엔터를 <br>로 변경 하는 메소드
	* 
	* @param str		특수 문자를 HTML 문자로 변경할 문자열
	* @return			특수 문자가 HTML 문자로 변경된 문자열
	*/
	public String htmlSymbols(String str) {
		if(str == null || str.length() == 0) {
			return "";
		}

		str = str.replaceAll("&", "&amp;");
		str = str.replaceAll("\"", "&quot;");
		str = str.replaceAll(">", "&gt;");
		str = str.replaceAll("<", "&lt;");
    	 
		str = str.replaceAll(" ", "&nbsp;"); // \\s를 사용할 경우 \n 아래에서 사용해야 한다.
		str = str.replaceAll("\n", "<br>");
    	 
		return str;
	}
     
	/**
	* 중간 이름 마스킹 처리
	* @param userName		이름
	* @return				마스킹 처리된 이름
	*/
	public String nameMasking(String userName) {
		String result = "";
    	 
		try {
			userName = userName.replaceAll("\\s", "");
			
			if(userName.length() < 2) {
				return userName;
			}
        	 
			String firstName, midName, lastName, s;
        	 
			firstName = userName.substring(0, 1); // 성
			midName = "";
			if(userName.length() > 2) {
				midName = userName.substring(1, userName.length()-1); // 중간이름
			}
			s = "";
			for(int i = 0; i<midName.length(); i++) {
				s += "*";
			}
			if(userName.length() > 2) {
				lastName = userName.substring(userName.length()-1, userName.length()); // 마지막 글자
			} else {
				lastName = "*";
			}

			result = firstName + s + lastName;
		} catch (Exception e) {
		}
    	 
		return result;
	}

	/**
	* 정규식을 이용하여 E-Mail을 검사하는 메소드
	* 
	* @param email		검사할 E-Mail
	* @return			올바른 E-Mail 이지의 여부
	*/
	public boolean isValidEmail(String email) {
		if (email == null) return false;
		
		boolean b = Pattern.matches("[\\w\\~\\-\\.]+@[\\w\\~\\-]+(\\.[\\w\\~\\-]+)+", 
						email.trim());
		return b;
	}
	
	/**
	* split을 한 기본주소 저장하는 메소드
	* 
	* @param town1		town1
	* @return			split한 주소
	*/
	public String splitTown1(String town1) {

	    if (town1 == null || town1.isEmpty()) {
	        return "";
	    }

	    String[] addressParts = town1.split(" ");
	    String town1Value = "";

	    if (addressParts[0].equals("세종특별자치시")) {
	        town1Value = addressParts[0];
	    } else if (addressParts.length >= 2) {
	        town1Value = addressParts[0] + " " + addressParts[1];
	    } else {
	        town1Value = town1;
	    }
	    return town1Value;
	}
	
	/**
	* inputDate 로부터 현재까지 경과한 시간을 String으로 반환해주는 메서드
	* 
	* @param regDate		게시글이 등록된 시간 (yyyy-MM-dd HH:mm:ss)
	* @return passedTime 	경과한 시간 (~초전, ~분전, ~시간전, ~일전, ~년전)
	*/
	public String returnPassedTime(String inputDate) {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		
		LocalDateTime reg = null;
		reg = LocalDateTime.parse(inputDate, dtf);
		
		LocalDateTime now = LocalDateTime.now();
		
		long passedSecond = 0;
		passedSecond = ChronoUnit.SECONDS.between(reg, now);
		
		if (passedSecond < 60) {
			return passedSecond + "초전";
		} else if (passedSecond < (60 * 60)) {
			return passedSecond / 60 + "분전";
		} else if (passedSecond < (60 * 60 * 24)) {
			return passedSecond / (60 * 60) + "시간전";
		} else if (passedSecond < (60 * 60 * 24 * 365)) {
			return passedSecond / (60 * 60 * 24) + "일전";
		} else {
			return passedSecond / (60 * 60 * 24 * 365) + "년전";
		}
	}
	
	/**
	* "yyyy-MM-dd HH:mm:ss" 형식의 문자열을 "yyyy년 MM월 dd일 HH시 mm분" 형식의 문자열로 반환
	* 
	* @param inputDate	변환할 문자열 (yyyy-MM-dd HH:mm:ss)
	* @return 			변환된 문자열 (yyyy년 MM월 dd일 HH시 mm분)
	*/
    public String convertDateFormat(String inputDate) {
        // 입력 문자열의 형식을 정의
        DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        
        // 입력 문자열을 LocalDateTime 객체로 파싱
        LocalDateTime dateTime = LocalDateTime.parse(inputDate, inputFormatter);
        
        // 원하는 출력 형식을 정의
        DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일 HH시 mm분");
        
        // LocalDateTime 객체를 원하는 형식의 문자열로 변환
        return dateTime.format(outputFormatter);
    }
}
