package com.springboot.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springboot.web.model.Owner;
import com.springboot.web.model.Property;
import com.springboot.web.repository.OwnerRepository;
import com.springboot.web.repository.PropertyRepository;

@Service
public class OwnerService implements OwnerServiceInterface {

	@Autowired
	private OwnerRepository orepo;

	@Autowired
	private PropertyRepository prepo;

	@Override
	public void addOwner(Owner ownobj) {
		orepo.save(ownobj);
	}

	@Override
	public Owner getOwnerByEmail(String email) {
		return orepo.findByEmail(email).orElse(null);
	}

	@Override
	public Owner getOwnerByName(String name) {
		return orepo.findByName(name);
	}

	@Override
	public List<Property> getPropertiesForOwner(Owner owner) {
		return prepo.findByOwner(owner);
	}
}
