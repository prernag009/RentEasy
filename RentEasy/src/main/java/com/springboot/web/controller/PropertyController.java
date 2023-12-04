package com.springboot.web.controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.springboot.web.model.ImageItem;
import com.springboot.web.model.Owner;
import com.springboot.web.model.Property;
import com.springboot.web.model.Review;
import com.springboot.web.model.Tenant;
import com.springboot.web.repository.OwnerRepository;
import com.springboot.web.repository.TenantRepository;
import com.springboot.web.service.ImageItemService;
import com.springboot.web.service.PropertyService;
import com.springboot.web.service.ReviewService;

import jakarta.servlet.http.HttpSession;

@Controller
public class PropertyController {
	@Autowired
	private PropertyService pservice;
	
	@Autowired
	private ReviewService rservice;
	
	@Autowired
    private ImageItemService imageItemService;
	
	 @Autowired
	 private OwnerRepository orepo;
	 
	 @Autowired
	 private TenantRepository trepo;
	
	@GetMapping("/addproperty")
	public String showPropertyForm(Model model) {
		model.addAttribute("property", new Property());
	    return "addproperty";
	}
	
	@PostMapping("/addproperty")
	public String addProperty(@ModelAttribute("property") Property property,
			@RequestParam("imageData") List<MultipartFile> imageFiles, HttpSession session)
	{
		String name = (String) session.getAttribute("name");
        Owner owner = orepo.findByName(name);

        // Set the owner in the property
        property.setOwner(owner);
        property.setDate_of_list(new Date());
        pservice.saveProperty(property);
        saveImageItems(property, imageFiles);
		return "redirect:/profile";
	}
	
	@GetMapping("/multiplepageview")
	public String getAllproperty(@RequestParam(value = "property_type", required = false) String property_type,
			@RequestParam(value = "property_location", required = false) String property_location,Model model)
	{
		List<Property> properties;
		if (property_type != null && property_location != null) {
            properties = pservice.searchProperties(property_type, property_location);
        } else {
        	properties = pservice.getAllProperties();
     		
        }
		List<ImageItem> imageItem = imageItemService.getAllimg();
		model.addAttribute("property", properties);
		model.addAttribute("imageitem",imageItem);
		return "multiplepageview";	
//		 }
//        return "redirect:/login";
	}
	
	 @PostMapping("/singlepropertyview")
	    public String addReview(@RequestParam("property_id") int property_id,float rating,String message,HttpSession session) {
	    	Property property = pservice.getPropertyById(property_id);
	    	String name = (String) session.getAttribute("name");
	        Tenant tenant = trepo.findByName(name);
	        Review review = new Review();
	        review.setRating(rating);
	        review.setMessage(message);
	        review.setTimestamp(LocalDateTime.now());
	        review.setProperty(property);
	        review.setTenant(tenant);
	        rservice.save(review);
	        return "redirect:/singlepropertyview?property_id=" + property_id;
	    }

	@GetMapping("/singlepropertyview")
    public String showSinglePropertyView(@RequestParam("property_id") int property_id, Model model) {
		Property property = pservice.getPropertyById(property_id);
		List<Review> reviews = rservice.getReviewsForProperty(property);
        model.addAttribute("review",new Review());
        model.addAttribute("property", property);
        model.addAttribute("reviews", reviews); 
        return "singlepropertyview";
    }
	 
	@PostMapping("/deleteProperty")
    public String deleteProperty(@RequestParam("property_id") int property_id) {
        pservice.deletePropertyById(property_id);
        return "redirect:/profile"; // Redirect back to the profile page after deletion
    }
	
	@GetMapping("/edit")
	 public String showEditPropertyForm(@RequestParam("property_id") int property_id, Model model) {
	     Property property = pservice.getPropertyById(property_id);
	     model.addAttribute("property", property);
	     return "edit"; // Update this with your view name for editing property
	 }
	 
	 @PostMapping("/edit")
	    public String editProperty(@ModelAttribute Property updatedProperty) {
	        pservice.updateProperty(updatedProperty.getProperty_id(), updatedProperty);
	        return "redirect:/profile";
	    }
	 
	private void saveImageItems(Property property, List<MultipartFile> imageFiles) {
        if (imageFiles != null && !imageFiles.isEmpty()) {
            for (MultipartFile file : imageFiles) {
                try {
                    byte[] imageData = file.getBytes();
                    ImageItem imageItem = new ImageItem();
                    imageItem.setImageData(imageData);
                    property.addImageItem(imageItem);
                    imageItemService.saveImageItem(imageItem);
                } catch (IOException e) {
                    e.printStackTrace(); // Handle the exception according to your needs
                }
            }
        }
	}
	
    
}