<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<%@ page import="jsp.eatday.model.Rest" %>
<%@ page import="jsp.eatday.model.RestDAO" %>    
<%@ page import="jsp.eatday.myrest.model.MyRest" %>
<%@ page import="jsp.eatday.myrest.model.MyRestDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8");//한글 깨짐 방 %>
<%
	String rest_name = request.getParameter("myrest_name");
	String rest_location = request.getParameter("myrest_location");
	String Name = null;
	String Location = null;
	String Address = null;
	String Rep = null;
	String Salestime = null;
	String Number = null;
	double Latitude = 0;
	double Longitude = 0;
	
	RestDAO myrest = new RestDAO();
	ArrayList<Rest> info = myrest.getmypgeinfo(rest_name, rest_location);
	
	for (Rest infor: info){
		Name = infor.getName();
		Location = infor.getLocation();
		Address = infor.getAddress();
		Rep = infor.getRep();
		Salestime = infor.getSalestime();
		Number = infor.getNumber();
		Latitude = infor.getLatitude();
		Longitude = infor.getLongitude();
	}
	
	System.out.println(Longitude);
	%>
	 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>담기 구현</h1>

</body>
</html>