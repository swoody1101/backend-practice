<%@page import="utils.JSFunction"%>
<%@page import="model1.board.BoardDTO"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String num = request.getParameter("num");
String title = request.getParameter("title");
String content = request.getParameter("content");

BoardDTO dto = new BoardDTO();
dto.setNum(num);
dto.setTitle(title);
dto.setContent(content);

BoardDAO dao = new BoardDAO(application);
int affected = dao.updateEdit(dto);
dao.close();

if (affected == 1) {
	response.sendRedirect("View.jsp?num=" + dto.getNum());
} else {
	JSFunction.alertBack("수정하기에 실패하였습니다.", out);
}
%>