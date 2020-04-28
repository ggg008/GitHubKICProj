package modelPaging;

public class ChartListInfoTOTemp
{
	private String fromSymbol;
	private String toSymbol;
	
	public ChartListInfoTOTemp(String fromSymbol, String toSymbol)
	{
		this.fromSymbol = fromSymbol;
		this.toSymbol = toSymbol;
	}
	
	public String getFromSymbol()
	{
		return fromSymbol;
	}
	public void setFromSymbol(String fromSymbol)
	{
		this.fromSymbol = fromSymbol;
	}
	
	public String getToSymbol()
	{
		return toSymbol;
	}
	public void setToSymbol(String toSymbol)
	{
		this.toSymbol = toSymbol;
	}
}
