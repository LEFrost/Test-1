package com.wgh.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.*;
import com.wgh.core.ChStr;
import com.wgh.actionForm.SendLetterForm;
import com.wgh.dao.CustomerDAO;
import com.wgh.dao.PersonnelDAO;
import com.wgh.dao.SendLetterDAO;
import com.wgh.dao.InfoTypeDAO;

public class SendLetter extends Action{
    private SendLetterDAO sendLetterDAO = null;
    private PersonnelDAO personnelDAO=null;
    private CustomerDAO customerDAO=null;
    private InfoTypeDAO infoTypeDAO=null;
    private ChStr chStr=new ChStr();
    public SendLetter() {
        this.sendLetterDAO = new SendLetterDAO();
        this.personnelDAO=new PersonnelDAO();
        this.customerDAO=new CustomerDAO();
        this.infoTypeDAO=new InfoTypeDAO();
    }	
	public ActionForward execute(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response){
        String action = request.getParameter("action");
        System.out.println("获取的查询字符串：" + action);
        if (action == null || "".equals(action)) {
        	request.setAttribute("error","您的操作有误！");
            return mapping.findForward("error");
        }else if ("addLetter".equals(action)) {
            return addLetter(mapping, form, request,response);
        }else if("sendLetter".equals(action)){
            return sendLetter(mapping, form, request,response);
        }else if("historyQuery".equals(action)){
        	return queryHistory(mapping, form, request,response);
        }else if("getLetterQuery".equals(action)){
        	return getLetterQuery(mapping,form,request,response);
        }
			request.setAttribute("error", "操作失败！");
			return mapping.findForward("error");
	}

    //编写短信页面应用的查询方法，用于查询收信人列表信息类别
    private ActionForward addLetter(ActionMapping mapping, ActionForm form,
                              HttpServletRequest request,
                              HttpServletResponse response) {
        request.setAttribute("personnelQuery",personnelDAO.query(0));
        request.setAttribute("customerQuery",customerDAO.query(0));
        request.setAttribute("shortInfo",infoTypeDAO.query(0));
        return mapping.findForward("addLetter");
    }
    //群发短信
    private ActionForward sendLetter(ActionMapping mapping, ActionForm form,
                              HttpServletRequest request,
                              HttpServletResponse response){
    	SendLetterForm sendLetterForm=(SendLetterForm) form;
    	sendLetterForm.setContent(chStr.toChinese(sendLetterForm.getContent()));
    	sendLetterForm.setFromMan(chStr.toChinese(sendLetterForm.getFromMan()));
        String ret=sendLetterDAO.sendLetter(sendLetterForm);
        if(ret.equals("ok")){
        	return mapping.findForward("sendLetter");
        }else{
            request.setAttribute("error",ret);
            return mapping.findForward("error");
        }
    }
    //查看历史记录
    private ActionForward queryHistory(ActionMapping mapping, ActionForm form,
                              HttpServletRequest request,
                              HttpServletResponse response) {
        request.setAttribute("history",sendLetterDAO.query());
        return mapping.findForward("queryHistory");
    }
    //接收短信息
    private ActionForward getLetterQuery(ActionMapping mapping, ActionForm form,
                              HttpServletRequest request,
                              HttpServletResponse response) {
        request.setAttribute("shortLetter",sendLetterDAO.getLetter());
        return mapping.findForward("getLetterQuery");
    }
}
