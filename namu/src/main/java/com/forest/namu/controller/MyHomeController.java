package com.forest.namu.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.forest.namu.domain.Member;
import com.forest.namu.domain.SessionInfo;
import com.forest.namu.service.MypageService;

import org.json.JSONObject;

@Controller
@RequestMapping("/myhome/*")
public class MyHomeController {

    @Autowired
    private MypageService service;

    private static final String GEOCODE_URL = "http://dapi.kakao.com/v2/local/search/address.json?query=";
    private static final String GEOCODE_USER_INFO = "KakaoAK 8d820ae717f654070a77be8c914c8a1f";

    // 카카오 API로부터 위도 경도 가져오기
    public static double[] kakao(String addr) {
        double[] coordinates = new double[2]; // 배열로 위도와 경도 저장

        try {
            // 인코딩한 String을 넘겨야 원하는 데이터를 받을 수 있다.
            String address = URLEncoder.encode(addr, StandardCharsets.UTF_8.toString());
            URL obj = new URL(GEOCODE_URL + address);

            HttpURLConnection con = (HttpURLConnection) obj.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("Authorization", GEOCODE_USER_INFO);
            con.setRequestProperty("content-type", "application/json");

            BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream(), StandardCharsets.UTF_8));
            StringBuilder response = new StringBuilder();
            String inputLine;
            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();

            // JSON 응답에서 위도와 경도를 추출하여 저장
            JSONObject jsonResponse = new JSONObject(response.toString());
            JSONObject document = jsonResponse.getJSONArray("documents").getJSONObject(0);
            double latitude = document.getDouble("y");
            double longitude = document.getDouble("x");

            // 배열에 저장
            coordinates[0] = latitude;
            coordinates[1] = longitude;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return coordinates; // 위도와 경도를 담고 있는 배열 반환
    }

    // JSP로 위도 경도 전송하기
    @GetMapping("list")
    public String getAddress(Model model, HttpSession session) throws Exception {
        SessionInfo info = (SessionInfo) session.getAttribute("member");
        
        // 사용자 정보 또는 서비스에서 주소 가져오기 (예: service.getAddress(info.getUserId()))
        Member dto = service.getAddress(info.getUserId());

        // 카카오 API 호출하여 위도와 경도 가져오기
        double[] coordinates = kakao(dto.getAddr());

        double latitude = coordinates[0];
        double longitude = coordinates[1];
        
        System.out.println("latitude"+latitude);
        System.out.println("longitude"+longitude);
        
        // 모델에 데이터 추가
        model.addAttribute("address", dto.getAddr());
        model.addAttribute("latitude", latitude); // 위도
        model.addAttribute("longitude", longitude); // 경도

        return ".myhome.list"; // JSP 파일 이름 반환
    }
}
