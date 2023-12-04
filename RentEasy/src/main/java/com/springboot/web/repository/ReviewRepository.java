package com.springboot.web.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.springboot.web.model.Property;
import com.springboot.web.model.Review;

public interface ReviewRepository extends JpaRepository<Review,Integer> {

	@Query(value="select*from property where property_id=?",nativeQuery=true)
	List<Review> findByPropertyId(int property_id);
	
	List<Review> findByProperty(Property property);

}
