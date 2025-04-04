package com.foodapp.model;

public class Category {
	
	private int categoryId;
	private String categoryName;
	private String imgPath;
	
	public Category() {
		super();
		
	}

	public Category(int categoryId, String categoryName, String imgPath) {
		super();
		this.categoryId = categoryId;
		this.categoryName = categoryName;
		this.imgPath = imgPath;
	}

	public Category(String categoryName, String imgPath) {
		super();
		this.categoryName = categoryName;
		this.imgPath = imgPath;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

	@Override
	public String toString() {
		return "Category [categoryId=" + categoryId + ", categoryName=" + categoryName + ", imgPath=" + imgPath + "]";
	}
	
	
	
}
