<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!--빈하고 DAO가져 -->
<%@ page import="jsp.eatday.user.model.User" %>
<%@ page import="jsp.eatday.user.model.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8");//한글 깨짐 방 %>

<!-- 한명의 회원정보를 담는 user라는 이름으로 클래스를 자바 빈즈로 사용 / scope:페이지 현재의 페이지에서만 사용-->
<jsp:useBean id="user" class="jsp.eatday.user.model.User" scope="request" />
<!-- 생성된 자바 빈즈의 객체를 이용해 setter에 속성 값 전달 -->
<jsp:setProperty name="user" property="id"/>
<jsp:setProperty name="user" property="password"/>

<!DOCTYPE html>

<html>
<head>
 <title>Eat Day : 로그인</title>
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
		System.out.println(user.getId());
		System.out.println(user.getPassword());
		
		UserDAO userDAO = new UserDAO();
		int result = userDAO.login(user.getId(), user.getPassword()); 
		
		if (result == 1){
			session.setAttribute("id", user.getId());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인 성공')");
			script.println("location.href = 'Index.jsp'");
			script.println("</script>");
		}
		else if (result == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 다릅니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else if (result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else if (result == -2){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생했습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		
	%>
</body>
</html>