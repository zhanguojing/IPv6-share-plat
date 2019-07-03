package com.power.service;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.power.pojo.LoadConsumption;
import com.power.pojo.EnvironmentalParameters;
import com.power.pojo.Inverter;
import com.power.pojo.ElectricityParameter;
import com.power.pojo.SolarController;

public class ReadExcelService {
	// 通过Excel读取负载消耗总电量
	public List<LoadConsumption> getLoadConsumptionListByExcel(String fileName) {
		List<LoadConsumption> list = new LinkedList<LoadConsumption>();
		InputStream is = null;
		XSSFWorkbook workBook = null;
		try {
			is = new FileInputStream(fileName);
			workBook = new XSSFWorkbook(is);
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
		Integer sheetLength = workBook.getNumberOfSheets();
		for (int i = 0; i < sheetLength; i++) {
			Sheet sheet = workBook.getSheetAt(i);
			int trLength = sheet.getLastRowNum();
			int tdLength = sheet.getRow(1).getLastCellNum();
			for (int j = 1; j <= trLength; j++) {
				Row row = sheet.getRow(j);
				int k = 0;
				if (i != 0) {
					k = 1;
				} else {
					LoadConsumption fuZai = new LoadConsumption();
					list.add(fuZai);
				}
				for (; k < tdLength; k++) {
					Cell cell = row.getCell(k);
					switch (i) {
					case 0:
						if (k == 0) {
							list.get(j - 1).setTime((Date) getValue(cell));
						} else {
							list.get(j - 1).setVoltage((Double) getValue(cell));
						}
						break;
					case 1:
						list.get(j - 1).setCurrent((Double) getValue(cell));
						break;
					case 2:
						list.get(j - 1).setPower((Double) getValue(cell));
						break;
					case 3:
						list.get(j - 1).setDayConsume((Double) getValue(cell));
						break;
					case 4:
						list.get(j - 1).setMonthConsume((Double) getValue(cell));
						break;
					case 5:
						list.get(j - 1).setAllConsume((Double) getValue(cell));
						break;
					default:
						break;
					}
				}
			}
		}
		return list;
	}

	// 通过Excel读取环境参数
	public List<EnvironmentalParameters> getEnvironmentalParametersListByExcel(String fileName) {
		List<EnvironmentalParameters> list = new LinkedList<EnvironmentalParameters>();
		InputStream is = null;
		XSSFWorkbook workBook = null;
		try {
			is = new FileInputStream(fileName);
			workBook = new XSSFWorkbook(is);
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
		Integer sheetLength = workBook.getNumberOfSheets();
		for (int i = 0; i < sheetLength; i++) {
			Sheet sheet = workBook.getSheetAt(i);
			int trLength = sheet.getLastRowNum();
			int tdLength = sheet.getRow(1).getLastCellNum();
			for (int j = 1; j <= trLength; j++) {
				Row row = sheet.getRow(j);
				int k = 0;
				if (i != 0) {
					k = 1;
				} else {
					EnvironmentalParameters huanJing = new EnvironmentalParameters();
					list.add(huanJing);
				}
				for (; k < tdLength; k++) {
					Cell cell = row.getCell(k);
					switch (i) {
					case 0:
						if (k == 0) {
							list.get(j - 1).setTime((Date) getValue(cell));
						} else {
							list.get(j - 1).setIlluminance((Double) getValue(cell));
						}
						break;
					case 1:
						list.get(j - 1).setWindSpeed((Double) getValue(cell));
						break;
					case 2:
						list.get(j - 1).setTemperature((Double) getValue(cell));
						break;
					default:
						break;
					}
				}
			}
		}
		return list;
	}

	// 通过Excel读取逆变器参数
	public List<Inverter> getInverterListByExcel(String fileName) {
		List<Inverter> list = new LinkedList<Inverter>();
		InputStream is = null;
		XSSFWorkbook workBook = null;
		try {
			is = new FileInputStream(fileName);
			workBook = new XSSFWorkbook(is);
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
		Integer sheetLength = workBook.getNumberOfSheets();
		for (int i = 0; i < sheetLength; i++) {
			Sheet sheet = workBook.getSheetAt(i);
			int trLength = sheet.getLastRowNum();
			int tdLength = sheet.getRow(1).getLastCellNum();
			for (int j = 1; j <= trLength; j++) {
				Row row = sheet.getRow(j);
				int k = 0;
				if (i != 0) {
					k = 1;
				} else {
					Inverter niBianQi = new Inverter();
					list.add(niBianQi);
				}
				for (; k < tdLength; k++) {
					Cell cell = row.getCell(k);
					switch (i) {
					case 0:
						if (k == 0) {
							list.get(j - 1).setTime((Date) getValue(cell));
						} else {
							list.get(j - 1).setVoltage((Double) getValue(cell));
						}
						break;
					case 1:
						list.get(j - 1).setCurrent((Double) getValue(cell));
						break;
					case 2:
						list.get(j - 1).setPower((Double) getValue(cell));
						break;
					case 3:
						list.get(j - 1).setDayConsume((Double) getValue(cell));
						break;
					case 4:
						list.get(j - 1).setMonthConsume((Double) getValue(cell));
						break;
					case 5:
						list.get(j - 1).setAllConsume((Double) getValue(cell));
						break;
					default:
						break;
					}
				}
			}
		}
		return list;
	}

	// 通过Excel读取市电参数
	public List<ElectricityParameter> getElectricityParameterListByExcel(String fileName) {
		List<ElectricityParameter> list = new LinkedList<ElectricityParameter>();
		InputStream is = null;
		XSSFWorkbook workBook = null;
		try {
			is = new FileInputStream(fileName);
			workBook = new XSSFWorkbook(is);
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
		Integer sheetLength = workBook.getNumberOfSheets();
		for (int i = 0; i < sheetLength; i++) {
			Sheet sheet = workBook.getSheetAt(i);
			int trLength = sheet.getLastRowNum();
			int tdLength = sheet.getRow(1).getLastCellNum();
			for (int j = 1; j <= trLength; j++) {
				Row row = sheet.getRow(j);
				int k = 0;
				if (i != 0) {
					k = 1;
				} else {
					ElectricityParameter shiDian = new ElectricityParameter();
					list.add(shiDian);
				}
				for (; k < tdLength; k++) {
					Cell cell = row.getCell(k);
					switch (i) {
					case 0:
						if (k == 0) {
							list.get(j - 1).setTime((Date) getValue(cell));
						} else {
							list.get(j - 1).setVoltage((Double) getValue(cell));
						}
						break;
					case 1:
						list.get(j - 1).setCurrent((Double) getValue(cell));
						break;
					case 2:
						list.get(j - 1).setPower((Double) getValue(cell));
						break;
					case 3:
						list.get(j - 1).setDaySupply((Double) getValue(cell));
						break;
					case 4:
						list.get(j - 1).setMonthSupply((Double) getValue(cell));
						break;
					case 5:
						list.get(j - 1).setAllSupply((Double) getValue(cell));
						break;
					default:
						break;
					}
				}
			}
		}
		return list;
	}

	// 通过Excel读取太阳能控制器参数
	public List<SolarController> getSolarControllerListByExcel(String fileName) {
		List<SolarController> list = new LinkedList<SolarController>();
		InputStream is = null;
		XSSFWorkbook workBook = null;
		try {
			is = new FileInputStream(fileName);
			workBook = new XSSFWorkbook(is);
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
		Integer sheetLength = workBook.getNumberOfSheets();
		for (int i = 0; i < sheetLength; i++) {
			Sheet sheet = workBook.getSheetAt(i);
			int trLength = sheet.getLastRowNum();
			int tdLength = sheet.getRow(1).getLastCellNum();
			for (int j = 1; j <= trLength; j++) {
				Row row = sheet.getRow(j);
				int k = 0;
				if (i != 0) {
					k = 1;
				} else {
					SolarController taiYangNeng = new SolarController();
					list.add(taiYangNeng);
				}
				for (; k < tdLength; k++) {
					Cell cell = row.getCell(k);
					switch (i) {
					case 0:
						if (k == 0) {
							list.get(j - 1).setTime((Date) getValue(cell));
						} else {
							list.get(j - 1).setVoltage((Double) getValue(cell));
						}
						break;
					case 1:
						list.get(j - 1).setInputCurrent((Double) getValue(cell));
						break;
					case 2:
						list.get(j - 1).setOutputCurrent((Double) getValue(cell));
						break;
					case 3:
						list.get(j - 1).setDischargeCurrent((Double) getValue(cell));
						break;
					case 4:
						list.get(j - 1).setDayGeneration((Double) getValue(cell));
						break;
					case 5:
						list.get(j - 1).setMonthGeneration((Double) getValue(cell));
						break;
					case 6:
						list.get(j - 1).setAllGeneration((Double) getValue(cell));
						break;
					case 7:
						list.get(j - 1).setAllRuntime((Double) getValue(cell));
						break;
					default:
						break;
					}
				}
			}
		}
		return list;
	}

	// 通过cell对象取excel中的数据
	public Object getValue(Cell cell) {
		Integer type = cell.getCellType();
		switch (type) {
		case Cell.CELL_TYPE_NUMERIC:
			Double value = cell.getNumericCellValue();
			if (String.valueOf(value).contains("E")) {
				BigDecimal bigDecimal = new BigDecimal(value);
				SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmm");
				Date date = null;
				try {
					date = format.parse(bigDecimal.toPlainString());
				} catch (ParseException e) {
					e.printStackTrace();
				}
				return date;
			} else {
				return value;
			}
		case Cell.CELL_TYPE_STRING:
			return cell.getStringCellValue();
		default:
			return null;
		}
	}
}
