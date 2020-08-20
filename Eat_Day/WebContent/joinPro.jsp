<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!--빈하고 DAO가져 -->
<%@ page import="jsp.eatday.user.model.User" %>
<%@ page import="jsp.eatday.user.model.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8");//한글 깨짐 방 %>

<!-- 한명의 회원정보를 담는 user라는 이름으로 클래스를 자바 빈즈로 사용(객체 빈 껍데기 생성) / scope:페이지 현재의 페이지에서만 사용-->
<jsp:useBean id="user" class="jsp.eatday.user.model.User" scope="request" />
<!-- 생성된 자바 빈즈의 객체에 form으로부터 들어온 데이터를 각 프로퍼티에 저 이용해 setter에 속성 값 전달 -->
<jsp:setProperty name="user" property="id"/>
<jsp:setProperty name="user" property="email"/>
<jsp:setProperty name="user" property="password"/>
<jsp:setProperty name="user" property="name"/>
<jsp:setProperty name="user" property="phone"/>
<jsp:setProperty name="user" property="sex"/>
<jsp:setProperty name="user" property="year"/>
<jsp:setProperty name="user" property="month"/>
<jsp:setProperty name="user" property="day"/>

<!DOCTYPE html>

<html>
<head>
 <title>Eat Day : 회원가입</title>
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
		System.out.println(user.getName());
		System.out.println(user.getPhone());
		System.out.println(user.getSex());
		System.out.println(user.getYear());
		System.out.println(user.getMonth());
		System.out.println(user.getDay());
		System.out.println(user.getEmail());
		
		if(user.getId() == null || user.getEmail() == null || user.getPassword() == null || user.getName() == null || user.getPhone() == 0 || user.getSex() == null || user.getYear() == 0 || user.getMonth() == 0 || user.getDay() == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			UserDAO userDAO = new UserDAO();//인스턴스생성
			
			// UserDAO에 join 메소드로 user
			int result = userDAO.join(user); 
			if (result == -1){ // 아이디가 기본키기. 중복되면 오류.
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 존재하는 아이디입니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			//가입성공
			else {
				session.setAttribute("id", user.getId());
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'Index.jsp'");
				script.println("</script>");
			}
			
		}
		
	%>
</body>
</html>