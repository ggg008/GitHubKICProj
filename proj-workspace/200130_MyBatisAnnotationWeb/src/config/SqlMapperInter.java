package config;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;//어노테이션 지원 클래스

import model1.DeptTO;
import model1.EmpTO;

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
	
	// emp에서 s시작하는 사원정보(사원번호, 사원명, 급여)
	@Select("SELECT empno, ename, sal FROM emp WHERE ename LIKE 's%'")
	public ArrayList<EmpTO> selectEmpList();
	
}
