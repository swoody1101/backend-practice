<%@page import="model1.board.BoardDTO"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String num = request.getParameter("num");

BoardDAO dao = new BoardDAO(application);
dao.updateVisitCount(num);
BoardDTO dto = dao.selectView(num);

System.out.println(dto.getContent());

dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
<script>
	function deletePost() {

	}
</script>
</head>
<body>
	<jsp:include page="../Common/Link.jsp" />
	<h2>회원제 게시판 - 상세 보기(View)</h2>
	<form name="writeFrm">
		<input type="hidden" name="num" value="<%=num%>" />
		<table border="1" width="90%">
			<tr>
				<td>번호</td>
				<td><%=dto.getNum()%></td>
				<td>작성자</td>
				<td><%=dto.getName()%></td>
			</tr>
			<tr>
				<td>작성일</td>
				<td><%=dto.getPostdate()%></td>
				<td>조회수</td>
				<td><%=dto.getVisitcount()%></td>
			</tr>
			<tr>
				<td>제목</td>
				<td colspan="3"><%=dto.getTitle()%></td>
			</tr>
			<tr>
				<td>내용</td>
				<td colspan="3" height="100">
					<%=dto.getContent().replace("\r\n", "<br/>")%>
				</td>
			</tr>
			<tr>
				<td colspan="4" align="center">
					<%
					if (session.getAttribute("UserId") != null 
						&& session.getAttribute("UserId").toString().equals(dto.getId())) {
					%>
					<button type="submit" onclick="location.href='Edit.jsp?num=<%=dto.getNum()%>';">
						수정하기
					</button>
					<button type="submit" onclick="deletePost();">
						삭제하기
					</button>
					<%	
					}
					%>
					<button type="button" onclick="location.href='List.jsp';">
						목록 보기
					</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>