package com.comic.mapper;

import org.apache.ibatis.annotations.Param;

public interface KakaoPayMapper {
	public void insertroomSale(@Param("id") String id);

	public void insertproductSale(@Param("id") String id);

	public void resetRoom(@Param("id") String id);

	public void productUpdate(@Param("id") String id);
}
