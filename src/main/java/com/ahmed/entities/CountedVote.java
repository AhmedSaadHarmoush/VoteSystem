package com.ahmed.entities;

public class CountedVote {
	private Person user;
	private Person candidate;
	private Person expected;
	public Person getExpected() {
		return expected;
	}
	public void setExpected(Person expected) {
		this.expected = expected;
	}
	public Person getUser() {
		return user;
	}
	public void setUser(Person user) {
		this.user = user;
	}
	public Person getCandidate() {
		return candidate;
	}
	public void setCandidate(Person candidate) {
		this.candidate = candidate;
	}
	
}
