package com.foodapp.model;

import java.util.HashMap;
import java.util.Map;

public class Cart {

	Map<Integer,CartItem> itemsMap;

	public Cart() {

		itemsMap = new HashMap<>();
	}

	public void addItem(CartItem item) {

		int itemId = item.getItemId();

		if(itemsMap.containsKey(itemId)) {

			CartItem existingItem = itemsMap.get(itemId);
			existingItem.setQuantity(existingItem.getQuantity()+item.getQuantity());
		}
		else {
			itemsMap.put(itemId, item);
		}
	}

	public void updateItem(int itemId,  int quantity) {

		if(itemsMap.containsKey(itemId)) {
			if(quantity <= 0) {
				itemsMap.remove(itemId);
			}
			else {
				itemsMap.get(itemId).setQuantity(quantity);;
			}
		}
	}

	public void deleteItem(int itemId) {

		itemsMap.remove(itemId);
	}

	public void clearItem() {

		itemsMap.clear();
	}

	public Map<Integer, CartItem> fetchAllItems() {

		return itemsMap;
	}

}
