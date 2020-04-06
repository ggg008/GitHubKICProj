package _200117_listener;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class P277TestSessionListener implements HttpSessionListener
{
	public P277TestSessionListener()
	{
		System.out.println("P277TestSessionListener 객체 생성");
	}
	
	@Override
	public void sessionCreated(HttpSessionEvent se)
	{
		//1인당=1세션 : 주로 대기 인원 파악하기에 용이
		System.out.println("세션 객체 생성");
	}
	
	@Override
	public void sessionDestroyed(HttpSessionEvent se)
	{
		System.out.println("세션 객체 해제");
	}
}
