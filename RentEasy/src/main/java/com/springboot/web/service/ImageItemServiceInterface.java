package com.springboot.web.service;

import java.util.List;

import com.springboot.web.model.ImageItem;

public interface ImageItemServiceInterface {
		void saveImageItem(ImageItem imageItem);
		List<ImageItem> getAllimg();
}
