package com.megabox.admin.store.bo;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.megabox.admin.store.dao.StoreDAO;
import com.megabox.admin.store.model.Store;
import com.megabox.common.FileManagerService;

@Service
public class StoreBO {
	
	@Autowired
	private StoreDAO storeDAO;
	
	@Autowired 
	private FileManagerService fileManagerService;
	
	public void addStore(
						String product, 
						String composition, 
						int price, 
						int amount, 
						MultipartFile file) {
		String imagePath = null;
		if (file != null) {
			try {
				imagePath = fileManagerService.saveFile("admin", file);
			} catch (IOException e) {
				imagePath = null;
			}
		}
		storeDAO.insertStore(product, composition, imagePath, price, amount);
	}
	
	public List<Store> getStoreList() {
		return storeDAO.selectStoreList();
	}
}
