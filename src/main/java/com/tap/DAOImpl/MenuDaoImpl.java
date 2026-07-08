package com.tap.DAOImpl;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.MenuDao;
import com.tap.model.Menu;
import com.tap.utility.DBConnection;

public class MenuDaoImpl implements MenuDao {

	// SQL Queries
	public static final String INSERT_QUERY = "INSERT INTO menu(restaurantId, itemName, description, price, category, imagePath) VALUES(?,?,?,?,?,?)";

	private static final String UPDATE_QUERY = "UPDATE menu SET restaurantId = ?, itemName = ?, description = ?, price = ?, category = ? WHERE menuId = ?";

	private static final String DELETE_QUERY = "DELETE FROM menu WHERE menuId = ?";

	private static final String SELECT_QUERY = "SELECT * FROM menu WHERE menuId = ?";

	private static final String SELECT_QUERY02 = "SELECT * FROM menu WHERE restaurantId = ?";

	private static final String SELECT_QUERY03 = "SELECT * FROM menu";

	// Add Menu
	@Override
	public void addMenu(Menu m) {

		try (Connection connection = DBConnection.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(INSERT_QUERY);) {

			pstmt.setInt(1, m.getRestaurantId());
			pstmt.setString(2, m.getItemName());
			pstmt.setString(3, m.getDescription());
			pstmt.setBigDecimal(4, m.getPrice());
			pstmt.setString(5, m.getCategory());
			pstmt.setString(6, m.getImagePath());

			int i = pstmt.executeUpdate();
			System.out.println(i);

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	// Update Menu
	@Override
	public void updateMenu(Menu m) {

		try (Connection connection = DBConnection.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(UPDATE_QUERY);) {

			pstmt.setInt(1, m.getRestaurantId());
			pstmt.setString(2, m.getItemName());
			pstmt.setString(3, m.getDescription());
			pstmt.setBigDecimal(4, m.getPrice());
			pstmt.setString(5, m.getCategory());
			pstmt.setInt(6, m.getMenuId());

			int i = pstmt.executeUpdate();
			System.out.println(i);

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// Delete Menu
	@Override
	public void deleteMenu(int id) {

		try (Connection connection = DBConnection.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(DELETE_QUERY);) {

			pstmt.setInt(1, id);

			int i = pstmt.executeUpdate();
			System.out.println(i);

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	// Get Menu By ID
	@Override
	public Menu getMenu(int id) {

		Menu m = null;

		try (Connection connection = DBConnection.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(SELECT_QUERY);) {

			pstmt.setInt(1, id);

			ResultSet res = pstmt.executeQuery();

			while (res.next()) {
				m = getMenuByResultSet(res);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return m;

	}

	// Get All Menu By Restaurant
	@Override
	public List<Menu> getAllMenuByRestaurant(int id) {

		List<Menu> list = new ArrayList<Menu>();

		try (Connection connection = DBConnection.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(SELECT_QUERY02);) {

			pstmt.setInt(1, id);

			ResultSet res = pstmt.executeQuery();

			while (res.next()) {
				Menu m = getMenuByResultSet(res);
				list.add(m);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;

	}

	// Get All Menu
	@Override
	public List<Menu> getAllMenu() {

		List<Menu> list = new ArrayList<Menu>();

		try (Connection connection = DBConnection.getConnection(); Statement stmt = connection.createStatement();) {

			ResultSet res = stmt.executeQuery(SELECT_QUERY03);

			while (res.next()) {
				Menu m = getMenuByResultSet(res);
				list.add(m);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;

	}

	// Convert ResultSet to Menu Object
	private Menu getMenuByResultSet(ResultSet res) throws SQLException {

		int menuId = res.getInt("menuId");
		int restaurantId = res.getInt("restaurantId");
		String itemName = res.getString("itemName");
		String description = res.getString("description");
		BigDecimal price = res.getBigDecimal("price");
		boolean isAvailable = res.getBoolean("isAvailable");
		String category = res.getString("category");
		Timestamp createdAt = res.getTimestamp("createdAt");
		Timestamp updatedAt = res.getTimestamp("updatedAt");
		Timestamp deletedAt = res.getTimestamp("deletedAt");
		String imagePath = res.getString("imagePath");

		Menu m = new Menu(menuId, restaurantId, itemName, description, price, isAvailable, category, createdAt,
				updatedAt, deletedAt, imagePath);

		return m;

	}

}
