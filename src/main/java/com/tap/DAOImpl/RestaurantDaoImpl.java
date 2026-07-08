package com.tap.DAOImpl;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.RestaurantDao;
import com.tap.model.Restaurant;
import com.tap.utility.DBConnection;

public class RestaurantDaoImpl implements RestaurantDao {

	// SQL Queries
	public static final String INSERT_QUERY = "INSERT INTO restaurant(name, cuisineType, deliveryTime, address, adminUserId, rating, isActive, imagePath) VALUES(?,?,?,?,?,?,?,?)";

	private static final String UPDATE_QUERY = "UPDATE restaurant SET name = ?, cuisineType = ?, deliveryTime = ?, address = ?, adminUserId = ?, rating = ?, isActive = ? WHERE restaurantId = ?";

	private static final String SELECT_QUERY = "SELECT * FROM restaurant WHERE restaurantId = ?";

	private static final String DELETE_QUERY = "DELETE FROM restaurant WHERE restaurantId = ?";

	private static final String SELECT_QUERY_2 = "SELECT * FROM restaurant";

	// Add Restaurant
	@Override
	public void addRestaurant(Restaurant r) {

		try (Connection connection = DBConnection.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(INSERT_QUERY);) {

			pstmt.setString(1, r.getName());
			pstmt.setString(2, r.getCuisineType());
			pstmt.setInt(3, r.getDeliveryTime());
			pstmt.setString(4, r.getAddress());
			pstmt.setInt(5, r.getAdminUserId());
			pstmt.setBigDecimal(6, r.getRating());
			pstmt.setBoolean(7, r.getIsActive());
			pstmt.setString(8, r.getImagePath());

			int i = pstmt.executeUpdate();
			System.out.println(i);

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// Update Restaurant
	@Override
	public void updateRestaurant(Restaurant r) {

		try (Connection connection = DBConnection.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(UPDATE_QUERY);) {

			pstmt.setString(1, r.getName());
			pstmt.setString(2, r.getCuisineType());
			pstmt.setInt(3, r.getDeliveryTime());
			pstmt.setString(4, r.getAddress());
			pstmt.setInt(5, r.getAdminUserId());
			pstmt.setBigDecimal(6, r.getRating());
			pstmt.setBoolean(7, r.getIsActive());
			pstmt.setInt(8, r.getRestaurantId());

			int i = pstmt.executeUpdate();
			System.out.println(i);

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// Delete Restaurant
	@Override
	public void deleteRestaurant(int id) {

		try (Connection connection = DBConnection.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(DELETE_QUERY);) {

			pstmt.setInt(1, id);

			int i = pstmt.executeUpdate();
			System.out.println(i);

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	// Get Restaurant By ID
	@Override
	public Restaurant getRestaurant(int id) {

		Restaurant r = null;

		try (Connection connection = DBConnection.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(SELECT_QUERY);) {

			pstmt.setInt(1, id);

			ResultSet res = pstmt.executeQuery();

			while (res.next()) {
				r = getRestaurantByResultSet(res);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return r;

	}

	// Get All Restaurant
	@Override
	public List<Restaurant> getAllRestaurant() {

		ArrayList<Restaurant> list = new ArrayList<Restaurant>();

		try (Connection connection = DBConnection.getConnection(); Statement stmt = connection.createStatement();) {

			ResultSet res = stmt.executeQuery(SELECT_QUERY_2);

			while (res.next()) {

				Restaurant r = getRestaurantByResultSet(res);
				list.add(r);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;

	}

	// Convert ResultSet to Restaurant Object
	private static Restaurant getRestaurantByResultSet(ResultSet res) throws SQLException {

		int restaurantId = res.getInt("restaurantId");
		String name = res.getString("name");
		String cuisineType = res.getString("cuisineType");
		int deliveryTime = res.getInt("deliveryTime");
		String address = res.getString("address");
		int adminUserId = res.getInt("adminUserId");
		BigDecimal rating = res.getBigDecimal("rating");
		boolean isActive = res.getBoolean("isActive");
		String imagePath = res.getString("imagePath");

		Restaurant r = new Restaurant(restaurantId, name, cuisineType, deliveryTime, address, adminUserId, rating,
				isActive, imagePath);

		return r;
	}

}
