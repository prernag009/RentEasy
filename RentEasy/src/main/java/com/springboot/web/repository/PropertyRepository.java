package com.springboot.web.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.springboot.web.model.Owner;
import com.springboot.web.model.Property;

@Repository
public interface PropertyRepository extends JpaRepository<Property, Integer> {
	@Query(value = "select * from property where property_id=?", nativeQuery = true)
	Property findById(int property_id);

	@Query(value = "select * from property where property_type=? and property_location=?", nativeQuery = true)
	List<Property> findByPropertyTypeAndLocation(String type, String location);

	List<Property> findByOwner(Owner owner);
}
