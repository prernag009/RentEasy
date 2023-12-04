package com.springboot.web.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;

@Entity
@Table(name = "property")
public class Property {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int property_id;
	private String property_title;
	private String property_description;
	private int property_price;
	private int property_area;
	private String property_location;
	private String property_address;
	private String property_type;
	@Temporal(TemporalType.DATE)
	private Date date_of_list;
	private String status;

	@OneToMany(mappedBy = "property", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<ImageItem> imageItems;

	@OneToMany(mappedBy = "property")
	private List<Review> reviews;

	@ManyToOne
	@JoinColumn(name = "owner_id")
	private Owner owner;

	public void addImageItem(ImageItem imageItem) {
		if (imageItems == null) {
			imageItems = new ArrayList<>();
		}
		imageItems.add(imageItem);
		imageItem.setProperty(this);
	}
	
	public Property() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Property(int property_id, String property_title, String property_description, int property_price,
			int property_area, String property_location, String property_address, String property_type,
			Date date_of_list, List<ImageItem> imageItems,String status, List<Review> reviews, Owner owner) {
		super();
		this.property_id = property_id;
		this.property_title = property_title;
		this.property_description = property_description;
		this.property_price = property_price;
		this.property_area = property_area;
		this.property_location = property_location;
		this.property_address = property_address;
		this.property_type = property_type;
		this.date_of_list = date_of_list;
		this.status = status;
		this.imageItems = imageItems;
		this.reviews = reviews;
		this.owner = owner;
	}

	public int getProperty_id() {
		return property_id;
	}

	public void setProperty_id(int property_id) {
		this.property_id = property_id;
	}

	public String getProperty_title() {
		return property_title;
	}

	public void setProperty_title(String property_title) {
		this.property_title = property_title;
	}

	public String getProperty_description() {
		return property_description;
	}

	public void setProperty_description(String property_description) {
		this.property_description = property_description;
	}

	public int getProperty_price() {
		return property_price;
	}

	public void setProperty_price(int property_price) {
		this.property_price = property_price;
	}

	public int getProperty_area() {
		return property_area;
	}

	public void setProperty_area(int property_area) {
		this.property_area = property_area;
	}

	public String getProperty_location() {
		return property_location;
	}

	public void setProperty_location(String property_location) {
		this.property_location = property_location;
	}

	public String getProperty_address() {
		return property_address;
	}

	public void setProperty_address(String property_address) {
		this.property_address = property_address;
	}

	public String getProperty_type() {
		return property_type;
	}

	public void setProperty_type(String property_type) {
		this.property_type = property_type;
	}

	public Date getDate_of_list() {
		return date_of_list;
	}

	public void setDate_of_list(Date date_of_list) {
		this.date_of_list = date_of_list;
	}
	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public List<ImageItem> getImageItems() {
		return imageItems;
	}

	public void setImageItems(List<ImageItem> imageItems) {
		this.imageItems = imageItems;
	}

	public List<Review> getReviews() {
		return reviews;
	}

	public void setReviews(List<Review> reviews) {
		this.reviews = reviews;
	}

	public Owner getOwner() {
		return owner;
	}

	public void setOwner(Owner owner) {
		this.owner = owner;
	}
}
