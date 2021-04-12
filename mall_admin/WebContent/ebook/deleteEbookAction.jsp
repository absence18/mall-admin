<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="gdu.mall.vo.*" %>
<%@ page import = "gdu.mall.dao.*" %>
<%@ page import="java.util.*" %>

<%
	//deleteEbookAction.jsp
	
	//값 수집
	String ebookISBN = request.getParameter("ebookISBN");

	//값 디버깅
	System.out.println(ebookISBN + "<-- deleteEbookAction.jsp에서 ebookISBN");
	
	//삭제실행
	EbookDao.deleteEbook(ebookISBN);
	
	//리다이렉션
	response.sendRedirect(request.getContextPath()+"/ebook/ebookList.jsp");
%>