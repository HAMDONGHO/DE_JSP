<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!
	String adminID;
	String adminPW;
	String imgdir;
	String TestServerIP;%>
	
	<%
	adminID= config.getInitParameter("adminId");
	adminPW= config.getInitParameter("adminPw");
	//application 객체!! 이건 여기저기서 어떤 이미지나 아이피 등 이런거 가져올때 사
	imgdir = application.getInitParameter("imgDir");
	TestServerIP = application.getInitParameter("testServerIP");%>
	
	<p>adminID = <%=adminID %></p>
	<p>adminPW = <%=adminPW %></p>
	<p>imgDir = <%=imgdir %></p>
	<p>TestServerIP = <%=TestServerIP %></p>
	
	<%
		out.print("<h1>jsp이용해서도 html출력 가능!</h1>");%>
	
	<% 
	//이러면 다른 js파일에서 connecitonIP값을 (String)application.getAttribute("connectedIP");해서 가져올 수 있
		application.setAttribute("connecionIP", "165.62.98.23");
		application.setAttribute("connectedUser", "HAM");
	%>
	
	

</body>
</html>