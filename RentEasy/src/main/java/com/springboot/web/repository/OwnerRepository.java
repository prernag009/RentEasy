package com.springboot.web.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.springboot.web.model.Owner;

@Repository
public interface OwnerRepository extends JpaRepository<Owner,Integer> {
	Optional<Owner> findByEmail(String email);
	Owner findByName(String name);
}

