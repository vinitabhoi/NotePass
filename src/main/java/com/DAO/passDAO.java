package com.DAO;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entities.Pass;
import com.entities.Post;


public class passDAO {
	private Connection conn;
	
	
	public passDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean AddPassword(String acc, int len, int usid, String password)
	{
		boolean f=false;
		
		try {
			
			String qu="insert into pass(account,length,usid,password) values(?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(qu);
			ps.setString(1, acc);
			ps.setInt(2, len);
			ps.setInt(3, usid);
			ps.setString(4, password);
			int i=ps.executeUpdate();
			if(i==1)
			{
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	
	public List<Pass> getData(int id)
	{
		List<Pass> list=new ArrayList<Pass>();
		Pass pa=null;
		try {
			
			String qu="select * from pass where usid=? order by id DESC";
			PreparedStatement ps=conn.prepareStatement(qu);
			ps.setInt(1, id);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				pa=new Pass();
				pa.setId(rs.getInt(1));
				pa.setAccount(rs.getString(2));
				pa.setLength(rs.getInt(3));
				pa.setPassword(rs.getString(5));
				list.add(pa);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	public Pass getDataById(int passId)
	{
		Pass p=null;
		
		try {
			String qu="select * from pass where id=?";
			
			PreparedStatement ps=conn.prepareStatement(qu);
			ps.setInt(1, passId);
			
			ResultSet rs=ps.executeQuery();
			
			if(rs.next())
			{
				p=new Pass();
				p.setId(rs.getInt(1));
				p.setAccount(rs.getString(2));
				p.setPassword(rs.getString(5));
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return p;
	}
	
public boolean EncryptDecrypt(int nid, String password) {
	boolean f=false;
	
	try {
		String qu="update pass set password=? where id=?";
		PreparedStatement ps=conn.prepareStatement(qu);
		ps.setInt(1, nid);
		ps.setString(2, password);
		int i=ps.executeUpdate();
		
		if(i==1)
		{
			f=true;
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	} 
	return f;
}

public boolean DeletePassword(int nid)
{
	boolean f=false;
	
	try {
		
		String qu="delete from pass where id=?";
		PreparedStatement ps=conn.prepareStatement(qu);
		ps.setInt(1, nid);
		int x=ps.executeUpdate();
		if(x==1)
		{
			f=true;
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	return f;
}

}













