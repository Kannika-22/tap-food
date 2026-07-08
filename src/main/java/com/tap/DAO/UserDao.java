package com.tap.DAO;

import java.util.List;

import com.tap.model.User;

public interface UserDao {

	// Create Operation
	int addUser(User u);

	// Update Operation
	void updateUser(User u);

	// Delete Operation
	void deleteUser(int id);

	// Read Single User
	User getUser(int id);

	// Read Single User By Email
	User getUserByEmail(String email);

	// Read All Users
	List<User> getAllUser();

	boolean updatePassword(String email, String password);
}