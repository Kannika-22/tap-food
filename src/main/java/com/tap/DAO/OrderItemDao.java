package com.tap.DAO;

import java.util.List;

import com.tap.model.OrderItem;

public interface OrderItemDao {

	// Create Operation
	void addOrderItem(OrderItem oi);

	// Update Operation
	void updateOrderItem(OrderItem oi);

	// Delete Operation
	void deleteOrderItem(int id);

	// Read Single User
	OrderItem getOrderItem(int id);

	// Read All Users
	List<OrderItem> getAllOrderItem();

}
