<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="model1.BoardTO"%>
<%
	//model2 -> ***Action -> 뷰에서 사용
	BoardTO to1 = new BoardTO();
	to1.setSubject("제목");
	to1.setWriter("작성자");

	BoardTO to2 = new BoardTO();
	to2.setSubject("제목2");
	to2.setWriter("작성자2");

	BoardTO[] list = { to1, to2 };

	//pageContext.setAttribute("to", to);
	request.setAttribute("list", list);

	ArrayList<BoardTO> list2 = new ArrayList<>();
	list2.add(to1);
	list2.add(to2);

	request.setAttribute("list2", list2);

	HashMap<String, BoardTO> list3 = new HashMap<>();
	list3.put("tokey1", to1);
	list3.put("tokey2", to2);

	request.setAttribute("list3", list3);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	${ list[0].subject }
	<br> ${ list[1]["subject"] }
	<br> ${ list[5].subject }
	<!-- 에러는 나지 않음(값이 출력 안될뿐)(내부에서 익셉션 처리) -->
	<br>
	<hr>

	${ list2[0].subject }
	<br> ${ list2[1]["subject"] }
	<br>

	<hr>

	${ list3.tokey1.subject }
	<br> ${ list3.tokey2["subject"] }
	<!-- not error -->
	<br> ${ list3.tokey3["subject"] } 
	<br> ${ list3.to4.subject }
	<br>

</body>
</html>