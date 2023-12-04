package com.springboot.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.springboot.web.model.Tenant;
import com.springboot.web.repository.TenantRepository;

@Service
public class TenantService implements TenantServiceInterface{

    @Autowired
    private TenantRepository trepo;

    @Override
	public void addTenant(Tenant tenobj) {
		trepo.save(tenobj);
	}
    
    @Override
    public Tenant getTenantByEmail(String email) {
        return trepo.findByEmail(email).orElse(null);
    }
    
    @Override
    public Tenant getTenantByName(String name) {
        return trepo.findByName(name);
    }

}
