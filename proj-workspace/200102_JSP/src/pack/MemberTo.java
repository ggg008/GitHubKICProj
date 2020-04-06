package pack;

public class MemberTo
{
	private String id;
	private String password;
	
	public MemberTo()
	{
		// TODO Auto-generated constructor stub
		System.out.println("생성자 호출");
	}

	public String getId()
	{
		System.out.println("getId() 호출");
		return id;
	}

	public void setId(String id)
	{
		System.out.println("setID() 호출");
		this.id = id;
	}

	public String getPassword()
	{
		System.out.println("getPassword() 호출");
		return password;
	}

	public void setPassword(String password)
	{
		System.out.println("setPassword() 호출");
		this.password = password;
	}
}
