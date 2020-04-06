package _200117_listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class ListenerEx01 implements ServletContextListener
{
	@Override
	public void contextInitialized(ServletContextEvent sce)
	{
		System.out.println("contextInitialized 호출");
	}
	
	@Override
	public void contextDestroyed(ServletContextEvent sce)
	{
		System.out.println("contextDestroyed 호출");
	}
}
