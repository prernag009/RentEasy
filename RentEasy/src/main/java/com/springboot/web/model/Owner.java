package com.springboot.web.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity
public class Owner {
	@Id
	private int owner_id;
	@Column(name = "name")
	private String name;
	private String email;
	private String password;
	private long contactno;
	public Owner() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Owner(int owner_id, String name, String email, String password, long contactno) {
		super();
		this.owner_id = owner_id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.contactno = contactno;
	}
	public int getOwner_id() {
		return owner_id;
	}
	public void setOwner_id(int owner_id) {
		this.owner_id = owner_id;
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
}
