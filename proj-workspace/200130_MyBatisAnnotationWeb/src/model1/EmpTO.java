package model1;

public class EmpTO
{
	private String empno;
	private String ename;
	private String sal;

	private String deptno;
	private String salGrade;
	
	
	public String getEmpno()
	{
		return empno;
	}
	public void setEmpno(String empno)
	{
		this.empno = empno;
	}
	public String getEname()
	{
		return ename;
	}
	public void setEname(String ename)
	{
		System.out.println("call setter Ename()");
		this.ename = ename;
	}
	public String getSal()
	{
		return sal;
	}
	public void setSal(String sal)
	{
		this.sal = sal;
	}
	public String getDeptno()
	{
		return deptno;
	}
	public void setDeptno(String deptno)
	{
		this.deptno = deptno;
	}
	public String getSalGrade()
	{
		return salGrade;
	}
	public void setSalGrade(String salGrade)
	{
		this.salGrade = salGrade;
	}
}
