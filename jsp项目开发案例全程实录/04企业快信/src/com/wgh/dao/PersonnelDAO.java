package com.wgh.dao;

import java.sql.*;
import java.util.*;

import com.wgh.actionForm.PersonnelForm;
import com.wgh.core.ConnDB;

public class PersonnelDAO {
	private ConnDB conn=new ConnDB();
     //添加数据
    public int insert(PersonnelForm cF) {
        String sql1="SELECT * FROM tb_personnel WHERE name='"+cF.getName()+"'";
        ResultSet rs = conn.executeQuery(sql1);
        String sql = "";
        int falg = 0;
            try {
                if (rs.next()) {
                    falg=2;
                } else {
                    sql = "INSERT INTO tb_personnel (name,sex,birthday,school,education,specialty,place,mobileTel,email) values('" +
                    cF.getName() + "','" +cF.getSex() +"','"+cF.getBirthday()+"','"+cF.getSchool()+"','"+cF.getEducation()+"','"+
                    cF.getSpecialty()+"','"+cF.getPlace()+"','"+cF.getMobileTel()+"','"+cF.getEmail()+"')";
                    falg = conn.executeUpdate(sql);
                    System.out.println("添加员工信息的SQL：" + sql);
                    conn.close();
                }
            } catch (SQLException ex) {
                falg=0;
            }
        return falg;
    }
    //查询方法
    public List query(int id) {
    	List personnelList = new ArrayList();
        PersonnelForm cF = null;
        String sql="";
        if(id==0){
            sql = "SELECT * FROM tb_personnel";
        }else{
        	sql = "SELECT * FROM tb_personnel WHERE ID=" +id + "";
        }
        ResultSet rs = conn.executeQuery(sql);
        try {
            while (rs.next()) {
                cF = new PersonnelForm();
                cF.setID(rs.getInt(1));
                cF.setName(rs.getString(2));
                cF.setSex(rs.getString(3));
                cF.setBirthday(rs.getDate(4));
                cF.setSchool(rs.getString(5));
                cF.setEducation(rs.getString(6));
                cF.setSpecialty(rs.getString(7));
                cF.setPlace(rs.getString(8));
                cF.setMobileTel(rs.getString(9));
                cF.setEmail(rs.getString(10));
                personnelList.add(cF);
            }
        } catch (SQLException ex) {}
        return personnelList;
    }
    //修改数据
    public int update(PersonnelForm c){
        String sql="UPDATE tb_personnel SET sex='"+c.getSex()+"',birthday='"+c.getBirthday()+"',school='"+c.getSchool()+"',education='"+c.getEducation()+"',specialty='"+c.getSpecialty()+"',place='"+c.getPlace()+"',mobileTel='"+c.getMobileTel()+"',email='"+c.getEmail()+"'  where ID="+c.getID()+"";
        int ret=conn.executeUpdate(sql);
        System.out.println("修改员工信息时的SQL："+sql);
        conn.close();
        return ret;
    }

//    删除数据
        public int delete(PersonnelForm personnelForm) {
            String sql = "DELETE FROM tb_personnel where id=" + personnelForm.getID() +"";
            int flag = conn.executeUpdate(sql);
            conn.close();
            return flag;
        }
}
