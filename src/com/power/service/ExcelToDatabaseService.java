package com.power.service;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import com.power.pojo.ElectricityParameter;
import com.power.pojo.EnvironmentalParameters;
import com.power.pojo.Inverter;
import com.power.pojo.LoadConsumption;
import com.power.pojo.SolarController;
import com.power.util.JdbcUtil;

public class ExcelToDatabaseService {
	//导入负载消耗数据到数据库
		public Integer addLoadConsumptionList(List<LoadConsumption> list) {
			Integer result=0;
			for(LoadConsumption loadConsumption:list){
				String sql="insert into load_consumption(voltage,current,power,day_consume,month_consume,all_consume,time)values(?,?,?,?,?,?,?)";
				try{
					PreparedStatement ps = JdbcUtil.getConnection().prepareStatement(sql);
					ps.setDouble(1, loadConsumption.getVoltage());
					ps.setDouble(2, loadConsumption.getCurrent());
					ps.setDouble(3, loadConsumption.getPower());
					ps.setDouble(4, loadConsumption.getDayConsume());
					ps.setDouble(5, loadConsumption.getMonthConsume());
					ps.setDouble(6, loadConsumption.getAllConsume());
					ps.setTimestamp(7, new Timestamp(loadConsumption.getTime().getTime()));
					result+=ps.executeUpdate();
				}catch(SQLException e){
					e.printStackTrace();
				}
			}
			return result;
		}
		//导入市电数据到数据库
			public Integer addElectricityParameterList(List<ElectricityParameter> list) {
				Integer result=0;
				for(ElectricityParameter electricityParameter:list){
					String sql="insert into electricity_parameter(voltage,current,power,day_supply,month_supply,all_supply,time)values(?,?,?,?,?,?,?)";
					try{
						PreparedStatement ps = JdbcUtil.getConnection().prepareStatement(sql);
						ps.setDouble(1, electricityParameter.getVoltage());
						ps.setDouble(2, electricityParameter.getCurrent());
						ps.setDouble(3, electricityParameter.getPower());
						ps.setDouble(4, electricityParameter.getDaySupply());
						ps.setDouble(5, electricityParameter.getMonthSupply());
						ps.setDouble(6, electricityParameter.getAllSupply());
						ps.setTimestamp(7, new Timestamp(electricityParameter.getTime().getTime()));
						result+=ps.executeUpdate();
					}catch(SQLException e){
						e.printStackTrace();
					}
				}
				return result;
			}
			//导入环境参数数据到数据库
					public Integer addEnvironmentalParametersList(List<EnvironmentalParameters> list) {
						Integer result=0;
						for(EnvironmentalParameters environmentalParameter:list){
							String sql="insert into environmental_parameters(illuminance,wind_speed,temperature,time)values(?,?,?,?)";
							try{
								PreparedStatement ps = JdbcUtil.getConnection().prepareStatement(sql);
								ps.setDouble(1, environmentalParameter.getIlluminance());
								ps.setDouble(2, environmentalParameter.getWindSpeed());
								ps.setDouble(3, environmentalParameter.getTemperature());
								ps.setTimestamp(4, new Timestamp(environmentalParameter.getTime().getTime()));
								result+=ps.executeUpdate();
							}catch(SQLException e){
								e.printStackTrace();
							}
						}
						return result;
					}
					//导入逆变参数数据到数据库
					public Integer addInverterList(List<Inverter> list) {
						Integer result=0;
						for(Inverter inverter:list){
							String sql="insert into inverter(voltage,current,power,day_consume,month_consume,all_consume,time)values(?,?,?,?,?,?,?)";
							try{
								PreparedStatement ps = JdbcUtil.getConnection().prepareStatement(sql);
								ps.setDouble(1, inverter.getVoltage());
								ps.setDouble(2, inverter.getCurrent());
								ps.setDouble(3, inverter.getPower());
								ps.setDouble(4, inverter.getDayConsume());
								ps.setDouble(5, inverter.getMonthConsume());
								ps.setDouble(6, inverter.getAllConsume());
								ps.setTimestamp(7, new Timestamp(inverter.getTime().getTime()));
								result+=ps.executeUpdate();
							}catch(SQLException e){
								e.printStackTrace();
							}
						}
						return result;
					}
					//导入太阳能控制器参数数据到数据库
					public Integer addSolarControllerList(List<SolarController> list) {
						Integer result=0;
						for(SolarController solarController:list){
							String sql="insert into solar_controller(voltage,input_current,output_current,discharge_current,day_generation,month_generation,all_generation,all_runtime,time)values(?,?,?,?,?,?,?,?,?)";
							try{
								PreparedStatement ps = JdbcUtil.getConnection().prepareStatement(sql);
								ps.setDouble(1, solarController.getVoltage());
								ps.setDouble(2, solarController.getInputCurrent());
								ps.setDouble(3, solarController.getOutputCurrent());
								ps.setDouble(4, solarController.getDischargeCurrent());
								ps.setDouble(5, solarController.getDayGeneration());
								ps.setDouble(6, solarController.getMonthGeneration());
								ps.setDouble(7, solarController.getAllGeneration());
								ps.setDouble(8, solarController.getAllRuntime());
								ps.setTimestamp(9, new Timestamp(solarController.getTime().getTime()));
								result+=ps.executeUpdate();
							}catch(SQLException e){
								e.printStackTrace();
							}
						}
						return result;
					}
					
}
