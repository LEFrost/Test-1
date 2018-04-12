package com.wgh.dao;

import java.sql.*;
import java.util.*;

import com.wgh.actionForm.ParameterForm;
import com.wgh.core.ConnDB;

public class ParameterDAO {
	private ConnDB conn=new ConnDB();
    //查询方法
    public List query() {
    	List parameterList = new ArrayList();
    	ParameterForm p = null;
        String sql = "SELECT top 1 * FROM tb_parameter";
        ResultSet rs = conn.executeQuery(sql);
        try {
            while (rs.next()) {
                p = new ParameterForm();
                p.setID(rs.getInt(1));
                p.setDevice(rs.getString(2));
                p.setBaud(rs.getString(3));
                p.setSn(rs.getString(4));
                parameterList.add(p);
            }
        } catch (SQLException ex) {}
        return parameterList;
    }
    //修改数据
    public int update(ParameterForm p){
        String sql = "SELECT top 1 * FROM tb_parameter";
        int ret=0;
        try{       
	        ResultSet rs = conn.executeQuery(sql);
	        String sql_u="";
	
	    	if(rs.next()){
	    		sql_u="UPDATE tb_parameter SET device='"+p.getDevice()+"',baud='"+p.getBaud()+"',sn='"+p.getSn()+"'  where ID="+p.getID()+"";
	    	}else{
	    		sql_u="INSERT INTO tb_parameter (device,baud,sn) values('"+p.getDevice()+"','"+p.getBaud()+"','"+p.getSn()+"')";
	    	}
	    	ret=conn.executeUpdate(sql_u);
	    	System.out.println("系统参数设定时的SQL语句："+sql_u);
        }catch(Exception e){
            System.out.println("系统参数设定时产生的错误信息："+e.getMessage());        	
        }
        conn.close();
        return ret;
    }
}
