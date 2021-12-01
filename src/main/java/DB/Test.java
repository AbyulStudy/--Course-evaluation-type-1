package DB;

import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class Test {

	public static void main(String[] args) throws ParseException {
		// TODO Auto-generated method stub
        //String to Date 변환
        String from = "20190303";
        SimpleDateFormat fDate = new SimpleDateFormat("yyyy.MM.dd"); //같은 형식으로 맞춰줌
        Date n = fDate.parse(from);

        System.out.println(n.getTime());
	}

}
