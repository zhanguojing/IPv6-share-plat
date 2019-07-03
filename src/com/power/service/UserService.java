package com.power.service;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.power.pojo.User;
import com.power.util.JdbcUtil;

public class UserService {
	// 通过no获取客户信息
		public User getUserByNo(String no) {
			String sql = "select * from user where no=?";
			User user = null;
			try {
				PreparedStatement ps = JdbcUtil.getConnection().prepareStatement(sql);
				ps.setInt(1, Integer.valueOf(no));
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					user = new User();
					user.setId(rs.getInt("id"));
					user.setNo(rs.getInt("no"));
					user.setName(rs.getString("name"));
					user.setPassword(rs.getString("password"));
					user.setSex(rs.getString("sex"));
					user.setLevel(rs.getInt("level"));
					break;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return user;
		}

		// 添加用户信息
		public Integer addUser(HttpServletRequest request) {
			String sql = "insert into user(no,name,password,sex,level)values(?,?,?,?,?)";
			Integer result = 0;
			try {
				PreparedStatement ps = JdbcUtil.getConnection().prepareStatement(sql);
				ps.setInt(1, Integer.valueOf(request.getParameter("no")));
				ps.setString(2, request.getParameter("name"));
				ps.setString(3, request.getParameter("password"));
				  //String  name= request.getParameter("name");
				 // String sex2=request.getParameter("sex");
				  
				//String sex = request.getParameter("sex");
				//sex= URLDecoder.decode(URLDecoder.decode(sex,"utf-8"),"utf-8");
				ps.setString(4, "null");
				ps.setInt(5, 2);
				result = ps.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return result;
		}

		// 生成新客户信息的账号
		public Integer getNewUserNo() {
			Integer no = null;
			try {
				String sql = "select Max(no) from user";
				PreparedStatement ps = JdbcUtil.getConnection().prepareStatement(sql);
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					no = rs.getInt(1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			if (no == null || no == 0) {
				no = 1;
			} else {
				no++;
			}
			return no;
		}

		public List<User> findUserList(Map params) {
			String sql = "select * from user where 1=1 and no != "+params.get("curUserid");
			String name = (String) params.get("name");
			if (name != null && !"".equals(name)) {
				sql += " and name like '%"+name+"%' ";
			}
			sql +=" limit "+((Integer.parseInt(params.get("curPage").toString()) - 1)*10)+",10";
			User user = null;
			List<User> userList = new ArrayList<User>();
			try {
				PreparedStatement ps = JdbcUtil.getConnection().prepareStatement(sql);
				ResultSet rs = ps.executeQuery();
				
				while (rs.next()) {
					user = new User();
					user.setId(rs.getInt("id"));
					user.setNo(rs.getInt("no"));
					user.setName(rs.getString("name"));
					user.setPassword(rs.getString("password"));
					user.setSex(rs.getString("sex"));
					user.setLevel(rs.getInt("level"));
					userList.add(user);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return userList;
		}

		public int findUserListCount(Map params) {
			String sql = "select count(*) as cnt from user where 1=1 and no != "+params.get("curUserid");
			String name = (String) params.get("name");
			if (name != null && !"".equals(name)) {
				sql += " and name like '%"+name+"%' ";
			}
			User user = null;
			List<User> userList = new ArrayList<User>();
			try {
				PreparedStatement ps = JdbcUtil.getConnection().prepareStatement(sql);
				ResultSet rs = ps.executeQuery();
				
				while (rs.next()) {
					return rs.getInt("cnt");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return 0;
		}

		public Integer delete(String no) {
			String sql = "delete from user where no=?";
			User user = null;
			try {
				PreparedStatement ps = JdbcUtil.getConnection().prepareStatement(sql);
				ps.setInt(1, Integer.valueOf(no));
				return ps.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return 0;
		}

		public Integer update(HttpServletRequest request) throws UnsupportedEncodingException {
			String sql = "update user set name=?,sex=?,level=?,password=? where no=?";
			Integer result = 0;
			try {
				PreparedStatement ps = JdbcUtil.getConnection().prepareStatement(sql);
				ps.setString(1, request.getParameter("name"));
				String sex = request.getParameter("sex");
				//sex = new String(sex.getBytes(),"UTF-8");
				sex= URLDecoder.decode(URLDecoder.decode(sex,"utf-8"),"utf-8");
				ps.setString(2, sex);			
				ps.setInt(3, Integer.valueOf(request.getParameter("level")));
				ps.setString(4, request.getParameter("password"));
				ps.setInt(5, Integer.valueOf(request.getParameter("no")));
				
				result = ps.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return result;
		}
}
