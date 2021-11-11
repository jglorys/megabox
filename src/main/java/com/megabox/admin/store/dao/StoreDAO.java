package com.megabox.admin.store.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.megabox.admin.store.model.Store;

@Repository
public interface StoreDAO {
	public void insertStore(
			@Param("product") String product, 
			@Param("composition") String composition, 
			@Param("productImg") String productImg, 
			@Param("price") int price, 
			@Param("amount") int amount);
	
	public List<Store> selectStoreList();
}
