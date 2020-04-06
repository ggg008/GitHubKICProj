package model2;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model1.ZipcodeDAO;
import model1.ZipcodeTO;

public class ZipcodeOkAction implements SubContoroller
{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
	{
//		System.out.println(this.getClass().getName() + " method call execute");
//		
//		System.out.println(request.getParameter("dong"));
//		
		
		String strDong = request.getParameter("dong");
		
		ZipcodeDAO zdao = new ZipcodeDAO();
		
		ArrayList<ZipcodeTO> zipcodeList = zdao.zipcodeList(strDong);
		
		for(ZipcodeTO zto : zipcodeList) {
			System.out.println(zto.getSeq());
		}
		
		request.setAttribute("data", "새로운 데이터");
		

	}

}
