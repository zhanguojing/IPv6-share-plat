package com.power.service;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Method;
import java.net.URLEncoder;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.xssf.streaming.SXSSFCell;
import org.apache.poi.xssf.streaming.SXSSFRow;
import org.apache.poi.xssf.streaming.SXSSFSheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;

import com.power.pojo.LoadConsumption;
import com.power.pojo.SolarController;
import com.power.util.JdbcUtil;

public class LoadConsumptionService {
	public List<LoadConsumption> getLoadConsumptionListFromDatabase(String startDate, String endDate) {
		String sql = null;
		PreparedStatement ps = null;
		List<LoadConsumption> list = new LinkedList<LoadConsumption>();
		try {
			if (startDate == null || endDate == null||startDate.equals("")||endDate.equals("")) {
				sql = "SELECT temp.*, DATE_FORMAT(temp.time,'%Y%m%d%H%i') AS timestr  FROM (SELECT * FROM load_consumption ORDER BY TIME DESC LIMIT 0,1000) AS temp ORDER BY TIME ASC";
				ps = JdbcUtil.getConnection().prepareStatement(sql);
			} else {
				sql = "select temp.*, DATE_FORMAT(temp.time,'%Y%m%d%H%i') AS timestr from load_consumption temp where time between ?  and ? order by time asc ";
				ps = JdbcUtil.getConnection().prepareStatement(sql);
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				Date startTime = null;
				Date endTime = null;
				startTime = format.parse(startDate);
				endTime = format.parse(endDate);
				ps.setTimestamp(1, new Timestamp(startTime.getTime()));
				ps.setTimestamp(2, new Timestamp(endTime.getTime()));
				ResultSet rs = ps.executeQuery();
			}
			ResultSet rs = ps.executeQuery();
			SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			while (rs.next()) {
				LoadConsumption loadConsumption = new LoadConsumption();
				loadConsumption.setId(rs.getLong("id"));
				loadConsumption.setVoltage(rs.getDouble("voltage"));
				loadConsumption.setCurrent(rs.getDouble("power"));
				loadConsumption.setPower(rs.getDouble("power"));
				loadConsumption.setDayConsume(rs.getDouble("day_consume"));
				loadConsumption.setMonthConsume(rs.getDouble("month_consume"));
				loadConsumption.setAllConsume(rs.getDouble("all_consume"));
				loadConsumption.setTime(rs.getTimestamp("time"));
				loadConsumption.setTimestr(rs.getString("timestr"));
				list.add(loadConsumption);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public List<List<Object>> getVoltageListOfLoadConsumption(List<LoadConsumption> loadConsumptionList){
		List<List<Object>> list=new LinkedList<List<Object>>();
		SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		for(LoadConsumption loadConsumption:loadConsumptionList){
			List<Object> voltageList=new LinkedList<Object>();
			voltageList.add(format.format(loadConsumption.getTime()));
			voltageList.add(loadConsumption.getVoltage());
			list.add(voltageList);
		}
		return list;
	}
	public List<List<Object>> getCurrentListOfLoadConsumption(List<LoadConsumption> loadConsumptionList){
		List<List<Object>> list=new LinkedList<List<Object>>();
		SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		for(LoadConsumption loadConsumption:loadConsumptionList){
			List<Object> powerList=new LinkedList<Object>();
			powerList.add(format.format(loadConsumption.getTime()));
			powerList.add(loadConsumption.getCurrent());
			list.add(powerList);
		}
		return list;
	}
	public List<List<Object>> getPowerListOfLoadConsumption(List<LoadConsumption> loadConsumptionList){
		List<List<Object>> list=new LinkedList<List<Object>>();
		SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		for(LoadConsumption loadConsumption:loadConsumptionList){
			List<Object> powerList=new LinkedList<Object>();
			powerList.add(format.format(loadConsumption.getTime()));
			powerList.add(loadConsumption.getPower());
			list.add(powerList);
		}
		return list;
	}
	public List<List<Object>> getDayConsumeListOfLoadConsumption(List<LoadConsumption> loadConsumptionList){
		List<List<Object>> list=new LinkedList<List<Object>>();
		SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		for(LoadConsumption loadConsumption:loadConsumptionList){
			List<Object> dayConsumeList=new LinkedList<Object>();
			dayConsumeList.add(format.format(loadConsumption.getTime()));
			dayConsumeList.add(loadConsumption.getDayConsume());
			list.add(dayConsumeList);
		}
		return list;
	}
	public List<List<Object>> getMonthConsumeListOfLoadConsumption(List<LoadConsumption> loadConsumptionList){
		List<List<Object>> list=new LinkedList<List<Object>>();
		SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		for(LoadConsumption loadConsumption:loadConsumptionList){
			List<Object> monthConsumeList=new LinkedList<Object>();
			monthConsumeList.add(format.format(loadConsumption.getTime()));
			monthConsumeList.add(loadConsumption.getMonthConsume());
			list.add(monthConsumeList);
		}
		return list;
	}
	public List<List<Object>> getAllConsumeListOfLoadConsumption(List<LoadConsumption> loadConsumptionList){
		List<List<Object>> list=new LinkedList<List<Object>>();
		SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		for(LoadConsumption loadConsumption:loadConsumptionList){
			List<Object> allConsumeList=new LinkedList<Object>();
			allConsumeList.add(format.format(loadConsumption.getTime()));
			allConsumeList.add(loadConsumption.getAllConsume());
			list.add(allConsumeList);
		}
		return list;
	}
	@SuppressWarnings("deprecation")
	public void exportExcel(Map<String, String> headMap,List<LoadConsumption> list, OutputStream out) {
        // 声明一个工作薄
        SXSSFWorkbook workbook = new SXSSFWorkbook(1000);//缓存
        workbook.setCompressTempFiles(true);
         //表头样式
        CellStyle titleStyle = workbook.createCellStyle();
        titleStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        Font titleFont = workbook.createFont();
        titleFont.setFontHeightInPoints((short) 20);
        titleFont.setBoldweight((short) 700);
        titleStyle.setFont(titleFont);
        // 列头样式
        CellStyle headerStyle = workbook.createCellStyle();
        //headerStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        headerStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        headerStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        headerStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);
        headerStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);
        headerStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        Font headerFont = workbook.createFont();
        headerFont.setFontHeightInPoints((short) 12);
        headerFont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        headerStyle.setFont(headerFont);
        // 单元格样式
        
        
        
        CellStyle cellStyle = workbook.createCellStyle();
//        cellStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        cellStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        cellStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        cellStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);
        cellStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);
        cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        cellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
        
   
        
        
        
        Font cellFont = workbook.createFont();
        cellFont.setBoldweight(HSSFFont.BOLDWEIGHT_NORMAL);
        cellStyle.setFont(cellFont);
   
        
        for(int i=0;i<headMap.size()-1;i++){
        	SXSSFSheet sheet = workbook.createSheet();
        	//设置列宽
            int minBytes = 17;//至少字节数
            int[] arrColWidth = new int[headMap.size()];
            // 产生表格标题行,以及设置列宽
            String[] properties = new String[headMap.size()];
            String[] headers = new String[headMap.size()];
            int ii = 0;
            for (Iterator<String> iter = headMap.keySet().iterator(); iter
                    .hasNext();) {
                String fieldName = iter.next();

                properties[ii] = fieldName;
                headers[ii] = headMap.get(fieldName);
                int bytes = fieldName.getBytes().length;
                arrColWidth[ii] =  bytes < minBytes ? minBytes : bytes;
                sheet.setColumnWidth(ii,arrColWidth[ii]*256);
                ii++;
            }
            workbook.setSheetName(i, headers[i]);
            SXSSFRow headerRow = sheet.createRow(0); //列头 rowIndex =1
                headerRow.createCell(0).setCellValue(headers[headers.length-1]);
                headerRow.getCell(0).setCellStyle(headerStyle);
                headerRow.createCell(1).setCellValue(headers[i]);
                headerRow.getCell(1).setCellStyle(headerStyle);
                for (int j=0;j<list.size();j++) {
                    SXSSFRow dataRow = sheet.createRow(j+1);
                    for (int k = 0; k < 2; k++)
                    {
                        SXSSFCell newCell = dataRow.createCell(k);
                        try{
                        Object o =  list.get(j);
                        String methodName=null;
                        if(k==0){
                        	methodName="get"+properties[properties.length-1].substring(0, 1).toUpperCase()+properties[properties.length-1].substring(1);
                        	Method method=o.getClass().getDeclaredMethod(methodName);
                        	String timestamp=(String) method.invoke(o);
                        	SimpleDateFormat format=new SimpleDateFormat("yyyyMMddHHmm");
                        	String cellValue=timestamp;
                        	newCell.setCellValue(cellValue);
                            newCell.setCellStyle(cellStyle);
                        }else{
                        	methodName="get"+properties[i].substring(0, 1).toUpperCase()+properties[i].substring(1);
                        	Method method=o.getClass().getDeclaredMethod(methodName);
                        	Double cellValue=(Double) method.invoke(o);
                        	newCell.setCellValue(cellValue);
                            newCell.setCellStyle(cellStyle);}
                        }catch (Exception e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
                    }
                }
        }
        
        try {
            workbook.write(out);
            workbook.close();
            workbook.dispose();
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
	public void excelToServlet(HttpServletResponse response,String fileName){
		try {
            InputStream is = new BufferedInputStream(new FileInputStream("D://"+fileName));
            // 设置response参数，可以打开下载页面
            response.reset();
            response.setContentType("application/x-msdownload"); 
            response.setHeader("Content-Disposition", "attachment;filename="+ URLEncoder.encode(fileName, "utf-8"));
            ServletOutputStream outputStream = response.getOutputStream();
            BufferedInputStream bis = new BufferedInputStream(is);
            BufferedOutputStream bos = new BufferedOutputStream(outputStream);
            byte[] buff = new byte[8192];
            int bytesRead;
            while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
                bos.write(buff, 0, bytesRead);
            }
            bis.close();
            bos.close();
            outputStream.flush();
            outputStream.close();
        }catch (Exception e) {
            e.printStackTrace();
        }
	}
}
