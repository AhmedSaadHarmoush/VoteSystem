package com.ahmed.entities;
// Generated Feb 26, 2016 10:13:15 PM by Hibernate Tools 4.3.1.Final

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Status generated by hbm2java
 */
@Entity
@Table(name = "status", catalog = "final")
public class Status implements java.io.Serializable {

	private Integer id;
	private int on;

	public Status() {
	}

	public Status(int on) {
		this.on = on;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "[on]", nullable = false)
	public int getOn() {
		return this.on;
	}

	public void setOn(int on) {
		this.on = on;
	}

}
