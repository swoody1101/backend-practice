package utils;

public class BoardPage {
	public static String paginStr(int totalCount, int pageSize, int blockPage, int pageNum, String reqUrl) {
		String pagingStr = "";
		int totalPages = (int) (Math.ceil((double) totalCount / pageSize));

		int pageTemp = (((pageNum - 1) / blockPage) * blockPage) + 1;
		if (pageTemp != 1) {
			pagingStr += "<a href='" + reqUrl + "?pageNum=1'>[첫 페이지]</a>";
			pagingStr += "&nbsp;";
			pagingStr += "<a href='" + reqUrl + "?pageNum=" + (pageTemp - 1) + "'>[이전 블록]</a>";
		}

		int blockCount = 1;
		while (blockCount <= blockPage && pageTemp <= totalPages) {
			if (pageTemp == pageNum) {
				pagingStr += "&nbsp;" + pageTemp + "&nbsp;";
			} else {
				pagingStr += "<a href='" + reqUrl + "?pageNum=" + pageTemp + "'>" + pageTemp + "</a>&nbsp;";
			}
			pageTemp++;
			blockCount++;
		}

		if (pageTemp <= totalPages) {
			pagingStr += "<a href='" + reqUrl + "?pageNum=" + pageTemp + "'>[다음 블록]</a>";
			pagingStr += "&nbsp;";
			pagingStr += "<a href='" + reqUrl + "?pageNum=" + totalPages + "'>[마지막 페이지]</a>";
		}

		return pagingStr;
	}
}
