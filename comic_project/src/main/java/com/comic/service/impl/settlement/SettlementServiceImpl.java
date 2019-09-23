package com.comic.service.impl.settlement;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.comic.mapper.SettlementMapper;
import com.comic.model.LossVO;
import com.comic.model.ProductVO;
import com.comic.service.SettlementService;

import lombok.Setter;
import net.sf.json.JSONArray;


@Service
public class SettlementServiceImpl implements SettlementService {
	
	@Setter(onMethod_ = @Autowired)
	private SettlementMapper settleMapper;

	@Override
	public List<ProductVO> settlementList() {
		return settleMapper.settlementList();
	}

	@Override
	public boolean modify(String num, String currentNum) {
		int number = Integer.parseInt(num);
		int curNum = Integer.parseInt(currentNum);
		return settleMapper.settlementUpdate(number , curNum) == 1;
	}

	@Override
	public Map<String, Object> settlementError(HashMap<String, Object> map, List<ProductVO> current) {
		JSONArray jsonArray = new JSONArray(); // object 타입
		int[] list = new int[current.size()];
		for (int i = 0; i < list.length; i++) { // object type을 int형으로 저장
			list[i] = Integer.parseInt(jsonArray.fromObject(map.get("list")).get(i).toString());
		}
		
		for (int i = 0; i < current.size(); i++) {
			if (current.get(i).getProduct_qty() > list[i]) { // 현재 재고 수량 > 입력한 실제수량 -> 오차수량은 -
				map.put(Integer.toString(i), ((-1) * (current.get(i).getProduct_qty() - list[i])));
			} else if (current.get(i).getProduct_qty() < list[i]) { // 현재 재고 수량 > 입력한 실제수량 -> 오차수량은 +
				map.put(Integer.toString(i), ((-1) * (current.get(i).getProduct_qty() - list[i])));
			} else {
				map.put(Integer.toString(i), 0);
			}
		}
		map.remove("list"); // 실제 수량 입력은 제거
		return map;
	}

	@Override
	public void insertLoss(ProductVO product, String input_qty) {
		//product_qty 현재재고
		//input_qty 입력재고
		String category = "지출";
		// 현재재고보다 입력재고가 많으면 -> 수익, 적으면 -> 지출
		// 현재재고 - 입력재고 = 오차수량 ==> 입력재고가 더 크면 - 값이 나옴
		// 현재재고 - 입력재고 = 오차수량 ==> 입력재고가 작으면 + 값이 나옴
		// - 수익, + 지출
		int errorNum = product.getProduct_qty() - Integer.parseInt(input_qty); 
		int pay = 1;
		if(errorNum < 0) { //  수익
			category = "수익";
			settleMapper.settlementLossInsert(category, Math.abs(errorNum), product.getProduct_num(), pay);
		} else if (errorNum > 0) { //현재재고 > 입력재고 => 지출
			pay = errorNum * -1;
			settleMapper.settlementLossInsert(category, errorNum, product.getProduct_num(), pay);
		}
		
	}
	
	
}
