package albumModel;

public class AlbumCommentTO
{
	private String commentno;
	private String writer;
	private String password;
	private String content;
	private String wip;
	private String wdate;
	private String parentseq;
	

	public String getCommentno()
	{
		return commentno;
	}
	public void setCommentno(String commentno)
	{
		this.commentno = commentno;
	}
	public String getWriter()
	{
		return writer;
	}
	public void setWriter(String writer)
	{
		this.writer = writer;
	}
	public String getPassword()
	{
		return password;
	}
	public void setPassword(String password)
	{
		this.password = password;
	}
	public String getContent()
	{
		return content;
	}
	public void setContent(String content)
	{
		this.content = content;
	}
	public String getWip()
	{
		return wip;
	}
	public void setWip(String wip)
	{
		this.wip = wip;
	}
	public String getWdate()
	{
		return wdate;
	}
	public void setWdate(String wdate)
	{
		this.wdate = wdate;
	}
	public String getParentseq()
	{
		return parentseq;
	}
	public void setParentseq(String parentseq)
	{
		this.parentseq = parentseq;
	}
}
