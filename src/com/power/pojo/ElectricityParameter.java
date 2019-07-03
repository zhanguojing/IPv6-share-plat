package com.power.pojo;

import java.util.Date;

public class ElectricityParameter {
	private Long id;
	private Double voltage;
	private Double current;
	private Double power;
	private Double daySupply;
	private Double monthSupply;
	private Double allSupply;
	private Date time;
	private String timestr;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Double getVoltage() {
		return voltage;
	}
	public void setVoltage(Double voltage) {
		this.voltage = voltage;
	}
	public Double getCurrent() {
		return current;
	}
	public void setCurrent(Double current) {
		this.current = current;
	}
	public Double getPower() {
		return power;
	}
	public void setPower(Double power) {
		this.power = power;
	}
	public Double getDaySupply() {
		return daySupply;
	}
	public void setDaySupply(Double daySupply) {
		this.daySupply = daySupply;
	}
	public Double getMonthSupply() {
		return monthSupply;
	}
	public void setMonthSupply(Double monthSupply) {
		this.monthSupply = monthSupply;
	}
	public Double getAllSupply() {
		return allSupply;
	}
	public void setAllSupply(Double allSupply) {
		this.allSupply = allSupply;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public String getTimestr() {
		return timestr;
	}
	public void setTimestr(String timestr) {
		this.timestr = timestr;
	}
}
