package com.power.pojo;

import java.util.Date;

public class SolarController {
	private Long id;
	private Date time;
	private Double voltage;
	private Double inputCurrent;
	private Double outputCurrent;
	private Double dischargeCurrent;
	private Double dayGeneration;
	private Double monthGeneration;
	private Double allGeneration;
	private Double allRuntime;
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
	public Double getVoltage() {
		return voltage;
	}
	public void setVoltage(Double voltage) {
		this.voltage = voltage;
	}
	public Double getInputCurrent() {
		return inputCurrent;
	}
	public void setInputCurrent(Double inputCurrent) {
		this.inputCurrent = inputCurrent;
	}
	public Double getOutputCurrent() {
		return outputCurrent;
	}
	public void setOutputCurrent(Double outputCurrent) {
		this.outputCurrent = outputCurrent;
	}
	public Double getDischargeCurrent() {
		return dischargeCurrent;
	}
	public void setDischargeCurrent(Double dischargeCurrent) {
		this.dischargeCurrent = dischargeCurrent;
	}
	public Double getDayGeneration() {
		return dayGeneration;
	}
	public void setDayGeneration(Double dayGeneration) {
		this.dayGeneration = dayGeneration;
	}
	public Double getMonthGeneration() {
		return monthGeneration;
	}
	public void setMonthGeneration(Double monthGeneration) {
		this.monthGeneration = monthGeneration;
	}
	public Double getAllGeneration() {
		return allGeneration;
	}
	public void setAllGeneration(Double allGeneration) {
		this.allGeneration = allGeneration;
	}
	public Double getAllRuntime() {
		return allRuntime;
	}
	public void setAllRuntime(Double allRuntime) {
		this.allRuntime = allRuntime;
	}
	public String getTimestr() {
		return timestr;
	}
	public void setTimestr(String timestr) {
		this.timestr = timestr;
	}
}
