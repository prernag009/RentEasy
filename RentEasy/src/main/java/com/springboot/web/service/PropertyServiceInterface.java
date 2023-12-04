package com.springboot.web.service;

import java.util.List;

import com.springboot.web.model.Property;

public interface PropertyServiceInterface {
    public void saveProperty(Property property);
    public List<Property> getAllProperties();
//    public List<Property> searchProperties(String property_type, String property_location);
    public Property getPropertyById(int property_id);
	List<Property> searchProperties(String property_type, String property_location);
	void deletePropertyById(int property_id);
	void updateProperty(int property_id, Property updatedProperty);
}
