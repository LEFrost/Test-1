package com.wgh.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.*;

import com.wgh.actionForm.PersonnelForm;
import com.wgh.core.ChStr;
import com.wgh.dao.PersonnelDAO;

public class Personnel extends Action{
    private PersonnelDAO personnelDAO = null;
    private ChStr chStr=new ChStr();
    public Personnel() {
        this.personnelDAO = new PersonnelDAO();
    }	
	public ActionForward execute(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response){
        String action = request.getParameter("action");
        System.out.println("获取的查询字符串：" + action);
        if (action == null || "".equals(action)) {
            return mapping.findForward("error");
        }else if ("personnelQuery".equals(action)) {
            return personnelQuery(mapping, form, request,response);
			
		}else if("personnelAdd".equals(action)){
			 return personnelAdd(mapping, form, request,response);
		}else if("personnelDel".equals(action)){
			return personnelDel(mapping, form, request,response);
		} else if("personnelModifyQ".equals(action)){
                return personnelQueryModify(mapping, form, request,response);
        }else if("personnelModify".equals(action)){
            return personnelModify(mapping, form, request,response);
        }
			request.setAttribute("error", "操作失败！");
			return mapping.findForward("error");
	}
    //查询员工信息
    private ActionForward personnelQuery(ActionMapping mapping, ActionForm form,
                              HttpServletRequest request,
                              HttpServletResponse response) {
        request.setAttribute("personnelQuery", personnelDAO.query(0));
        return mapping.findForward("personnelQuery");
    }

    //添加员工信息
    private ActionForward personnelAdd(ActionMapping mapping, ActionForm form,
                              HttpServletRequest request,
                              HttpServletResponse response) {
        PersonnelForm personnelForm = (PersonnelForm) form;
        //此处需要进行中文转码
        personnelForm.setName(chStr.toChinese(personnelForm.getName()));
        personnelForm.setSex(chStr.toChinese(personnelForm.getSex()));
        personnelForm.setSchool(chStr.toChinese(personnelForm.getSchool()));
        personnelForm.setEducation(chStr.toChinese(personnelForm.getEducation()));
        personnelForm.setSpecialty(chStr.toChinese(personnelForm.getSpecialty()));
        personnelForm.setPlace(chStr.toChinese(personnelForm.getPlace()));   
        int ret = personnelDAO.insert(personnelForm);
        System.out.println("返回值ret："+ret);
        if (ret == 1) {
            return mapping.findForward("personnelAdd");
        } else if(ret==2){
            request.setAttribute("error","该员工信息已经添加！");
            return mapping.findForward("error");
        }else {
            request.setAttribute("error","添加员工信息失败！");
            return mapping.findForward("error");
        }
    }
    //修改员工信息的查询
    private ActionForward personnelQueryModify(ActionMapping mapping, ActionForm form,
                              HttpServletRequest request,
                              HttpServletResponse response) {
        PersonnelForm personnelForm = (PersonnelForm) form;
        request.setAttribute("personnelQuery",personnelDAO.query(Integer.parseInt(request.getParameter("id"))));
        return mapping.findForward("personnelQueryModify");
    }
    //修改员工信息
    private ActionForward personnelModify(ActionMapping mapping, ActionForm form,
                              HttpServletRequest request,
                              HttpServletResponse response){
        PersonnelForm personnelForm=(PersonnelForm) form;
        //此处需要进行中文转码
        personnelForm.setName(chStr.toChinese(personnelForm.getName()));
        personnelForm.setSex(chStr.toChinese(personnelForm.getSex()));
        personnelForm.setSchool(chStr.toChinese(personnelForm.getSchool()));
        personnelForm.setEducation(chStr.toChinese(personnelForm.getEducation()));
        personnelForm.setSpecialty(chStr.toChinese(personnelForm.getSpecialty()));
        personnelForm.setPlace(chStr.toChinese(personnelForm.getPlace())); 
        int ret=personnelDAO.update(personnelForm);
        if(ret==0){
            request.setAttribute("error","修改员工信息失败！");
            return mapping.findForward("error");
        }else{
            return mapping.findForward("personnelModify");
        }
    }
    //删除员工信息
    private ActionForward personnelDel(ActionMapping mapping, ActionForm form,
                              HttpServletRequest request,
                              HttpServletResponse response) {
        PersonnelForm personnelForm = (PersonnelForm) form;
        personnelForm.setID(Integer.parseInt(request.getParameter("id")));
        int ret = personnelDAO.delete(personnelForm);
        if (ret == 0) {
            request.setAttribute("error","删除员工信息失败！");
            return mapping.findForward("error");
        } else {
            return mapping.findForward("personnelDel");
        }
    }
}
