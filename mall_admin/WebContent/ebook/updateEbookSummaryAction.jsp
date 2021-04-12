<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="gdu.mall.vo.*" %>
<%@ page import = "gdu.mall.dao.*" %>
<%@ page import="java.util.*" %>

<%
	// 수집
	request.setCharacterEncoding("utf-8");
	String ebookISBN = request.getParameter("ebookISBN");
	String newEbookSummary = request.getParameter("newEbookSummary");
	
	// 디버깅
	System.out.println(ebookISBN + "<--- updateEbookSummaryAction.java에서 ebookISBN");
	System.out.println(newEbookSummary + "<--- updateEbookSummaryAction.java에서 newEbookSummary");
	
	// 값 생성
	Ebook ebook = new Ebook();
	ebook.setEbookISBN(ebookISBN);
	ebook.setEbookSummary(newEbookSummary);
	
	// 실행
	EbookDao.updateEbookSummary(ebook);
	
	response.sendRedirect(request.getContextPath()+"/ebook/ebookOne.jsp?ebookISBN="+ebookISBN);

%>