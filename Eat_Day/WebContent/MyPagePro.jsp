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
	String user_id = null;
	String rest_id = null;
	String rest_name = request.getParameter("myrest_name");
	String rest_location = request.getParameter("myrest_location");
	String Name = null;
	String Location = null;
	String Address = null;
	String Rep = null;
	String Salestime = null;
	String Number = null;
	String Classfy = null;
	float Latitude = 0;
	float Longitude = 0;
	
	if(session.getAttribute("id") != null){
		user_id = (String) session.getAttribute("id");
	}
	System.out.println(user_id);
	
	RestDAO myrest = new RestDAO();
	ArrayList<Rest> info = myrest.getmypgeinfo(rest_name, rest_location);
	
	for (Rest infor: info){
		rest_id = infor.getId();
		Name = infor.getName();
		Location = infor.getLocation();
		Address = infor.getAddress();
		Rep = infor.getRep();
		Salestime = infor.getSalestime();
		Number = infor.getNumber();
		Latitude = infor.getLatitude();
		Longitude = infor.getLongitude();
		Classfy = infor.getClassfy();
	}
	
	System.out.println(rest_id);
	
//여기서 이 창을 blank로 떠서 html태그로 내용 뜨게하고 그 내용 submit으로 proc따로 만들어 걸로 전달해 insert 하는 식으로 구현하면 뙬
	%>

<jsp:useBean id="mypage" class="jsp.eatday.myrest.model.MyRest" scope="request" />
<!-- 생성된 자바 빈즈의 객체에 form으로부터 들어온 데이터를 각 프로퍼티에 저 이용해 setter에 속성 값 전달 -->
<jsp:setProperty name="mypage" property="user_id" value="<%=user_id %>"/>
<jsp:setProperty name="mypage" property="rest_id" value="<%=rest_id %>"/>
<jsp:setProperty name="mypage" property="rest_name" value="<%=Name %>"/>
<jsp:setProperty name="mypage" property="rest_location" value="<%=Location %>"/>
<jsp:setProperty name="mypage" property="rest_address" value="<%=Address %>"/>
<jsp:setProperty name="mypage" property="rest_number" value="<%=Number %>"/>
<jsp:setProperty name="mypage" property="rest_salestime" value="<%=Salestime %>"/>
<jsp:setProperty name="mypage" property="rest_classfy" value="<%=Classfy %>"/>
<jsp:setProperty name="mypage" property="rest_rep" value="<%=Rep %>"/>
<jsp:setProperty name="mypage" property="rest_latitude" value="<%=Latitude %>"/>
<jsp:setProperty name="mypage" property="rest_longitude" value="<%=Longitude %>"/>
	 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyRest : 추가</title>
</head>
<body>
<%
		System.out.println(mypage.getUser_id());
		System.out.println(mypage.getRest_id());
		System.out.println(mypage.getRest_name());
		
		if(mypage.getRest_id() == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('장소와 가게 이름을 확인해주세요.')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			MyRestDAO myrestDAO = new MyRestDAO();//인스턴스생성
			
			int result = myrestDAO.insert(mypage); 
			if (result == -1){ // 아이디가 기본키기. 중복되면 오류.
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 넣었던 가게입니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			//가입성공
			else {
				//session.setAttribute("id", user.getId());
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('추가 성공')");
				script.println("location.href = 'Index.jsp'");
				script.println("</script>");
			}
			
		}
		
%>
</body>
</html>