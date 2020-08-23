<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="jsp.eatday.menu.model.Menu"%>
<%@page import="jsp.eatday.menu.model.MenuDAO"%>
<%@page import="jsp.eatday.model.*"%>
<%@page import="jsp.eatday.model.RestDAO"%>

<%@ page import="jsp.eatday.myrest.model.MyRest" %>
<%@ page import="jsp.eatday.myrest.model.MyRestDAO" %>

<%@page import="java.util.ArrayList"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>

<% request.setCharacterEncoding("UTF-8");//한글 깨짐 방 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script><script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<title>My Page</title>
</head>
  <body>
    <nav class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0">
      <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#">Eat_Day</a>
      <input class="form-control form-control-dark w-100" type="text" placeholder="Search" aria-label="Search">
      <ul class="navbar-nav px-3">
        <li class="nav-item text-nowrap">
          <a class="nav-link" href="logout.jsp">Logout</a>
        </li>
      </ul>
    </nav>

    <div class="container-fluid">
      <div class="row">
        <nav class="col-md-2 d-none d-md-block bg-light sidebar">
          <div class="sidebar-sticky">
            <ul class="nav flex-column">
              <li class="nav-item">
                <a class="nav-link active" href="Index.jsp">
                  <span data-feather="home"></span>
                 Home <span class="sr-only">(current)</span>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">
                  <span data-feather="file"></span>
                  읽을거리
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" target="_blank" href="https://www.facebook.com/">
                  <span data-feather="shopping-cart"></span>
                  Facebook
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" target="_blank" href="https://www.instagram.com/">
                  <span data-feather="users"></span>
                  Instagram
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="Reports.jsp">
                  <span data-feather="bar-chart-2"></span>
                  Reports
                </a>
              </li>
            </ul>

            <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
              <span>Saved reports</span>
              <a class="d-flex align-items-center text-muted" href="#">
                <span data-feather="plus-circle"></span>
              </a>
            </h6>
            <ul class="nav flex-column mb-2">
              <li class="nav-item">
                <a class="nav-link" href="#">
                  <span data-feather="file-text"></span>
                  Current month
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">
                  <span data-feather="file-text"></span>
                  Last quarter
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">
                  <span data-feather="file-text"></span>
                  Personal taste
                </a>
              </li>
            </ul>
          </div>
        </nav>

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
          <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
            <h1 class="h2">Dashboard</h1>
            <div class="btn-toolbar mb-2 mb-md-0">
              <div class="btn-group mr-2">
                <button class="btn btn-sm btn-outline-secondary">다운로드(CSV)</button>
              </div>
              <button class="btn btn-sm btn-outline-secondary dropdown-toggle">
                <span data-feather="calendar"></span>
                This week
              </button>
            </div>
          </div>
          
          <div id="map" style="float: center; margin-right: 10px; width:100%; height:500px; border:1px soli #ccc;"></div>
          <!-- <canvas class="my-4" id="myChart" width="900" height="380"></canvas>  -->

          <div class="table-responsive">
          <h2>My List</h2>
            <table class="table table-striped table-sm">
            	<th>가게이름</th>
    			<th>주소</th>
    			<th>메뉴</th>
    			<th>영업시간</th>
    			<th>전화번호</th>
		<%
			String userID = null;
			String rest_name = null;
			String rest_address =null;
			String rest_rep = null;
			String rest_salestime = null;
			String rest_number = null;
			double longi = 0;
			double lati = 0;
			double[] lati_test = new double[100];
			double[] longi_test = new double[100];
			String[] Name_arr = new String[100];
			String name_rest = null;
			
			if(session.getAttribute("id") != null){
				userID = (String) session.getAttribute("id");
			}
					
			MyRestDAO myrestDAO = new MyRestDAO();
			ArrayList<MyRest> info = myrestDAO.getinfo(userID);
			
			for (MyRest show: info){
				rest_name = show.getRest_name();
				lati = show.getRest_latitude();
				longi = show.getRest_longitude();
		%>
			<tr>
				<td><%=show.getRest_name() %></td>
				<td><%=show.getRest_address() %></td>
				<td><%=show.getRest_rep() %></td>
				<td><%=show.getRest_salestime() %></td>
				<td><%=show.getRest_number() %>
			<tr>
		<%}%>
		<%
			for (int i = 0; i < info.size(); i++){
				Name_arr[i] = info.get(i).getRest_name();
				lati_test[i] = info.get(i).getRest_latitude();
				longi_test[i] = info.get(i).getRest_longitude();
		%>
			<%}%>	
            </table>
          </div>
        </main>
      </div>
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=20f1fd2f38bb415d99c921c1c5bbb394"></script>
<script>

var lati_test = new Array();
var Name_arr = new Array();
var longi_test = new Array();
var lati = '<%=lati%>'
var longi = '<%=longi%>'
var moveLatLon1 = new kakao.maps.LatLng(36.632959, 127.452813); //정문
var moveLatLon2 = new kakao.maps.LatLng(36.632722, 127.458656); //중문
var moveLatLon3 = new kakao.maps.LatLng(36.625222, 127.463933); //후문
var moveBasic = new kakao.maps.LatLng(36.628583, 127.457583);

// 자바스크립트 배열에 이름, 위도, 경도 java 배열 담음
<%for(int i=0;i<info.size();i++){%>
	Name_arr[<%=i%>]='<%=Name_arr[i]%>';
	lati_test[<%=i%>]='<%=lati_test[i]%>';
	longi_test[<%=i%>]='<%=longi_test[i]%>';
<%}%>

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
  mapOption = {
      center: new kakao.maps.LatLng(36.738649495004985, 128.00236575261204), // 지도의 중심좌표(마지막 값 중심으로 배치 시킬))
      level: 13 // 지도의 확대 레벨
  };  

//지도 생성
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

//마커에 적용할 위치 변수
var positions = [];
/*var positions = [
	{
		content: Name_arr[i], 
    	latlng: new kakao.maps.LatLng(lati, longi)
	},
	{
    	content: '생태연못', 
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
];*/

//마커를 표시할 위치와 title 객체 배열에 받아온 이름, 위도, 경도 추가 
for(var i=0; i< Name_arr.length; i++){
	positions.push({content:Name_arr[i],latlng:new kakao.maps.LatLng(lati_test[i],longi_test[i])})
	
}

//마커 이미지
var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 

//마커마다 이미지 적용해서 지도에 추가
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

//이름, 위도, 경도 test
for(var j = 0; j<Name_arr.length; j++){
	console.log(Name_arr[j]);
	console.log(lati_test[j]);
	console.log(longi_test[j]);
}

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
<!--
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
    <script src="../../assets/js/vendor/popper.min.js"></script>
    <script src="../../dist/js/bootstrap.min.js"></script>

     Icons
    <script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
    <script>
      feather.replace()
    </script>

     Graphs
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>
    <script>
      var ctx = document.getElementById("myChart");
      var myChart = new Chart(ctx, {
        type: 'line',
        data: {
          labels: ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"],
          datasets: [{
            data: [15339, 21345, 18483, 24003, 23489, 24092, 12034],
            lineTension: 0,
            backgroundColor: 'transparent',
            borderColor: '#007bff',
            borderWidth: 4,
            pointBackgroundColor: '#007bff'
          }]
        },
        options: {
          scales: {
            yAxes: [{
              ticks: {
                beginAtZero: false
              }
            }]
          },
          legend: {
            display: false,
          }
        }
      });
      -->
  </body>
</html>