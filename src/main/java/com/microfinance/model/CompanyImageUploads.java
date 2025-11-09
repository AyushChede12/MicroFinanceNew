package com.microfinance.model;

import javax.persistence.*;

@Entity
public class CompanyImageUploads {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	private String fieldName; // e.g., AYUSH, AJAY
	private String imageName; // e.g., ayush.png
	private String imagePath; // e.g., /uploads/company_images/1730978345792_ayush.png

	@ManyToOne
	@JoinColumn(name = "company_id")
	private CompanyAdministration company;

	public Long getId() {
		return id;
	}

	public String getFieldName() {
		return fieldName;
	}

	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}

	public String getImageName() {
		return imageName;
	}

	public void setImageName(String imageName) {
		this.imageName = imageName;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public CompanyAdministration getCompany() {
		return company;
	}

	public void setCompany(CompanyAdministration company) {
		this.company = company;
	}
}
