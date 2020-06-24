package com.javaex.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javaex.dao.GuestBookDao;
import com.javaex.util.WebUtil;
import com.javaex.vo.GuestBookVo;

@WebServlet("/gbc")
public class GuestBookController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("gbc");
		String action = request.getParameter("action");
		GuestBookDao gDao = new GuestBookDao();
		
		switch(action) {
		case "addlist" : 
			List<GuestBookVo> gList = gDao.getPersonList();
			request.setAttribute("gList", gList);
			WebUtil.foword(request, response, "/WEB-INF/addList.jsp");
			break;
		case "add" :
			String name = request.getParameter("name");
			String password_write = request.getParameter("password");
			String content = request.getParameter("content");
			GuestBookVo gVo = new GuestBookVo(name, password_write, content);
			gDao.GuestBookInsert(gVo);
			WebUtil.redeirect(request, response, "./gbc?action=addlist");
			break;
		case "deleteForm" :
			WebUtil.foword(request, response, "/WEB-INF/deleteForm.jsp");
		case "delete" :
			int no = Integer.parseInt(request.getParameter("no"));
			String password_delete = request.getParameter("password");
			gDao.guestDelete(no, password_delete);
			WebUtil.redeirect(request, response, "./gbc?action=addlist");
		default : System.out.println(action);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
