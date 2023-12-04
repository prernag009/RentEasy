package com.springboot.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springboot.web.model.Property;
import com.springboot.web.model.Review;
import com.springboot.web.model.Tenant;
import com.springboot.web.repository.ReviewRepository;
import com.springboot.web.repository.TenantRepository;

@Service
public class ReviewService implements ReviewServiceInterface {
	@Autowired
    private ReviewRepository revrepo;
	
	@Autowired
    private TenantRepository trepo;

	@Override
	public void save(Review review) {
		String name=review.getTenant().getName();
		Tenant tenant=trepo.findByName(name);
		review.setTenant(tenant);
		review.getProperty().getProperty_id();
		review.getReview_id();
		revrepo.save(review);
	}

	@Override
	public List<Review> getReviewsForProperty(Property property) {
        return revrepo.findByProperty(property);
    }

}
