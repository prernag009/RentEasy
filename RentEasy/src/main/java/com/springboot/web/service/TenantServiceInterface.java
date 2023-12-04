package com.springboot.web.service;

import com.springboot.web.model.Tenant;

public interface TenantServiceInterface {
	 public void addTenant(Tenant tenobj);
	 public Tenant getTenantByEmail(String email);
	 public Tenant getTenantByName(String name);
}
