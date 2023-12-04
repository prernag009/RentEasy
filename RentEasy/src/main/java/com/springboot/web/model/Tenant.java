package com.springboot.web.model;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;

@Entity
public class Tenant {
	@Id
	private int tenant_id;
	@Column(name = "name")
	private String name;
	private String email;
	private String password;
	private long contactno;

	@OneToMany(mappedBy = "tenant")
	private List<Review> reviews;

	public Tenant() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Tenant(int tenant_id, String name, String email, String password, long contactno, List<Review> reviews) {
		super();
		this.tenant_id = tenant_id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.contactno = contactno;
		this.reviews = reviews;
	}

	public int getTenant_id() {
		return tenant_id;
	}

	public void setTenant_id(int tenant_id) {
		this.tenant_id = tenant_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public long getContactno() {
		return contactno;
	}

	public void setContactno(long contactno) {
		this.contactno = contactno;
	}

	public List<Review> getReviews() {
		return reviews;
	}

	public void setReviews(List<Review> reviews) {
		this.reviews = reviews;
	}
}
