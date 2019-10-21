package com.comic.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.comic.mapper.ProductMapper;
import com.comic.model.ProductVO;
import com.comic.service.ProductService;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ProductServiceImpl implements ProductService {
	
	private ProductMapper mapper;
	
	@Override
	public List<ProductVO> productGetList() {
		return mapper.productGetList();
	}

	@Override
	public ProductVO productGet(int product_num) {
		return mapper.productRead(product_num);
	}

	@Override
	public void productRegister(ProductVO vo) {
		mapper.productInsert(vo);
	}

	@Override
	public boolean productModify(ProductVO vo) {
		return mapper.productUpdate(vo) == 1;
	}

	@Override
	public void productRemove(int product_num) {
		mapper.productDelete(product_num);
		int result = mapper.productNumSelect(product_num);
		if(result > 0) {
			for (int i = 0; i < result; i++) {
				mapper.productNumUpdate(product_num+1);
				product_num++;
			}
		}
	}

	@Override
	public ProductVO productNameCheck(String product_name) {
		return mapper.productNameCheck(product_name);
	}

}
