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

import com.power.pojo.ElectricityParameter;
import com.power.service.ElectricityParameterService;

import net.sf.json.JSONArray;

@WebServlet(name="electricityParameterServlet",urlPatterns="/electricityParameterServlet")
public class ElectricityParameterServlet extends HttpServlet{
	
	public ElectricityParameterServlet(){
		super();
	}
	private	ElectricityParameterService electricityParameterService=new ElectricityParameterService();
	
	protected  void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		String type=request.getParameter("type");
		request.setCharacterEncoding("utf-8");    
		response.setCharacterEncoding("utf-8");
		PrintWriter out=response.getWriter();
		if(type.equals("getVoltageOfElectricityParameter")){
			String startDate=request.getParameter("startDate");
			String endDate=request.getParameter("endDate");
			List<ElectricityParameter> electricityParameterList=electricityParameterService.getElectricityParameterListFromDatabase(startDate, endDate);
			List<List<Object>> voltageList=electricityParameterService.getVoltageListOfElectricityParameter(electricityParameterList);
			out.write(JSONArray.fromObject(voltageList).toString());
		}else if(type.equals("getCurrentOfElectricityParameter")){
			String startDate=request.getParameter("startDate");
			String endDate=request.getParameter("endDate");
			List<ElectricityParameter> electricityParameterList=electricityParameterService.getElectricityParameterListFromDatabase(startDate, endDate);
			List<List<Object>> currentList=electricityParameterService.getCurrentListOfElectricityParameter(electricityParameterList);
			out.write(JSONArray.fromObject(currentList).toString());
		}else if(type.equals("getPowerOfElectricityParameter")){
			String startDate=request.getParameter("startDate");
			String endDate=request.getParameter("endDate");
			List<ElectricityParameter> electricityParameterList=electricityParameterService.getElectricityParameterListFromDatabase(startDate, endDate);
			List<List<Object>> powerList=electricityParameterService.getPowerListOfElectricityParameter(electricityParameterList);
			out.write(JSONArray.fromObject(powerList).toString());
		}else if(type.equals("getDaySupplyOfElectricityParameter")){
			String startDate=request.getParameter("startDate");
			String endDate=request.getParameter("endDate");
			List<ElectricityParameter> electricityParameterList=electricityParameterService.getElectricityParameterListFromDatabase(startDate, endDate);
			List<List<Object>> daySupplyList=electricityParameterService.getDaySupplyListOfElectricityParameter(electricityParameterList);
			out.write(JSONArray.fromObject(daySupplyList).toString());
		}else if(type.equals("getMonthSupplyOfElectricityParameter")){
			String startDate=request.getParameter("startDate");
			String endDate=request.getParameter("endDate");
			List<ElectricityParameter> electricityParameterList=electricityParameterService.getElectricityParameterListFromDatabase(startDate, endDate);
			List<List<Object>> monthSupplyList=electricityParameterService.getMonthSupplyListOfElectricityParameter(electricityParameterList);
			out.write(JSONArray.fromObject(monthSupplyList).toString());
		}else if(type.equals("getAllSupplyOfElectricityParameter")){
			String startDate=request.getParameter("startDate");
			String endDate=request.getParameter("endDate");
			List<ElectricityParameter> electricityParameterList=electricityParameterService.getElectricityParameterListFromDatabase(startDate, endDate);
			List<List<Object>> allSupplyList=electricityParameterService.getAllSupplyListOfElectricityParameter(electricityParameterList);
			out.write(JSONArray.fromObject(allSupplyList).toString());
		}else if(type.equals("getExcelOfElectricityParameter")){
			String startDate=request.getParameter("startDate");
			String endDate=request.getParameter("endDate"); 
			List<ElectricityParameter> list=electricityParameterService.getElectricityParameterListFromDatabase(startDate, endDate);
		        Map<String,String> headMap = new LinkedHashMap<String,String>();
		        headMap.put("voltage","输出电压(v)");
		        headMap.put("current","输出电流(A)");
		        headMap.put("power","输出功率(w)");
		        headMap.put("daySupply","日供电量(kw.h)");
		        headMap.put("monthSupply","月供电量(kw.h)");
		        headMap.put("allSupply","总供电量(kw.h)"); 
		        headMap.put("timestr","日期");
		        String fileName="市电参数.xlsx";
		        OutputStream outPutStream = new FileOutputStream("D://"+fileName);
		        electricityParameterService.exportExcel(headMap,list,outPutStream);
		        electricityParameterService.excelToServlet(response, fileName);
		}
	}
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		this.doGet(request, response);
	}
	
}
