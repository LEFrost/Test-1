package com.wgh.actionForm;
import org.apache.struts.action.ActionForm;

public class InfoTypeForm extends ActionForm{
	private String name;	//Àà±ðÃû³Æ
	private int ID;			//IDºÅ
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getID() {
		return ID;
	}
	public void setID(int ID) {
		this.ID = ID;
	}
}