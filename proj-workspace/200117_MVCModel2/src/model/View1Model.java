package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class View1Model implements Model
{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
	{
		System.out.println(this.getClass().getName() + " 생성");
	}
}
