<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JTSL - import</title>
</head>
<body>
	<c:set var="requestVar" value="MustHave" scope="request" />
	<c:import url="11JSTL/inc/OtherPage.jsp" var="contents">
		<c:param name="user_param1" value="JSP" />
		<c:param name="user_param2" valu="기본서" />
	</c:import>
	
	<h4>다른 문서 삽입하기</h4>
	${ contents }
	
	<h4>외부 자원 삽입하기</h4>
	<iframe src="../inc/GoldPage.jsp" style="width:100%;height:600px;" />
</body>
</html>