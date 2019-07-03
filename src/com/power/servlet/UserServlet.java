package com.power.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import com.power.pojo.User;
import com.power.service.UserService;

@WebServlet(name="userServlet",urlPatterns="/userServlet")
public class UserServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	UserService userService=new UserService();
	
	public UserServlet(){
		super();
	}
	
	protected  void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String type=request.getParameter("type");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		if(type.equals("loginValidate")){
			User user=userService.getUserByNo(request.getParameter("no"));
			if(user==null){
				out.write("400");
			}else if(user.getPassword().equals(request.getParameter("password"))){
				HttpSession session=request.getSession();
				session.setAttribute("user", user);
				out.write("200_"+user.getName());
			}else{
				out.write("500");
			}
		}else if(type.equals("registerValidate")){
			User findUser = userService.getUserByNo(request.getParameter("no"));
			if (findUser == null) {
				Integer result=userService.addUser(request);
				findUser=userService.getUserByNo(request.getParameter("no"));
				request.getSession().setAttribute("user", findUser);
				if(result==1){
					out.write("200");
				}else{
					out.write("300");
				}
			} else {
				out.write("400");
			}
		} else if (type.equals("updates") ) {
			User findUser = userService.getUserByNo(request.getParameter("no"));
			response.getWriter().write(JSONObject.fromObject(findUser).toString());
		}
		
		else if(type.equals("exitUser")){
			request.getSession().removeAttribute("user");
			response.sendRedirect("index.jsp");
		} else if (type.equals("del")) {
			String no = request.getParameter("no");
			Integer result= userService.delete(no);
			if(result==1){
				out.write("1");
			}else{
				out.write("0");
			}
		} else if (type.equals("add")) {
			String no = request.getParameter("no");
			String noh = request.getParameter("noh");
			if (noh != null && !"".equals(noh)) {
				Integer result = userService.update(request);
				if(result==1){
					out.write("3");
				}else{
					out.write("4");
				}
			} else {
			User user = userService.getUserByNo(no);
			if (user != null) {
				out.write("2");
			} else {
			Integer result= userService.addUser(request);
			if(result==1){
				out.write("1");
			}else{
				out.write("0");
			}
			}
			}
		}
		else if (type.equals("query")) {
			Map params = new HashMap();
			params.put("curPage", request.getParameter("curPage")==null?"1":request.getParameter("curPage"));
			String name = request.getParameter("name");
			if (name != null && !"".equals(name)) {
				params.put("name", new String(name.getBytes("ISO8859-1"),"UTF-8"));
			}
			
			
			
			HttpSession session=request.getSession();
			User user = (User) session.getAttribute("user");
			params.put("curUserid", user.getId());
			List<User> list = userService.findUserList(params);
			request.setAttribute("name", name);
			request.setAttribute("userList", list);
			request.setAttribute("curPage", request.getParameter("curPage")==null?"1":request.getParameter("curPage"));
			int total = userService.findUserListCount(params);
			int pages = total / 10;
			if (total % 10 != 0) {
				pages = pages +1;
			}
			request.setAttribute("total", pages);
			try {
				request.getRequestDispatcher("user.jsp").forward(request, response);
			} catch (ServletException e) {
				e.printStackTrace();
			}
			
		}
	}
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException{
		this.doGet(request, response);
	}
	
}
