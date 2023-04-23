package com.pharmacy_mgt.entity;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.pharmacy_mgt_sys.dao.Connection_postgre;

public class Product {

	String product_name;
	String product_id;
	String type;
	String Category;
	String Manufacturer;
	String date;
	int quantity;
	BigDecimal cost;

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getProduct_id() {
		return product_id;
	}

	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getCategory() {
		return Category;
	}

	public void setCategory(String category) {
		Category = category;
	}

	public String getManufacturer() {
		return Manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		Manufacturer = manufacturer;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public BigDecimal getCost() {
		return cost;
	}

	public void setCost(BigDecimal cost) {
		this.cost = cost;
	}

	@Override
	public String toString() {
		return "Product [product_name=" + product_name + ", product_id=" + product_id + ", type=" + type + ", Category="
				+ Category + ", Manufacturer=" + Manufacturer + ", date=" + date + ", quantity=" + quantity + ", cost="
				+ cost + "]";
	}

	public  void insert(String product_name, String product_id, String type, String Category, String Manufacturer,
			String date, int quantity, BigDecimal cost) throws SQLException {
		
		this.product_name = product_name;
		this.product_id = product_id;
		this.type = type;
		this.Category = Category;
		this.Manufacturer = Manufacturer;
		this.date = date;
		this.quantity = quantity;
		this.cost = cost;
		
		Connection_postgre app = new Connection_postgre();
        Connection con=app.connect();
        
        
        String INSERT_USERS_SQL = "INSERT INTO products" + "  (product_name, product_id, type,category,manufacturer,expiration_date,quantity,cost) VALUES "
    			+ " (?, ?, ?, ?, ?, ?, ?, ?);";
        
        PreparedStatement preparedStatement = con.prepareStatement(INSERT_USERS_SQL);

        preparedStatement.setString(1, product_name);
        preparedStatement.setString(2, product_id);
        preparedStatement.setString(3, type);
        preparedStatement.setString(4, Category);
        preparedStatement.setString(5, Manufacturer);
        preparedStatement.setString(6, date);
        preparedStatement.setInt(7, quantity);
        preparedStatement.setBigDecimal(8, cost);
        System.out.println(preparedStatement);
        preparedStatement.executeUpdate();
        con.close();

        
        
		

	}

}
