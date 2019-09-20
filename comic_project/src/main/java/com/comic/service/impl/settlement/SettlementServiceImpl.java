package com.comic.service.impl.settlement;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.comic.mapper.SettlementMapper;
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
	
	
}
