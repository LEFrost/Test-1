package com.wgh.actionForm;

import org.apache.struts.action.ActionForm;

public class ManagerForm extends ActionForm {
	private String pwd;		//密码
	private String name;	//管理员名称
	private byte state;		//状态（标记是否为超级管理员）
	private int ID;			//ID号
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public byte getState() {
		return state;
	}
	public void setState(byte state) {
		this.state = state;
	}
	public int getID() {
		return ID;
	}
	public void setID(int ID) {
		this.ID = ID;
	}
}