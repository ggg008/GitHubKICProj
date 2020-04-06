package config;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;//어노테이션 지원 클래스

import model1.DeptTO;

public interface SqlMapperInter
{
	// 어노테이션 기법을 이용한 mapper인터페이스	
	// List -> ArrayList
	@Select("SELECT * FROM dept")
	public ArrayList<DeptTO> selectList();
	
	@Select("SELECT * FROM dept WHERE deptno=#{deptno}")
	public DeptTO selectByDeptno(String deptno);
	
	//DML
	@Insert("INSERT INTO dept VALUES (#{deptno}, #{dname}, #{loc})")
	public int insert(DeptTO deptTO);
}
