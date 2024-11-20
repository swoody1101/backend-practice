package el;

public class MyELCLass {
	public String getGender(String jumin) {
		String returnStr = "";
		int beginIdx = jumin.indexOf("-") + 1;
		String genderStr = jumin.substring(beginIdx, beginIdx + 1);
		int genderInt = Integer.parseInt(genderStr);

		if (genderInt == 1 || genderInt == 3) {
			returnStr = "남자";
		} else if (genderInt == 2 || genderInt == 4) {
			returnStr = "여자";
		} else {
			returnStr = "주민번호 오류입니다.";
		}

		return returnStr;
	}

	public static boolean isNumber(String value) {
		char[] chArr = value.toCharArray();
		for (int i = 0; i < chArr.length; i++) {
			if (!(chArr[i] >= '0' && chArr[i] <= '9')) {
				return false;
			}
		}
		return true;
	}

	public static String showGugudan(int limitDan) {
		System.out.println("함수 호출");
		StringBuffer sb = new StringBuffer();
		try {
			sb.append("<table border='1'>");
			for (int i = 2; i <= limitDan; i++) {
				sb.append("<tr>");
				for (int j = 1; j <= 9; j++) {
					sb.append("<td>" + i + "*" + j + "=" + (i * j) + "</td>");
				}
				sb.append("</tr>");
			}
			sb.append("</table>");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return sb.toString();
	}
}
