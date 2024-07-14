package com.forest.namu.controller;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/payments")
public class PaymentController {

	@PostMapping("/token")
	public ResponseEntity<Map<String, Object>> getAccessToken() {
		Map<String, Object> response = new HashMap<>();
		try {
			RestTemplate restTemplate = new RestTemplate();
			String url = "https://api.iamport.kr/users/getToken";

			Map<String, String> body = new HashMap<>();
			body.put("imp_key", "0721586201076661"); // 포트원 API 키
			body.put("imp_secret", "GeN8ElK1shERF9kjsz6TfSI2D6noFdpfazn90wVeNjqul51gWlBUDTheod6BHUz8Aw5JzyFXUiq5cexD"); // 포트원
																														// API
																														// 시크릿

			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.APPLICATION_JSON);

			HttpEntity<Map<String, String>> entity = new HttpEntity<>(body, headers);
			ResponseEntity<Map> responseEntity = restTemplate.postForEntity(url, entity, Map.class);

			if (responseEntity.getStatusCode() != HttpStatus.OK) {
				throw new Exception("Failed to get access token: " + responseEntity.getStatusCode());
			}

			Map<String, Object> responseBody = responseEntity.getBody();

			if (responseBody == null || !responseBody.containsKey("response")) {
				throw new Exception("Failed to get access token: invalid response");
			}

			Map<String, String> responseData = (Map<String, String>) responseBody.get("response");
			response.put("state", "true");
			response.put("access_token", responseData.get("access_token"));
		} catch (Exception e) {
			response.put("state", "false");
			response.put("message", "Failed to get access token: " + e.getMessage());
		}
		return ResponseEntity.ok(response);
	}

	@PostMapping("/cancel")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> cancelPayment(@RequestBody Map<String, Object> requestData) {
	    String accessToken = (String) requestData.get("access_token");
	    String merchantUid = (String) requestData.get("merchant_uid");
	    String reason = (String) requestData.get("reason");

	    try {

	        RestTemplate restTemplate = new RestTemplate();
	        String url = "https://api.iamport.kr/payments/cancel";

	        Map<String, Object> body = new HashMap<>();
	        body.put("merchant_uid", merchantUid);
	        body.put("reason", reason);

	        HttpHeaders headers = new HttpHeaders();
	        headers.setContentType(MediaType.APPLICATION_JSON);
	        headers.set("Authorization", accessToken);

	        HttpEntity<Map<String, Object>> entity = new HttpEntity<>(body, headers);
	        ResponseEntity<Map> response = restTemplate.postForEntity(url, entity, Map.class);

	        if (response.getStatusCode() == HttpStatus.OK) {
	            Map<String, Object> responseBody = response.getBody();
	            // 성공 처리
	            Map<String, Object> successResponse = new HashMap<>();
	            successResponse.put("state", "true");
	            successResponse.put("response", responseBody);
	            return ResponseEntity.ok().body(successResponse);
	        } else {
	            // 실패 처리
	            throw new Exception("Failed to cancel payment: " + response.getStatusCode());
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        Map<String, Object> errorResponse = new HashMap<>();
	        errorResponse.put("state", "false");
	        errorResponse.put("message", e.getMessage());
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(errorResponse);
	    }
	}

}