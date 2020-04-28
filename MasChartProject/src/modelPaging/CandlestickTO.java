package modelPaging;

public class CandlestickTO
{
	private String candleKey;
	private String candleJSON;
	
	public String getCandleKey()
	{
		return candleKey;
	}
	public void setCandleKey(String candleKey)
	{
		this.candleKey = candleKey;
	}
	public String getCandleJSON()
	{
		return candleJSON;
	}
	public void setCandleJSON(String candleJSON)
	{		
		this.candleJSON = candleJSON;
	}
}
