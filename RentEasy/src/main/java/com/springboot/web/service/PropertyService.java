package com.springboot.web.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springboot.web.model.Owner;
import com.springboot.web.model.Property;
import com.springboot.web.repository.OwnerRepository;
import com.springboot.web.repository.PropertyRepository;

@Service
public class PropertyService implements PropertyServiceInterface {
	 @Autowired
	 private PropertyRepository prepo;
	 
	 @Autowired
	 private OwnerRepository orepo;

	 @Override
	public void saveProperty(Property property) {
		String name = property.getOwner().getName();
	    Owner owner = orepo.findByName(name);
	    property.setOwner(owner);
		property.setDate_of_list(new Date());
		prepo.save(property);
	}
    
	 @Override
	public List<Property> getAllProperties()
	{
		return prepo.findAll();
	}

	 @Override
	    public Property getPropertyById(int property_id) {
	        return prepo.findById(property_id);
	    }
	 
	 @Override
	 public List<Property> searchProperties(String property_type, String property_location) {
	        return prepo.findByPropertyTypeAndLocation(property_type, property_location);
	    }
	 
	 @Override
	 public void deletePropertyById(int property_id) {
	        prepo.deleteById(property_id);
	    }
	 
	 @Override
	 public void updateProperty(int property_id, Property updatedProperty) {
	        Property existingProperty = prepo.findById(property_id);
	        if (existingProperty != null) {
	        	existingProperty.setStatus(updatedProperty.getStatus());
	            existingProperty.setProperty_title(updatedProperty.getProperty_title());
	            existingProperty.setProperty_type(updatedProperty.getProperty_type());
	            existingProperty.setProperty_area(updatedProperty.getProperty_area());
	            existingProperty.setProperty_description(updatedProperty.getProperty_description());
	            existingProperty.setProperty_location(updatedProperty.getProperty_location());
	            existingProperty.setProperty_price(updatedProperty.getProperty_price());
	            existingProperty.setProperty_address(updatedProperty.getProperty_address());
	            // Update other property details as needed
	            prepo.save(existingProperty); // Save the changes
	        }
	    }
	
}