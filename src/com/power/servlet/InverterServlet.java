package com.power.servlet;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.power.pojo.Inverter;
import com.power.service.InverterService;

import net.sf.json.JSONArray;

@WebServlet(name="inverterServlet",urlPatterns="/inverterServlet")
public class InverterServlet extends HttpServlet{
	
	public InverterServlet(){
		super();
	}
	private	InverterService inverterService=new InverterService();
	
	protected  void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		String type=request.getParameter("type");
		request.setCharacterEncoding("utf-8");    
		response.setCharacterEncoding("utf-8");
		PrintWriter out=response.getWriter();
		if(type.equals("getVoltageOfInverter")){
			String startDate=request.getParameter("startDate");
			String endDate=request.getParameter("endDate");
			List<Inverter> inverterList=inverterService.getInverterListFromDatabase(startDate, endDate);
			List<List<Object>> voltageList=inverterService.getVoltageListOfInverter(inverterList);
			out.write(JSONArray.fromObject(voltageList).toString());
		}else if(type.equals("getCurrentOfInverter")){
			String startDate=request.getParameter("startDate");
			String endDate=request.getParameter("endDate");
			List<Inverter> inverterList=inverterService.getInverterListFromDatabase(startDate, endDate);
			List<List<Object>> currentList=inverterService.getCurrentListOfInverter(inverterList);
			out.write(JSONArray.fromObject(currentList).toString());
		}else if(type.equals("getPowerOfInverter")){
			String startDate=request.getParameter("startDate");
			String endDate=request.getParameter("endDate");
			List<Inverter> inverterList=inverterService.getInverterListFromDatabase(startDate, endDate);
			List<List<Object>> powerList=inverterService.getPowerListOfInverter(inverterList);
			out.write(JSONArray.fromObject(powerList).toString());
		}else if(type.equals("getDayConsumeOfInverter")){
			String startDate=request.getParameter("startDate");
			String endDate=request.getParameter("endDate");
			List<Inverter> inverterList=inverterService.getInverterListFromDatabase(startDate, endDate);
			List<List<Object>> dayConsumeList=inverterService.getDayConsumeListOfInverter(inverterList);
			out.write(JSONArray.fromObject(dayConsumeList).toString());
		}else if(type.equals("getMonthConsumeOfInverter")){
			String startDate=request.getParameter("startDate");
			String endDate=request.getParameter("endDate");
			List<Inverter> inverterList=inverterService.getInverterListFromDatabase(startDate, endDate);
			List<List<Object>> monthConsumeList=inverterService.getMonthConsumeListOfInverter(inverterList);
			out.write(JSONArray.fromObject(monthConsumeList).toString());
		}else if(type.equals("getAllConsumeOfInverter")){
			String startDate=request.getParameter("startDate");
			String endDate=request.getParameter("endDate");
			List<Inverter> inverterList=inverterService.getInverterListFromDatabase(startDate, endDate);
			List<List<Object>> allConsumeList=inverterService.getAllConsumeListOfInverter(inverterList);
			out.write(JSONArray.fromObject(allConsumeList).toString());
		}else if(type.equals("getExcelOfInverter")){
			String startDate=request.getParameter("startDate");
			String endDate=request.getParameter("endDate"); 
			List<Inverter> list=inverterService.getInverterListFromDatabase(startDate, endDate);
		        Map<String,String> headMap = new LinkedHashMap<String,String>();
		        headMap.put("voltage","输出电压(v)");
		        headMap.put("current","输出电流(A)");
		        headMap.put("power","输出功率(w)");
		        headMap.put("dayConsume","日耗电量(kw.h)");
		        headMap.put("monthConsume","月耗电量(kw.h)");
		        headMap.put("allConsume","总耗电量(kw.h)"); 
		        headMap.put("timestr","日期");
		        String fileName="逆变器参数.xlsx";
		        OutputStream outPutStream = new FileOutputStream("D://"+fileName);
		        inverterService.exportExcel(headMap,list,outPutStream);
		        inverterService.excelToServlet(response, fileName);
		}
	}
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		this.doGet(request, response);
	}
	
}
