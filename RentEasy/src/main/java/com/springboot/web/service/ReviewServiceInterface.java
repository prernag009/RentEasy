package com.springboot.web.service;

import java.util.List;

import com.springboot.web.model.Property;
import com.springboot.web.model.Review;

public interface ReviewServiceInterface {

	void save(Review review);

	List<Review> getReviewsForProperty(Property property);

}
