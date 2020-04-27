package subController;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelPaging.CandlestickTO;
import modelPaging.ChartListInfoTOTemp;
import modelPaging.MasDAO;

public class ChartAction implements MasAction
{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
	{
		// TODO Auto-generated method stub
		System.out.println("→ call " + this.getClass().getName() + " execute");
		
		MasDAO masDAO = new MasDAO();
		ChartListInfoTOTemp chartListInfoTOTemp = new ChartListInfoTOTemp();
		chartListInfoTOTemp.setFromSymbol(request.getParameter("fsym"));
		chartListInfoTOTemp.setToSymbol(request.getParameter("tsym"));
		
		ArrayList<CandlestickTO> list = masDAO.getCandlestickList(chartListInfoTOTemp, request.getParameter("historyTime"));		

		request.setAttribute("CandlestickLsit", list);
	}

}
