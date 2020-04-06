package _200117_listener;

import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

public class P278TestSessionAttributeListener implements HttpSessionAttributeListener
{
	public P278TestSessionAttributeListener()
	{
		System.out.println("P278TestSessionAttributeListener 객체 생성");
	}
	
	@Override
	public void attributeAdded(HttpSessionBindingEvent event)
	{
		System.out.println("세션 객체에 속성 추가");
	}
	
	@Override
	public void attributeRemoved(HttpSessionBindingEvent event)
	{
		System.out.println("세션 객체에 추가된 속성 삭제");
	}
	
	@Override
	public void attributeReplaced(HttpSessionBindingEvent event)
	{
		System.out.println("세션 객체에 추가된 속성 대체");
	}
	
}
