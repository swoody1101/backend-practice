<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String pValue = "백엔드개발자";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션 태그 - param</title>
</head>
<body>
	<jsp:useBean id="person" class="common.Person" scope="request" />
	<jsp:setProperty name="person" property="name" value="swoody" />
	<jsp:setProperty name="person" property="age" value="30" />
	<jsp:forward page="ParamForward.jsp?param1=이상우">
		<jsp:param name="param2" value="전라남도 여수" />
		<jsp:param name="param3" value="<%=pValue%>" />
	</jsp:forward>
</body>
</html>