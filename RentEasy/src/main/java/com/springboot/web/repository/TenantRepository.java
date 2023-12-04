package com.springboot.web.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.springboot.web.model.Tenant;

@Repository
public interface TenantRepository extends JpaRepository<Tenant,Integer> {
	Optional<Tenant> findByEmail(String email);
	Tenant findByName(String name);
}
