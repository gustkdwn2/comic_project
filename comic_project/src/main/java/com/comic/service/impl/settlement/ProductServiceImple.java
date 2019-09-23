package com.comic.service.impl.settlement;

import java.util.List;

import org.springframework.stereotype.Service;

import com.comic.mapper.ProductMapper;
import com.comic.model.ProductVO;
import com.comic.service.ProductService;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ProductServiceImple implements ProductService {
	
	private ProductMapper mapper;
	
	@Override
	public List<ProductVO> productGetList() {
		return mapper.productGetList();
	}

	@Override
	public ProductVO productGet(int num) {
		return mapper.productRead(num);
	}

	@Override
	public void productRegister(ProductVO vo) {
		mapper.productInsert(vo);
	}

	@Override
	public boolean modify(ProductVO vo) {
		return mapper.productUpdate(vo) == 1;
	}

	@Override
	public boolean productRemove(int num) {
		return mapper.productDelete(num) == 1;
	}

}
