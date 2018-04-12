package com.wgh.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.*;

import com.wgh.actionForm.CustomerForm;
import com.wgh.core.ChStr;
import com.wgh.dao.CustomerDAO;

public class Customer extends Action{
    private CustomerDAO customerDAO = null;
    private ChStr chStr=new ChStr();
    public Customer() {
        this.customerDAO = new CustomerDAO();
    }	
	public ActionForward execute(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response){
        String action = request.getParameter("action");
        System.out.println("获取的查询字符串：" + action);
        if (action == null || "".equals(action)) {
        	request.setAttribute("error","您的操作有误！");
            return mapping.findForward("error");
        }else if ("customerQuery".equals(action)) {
            return customerQuery(mapping, form, request,response);
		}else if("customerAdd".equals(action)){
			 return customerAdd(mapping, form, request,response);
		}else if("customerDel".equals(action)){
			return customerDel(mapping, form, request,response);
		} else if("customerModifyQ".equals(action)){
                return customerQueryModify(mapping, form, request,response);
        }else if("customerModify".equals(action)){
            return customerModify(mapping, form, request,response);
        }
			request.setAttribute("error", "操作失败！");
			return mapping.findForward("error");
	}
    //查询客户信息
    private ActionForward customerQuery(ActionMapping mapping, ActionForm form,
                              HttpServletRequest request,
                              HttpServletResponse response) {
        request.setAttribute("customerQuery", customerDAO.query(0));
        return mapping.findForward("customerQuery");
    }

    //添加客户信息
    private ActionForward customerAdd(ActionMapping mapping, ActionForm form,
                              HttpServletRequest request,
                              HttpServletResponse response) {
        CustomerForm customerForm = (CustomerForm) form;
        //此处需要进行中文转码
        customerForm.setName(chStr.toChinese(customerForm.getName()));
        customerForm.setAddress(chStr.toChinese(customerForm.getAddress()));
        customerForm.setArea(chStr.toChinese(customerForm.getArea()));
        customerForm.setBankName(chStr.toChinese(customerForm.getBankName()));
        customerForm.setLinkName(chStr.toChinese(customerForm.getLinkName()));
        int ret = customerDAO.insert(customerForm);
        System.out.println("返回值ret："+ret);
        if (ret == 1) {
            return mapping.findForward("customerAdd");
        } else if(ret==2){
            request.setAttribute("error","该客户信息已经添加！");
            return mapping.findForward("error");
        }else {
            request.setAttribute("error","添加客户信息失败！");
            return mapping.findForward("error");
        }
    }
    //修改客户信息的查询
    private ActionForward customerQueryModify(ActionMapping mapping, ActionForm form,
                              HttpServletRequest request,
                              HttpServletResponse response) {
        request.setAttribute("customerQuery",customerDAO.query(Integer.parseInt(request.getParameter("id"))));
        return mapping.findForward("customerQueryModify");
    }
    //修改客户信息
    private ActionForward customerModify(ActionMapping mapping, ActionForm form,
                              HttpServletRequest request,
                              HttpServletResponse response){
        CustomerForm customerForm=(CustomerForm) form;
        //此处需要进行中文转码
        customerForm.setName(chStr.toChinese(customerForm.getName()));
        customerForm.setAddress(chStr.toChinese(customerForm.getAddress()));
        customerForm.setArea(chStr.toChinese(customerForm.getArea()));
        customerForm.setBankName(chStr.toChinese(customerForm.getBankName()));
        customerForm.setLinkName(chStr.toChinese(customerForm.getLinkName()));
        int ret=customerDAO.update(customerForm);
        if(ret==0){
            request.setAttribute("error","修改客户信息失败！");
            return mapping.findForward("error");
        }else{
            return mapping.findForward("customerModify");
        }
    }
    //删除客户信息
    private ActionForward customerDel(ActionMapping mapping, ActionForm form,
                              HttpServletRequest request,
                              HttpServletResponse response) {
        CustomerForm customerForm = (CustomerForm) form;
        customerForm.setID(Integer.parseInt(request.getParameter("id")));
        int ret = customerDAO.delete(customerForm);
        if (ret == 0) {
            request.setAttribute("error","删除客户信息失败！");
            return mapping.findForward("error");
        } else {
            return mapping.findForward("customerDel");
        }
    }
}
