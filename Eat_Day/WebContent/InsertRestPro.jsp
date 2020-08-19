<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!--빈하고 DAO가져옴 -->
<%@ page import="jsp.eatday.model.Rest" %>
<%@ page import="jsp.eatday.model.RestDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8");//한글 깨짐 방 %>

<!-- 한명의 회원정보를 담는 user라는 이름으로 클래스를 자바 빈즈로 사용 / scope:페이지 현재의 페이지에서만 사용-->
<jsp:useBean id="rest" class="jsp.eatday.model.Rest" scope="request" />
<!-- 생성된 자바 빈즈의 객체를 이용해 setter에 속성 값 전달 -->
<jsp:setProperty name="rest" property="id"/>
<jsp:setProperty name="rest" property="name"/>
<jsp:setProperty name="rest" property="location"/>
<jsp:setProperty name="rest" property="address"/>
<jsp:setProperty name="rest" property="number"/>
<jsp:setProperty name="rest" property="salestime"/>
<jsp:setProperty name="rest" property="classfy"/>
<jsp:setProperty name="rest" property="weather"/>
<jsp:setProperty name="rest" property="temperature"/>
<jsp:setProperty name="rest" property="rep"/>
<jsp:setProperty name="rest" property="latitude"/>
<jsp:setProperty name="rest" property="longitude"/>

<!DOCTYPE html>

<html>
<head>
 <title>Eat Day : 맛집추가</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script><script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
 </head>
<body>
<%
		System.out.println(rest.getId());
		System.out.println(rest.getName());
		System.out.println(rest.getLocation());
		System.out.println(rest.getAddress());
		System.out.println(rest.getNumber());
		System.out.println(rest.getSalestime());
		System.out.println(rest.getClassfy());
		System.out.println(rest.getWeather());
		System.out.println(rest.getTemperature());
		System.out.println(rest.getRep());
		System.out.println(rest.getLatitude());
		System.out.println(rest.getLongitude());
		
		if(rest.getId() == null || rest.getName() == null || rest.getLatitude() == 0 || rest.getLongitude() == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('ID, 이름, 위도, 경도는 필수입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			RestDAO restDAO = new RestDAO();//인스턴스생성
			
			// UserDAO에 join 메소드로 user
			int result = restDAO.insert(rest); 
			if (result == -1){ // 아이디가 기본키기. 중복되면 오류.
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 존재하는 ID입니다. 하나 더 늘려보세요.')");
				script.println("history.back()");
				script.println("</script>");
			}
			//가입성공
			else {
				session.setAttribute("id", rest.getId());
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'Index.jsp'");
				script.println("</script>");
			}
			
		}
		
	%>
</body>
</html>