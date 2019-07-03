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

import com.power.pojo.EnvironmentalParameters;
import com.power.service.EnvironmentalParametersService;

import net.sf.json.JSONArray;

@WebServlet(name="environmentalParametersServlet",urlPatterns="/environmentalParametersServlet")
public class EnvironmentalParametersServlet extends HttpServlet{
	
	public EnvironmentalParametersServlet(){
		super();
	}
	private	EnvironmentalParametersService environmentalParametersService=new EnvironmentalParametersService();
	
	protected  void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		String type=request.getParameter("type");
		request.setCharacterEncoding("utf-8");    
		response.setCharacterEncoding("utf-8");
		PrintWriter out=response.getWriter();
		if(type.equals("getIlluminanceOfEnvironmentalParameters")){
			String startDate=request.getParameter("startDate");
			String endDate=request.getParameter("endDate");
			List<EnvironmentalParameters> environmentalParametersList=environmentalParametersService.getEnvironmentalParametersListFromDatabase(startDate, endDate);
			List<List<Object>> illuminanceList=environmentalParametersService.getIlluminanceListOfEnvironmentalParameters(environmentalParametersList);
			out.write(JSONArray.fromObject(illuminanceList).toString());
		}else if(type.equals("getWindSpeedOfEnvironmentalParameters")){
			String startDate=request.getParameter("startDate");
			String endDate=request.getParameter("endDate");
			List<EnvironmentalParameters> environmentalParametersList=environmentalParametersService.getEnvironmentalParametersListFromDatabase(startDate, endDate);
			List<List<Object>> windSpeedList=environmentalParametersService.getWindSpeedListOfEnvironmentalParameters(environmentalParametersList);
			out.write(JSONArray.fromObject(windSpeedList).toString());
		}else if(type.equals("getTemperatureOfEnvironmentalParameters")){
			String startDate=request.getParameter("startDate");
			String endDate=request.getParameter("endDate");
			List<EnvironmentalParameters> environmentalParametersList=environmentalParametersService.getEnvironmentalParametersListFromDatabase(startDate, endDate);
			List<List<Object>> temperatureList=environmentalParametersService.getTemperatureListOfEnvironmentalParameters(environmentalParametersList);
			out.write(JSONArray.fromObject(temperatureList).toString());
		}else if(type.equals("getExcelOfEnvironmentalParameters")){
			String startDate=request.getParameter("startDate");
			String endDate=request.getParameter("endDate"); 
			List<EnvironmentalParameters> list=environmentalParametersService.getEnvironmentalParametersListFromDatabase(startDate, endDate);
		        Map<String,String> headMap = new LinkedHashMap<String,String>();
		        headMap.put("illuminance","光照度(LUX)");
		        headMap.put("windSpeed","风速");
		        headMap.put("temperature","温度(℃)"); 
		        headMap.put("timestr","日期");
		        String fileName="环境参数.xlsx";
		        OutputStream outPutStream = new FileOutputStream("D://"+fileName);
		        environmentalParametersService.exportExcel(headMap,list,outPutStream);
		        environmentalParametersService.excelToServlet(response, fileName);
		}
	}
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		this.doGet(request, response);
	}
	
}
