package com.tap.DAO;

import java.util.List;

import com.tap.model.Restaurant;

public interface RestaurantDao {

	// Create Operation
	void addRestaurant(Restaurant r);

	// Update Operation
	void updateRestaurant(Restaurant r);

	// Delete Operation
	void deleteRestaurant(int id);

	// Read Single User
	Restaurant getRestaurant(int id);

	// Read All Users
	List<Restaurant> getAllRestaurant();
}
