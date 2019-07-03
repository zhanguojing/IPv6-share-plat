package com.power.pojo;

import java.util.Date;

public class EnvironmentalParameters {
	private Long id;
	private Date time;
	private Double illuminance;
	private Double windSpeed;
	private Double temperature;
	private String timestr;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public Double getIlluminance() {
		return illuminance;
	}
	public void setIlluminance(Double illuminance) {
		this.illuminance = illuminance;
	}
	public Double getWindSpeed() {
		return windSpeed;
	}
	public void setWindSpeed(Double windSpeed) {
		this.windSpeed = windSpeed;
	}
	public Double getTemperature() {
		return temperature;
	}
	public void setTemperature(Double temperature) {
		this.temperature = temperature;
	}
	public String getTimestr() {
		return timestr;
	}
	public void setTimestr(String timestr) {
		this.timestr = timestr;
	}
}
