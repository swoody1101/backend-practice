package model1.board;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.JDBConnect;
import jakarta.servlet.ServletContext;

public class BoardDAO extends JDBConnect {
	public BoardDAO(ServletContext application) {
		super(application);
	}

	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;

		String query = "SELECT COUNT(*) FROM board ";
		if (map.get("searchWord") != null) {
			query += "WHERE " + map.get("searchField") + " " + "LIKE '%" + map.get("searchWord") + "%'";
		}

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			totalCount = rs.getInt(1);
		} catch (Exception e) {
			System.out.println("게시물 수를 구하는 중 예외 발생");
			e.printStackTrace();
		}

		return totalCount;
	}

	public List<BoardDTO> selectList(Map<String, Object> map) {
		List<BoardDTO> bbs = new Vector<BoardDTO>();

		String query = "SELECT * FROM board ";
		if (map.get("searchWord") != null) {
			query += "WHERE " + map.get("searchField") + " LIKE '%" + map.get("searchWord") + "%'";
		}

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			while (rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString("visitcount"));
				bbs.add(dto);
			}
		} catch (Exception e) {
			System.out.println("게시물 리스트를");
			e.printStackTrace();
		}

		return bbs;
	}

	public int insertWrite(BoardDTO dto) {
		int result = 0;

		try {
			String query = "INSERT INTO board (" + "num, title, content, id, visitcount) " + "VALUES ("
					+ "seq_board_num.NEXTVAL, ?, ?, ?, 0)";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getId());

			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}

		return result;
	}

	public BoardDTO selectView(String num) {
		BoardDTO dto = new BoardDTO();

		String query = "SELECT B.*, M.name " + "FROM member M INNER JOIN board B " + "ON M.id=B.id " + "WHERE B.num=?";

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString("visitcount"));
				dto.setName(rs.getString("name"));
			}
		} catch (Exception e) {
			System.out.println("게시물 상세보기 중 예외 발생");
			e.printStackTrace();
		}

		return dto;
	}

	public void updateVisitCount(String num) {
		String query = "UPDATE board SET " + "visitcount=visitcount+1 " + "WHERE num=?";

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, num);
			pstmt.executeQuery();
		} catch (Exception e) {
			System.out.println("게시물 조회수 증가 중 예외 발생");
		}
	}

	public int updateEdit(BoardDTO dto) {
		int result = 0;

		try {
			String query = "UPDATE board SET "
					+ "title=?, content=? "
					+ "WHERE num=?";
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3,dto.getNum());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시물 수정 중 예외 발생");
			e.printStackTrace();
		}
		
		return result;
	}
}
