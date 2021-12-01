package DB;

import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class Test {

	public static void main(String[] args) throws ParseException {
		// TODO Auto-generated method stub
		// 날짜 형식 변경하기
		String joindate = "2020-11-02 00:00:00";
		SimpleDateFormat dtFormat = new SimpleDateFormat("yyyyMMdd");
		SimpleDateFormat newDate = new SimpleDateFormat("yyyy-MM-dd");
		Date formatDate = dtFormat.parse(joindate);
		String joinDateStr = newDate.format(formatDate);
		System.out.println("joindate : " + joindate);
		System.out.println("formatDate : " + formatDate);
		System.out.println("joinDateStr : " + joinDateStr);
	}

}
