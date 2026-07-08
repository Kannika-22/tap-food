package com.tap.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

public class OrderTable {

	// Instance Variables
	private int orderId;
	private int userId;
	private int restaurantId;
	private Timestamp orderDate;
	private BigDecimal totalAmount;
	private String status;
	private String paymentMethod;

	// Default Constructor
	public OrderTable() {

	}

	// Parameterized Constructor
	public OrderTable(int orderId, int userId, int restaurantId, Timestamp orderDate, BigDecimal totalAmount,
			String status, String paymentMethod) {
		super();
		this.orderId = orderId;
		this.userId = userId;
		this.restaurantId = restaurantId;
		this.orderDate = orderDate;
		this.totalAmount = totalAmount;
		this.status = status;
		this.paymentMethod = paymentMethod;
	}

	// Parameterized Constructor(without orderId, orderDate)
	public OrderTable(int userId, int restaurantId, BigDecimal totalAmount, String status, String paymentMethod) {
		super();
		this.userId = userId;
		this.restaurantId = restaurantId;
		this.totalAmount = totalAmount;
		this.status = status;
		this.paymentMethod = paymentMethod;
	}

	// Getters and Setters
	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getRestaurantId() {
		return restaurantId;
	}

	public void setRestaurantId(int restaurantId) {
		this.restaurantId = restaurantId;
	}

	public Timestamp getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Timestamp orderDate) {
		this.orderDate = orderDate;
	}

	public BigDecimal getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(BigDecimal totalAmount) {
		this.totalAmount = totalAmount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	// toString Method
	@Override
	public String toString() {
		return "OrderTable [orderId=" + orderId + ", userId=" + userId + ", restaurantId=" + restaurantId
				+ ", orderDate=" + orderDate + ", totalAmount=" + totalAmount + ", status=" + status
				+ ", paymentMethod=" + paymentMethod + "]";
	}

}
