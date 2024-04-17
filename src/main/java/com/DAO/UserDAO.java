package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entities.*;

public class UserDAO {

	private Connection conn;

	public UserDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean userRegister(User us) {
		boolean f = false;
		try {

			String qu = "insert into user(name, email, password) values(?,?,?)";
			PreparedStatement ps = conn.prepareStatement(qu);
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPassword());

			ps.execute();
			f = true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public User loginUser(User us)
	{
		 User user=null;
		try {
			String query="select * from user where email=? and password=?";
			PreparedStatement ps=conn.prepareStatement(query);
			ps.setString(1, us.getEmail());
			ps.setString(2, us.getPassword());
			ResultSet rs=ps.executeQuery();
			
			if(rs.next())
			{
				user=new User();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}
	
	
	
}
