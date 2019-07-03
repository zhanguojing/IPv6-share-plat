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

import com.power.pojo.SolarController;
import com.power.service.SolarControllerService;

import net.sf.json.JSONArray;

@WebServlet(name="solarControllerServlet",urlPatterns="/solarControllerServlet")
public class SolarControllerServlet extends HttpServlet{
	
	public SolarControllerServlet(){
		super();
	}
	private	SolarControllerService solarControllerService=new SolarControllerService();
	
	protected  void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		String type=request.getParameter("type");
		request.setCharacterEncoding("utf-8");    
		response.setCharacterEncoding("utf-8");
		PrintWriter out=response.getWriter();
		if(type.equals("getVoltageOfSolarController")){
			String startDate=request.getParameter("startDate");
			String endDate=request.getParameter("endDate");
			List<SolarController> solarControllerList=solarControllerService.getSolarControllerListFromDatabase(startDate, endDate);
			List<List<Object>> voltageList=solarControllerService.getVoltageListOfSolarController(solarControllerList);
			out.write(JSONArray.fromObject(voltageList).toString());
		}else if(type.equals("getInputCurrentOfSolarController")){
			String startDate=request.getParameter("startDate");
			String endDate=request.getParameter("endDate");
			List<SolarController> solarControllerList=solarControllerService.getSolarControllerListFromDatabase(startDate, endDate);
			List<List<Object>> inputCurrentList=solarControllerService.getInputCurrentListOfSolarController(solarControllerList);
			out.write(JSONArray.fromObject(inputCurrentList).toString());
		}else if(type.equals("getOutputCurrentOfSolarController")){
			String startDate=request.getParameter("startDate");
			String endDate=request.getParameter("endDate");
			List<SolarController> solarControllerList=solarControllerService.getSolarControllerListFromDatabase(startDate, endDate);
			List<List<Object>> outputCurrentList=solarControllerService.getOutputCurrentListOfSolarController(solarControllerList);
			out.write(JSONArray.fromObject(outputCurrentList).toString());
		}else if(type.equals("getDischargeCurrentOfSolarController")){
			String startDate=request.getParameter("startDate");
			String endDate=request.getParameter("endDate");
			List<SolarController> solarControllerList=solarControllerService.getSolarControllerListFromDatabase(startDate, endDate);
			List<List<Object>> dischargeCurrentList=solarControllerService.getDischargeCurrentListOfSolarController(solarControllerList);
			out.write(JSONArray.fromObject(dischargeCurrentList).toString());
		}else if(type.equals("getDayGenerationOfSolarController")){
			String startDate=request.getParameter("startDate");
			String endDate=request.getParameter("endDate");
			List<SolarController> solarControllerList=solarControllerService.getSolarControllerListFromDatabase(startDate, endDate);
			List<List<Object>> dayGenerationList=solarControllerService.getDayGenerationListOfSolarController(solarControllerList);
			out.write(JSONArray.fromObject(dayGenerationList).toString());
		}else if(type.equals("getMonthGenerationOfSolarController")){
			String startDate=request.getParameter("startDate");
			String endDate=request.getParameter("endDate");
			List<SolarController> solarControllerList=solarControllerService.getSolarControllerListFromDatabase(startDate, endDate);
			List<List<Object>> monthGenerationList=solarControllerService.getMonthGenerationListOfSolarController(solarControllerList);
			out.write(JSONArray.fromObject(monthGenerationList).toString());
		}else if(type.equals("getAllGenerationOfSolarController")){
			String startDate=request.getParameter("startDate");
			String endDate=request.getParameter("endDate");
			List<SolarController> solarControllerList=solarControllerService.getSolarControllerListFromDatabase(startDate, endDate);
			List<List<Object>> allGenerationList=solarControllerService.getAllGenerationListOfSolarController(solarControllerList);
			out.write(JSONArray.fromObject(allGenerationList).toString());
		}else if(type.equals("getAllRuntimeOfSolarController")){
			String startDate=request.getParameter("startDate");
			String endDate=request.getParameter("endDate");
			List<SolarController> solarControllerList=solarControllerService.getSolarControllerListFromDatabase(startDate, endDate);
			List<List<Object>> allRuntimeList=solarControllerService.getAllRuntimeListOfSolarController(solarControllerList);
			out.write(JSONArray.fromObject(allRuntimeList).toString());
		}else if(type.equals("getExcelOfSolarController")){
			String startDate=request.getParameter("startDate");
			String endDate=request.getParameter("endDate"); 
			List<SolarController> list=solarControllerService.getSolarControllerListFromDatabase(startDate, endDate);
		        Map<String,String> headMap = new LinkedHashMap<String,String>();
		        headMap.put("voltage","电池电压(v)");
		        headMap.put("inputCurrent","光伏输入电流(A)");
		        headMap.put("outputCurrent","负载输出电流(A)");
		        headMap.put("dischargeCurrent","充放电电流(A)");
		        headMap.put("dayGeneration","日发电量(kw.h)");
		        headMap.put("monthGeneration","月发电量(kw.h)"); 
		        headMap.put("allGeneration","总发电量(kw.h)");
		        headMap.put("allRuntime","总运行时间");
		        headMap.put("timestr","日期");
		        String fileName="太阳能控制器参数.xlsx";
		        OutputStream outPutStream = new FileOutputStream("D://"+fileName);
		        solarControllerService.exportExcel(headMap,list,outPutStream);
		        solarControllerService.excelToServlet(response, fileName);
		}
	}
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		this.doGet(request, response);
	}
	
}
