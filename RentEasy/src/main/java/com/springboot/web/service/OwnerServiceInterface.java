package com.springboot.web.service;

import java.util.List;

import com.springboot.web.model.Owner;
import com.springboot.web.model.Property;

public interface OwnerServiceInterface {
	public void addOwner(Owner ownobj);

	public Owner getOwnerByEmail(String email);

	Owner getOwnerByName(String name);

	public List<Property> getPropertiesForOwner(Owner owner);
}
