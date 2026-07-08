package com.tap.DAO;

import java.util.List;

import com.tap.model.Menu;

public interface MenuDao {

	// Create Operation
	void addMenu(Menu m);

	// Update Operation
	void updateMenu(Menu m);

	// Delete Operation
	void deleteMenu(int id);

	// Read Single Menu
	Menu getMenu(int id);

	// Read All Menu By Restaurant
	List<Menu> getAllMenuByRestaurant(int id);

	// Read All Users
	List<Menu> getAllMenu();

}
