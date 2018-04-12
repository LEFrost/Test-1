package com.wgh.action;

import org.apache.struts.action.*;

import com.wgh.actionForm.InfoTypeForm;
import com.wgh.core.ChStr;
import com.wgh.dao.InfoTypeDAO;

import javax.servlet.http.*;

public class InfoType extends Action {
    private InfoTypeDAO infoTypeDAO = null;
    private ChStr chStr=new ChStr();
    public InfoType() {
        this.infoTypeDAO = new InfoTypeDAO();
    }	
	public ActionForward execute(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response){
        String action = request.getParameter("action");
        System.out.println("获取的查询字符串：" + action);
        if (action == null || "".equals(action)) {
            return mapping.findForward("error");
		}else if ("infoTypeQuery".equals(action)) {
            return infoTypeQuery(mapping, form, request,response);
			
		}else if("infoTypeAdd".equals(action)){
			 return infoTypeAdd(mapping, form, request,response);
		}else if("infoTypeDel".equals(action)){
			return infoTypeDel(mapping, form, request,response);
		}
		request.setAttribute("error", "操作失败！");
		return mapping.findForward("error");
	}

    //查询信息类别
    private ActionForward infoTypeQuery(ActionMapping mapping, ActionForm form,
                              HttpServletRequest request,
                              HttpServletResponse response) {
        request.setAttribute("infoTypeQuery", infoTypeDAO.query(0));
        return mapping.findForward("infoTypeQuery");
    }

    //添加信息类别
    private ActionForward infoTypeAdd(ActionMapping mapping, ActionForm form,
                              HttpServletRequest request,
                              HttpServletResponse response) {
        InfoTypeForm infoTypeForm = (InfoTypeForm) form;
        infoTypeForm.setName(chStr.toChinese(infoTypeForm.getName()));
        int ret = infoTypeDAO.insert(infoTypeForm);
        System.out.println("返回值ret："+ret);
        if (ret == 1) {
            return mapping.findForward("infoTypeAdd");
        } else if(ret==2){
            request.setAttribute("error","该信息类别已经添加！");
            return mapping.findForward("error");
        }else {
            request.setAttribute("error","添加信息类别失败！");
            return mapping.findForward("error");
        }
    }

    //删除信息类别
    private ActionForward infoTypeDel(ActionMapping mapping, ActionForm form,
                              HttpServletRequest request,
                              HttpServletResponse response) {
        InfoTypeForm infoTypeForm = (InfoTypeForm) form;
        infoTypeForm.setID(Integer.parseInt(request.getParameter("id")));
        int ret = infoTypeDAO.delete(infoTypeForm);
        if (ret == 0) {
            request.setAttribute("error","删除信息类别失败！");
            return mapping.findForward("error");
        } else {
            return mapping.findForward("infoTypeDel");
        }
    }

}
