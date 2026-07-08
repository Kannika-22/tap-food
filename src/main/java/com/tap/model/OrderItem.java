package com.tap.model;

import java.math.BigDecimal;

public class OrderItem {

	// Instance Variables
	private int orderItemId;
	private int orderId;
	private int menuId;
	private int quantity;
	private BigDecimal itemTotal;

	// Default Constructor
	public OrderItem() {

	}

	// Parameterized Constructor
	public OrderItem(int orderItemId, int orderId, int menuId, int quantity, BigDecimal itemTotal) {
		super();
		this.orderItemId = orderItemId;
		this.orderId = orderId;
		this.menuId = menuId;
		this.quantity = quantity;
		this.itemTotal = itemTotal;
	}

	// Parameterized Constructor(without orderItemId)
	public OrderItem(int orderId, int menuId, int quantity, BigDecimal itemTotal) {
		super();
		this.orderId = orderId;
		this.menuId = menuId;
		this.quantity = quantity;
		this.itemTotal = itemTotal;
	}

	// Getters and Setters
	public int getOrderItemId() {
		return orderItemId;
	}

	public void setOrderItemId(int orderItem) {
		this.orderItemId = orderItem;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getMenuId() {
		return menuId;
	}

	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public BigDecimal getItemTotal() {
		return itemTotal;
	}

	public void setItemTotal(BigDecimal itemTotal) {
		this.itemTotal = itemTotal;
	}

	// toString Method
	@Override
	public String toString() {
		return "OrderItem [orderItem=" + orderItemId + ", orderId=" + orderId + ", menuId=" + menuId + ", quantity="
				+ quantity + ", itemTotal=" + itemTotal + "]";
	}

}
