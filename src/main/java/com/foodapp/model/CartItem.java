package com.foodapp.model;

public class CartItem {
	private int itemId;
	private String menuName;
	private int restaurantId;
	private int quantity;
	private float price;
	private float subTotal;
	private String imgPath;
	
	public CartItem() {
		super();
	}


	public CartItem(int itemId, String menuName, int restaurantId, int quantity, float price, float subTotal,
			String imgPath) {
		super();
		this.itemId = itemId;
		this.menuName = menuName;
		this.restaurantId = restaurantId;
		this.quantity = quantity;
		this.price = price;
		this.subTotal = subTotal;
		this.imgPath = imgPath;
	}


	public int getItemId() {
		return itemId;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public int getRestaurantId() {
		return restaurantId;
	}

	public void setRestaurantId(int restaurantId) {
		this.restaurantId = restaurantId;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public float getSubTotal() {
		return subTotal;
	}

	public void setSubTotal(float subTotal) {
		this.subTotal = subTotal;
	}
	

	public String getImgPath() {
		return imgPath;
	}


	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

	@Override
	public String toString() {
		return "CartItem [itemId=" + itemId + ", menuName=" + menuName + ", restaurantId=" + restaurantId
				+ ", quantity=" + quantity + ", price=" + price + ", subTotal=" + subTotal + ", imgPath=" + imgPath
				+ "]";
	}
	
}
