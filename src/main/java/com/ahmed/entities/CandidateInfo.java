package com.ahmed.entities;

public class CandidateInfo {
	private int id;
	private String username;
	private int delegates;
	private double percentage;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getDelegates() {
		return delegates;
	}
	public void setDelegates(int delegates) {
		this.delegates = delegates;
	}
	public double getPercentage() {
		return percentage;
	}
	public void setPercentage(double percentage) {
		this.percentage = percentage;
	}
	public CandidateInfo(String username, int delegates, int percentage) {
		super();
		this.username = username;
		this.delegates = delegates;
		this.percentage = percentage;
	}
	public CandidateInfo(){
		delegates=0;
		percentage=0;
	}
}
