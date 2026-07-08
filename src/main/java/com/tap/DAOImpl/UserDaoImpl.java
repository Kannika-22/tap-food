package com.tap.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.UserDao;
import com.tap.model.User;
import com.tap.utility.DBConnection;

public class UserDaoImpl implements UserDao {

	// SQL Queries
	public static final String INSERT_QUERY = "INSERT INTO user(userName, password, email, address, role, lastLoginDate) VALUES(?,?,?,?,?,?)";

	private static final String UPDATE_QUERY = "UPDATE user SET userName = ?, password = ?, email = ?, address = ?, lastLoginDate = ? WHERE userId = ?";

	private static final String DELETE_QUERY = "DELETE FROM user WHERE userId = ?";

	private static final String SELECT_QUERY = "SELECT * FROM user WHERE userId = ?";

	private static final String SELECT_QUERY_2 = "SELECT * FROM user WHERE email = ?";

	private static final String SELECT_QUERY_3 = "SELECT * FROM user";

	private static final String UPDATE_PASSWORD_QUERY = "UPDATE user SET password=? WHERE email=?";

	// Add User
	@Override
	public int addUser(User u) {

		try (Connection connection = DBConnection.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(INSERT_QUERY);) {

			pstmt.setString(1, u.getUserName());
			pstmt.setString(2, u.getPassword());
			pstmt.setString(3, u.getEmail());
			pstmt.setString(4, u.getAddress());
			pstmt.setString(5, u.getRole());
			pstmt.setTimestamp(6, new Timestamp(System.currentTimeMillis()));

			int i = pstmt.executeUpdate();
			return i;

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	// Update User
	@Override
	public void updateUser(User u) {

		try (Connection connection = DBConnection.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(UPDATE_QUERY);) {

			pstmt.setString(1, u.getUserName());
			pstmt.setString(2, u.getPassword());
			pstmt.setString(3, u.getEmail());
			pstmt.setString(4, u.getAddress());
			pstmt.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
			pstmt.setInt(6, u.getUserId());

			int i = pstmt.executeUpdate();
			System.out.println(i);

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// Delete User
	@Override
	public void deleteUser(int id) {

		try (Connection connection = DBConnection.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(DELETE_QUERY);) {

			pstmt.setInt(1, id);

			int i = pstmt.executeUpdate();
			System.out.println(i);

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// Get User By ID
	@Override
	public User getUser(int id) {

		User u = null;

		try (Connection connection = DBConnection.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(SELECT_QUERY);) {

			pstmt.setInt(1, id);

			ResultSet res = pstmt.executeQuery();

			while (res.next()) {
				u = getUserByResultSet(res);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return u;
	}

	@Override
	public User getUserByEmail(String email) {

		User u = null;

		try (Connection connection = DBConnection.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(SELECT_QUERY_2);) {

			pstmt.setString(1, email);

			ResultSet res = pstmt.executeQuery();

			while (res.next()) {
				u = getUserByResultSet(res);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return u;

	}

	// Get All Users
	@Override
	public List<User> getAllUser() {

		ArrayList<User> list = new ArrayList<User>();

		try (Connection connection = DBConnection.getConnection(); Statement stmt = connection.createStatement();) {

			ResultSet res = stmt.executeQuery(SELECT_QUERY_3);

			while (res.next()) {

				User u = getUserByResultSet(res);
				list.add(u);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public boolean updatePassword(String email, String password) {

		boolean status = false;

		try (Connection connection = DBConnection.getConnection();

				PreparedStatement pstmt = connection.prepareStatement(UPDATE_PASSWORD_QUERY)) {

			pstmt.setString(1, password);
			pstmt.setString(2, email);

			int rows = pstmt.executeUpdate();

			if (rows > 0) {
				status = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;

	}

	// Convert ResultSet to User Object
	private static User getUserByResultSet(ResultSet res) throws SQLException {

		int userId = res.getInt("userId");
		String userName = res.getString("userName");
		String password = res.getString("password");
		String email = res.getString("email");
		String address = res.getString("address");
		String role = res.getString("role");
		Timestamp createdDate = res.getTimestamp("createdDate");
		Timestamp lastLoginDate = res.getTimestamp("lastLoginDate");

		User u = new User(userId, userName, password, email, address, role, createdDate, lastLoginDate);

		return u;
	}

}