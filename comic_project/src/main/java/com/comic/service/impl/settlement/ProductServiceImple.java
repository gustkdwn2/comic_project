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

}
