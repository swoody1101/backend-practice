<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String outerPath1 = "./inc/OuterPage1.jsp";
String outerPath2 = "./inc/OuterPage2.jsp";

pageContext.setAttribute("pAttr", "동명왕");
request.setAttribute("rAttr", "온조왕");
%>
<html>
<head>
<meta charset="UTF-8">
<title>지시어와 액션 태그 동작 방식 비교</title>
</head>
<body>
	<h2>지시어와 액션 태그 동작 방식 비교</h2>
	
	<h3>지시어로 페이지 포함하기</h3>
	<%@include file="./inc/OuterPage1.jsp"%>
	<!-- 에러 발생 -->
	<%--@include file="<%=outerPath1%>"--%>
	<p>외부 파일에 선언한 변수 : <%=newVar1%></p>
	
	<h3>액션 태그로 페이지 포함하기</h3>
	<jsp:include page="./inc/OuterPage2.jsp"/>
	<jsp:include page="<%=outerPath2%>"/>
	<!-- 에러 발생 -->
	<p>외부 파일에 선언한 변수 : <%--=newVar2--%></p>
</body>
</html>