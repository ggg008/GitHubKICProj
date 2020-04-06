package config;

import java.util.ArrayList;

//어노테이션 지원 클래스
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model1.BoardTO;

public interface SqlMapperInter
{
	// 어노테이션 기법을 이용한 mapper인터페이스	
	// List -> ArrayList
	//	myBatis규칙에 따라 파라메터는 하나로 제한(여러값을 넣고 싶을때는 TO사용)
	@Select("SELECT seq, subject, writer, date_format(wdate, '%Y-%m-%d') wdate, hit, datediff(now(), wdate) wgap " + 
			"		FROM board1 " + 
			"		ORDER BY seq DESC")
	public ArrayList<BoardTO> selectBoardList();
	
	@Update("UPDATE board1 " + 
			"		SET hit=hit+1 " + 
			"		WHERE seq = #{seq}")
	public int updateBoardViewHit(String seq);
	
	@Select("SELECT seq, subject, writer, date_format(wdate, '%Y-%m-%d %h:%i:%s') wdate, mail, wip, hit, content " + 
			"		FROM board1 " + 
			"		WHERE seq = #{seq}")
	public BoardTO updateBoardView(BoardTO bTo);
	
	@Insert("INSERT INTO board1 " + 
			"		VALUES(0, #{subject}, #{writer}, #{mail}, #{password}, #{content}, 0, #{wip}, now())")
	public int insertBoardWriteOk(BoardTO bTo);
	
	@Select("SELECT seq, writer, subject, content, mail, password" + 
			"		FROM board1 " + 
			"		WHERE seq = #{seq}")
	public BoardTO selectBoardModify(BoardTO bTo);
	
	@Update("UPDATE board1 " + 
			"		SET writer=#{writer}, subject=#{subject}, content=#{content}, mail=#{mail} " + 
			"		WHERE seq=#{seq} AND password=#{password}")
	public int updateBoardModifyOk(BoardTO bTo);
	
	@Select("SELECT seq, writer, subject" + 
			"		FROM board1 " + 
			"		WHERE seq = #{seq}")
	public BoardTO selectBoardDelete(BoardTO bTo);
	
	@Delete("DELETE FROM board1 " + 
			"		WHERE seq=#{seq} AND password=#{password}")
	public int deleteBoardDeleteOk(BoardTO bTo);
	
}
