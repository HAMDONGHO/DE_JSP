<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>Hello JSP World!!</p>
	<hr color="gray">
	<p>second!!
	<%! int num =-5;
	String str = "jsp";
	ArrayList<String> list = new ArrayList<String>();
	public void jspMethod(){
		System.out.println("--jspMethod()--");
	}
	%>
	<% if(num>0){ %>
	<p> num >0 </p>
	<%}else{ %>
	<p> num <0 </p>
	<% 
	} 
	%>
num is <%= num %>
	

</body>
</html>