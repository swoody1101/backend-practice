<%@page import="utils.BoardPage"%>
<%@page import="model1.board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
BoardDAO dao = new BoardDAO(application);

Map<String, Object> param = new HashMap<String, Object>();
String searchField = request.getParameter("searchField");
String searchWord = request.getParameter("searchWord");
if (searchWord != null) {
	param.put("searchField", searchField);
	param.put("searchWord", searchWord);
}

int totalCount = dao.selectCount(param);
int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
int totalPage = (int) Math.ceil((double) totalCount / pageSize);

int pageNum = 1;
String pageTemp = request.getParameter("pageNum");
if (pageTemp != null && !pageTemp.equals("")) {
	pageNum = Integer.parseInt(pageTemp);
}

int start = (pageNum - 1) * pageSize + 1;
int end = pageNum * pageSize;
param.put("start", start);
param.put("end", end);

List<BoardDTO> boardLists = dao.selectListPage(param);
dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
</head>
<body>
	<jsp:include page="../Common/Link.jsp" />

	<h2>목록 보기(List) - 현재 페이지 : <%=pageNum%> (전체 : <%= totalPage %>)</h2>
	<form method="get">
		<table border="1" width="90%">
			<tr>
				<td align="center"><select name="searchField">
						<option value="title">제목</option>
						<option value="content">내용</option>
				</select> <input type="text" name="searchWord" /> <input type="submit"
					value="검색하기" /></td>
			</tr>
		</table>
	</form>

	<table border="1" width="90%">
		<tr>
			<th width="10%">번호</th>
			<th width="50%">제목</th>
			<th width="15%">작성자</th>
			<th width="10%">조회수</th>
			<th width="15%">작성일</th>
		</tr>
		<%
		if (boardLists.isEmpty()) {
		%>
		<tr>
			<td colspan="5" align="center">등록된 게시물이 없습니다.</td>
		</tr>
		<%
		} else {
			int virtualNum = 0;
			int countNum = 0;
			for (BoardDTO dto : boardLists) {
				virtualNum = totalCount - (((pageNum - 1) * pageSize) + countNum++);
			%>
			<tr align="center">
				<td><%=virtualNum%></td>
				<td align="left">
					<a href="View.jsp?num=<%=dto.getNum()%>"><%=dto.getTitle()%></a>
				</td>
				<td align="center"><%=dto.getId()%></td>
				<td align="center"><%=dto.getVisitcount()%></td>
				<td align="center"><%=dto.getPostdate()%></td>
			</tr>
			<%
			}
		}
		%>
	</table>

	<table border="1" width="90%">
		<tr align="center">
			<td>
				<%=BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, request.getRequestURI())%>
			</td>
			<td>
				<button type="button" onclick="location.href='Write.jsp';">글쓰기</button>
			</td>
		</tr>
	</table>
</body>
</html>