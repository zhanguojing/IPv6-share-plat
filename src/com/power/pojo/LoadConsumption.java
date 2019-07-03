package com.power.pojo;

import java.util.Date;

public class LoadConsumption {
	private Long id;
	private Double voltage;
	private Double current;
	private Double power;
	private Double dayConsume;
	private Double monthConsume;
	private Double allConsume;
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
	public Double getDayConsume() {
		return dayConsume;
	}
	public void setDayConsume(Double dayConsume) {
		this.dayConsume = dayConsume;
	}
	public Double getMonthConsume() {
		return monthConsume;
	}
	public void setMonthConsume(Double monthConsume) {
		this.monthConsume = monthConsume;
	}
	public Double getAllConsume() {
		return allConsume;
	}
	public void setAllConsume(Double allConsume) {
		this.allConsume = allConsume;
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
