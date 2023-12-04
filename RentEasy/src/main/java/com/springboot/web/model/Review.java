package com.springboot.web.model;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
public class Review {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "review_id")
	private int review_id;
	private float rating;
	private String message;
	private LocalDateTime timestamp;
	@ManyToOne
	@JoinColumn(name = "property_id")
	private Property property;

	@ManyToOne
	@JoinColumn(name = "tenant_id")
	private Tenant tenant;

	public Review() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Review(int review_id, float rating, String message, LocalDateTime timestamp, Property property,
			Tenant tenant) {
		super();
		this.review_id = review_id;
		this.rating = rating;
		this.message = message;
		this.timestamp = timestamp;
		this.property = property;
		this.tenant = tenant;
	}

	public int getReview_id() {
		return review_id;
	}

	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}

	public float getRating() {
		return rating;
	}

	public void setRating(float rating) {
		this.rating = rating;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public LocalDateTime getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(LocalDateTime timestamp) {
		this.timestamp = timestamp;
	}

	public Property getProperty() {
		return property;
	}

	public void setProperty(Property property) {
		this.property = property;
	}

	public Tenant getTenant() {
		return tenant;
	}

	public void setTenant(Tenant tenant) {
		this.tenant = tenant;
	}
}
