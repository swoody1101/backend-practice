package membership;

import common.JDBConnect;

public class MemberDAO extends JDBConnect {
	public MemberDAO(String drv, String url, String id, String pw) {
		super(drv, url, id, pw);
	}

	public MemberDTO getMemberDTO(String uid, String upass) {
		MemberDTO dto = new MemberDTO();
		String query = "SELECT * FROM member WHERE id=? AND pass=?";

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, uid);
			pstmt.setString(2, upass);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString("name"));
				dto.setRegidate(rs.getString(4));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}
}
