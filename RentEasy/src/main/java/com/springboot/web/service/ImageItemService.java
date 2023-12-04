package com.springboot.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springboot.web.model.ImageItem;
import com.springboot.web.repository.ImageItemRepository;

@Service
public class ImageItemService implements ImageItemServiceInterface {

    @Autowired
    private ImageItemRepository imagerepo;

    @Override
	public void saveImageItem(ImageItem imageItem) {
		imagerepo.save(imageItem);
	}
    
    @Override
    public List<ImageItem> getAllimg() {
		return imagerepo.findAll();
	}
}
