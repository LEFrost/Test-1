package com.wgh.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.*;
import com.wgh.core.ChStr;
import com.wgh.actionForm.SendMailForm;
import com.wgh.dao.CustomerDAO;
import com.wgh.dao.PersonnelDAO;
import com.wgh.dao.SendMailDAO;

public class SendMail extends Action{
    private SendMailDAO sendMailDAO = null;
    private PersonnelDAO personnelDAO=null;
    private CustomerDAO customerDAO=null;
    private ChStr chStr=new ChStr();
    public SendMail() {
        this.sendMailDAO = new SendMailDAO();
        this.personnelDAO=new PersonnelDAO();
        this.customerDAO=new CustomerDAO();
    }	
	public ActionForward execute(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response){
        String action = request.getParameter("action");
        System.out.println("获取的查询字符串：" + action);
        if (action == null || "".equals(action)) {
            request.setAttribute("error","您的操作有误！");			//将错误信息保存到error中
            return mapping.findForward("error");				//转到显示错误信息的页面
        }else if ("addMail".equals(action)) {
            return addMail(mapping, form, request,response);
        }else if("sendMail".equals(action)){
            return sendMail(mapping, form, request,response);
        }
			request.setAttribute("error", "操作失败！");
			return mapping.findForward("error");
	}

    //查询收件人列表
    private ActionForward addMail(ActionMapping mapping, ActionForm form,
                              HttpServletRequest request,
                              HttpServletResponse response) {
        request.setAttribute("personnelQuery",personnelDAO.query(0));
        request.setAttribute("customerQuery",customerDAO.query(0));
        return mapping.findForward("addMail");
    }
    //群发邮件
    private ActionForward sendMail(ActionMapping mapping, ActionForm form,
                              HttpServletRequest request,
                              HttpServletResponse response){
        SendMailForm sendMailForm=(SendMailForm) form;
        sendMailForm.setTitle(chStr.toChinese(sendMailForm.getTitle()));
        sendMailForm.setAdjunct(chStr.toChinese(sendMailForm.getAdjunct()));
        sendMailForm.setContent(chStr.toChinese(sendMailForm.getContent()));
        int ret=sendMailDAO.sendMail(sendMailForm);
        if(ret==0){
            request.setAttribute("error","邮件发送失败！");
            return mapping.findForward("error");
        }else{
            return mapping.findForward("sendMail");
        }
    }
}
