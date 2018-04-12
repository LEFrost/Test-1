package com.wgh.dao;

import java.lang.*;
import java.io.*;
import BestMail.smssend;
import java.sql.*;
import java.util.*;

import com.wgh.actionForm.PersonnelForm;
import com.wgh.actionForm.SendLetterForm;
import com.wgh.core.ConnDB;

public class SendLetterDAO {
	private ConnDB conn=new ConnDB();
	private smssend smssendinformation = null;
	// ���Ͷ���
	public String sendLetter(SendLetterForm s) {
		String ret = "";
		String device="";
		String baud="";
		String sn="";
		String info="";
		String sendnum="";
		String flag="";
		try {
			String sql_p="SELECT top 1 * FROM tb_parameter";
			ResultSet rs=conn.executeQuery(sql_p);
			if(rs.next()){
				device=rs.getString(2);
				baud=rs.getString(3);
				sn=rs.getString(4);
				info=s.getContent();
				sendnum=s.getToMan();
				System.out.println("SN:"+sn+"***********"+info);
				flag=mySend(device,baud,sn,info,sendnum);//���Ͷ���
				if(flag.equals("ok")){
		            String sql = "INSERT INTO tb_shortLetter (toMan,content,fromMan) values('" +s.getToMan() +"','"+s.getContent()+"','"+s.getFromMan()+"')";
		            int r= conn.executeUpdate(sql);
		            System.out.println("��Ӷ��ŷ�����ʷ��¼��SQL��" + sql);
		            if(r==0){
		            	ret="��Ӷ��ŷ�����ʷ��¼ʧ�ܣ�";
		            }else{
		            	ret="ok";
		            }
				}else{
					ret=flag;
				}				
			}else{
				ret="���Ͷ���ʧ�ܣ�";
			}
		} catch (Exception e) {
			System.out.println("���Ͷ��Ų����Ĵ���" + e.getMessage());
			ret = "���Ͷ���ʧ�ܣ�";
		}finally{
			conn.close();
		}
		return ret;
	}
	
	// ��ʼ��GSM Modem�豸
	public boolean getConnectionModem(String device,String baud,String sn) {
		smssendinformation = new smssend();
		boolean connection = true;
		if (!smssendinformation.GSMModemInitNew(device, baud, null, "GSM",
			false, sn)) {
			System.out.println("��ʼ��GSM Modem �豸ʧ�ܣ�"
					+ smssendinformation.GSMModemGetErrorMsg());
			connection = false;
		}
		return connection;	
	}
	// �����ֻ����ŵķ���
	public String mySend(String device,String baud,String sn,String info, String sendnum) {
		boolean flag = false;
		String rtn="";
		flag=this.getConnectionModem(device,baud,sn);

		if(flag){
			byte[] sendtest = smssendinformation.getUNIByteArray(info); // ת��ΪUNICOCE		
			//ʵ��Ⱥ��
			String[] arrSendnum=sendnum.split(",");
			for(int i=0;i<arrSendnum.length;i++){
				if (!smssendinformation.GSMModemSMSsend(null, 8, sendtest, arrSendnum[i],false)) {
					System.out.println("���Ͷ���ʧ�ܣ�"
							+ smssendinformation.GSMModemGetErrorMsg());
					rtn =rtn+"��"+arrSendnum[i]+"���Ͷ���ʧ��!<br>ԭ���ǣ�"+smssendinformation.GSMModemGetErrorMsg()+"<br>";
				}
			}
		}else{
			rtn="��ʼ��GSM Modem�豸ʧ�ܣ�";
		}
		if(rtn.equals("")){
			rtn="ok";
		}
		closeConnection();		//�ر�����
		return rtn;
	}
	// �ر����ӵķ���
	public void closeConnection() {
		if (smssendinformation != null) {
			smssendinformation.GSMModemRelease();
			System.out.println("�رճɹ�������");
		}

	}	
    //��ѯ����
    public List query(){
    	List personnelList = new ArrayList();
        SendLetterForm s = null;
        String sql = "SELECT * FROM tb_shortLetter";
        ResultSet rs = conn.executeQuery(sql);
        String ss="";
        try {
            while (rs.next()) {
                s = new SendLetterForm();
                s.setID(rs.getInt(1));
                s.setToMan(rs.getString(2));
                s.setContent(rs.getString(3));
                s.setFromMan(rs.getString(4));
                ss=rs.getString(5);
                 s.setSendTime(java.text.DateFormat.getDateTimeInstance().parse(ss));//��String���ַ���ת����java.util.Date��
                personnelList.add(s);
            }
        } catch (Exception ex) {
        	System.out.println(ex.getMessage());
        }
        return personnelList;
    }
    //���ն���
    public List getLetter(){
    	List list=new ArrayList();
		String device="";
		String baud="";
		String sn="";
		try {
			String sql_p="SELECT top 1 * FROM tb_parameter";
			ResultSet rs=conn.executeQuery(sql_p);
			if(rs.next()){
				device=rs.getString(2);
				baud=rs.getString(3);
				sn=rs.getString(4);
				list=myGet(device,baud,sn);//���ն���
			}else{
				System.out.println("���ն���ʧ��");
			}
		} catch (Exception e) {
			System.out.println("���ն��Ų����Ĵ���" + e.getMessage());
		}finally{
			conn.close();
		}
    	return list;
    }
    //���ն��ŵķ���
    public List myGet(String device,String baud,String sn) {
		boolean flag = false;
		flag=this.getConnectionModem(device,baud,sn);
		List list=new ArrayList();
		if(flag){
			String[] allmsg = smssendinformation.GSMModemSMSReadAll(1);
	        // ������ÿһ����Ϣ����������ɣ��绰����#����#�ı�����
	        for (int kk = 0; allmsg != null && kk < allmsg.length; kk++) {
	        	if (allmsg[kk] == null) continue;
	        	String[] tmp = allmsg[kk].split("#");
	        	if (tmp == null || tmp.length != 3) continue;
	        	//��ȡ����
	        	String codeflg = tmp[1];	//����
	        	String recvtext = tmp[2];	//��������
	        	if (recvtext != null && codeflg.equalsIgnoreCase("8")){
	        		recvtext = smssendinformation.HexToBuf(recvtext);//�õ�Java�Ķ����ı��ַ���
	        	}
	        	tmp[2]=recvtext;
	        	System.out.println("�������ݣ�"+recvtext);
	        	list.add(tmp);
	        } 
		}
		closeConnection();		//�ر�����
		return list;
	}
}
