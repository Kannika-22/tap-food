package com.tap.DAO;

import java.util.List;

import com.tap.model.OrderTable;

public interface OrderTableDao {

	// Create Operation
	int addOrderTable(OrderTable o);

	// Update Operation
	void updateOrderTable(OrderTable o);

	// Delete Operation
	void deleteOrderTable(int id);

	// Read Single User
	OrderTable getOrderTable(int id);

	// Read All Users
	List<OrderTable> getAllOrderTable();

	List<OrderTable> getOrdersByUserId(int userId);

}
