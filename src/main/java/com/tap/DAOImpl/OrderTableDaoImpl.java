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

import com.tap.DAO.OrderTableDao;
import com.tap.model.OrderTable;
import com.tap.utility.DBConnection;

public class OrderTableDaoImpl implements OrderTableDao {

	// SQL Queries
	public static final String INSERT_QUERY = "INSERT INTO ordertable(userId, restaurantId, totalAmount, status, paymentMethod) VALUES(?,?,?,?,?)";

	private static final String UPDATE_QUERY = "UPDATE ordertable SET userId = ?, restaurantId = ?, totalAmount = ?, status = ?, paymentMethod = ? WHERE orderId = ?";

	private static final String DELETE_QUERY = "DELETE FROM ordertable WHERE orderId = ?";

	private static final String SELECT_QUERY = "SELECT * FROM ordertable WHERE orderId = ?";

	private static final String SELECT_QUERY02 = "SELECT * FROM ordertable";

	private static final String SELECT_QUERY03 = "SELECT * FROM ordertable WHERE userId = ? ORDER BY orderDate DESC";

	// Add OrderTable
	@Override
	public int addOrderTable(OrderTable o) {

		int orderId = 0;

		try (Connection connection = DBConnection.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(INSERT_QUERY, Statement.RETURN_GENERATED_KEYS);) {

			pstmt.setInt(1, o.getUserId());
			pstmt.setInt(2, o.getRestaurantId());
			pstmt.setBigDecimal(3, o.getTotalAmount());
			pstmt.setString(4, o.getStatus());
			pstmt.setString(5, o.getPaymentMethod());

			int i = pstmt.executeUpdate();
			System.out.println(i);

			ResultSet res = pstmt.getGeneratedKeys();
			if (res.next()) {
				orderId = res.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return orderId;

	}

	// Update OrderTable
	@Override
	public void updateOrderTable(OrderTable o) {

		try (Connection connection = DBConnection.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(UPDATE_QUERY);) {

			pstmt.setInt(1, o.getUserId());
			pstmt.setInt(2, o.getRestaurantId());
			pstmt.setBigDecimal(3, o.getTotalAmount());
			pstmt.setString(4, o.getStatus());
			pstmt.setString(5, o.getPaymentMethod());
			pstmt.setInt(6, o.getOrderId());

			int i = pstmt.executeUpdate();
			System.out.println(i);

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// Delete OrderTable
	@Override
	public void deleteOrderTable(int id) {

		try (Connection connection = DBConnection.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(DELETE_QUERY);) {

			pstmt.setInt(1, id);

			int i = pstmt.executeUpdate();
			System.out.println(i);

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// Get OrderTable By ID
	@Override
	public OrderTable getOrderTable(int id) {

		OrderTable o = null;

		try (Connection connection = DBConnection.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(SELECT_QUERY);) {

			pstmt.setInt(1, id);

			ResultSet res = pstmt.executeQuery();

			while (res.next()) {
				o = getOrderTableByResultSet(res);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return o;
	}

	// Get All OrderTable
	@Override
	public List<OrderTable> getAllOrderTable() {

		ArrayList<OrderTable> list = new ArrayList<OrderTable>();

		try (Connection connection = DBConnection.getConnection(); Statement stmt = connection.createStatement();) {

			ResultSet res = stmt.executeQuery(SELECT_QUERY02);

			while (res.next()) {
				OrderTable o = getOrderTableByResultSet(res);
				list.add(o);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;

	}

	@Override
	public List<OrderTable> getOrdersByUserId(int userId) {

		List<OrderTable> list = new ArrayList<>();

		try (Connection connection = DBConnection.getConnection();

				PreparedStatement pstmt = connection.prepareStatement(SELECT_QUERY03);) {

			pstmt.setInt(1, userId);

			ResultSet res = pstmt.executeQuery();

			while (res.next()) {

				list.add(getOrderTableByResultSet(res));

			}

		}

		catch (SQLException e) {

			e.printStackTrace();

		}

		return list;

	}

	// Convert ResultSet to OrderTable Object
	private OrderTable getOrderTableByResultSet(ResultSet res) throws SQLException {

		int orderId = res.getInt("orderId");
		int userId = res.getInt("userId");
		int restaurantId = res.getInt("restaurantId");
		Timestamp orderDate = res.getTimestamp("orderDate");
		BigDecimal totalAmount = res.getBigDecimal("totalAmount");
		String status = res.getString("status");
		String paymentMethod = res.getString("paymentMethod");

		OrderTable o = new OrderTable(orderId, userId, restaurantId, orderDate, totalAmount, status, paymentMethod);

		return o;

	}

}
