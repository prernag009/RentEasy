package com.springboot.web.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.springboot.web.model.ImageItem;

@Repository
public interface ImageItemRepository extends JpaRepository<ImageItem, Integer> {
    // Define additional methods if needed
}