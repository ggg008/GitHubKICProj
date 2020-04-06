package utill;

import java.text.DecimalFormat;

public class FormatUtill
{
	//EL 출력 처리용 메서드
	public static String number(long number, String pattern)
	{
		DecimalFormat format = new DecimalFormat(pattern);
		
		return format.format(number);		
	}
}
