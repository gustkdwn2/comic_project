package com.comic.service.impl;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.comic.mapper.KakaoPayMapper;
import com.comic.service.KaKaoPayService;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

import lombok.Setter;


@Service
public class KaKaoPayServiceImpl implements KaKaoPayService {

	@Setter(onMethod_ = @Autowired)
	private KakaoPayMapper kakaoPayMapper;
	
	@Override
	public JsonElement kakaoPay(int room_num, String id, int totalprice) {
		String result = "";
		JsonElement element = null;
		try {
			URL url = new URL("https://kapi.kakao.com/v1/payment/ready");
				HttpURLConnection conn = (HttpURLConnection) url.openConnection();
				conn.setRequestMethod("POST");
				conn.setDoOutput(true);
				//admin key a258e66f44b2c8ba226f22660cda5933  현태 api  port 8080
				//admin key 57a8cadc155aba24a64f1f344d81bfe8  인호 api  port 8090
				conn.setRequestProperty("Authorization", "KakaoAK a258e66f44b2c8ba226f22660cda5933");
				
				BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
				StringBuilder sb = new StringBuilder();
				
				sb.append("cid=TC0ONETIME");
				sb.append("&partner_order_id=1001");
				sb.append("&partner_user_id="+id);
				sb.append("&item_name= "+ room_num);
				sb.append("&quantity=1");
				sb.append("&total_amount="+totalprice);
				sb.append("&tax_free_amount="+(totalprice/10));
				sb.append("&approval_url=http://10.10.10.173:8080/pay/successpay?id="+id);
				sb.append("&cancel_url=http://10.10.10.173:8080/pay/cancelpay?id="+id);
				sb.append("&fail_url=http://10.10.10.173:8080/pay/failpay?id="+id);
				
				bw.write(sb.toString());
				bw.flush();
				
				String line = "";
				
				
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				while ((line = br.readLine()) != null) {
					result += line;
				}
				JsonParser parser = new JsonParser();
				
				element = parser.parse(result);
				
				bw.close();
				br.close();
				
				
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return element;
	}

	@Override
	public void insertSale(String id) {
		kakaoPayMapper.insertproductSale(id);  // 상품 매출 추가
		kakaoPayMapper.insertroomSale(id);  // 방 매출 추가
		kakaoPayMapper.productUpdate(id);
		kakaoPayMapper.resetRoom(id); // 방 사용 테이블 초기화
		
	}

	@Override
	public void resetRoom(String id) {
		kakaoPayMapper.resetRoom(id); // 방 사용 테이블 초기화
	}
}
