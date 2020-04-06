<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pageContext</title>
</head>
<body>
	<!-- pageContext로 include, forward기능 사용 -->
	<!-- 메서드선언 -->
	<%!public void work(String p, PageContext pc)
	{
		try {
			JspWriter out = pc.getOut();

			if (p.equals("include")) {

				out.print("-- include 전 -- <br>");
				pc.include("test.jsp");
				out.print("-- include 후 -- <br>");

			} else if (p.equals("forward")) {
				out.print("-- forward -- <br>");//비출력
				pc.forward("test.jsp");
			}

		} catch (Exception e) {
			System.out.println("오류 발생" + e.getMessage() + " = " + e.getStackTrace()[0].getLineNumber());
		}

	}%>
	<%	
		String p = request.getParameter("p");
		this.work(p, pageContext);
	%>
</body>
</html>