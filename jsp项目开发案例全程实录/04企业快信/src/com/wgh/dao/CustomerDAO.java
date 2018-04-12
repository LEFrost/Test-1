package com.wgh.dao;

import java.sql.*;
import java.util.*;

import com.wgh.actionForm.CustomerForm;
import com.wgh.core.ConnDB;

public class CustomerDAO {
	private ConnDB conn=new ConnDB();
     //添加数据
    public int insert(CustomerForm cF) {
        String sql1="SELECT * FROM tb_customer WHERE name='"+cF.getName()+"'";
        ResultSet rs = conn.executeQuery(sql1);
        String sql = "";
        int falg = 0;
            try {
                if (rs.next()) {
                    falg=2;
                } else {
                    sql = "INSERT INTO tb_customer (name,address,area,postcode,mobileTel,email,bankName,bankNo,linkName) values('" +
                    cF.getName() + "','" +cF.getAddress() +"','"+cF.getArea()+"','"+cF.getPostcode()+"','"+cF.getMobileTel()+"','"+
                    cF.getEmail()+"','"+cF.getBankName()+"','"+cF.getBankNo()+"','"+cF.getLinkName()+"')";
                    falg = conn.executeUpdate(sql);
                    System.out.println("添加客户信息的SQL：" + sql);
                    conn.close();
                }
            } catch (SQLException ex) {
                falg=0;
            }
        return falg;
    }
    //查询方法
    public List query(int id) {
    	List customerList = new ArrayList();
        CustomerForm cF = null;
        String sql="";
        if(id==0){
            sql = "SELECT * FROM tb_customer";
        }else{
        	sql = "SELECT * FROM tb_customer WHERE ID=" +id+ "";
        }
        ResultSet rs = conn.executeQuery(sql);
        try {
            while (rs.next()) {
                cF = new CustomerForm();
                cF.setID(rs.getInt(1));
                cF.setName(rs.getString(2));
                cF.setAddress(rs.getString(3));
                cF.setPostcode(rs.getString(4));
                cF.setArea(rs.getString(5));
                cF.setMobileTel(rs.getString(6));
                cF.setEmail(rs.getString(7));
                cF.setBankNo(rs.getString(8));
                cF.setBankName(rs.getString(9));
                cF.setLinkName(rs.getString(10));
                customerList.add(cF);
            }
        } catch (SQLException ex) {}
        finally{
        	conn.close();											//关闭数据库连接
        }
        return customerList;
    }
    //修改数据
    public int update(CustomerForm c){
        String sql="UPDATE tb_customer SET address='"+c.getAddress()+"',postcode='"+c.getPostcode()+"',area='"+c.getArea()+"',mobileTel='"+c.getMobileTel()+"',email='"+c.getEmail()+"',bankName='"+c.getBankName()+"',bankNo='"+c.getBankNo()+"',linkName='"+c.getLinkName()+"'  where ID="+c.getID()+"";
        int ret=conn.executeUpdate(sql);
        System.out.println("修改客户信息时的SQL："+sql);
        conn.close();
        return ret;
    }

//    删除数据
        public int delete(CustomerForm customerForm) {
        	int flag=0;
        	try{
            String sql = "DELETE FROM tb_customer where id=" + customerForm.getID() +"";
            flag = conn.executeUpdate(sql);
        	}catch(Exception e){
        		System.out.println("删除客户信息时产生的错误："+e.getMessage());
        	}finally{
        		conn.close();	//关闭数据库连接
        	}
             return flag;
        }
}
