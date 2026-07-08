package com.tap.DAOImpl;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.OrderItemDao;
import com.tap.model.OrderItem;
import com.tap.utility.DBConnection;

public class OrderItemDaoImpl implements OrderItemDao {

	// SQL Queries
	public static final String INSERT_QUERY = "INSERT INTO orderitem(orderId, menuId, quantity, itemTotal) VALUES(?,?,?,?)";

	private static final String UPDATE_QUERY = "UPDATE orderitem SET orderId = ?, menuId = ?, quantity = ?, itemTotal = ? WHERE orderItemId = ?";

	private static final String DELETE_QUERY = "DELETE FROM orderitem WHERE orderItemId = ?";

	private static final String SELECT_QUERY = "SELECT * FROM orderitem WHERE orderItemId = ?";

	private static final String SELECT_QUERY02 = "SELECT * FROM orderitem";

	// Add OrderItem
	@Override
	public void addOrderItem(OrderItem oi) {

		try (Connection connection = DBConnection.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(INSERT_QUERY);) {

			pstmt.setInt(1, oi.getOrderId());
			pstmt.setInt(2, oi.getMenuId());
			pstmt.setInt(3, oi.getQuantity());
			pstmt.setBigDecimal(4, oi.getItemTotal());

			int i = pstmt.executeUpdate();
			System.out.println(i);

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	// Update OrderItem
	@Override
	public void updateOrderItem(OrderItem oi) {

		try (Connection connection = DBConnection.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(UPDATE_QUERY);) {

			pstmt.setInt(1, oi.getOrderId());
			pstmt.setInt(2, oi.getMenuId());
			pstmt.setInt(3, oi.getQuantity());
			pstmt.setBigDecimal(4, oi.getItemTotal());
			pstmt.setInt(5, oi.getOrderItemId());

			int i = pstmt.executeUpdate();
			System.out.println(i);

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	// Delete OrderItem
	@Override
	public void deleteOrderItem(int id) {

		try (Connection connection = DBConnection.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(DELETE_QUERY);) {

			pstmt.setInt(1, id);

			int i = pstmt.executeUpdate();
			System.out.println(i);

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	// Get OrderItem By ID
	@Override
	public OrderItem getOrderItem(int id) {

		OrderItem oi = null;

		try (Connection connection = DBConnection.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(SELECT_QUERY);) {

			pstmt.setInt(1, id);
			ResultSet res = pstmt.executeQuery();

			while (res.next()) {
				oi = getOrderItemByResultSet(res);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return oi;

	}

	// Get All OrderItem
	@Override
	public List<OrderItem> getAllOrderItem() {

		List<OrderItem> list = new ArrayList<OrderItem>();

		try (Connection connection = DBConnection.getConnection(); Statement stmt = connection.createStatement();) {

			ResultSet res = stmt.executeQuery(SELECT_QUERY02);

			while (res.next()) {
				OrderItem oi = getOrderItemByResultSet(res);
				list.add(oi);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;

	}

	// Convert ResultSet to OrderItem Object
	private OrderItem getOrderItemByResultSet(ResultSet res) throws SQLException {

		int orderItemId = res.getInt("orderItemId");
		int orderId = res.getInt("orderId");
		int menuId = res.getInt("menuId");
		int quantity = res.getInt("quantity");
		BigDecimal itemTotal = res.getBigDecimal("itemTotal");

		OrderItem oi = new OrderItem(orderItemId, orderId, menuId, quantity, itemTotal);

		return oi;

	}

}
