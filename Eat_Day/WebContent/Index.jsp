<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="jsp.eatday.menu.model.Menu"%>
<%@page import="jsp.eatday.menu.model.MenuDAO"%>
<%@page import="jsp.eatday.model.*"%>
<%@page import="jsp.eatday.model.RestDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2d3f891aa941df0a0b5c08b7f62ee1f9&libraries=services"></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<title>Eat_Day</title>
</head>
<body bgcolor='#000000'>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="Index.jsp">오늘 뭐 먹지??</a>
		<br>
		<form action="Index.jsp" method="get">
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
		        <select class="selectpicker" id="location" name="location" onClick="panToL();">
		          <option value="">선택안함</option>
                  <option value="정문">정문</option>
                  <option value="중문">중문</option>
                  <option value="후문">후문</option>
               </select>
               <br>
               <select class="selectpicker" name="classfy">
                  <option value="">선택안함</option>
                  <option value="한식">한식</option>
                  <option value="양식">양식</option>
                  <option value="일식">일식</option>
                  <option value="중식">중식</option>
                  <option value="디저트">디저트</option>
                  <option value="술">술</option>
               </select>
                 <select class="selectpicker" name="weather">
                  <option value="">선택안함</option>
                  <option value="맑음">맑음</option>
                  <option value="흐림">흐림</option>
                  <option value="비">비</option>
                  <option value="눈">눈</option>
               </select>
               <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">찾기</button>
               </form>
			</div>
			<div style="float: right;">
				<ul class="nav-item dropdown">
				    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">Join</a>
				    <div class="dropdown-menu">
				      <a class="dropdown-item" href="login.jsp">로그인</a>
				      <a class="dropdown-item" href="join.jsp">회원가입</a>
				    </div>
				</ul> 
			</div>		
	</nav>
	<br>
<div class="cont-location">
    <div id="map" style="position: absolute; right:10px; margin:auto;width:43%;height:80%;border:1px soli #ccc;"></div>
    <div id="content_eat" style="position: absolute; left:10px; margin: auto; width:54%; hegight:80%; border: 1px soli #ccc;">
    	<table class="table table-bordered table-sm">
    	<th>가게이름</th>
    	<th>대표메뉴</th>
    	<th>전화번호</th>
    	<th>영업시간</th>
		<%
			String location = request.getParameter("location");
			String classfy = request.getParameter("classfy");
			String weather = request.getParameter("weather");
			double longi = 0;
			double lati = 0;
			String Name_Rest = null;
			String menu_id = null;
					
			RestDAO SelectDAO = new RestDAO();
			ArrayList<Rest> selec = SelectDAO.getLocation(location, classfy, weather);
			MenuDAO Menu_eat = new MenuDAO();
			
			for (Rest show: selec){
				menu_id = show.getId();
				lati = show.getLatitude();
				longi = show.getLongitude();
				Name_Rest = show.getName();
				//onclick로 지도에 해당 위치만 표시??
		%>
			<tr>
				<td><%=show.getName() %></td>
				<td><%=show.getRep_Menu() %></td>
				<td><%=show.getNumber() %></td>
				<td><%=show.getSalestime() %></td>
			<tr>
		<%}%>
		</table>	
    </div>
</div>
<script>

var lati = '<%=lati%>'
var longi = '<%=longi%>'
var Name = '<%=Name_Rest%>'
var moveLatLon1 = new kakao.maps.LatLng(36.632959, 127.452813); //정문
var moveLatLon2 = new kakao.maps.LatLng(36.632722, 127.458656); //중문
var moveLatLon3 = new kakao.maps.LatLng(36.625222, 127.463933); //후문
var moveBasic = new kakao.maps.LatLng(36.628583, 127.457583);

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
  mapOption = {
      center: new kakao.maps.LatLng(lati, longi), // 지도의 중심좌표
      level: 4 // 지도의 확대 레벨
  };  

//지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

//지도 이동
function panToL(){
	var zone = document.getElementById("location")
	  
	if (zone.value=="정문"){
		map.panTo(moveLatLon1)
	}
	else if (zone.value=="중문"){
		map.panTo(moveLatLon2)
	}
	else if (zone.value=="후문"){
		map.panTo(moveLatLon3)
	}
	else{
		map.PanTo(moveBasic)
	}
}

//마커를 표시할 위치와 title 객체 배열입니다 
var positions = [
    {
    	content: Name, 
        latlng: new kakao.maps.LatLng(lati, longi)
    },
    {
        title: '생태연못', 
        latlng: new kakao.maps.LatLng(33.450936, 126.569477)
    },
    {
        title: '텃밭', 
        latlng: new kakao.maps.LatLng(33.450879, 126.569940)
    },
    {
        title: '근린공원',
        latlng: new kakao.maps.LatLng(33.451393, 126.570738)
    }
];

var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 

for (var i = 0; i < positions.length; i ++) {
    
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(24, 35); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
        //title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage // 마커 이미지 
    });
    // 마커에 표시할 인포윈도우를 생성합니다 
    var infowindow = new kakao.maps.InfoWindow({
        content: positions[i].content // 인포윈도우에 표시할 내용
    });

    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
}

//인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
    };
}

// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
function makeOutListener(infowindow) {
    return function() {
        infowindow.close();
    };
}

console.log(Name)
console.log(lati)
console.log(longi)

/*
//장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places(map); 

//카테고리로 은행을 검색합니다
ps.categorySearch('CE7', placesSearchCB, {useMapBounds:true}); 

//키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) {
  if (status === kakao.maps.services.Status.OK) {
      for (var i=0; i<data.length; i++) {
          displayMarker(data[i]);    
      }       
  }
}

//지도에 마커를 표시하는 함수입니다
function displayMarker(place) {
  // 마커를 생성하고 지도에 표시합니다
  var marker = new kakao.maps.Marker({
      map: map,
      position: new kakao.maps.LatLng(place.y, place.x) 
  });

  // 마커에 클릭이벤트를 등록합니다
  kakao.maps.event.addListener(marker, 'click', function() {
      // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
      infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
      infowindow.open(map, marker);
  });
}
*/

//지도 이동
//충북대 중심
/*
function setCenter() {            
  // 이동할 위도 경도 위치를 생성합니다 
  var moveLatLon = new kakao.maps.LatLng(36.628583, 127.457583);
  
  // 지도 중심을 이동 시킵니다
  map.setCenter(moveLatLon);
}
*/
</script>
	<footer>
	</footer>
</body>
</html>