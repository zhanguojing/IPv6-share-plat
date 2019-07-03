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

import com.power.pojo.LoadConsumption;
import com.power.service.LoadConsumptionService;


import net.sf.json.JSONArray;

@WebServlet(name="loadConsumptionServlet",urlPatterns="/loadConsumptionServlet")
public class LoadConsumptionServlet extends HttpServlet{
	
	public LoadConsumptionServlet(){
		super();
	}
	private	LoadConsumptionService loadConsumptionService=new LoadConsumptionService();
	
	protected  void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		String type=request.getParameter("type");
		request.setCharacterEncoding("utf-8");    
		response.setCharacterEncoding("utf-8");
		PrintWriter out=response.getWriter();
		if(type.equals("getVoltageOfLoadConsumption")){
			String startDate=request.getParameter("startDate");
			String endDate=request.getParameter("endDate");
			List<LoadConsumption> loadConsumptionList=loadConsumptionService.getLoadConsumptionListFromDatabase(startDate, endDate);
			List<List<Object>> voltageList=loadConsumptionService.getVoltageListOfLoadConsumption(loadConsumptionList);
			out.write(JSONArray.fromObject(voltageList).toString());
		}else if(type.equals("getCurrentOfLoadConsumption")){
			String startDate=request.getParameter("startDate");
			String endDate=request.getParameter("endDate");
			List<LoadConsumption> loadConsumptionList=loadConsumptionService.getLoadConsumptionListFromDatabase(startDate, endDate);
			List<List<Object>> currentList=loadConsumptionService.getCurrentListOfLoadConsumption(loadConsumptionList);
			out.write(JSONArray.fromObject(currentList).toString());
		}else if(type.equals("getPowerOfLoadConsumption")){
			String startDate=request.getParameter("startDate");
			String endDate=request.getParameter("endDate");
			List<LoadConsumption> loadConsumptionList=loadConsumptionService.getLoadConsumptionListFromDatabase(startDate, endDate);
			List<List<Object>> powerList=loadConsumptionService.getPowerListOfLoadConsumption(loadConsumptionList);
			out.write(JSONArray.fromObject(powerList).toString());
		}else if(type.equals("getDayConsumeOfLoadConsumption")){
			String startDate=request.getParameter("startDate");
			String endDate=request.getParameter("endDate");
			List<LoadConsumption> loadConsumptionList=loadConsumptionService.getLoadConsumptionListFromDatabase(startDate, endDate);
			List<List<Object>> dayConsumeList=loadConsumptionService.getDayConsumeListOfLoadConsumption(loadConsumptionList);
			out.write(JSONArray.fromObject(dayConsumeList).toString());
		}else if(type.equals("getMonthConsumeOfLoadConsumption")){
			String startDate=request.getParameter("startDate");
			String endDate=request.getParameter("endDate");
			List<LoadConsumption> loadConsumptionList=loadConsumptionService.getLoadConsumptionListFromDatabase(startDate, endDate);
			List<List<Object>> monthConsumeList=loadConsumptionService.getMonthConsumeListOfLoadConsumption(loadConsumptionList);
			out.write(JSONArray.fromObject(monthConsumeList).toString());
		}else if(type.equals("getAllConsumeOfLoadConsumption")){
			String startDate=request.getParameter("startDate");
			String endDate=request.getParameter("endDate");
			List<LoadConsumption> loadConsumptionList=loadConsumptionService.getLoadConsumptionListFromDatabase(startDate, endDate);
			List<List<Object>> allConsumeList=loadConsumptionService.getAllConsumeListOfLoadConsumption(loadConsumptionList);
			out.write(JSONArray.fromObject(allConsumeList).toString());
		}else if(type.equals("getExcelOfLoadConsumption")){
			String startDate=request.getParameter("startDate");
			String endDate=request.getParameter("endDate"); 
			List<LoadConsumption> list=loadConsumptionService.getLoadConsumptionListFromDatabase(startDate, endDate);
		        Map<String,String> headMap = new LinkedHashMap<String,String>();
		        headMap.put("voltage","输出电压(v)");
		        headMap.put("current","输出电流(A)");
		        headMap.put("power","输出功率(w)");
		        headMap.put("dayConsume","日耗电量(kw.h)");
		        headMap.put("monthConsume","月耗电量(kw.h)");
		        headMap.put("allConsume","总耗电量(kw.h)"); 
		        headMap.put("timestr","日期");
		        String fileName="负载.xlsx";
		        OutputStream outPutStream = new FileOutputStream("D://"+fileName);
		        loadConsumptionService.exportExcel(headMap,list,outPutStream);
		        loadConsumptionService.excelToServlet(response, fileName);
		}
	}
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		this.doGet(request, response);
	}
	
}
