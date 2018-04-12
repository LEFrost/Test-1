package com.wgh.actionForm;
import org.apache.struts.action.ActionForm;

public class ShortInfoForm extends ActionForm{
	private int ID;			//ID号	
	private int typeID;		//类别ID
	private String typeName;	//类别名称
	private String content;	//内容
	public int getID() {
		return ID;
	}
	public void setID(int ID) {
		this.ID = ID;
	}
	
	public int getTypeID() {
		return typeID;
	}
	public void setTypeID(int typeID) {
		this.typeID = typeID;
	}
	
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}