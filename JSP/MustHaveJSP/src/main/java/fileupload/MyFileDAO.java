package fileupload;

import common.DBConnPool;

public class MyFileDAO extends DBConnPool {
	public int insertFile(MyFileDTO dto) {
		int applyResult = 0;
		
		try {
			String query = "INSERT INTO myfile ("
					+ " idx, title, cate, ofile, sfile)"
					+ " value ("
					+ " seq_board_num.nextval, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getCate());
			pstmt.setString(3, dto.getOfile());
			pstmt.setString(4, dto.getSfile());
			
			applyResult = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("파일 정보 INSERT 중 예외 발생");
			e.printStackTrace();
		}
		
		return applyResult;
	}
}
