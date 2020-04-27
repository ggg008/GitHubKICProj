package subController;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelPaging.CandlestickTO;
import modelPaging.ChartListInfoTOTemp;
import modelPaging.MasDAO;

public class ChartListAction implements MasAction
{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
	{
		// TODO Auto-generated method stub
//		System.out.println("→ call " + this.getClass().getName() + " execute");
		
		MasDAO masDAO = new MasDAO();
		
		ArrayList<ChartListInfoTOTemp> chartlist = masDAO.getChartList();		

		request.setAttribute("ChartList", chartlist);
	}

}
