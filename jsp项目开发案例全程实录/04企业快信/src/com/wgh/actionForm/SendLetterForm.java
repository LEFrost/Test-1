package com.wgh.actionForm;

import java.util.Date;
import org.apache.struts.action.ActionForm;

public class SendLetterForm extends ActionForm {
	private String content;
	private Date sendTime;
	private String fromMan;
	private int ID;
	private String toMan;

	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	public Date getSendTime() {
		return sendTime;
	}
	public void setSendTime(Date sendTime) {
		this.sendTime = sendTime;
	}

	public String getFromMan() {
		return fromMan;
	}
	public void setFromMan(String fromMan) {
		this.fromMan = fromMan;
	}

	public int getID() {
		return ID;
	}
	public void setID(int ID) {
		this.ID = ID;
	}

	public String getToMan() {
		return toMan;
	}
	public void setToMan(String toMan) {
		this.toMan = toMan;
	}
}