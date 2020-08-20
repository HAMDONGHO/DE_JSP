<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		String userID = null;
	
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		
		
	%>
	<div class="jumbotron text-center" style="margin-bottom:0">
	  <h1>Eat Day</h1>
	  <p>맛집을 추가하자!!</p>
	  <a href="Index.jsp">Home</a>
	</div>
	<div class="container" >
	      <div class="col-sm-9 col-md-7 col-lg-5 mx-auto" style="position: absolute; left:60px; margin:auto;">
	        <div class="card card-signin my-5">
	          <div class="card-body" >
	            <h5 class="card-title text-center">빠짐없이 채워주세요!</h5>
	            
	            <form class="form-signin" method="get" action="InsertRestPro.jsp">
	              <div class="input-group mb-3">
	               	<div class="input-group-prepend">
				    	<span class="input-group-text">ID</span>
				 	</div>
	                <input type="text" id="id" name = "id" class="form-control" placeholder="ex)중문일 경우 Mid-1" required autofocus>
	              </div>
	              
	              <div class="input-group mb-3">
	               	<div class="input-group-prepend">
				    	<span class="input-group-text">Name</span>
				 	</div>
	                <input type="text" id="name" name = "name" class="form-control" placeholder="이름" required autofocus>
	              </div>
	              
	              <div class="input-group mb-3">
	               	<div class="input-group-prepend">
				    	<span class="input-group-text">location</span>
				 	</div>
	                <input type="radio" id="location" name = "location" value="정문" class="form-control">정문
	                <input type="radio" id="location" name = "location" value="중문" class="form-control">중문
	                <input type="radio" id="location" name = "location" value="후문" class="form-control">후문
	              </div>
	              
	              <div class="input-group mb-3">
	               	<div class="input-group-prepend">
				    	<span class="input-group-text">Address</span>
				 	</div>
	                <input type="text" id="address" name = "address" class="form-control" placeholder="주소" autofocus>
	              </div>
	              
	              <div class="input-group mb-3">
 					<div class="input-group-prepend">
				    	<span class="input-group-text">Number</span>
				 	</div>
	                <input type="number" id="number" name = "number" class="form-control" placeholder="전화번호(지역번호 빼고 입력해주세요.)">
	              </div>
              
	              <div class="input-group mb-3">
 					<div class="input-group-prepend">
				    	<span class="input-group-text">Salestime</span>
				 	</div>
	                <input type="text" id="salestime" name = "salestime" class="form-control" placeholder="영업시간(ex.11:00~20:00)">
	              </div>
	              
	              <div class="input-group mb-3">
	               	<div class="input-group-prepend">
				    	<span class="input-group-text">Classfy</span>
				 	</div>
				 	<select class="form-control" id="classfy" name="classfy">
                  		<option value= null>선택안함</option>
                  		<option value="한식">한식</option>
                  		<option value="양식">양식</option>
                  		<option value="일식">일식</option>
                  		<option value="중식">중식</option>
                  		<option value="패스트푸드">패스트푸드</option>
                  		<option value="분식">분식</option>
                  		<option value="카페">카페</option>
                  		<option value="술">술</option>
               		</select>
               		<!--  
	                <input type="radio" id="classfy" name = "classfy" value="한식" class="form-control">한식
	                <input type="radio" id="classfy" name = "classfy" value="양식" class="form-control">양식
	                <input type="radio" id="classfy" name = "classfy" value="일식" class="form-control">일식
	                <input type="radio" id="classfy" name = "classfy" value="중식" class="form-control">중식
	                <input type="radio" id="classfy" name = "classfy" value="패스트푸드" class="form-control">패스트푸드
	                <input type="radio" id="classfy" name = "classfy" value="분식" class="form-control">분식
	                <input type="radio" id="classfy" name = "classfy" value="카페" class="form-control">카페
	                <input type="radio" id="classfy" name = "classfy" value="술" class="form-control">술
	                -->
	              </div>
	              
	              <div class="input-group mb-3">
	               	<div class="input-group-prepend">
				    	<span class="input-group-text">Weather</span>
				 	</div>
	                <input type="radio" id="weather" name = "weather" value="맑음" class="form-control">맑음
	                <input type="radio" id="weather" name = "weather" value="흐림" class="form-control">흐림
	                <input type="radio" id="weather" name = "weather" value="비" class="form-control">비
	                <input type="radio" id="weather" name = "weather" value="눈" class="form-control">눈
	                <input type="radio" id="weather" name = "weather" value= null class="form-control">입력안함
	              </div>
	              
	              <div class="input-group mb-3">
 					<div class="input-group-prepend">
				    	<span class="input-group-text">Temperature</span>
				 	</div>
	                <input type="number" id="temperature" name = "temperature" class="form-control" placeholder="먹기 좋은 온도(C)">
	              </div>
	              
	              <div class="input-group mb-3">
	               	<div class="input-group-prepend">
				    	<span class="input-group-text">Represent</span>
				 	</div>
	                <input type="text" id="rep" name = "rep" class="form-control" placeholder="대표메뉴" required>
	              </div>
	              
	              <div class="input-group mb-3">
 					<div class="input-group-prepend">
				    	<span class="input-group-text">Latitude</span>
				 	</div>
	                <input type="number" step="any" id="latitude" name = "latitude" class="form-control" placeholder="위도" required>
	              </div>
	              
	              <div class="input-group mb-3">
 					<div class="input-group-prepend">
				    	<span class="input-group-text">Longitude</span>
				 	</div>
	                <input type="number" step="any" id="longitude" name = "longitude" class="form-control" placeholder="경도" required>
	              </div>
	              
             	<hr class="my-4">
              	<button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">추가하기</button>
            </form>
          </div>
        </div>
      </div>
    </div>
    
    <div class="cont-location">
    	<div class="col-sm-9 col-md-7 col-lg-5 mx-auto" style="position: absolute; right:60px; margin: auto; height: 50%; width:80%; margin-top:5%;">
    		<h5>위도 경도를 확인해주세요!</h5>
	        <div id="map" style="width:100%;height:660px;"></div>
			<div id="clickLatlng"></div>
      </div>
    </div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=20f1fd2f38bb415d99c921c1c5bbb394"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(36.628583, 127.457583), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 지도를 클릭한 위치에 표출할 마커입니다
var marker = new kakao.maps.Marker({ 
    // 지도 중심좌표에 마커를 생성합니다 
    position: map.getCenter() 
}); 
// 지도에 마커를 표시합니다
marker.setMap(map);

// 지도에 클릭 이벤트를 등록합니다
// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
    
    // 클릭한 위도, 경도 정보를 가져옵니다 
    var latlng = mouseEvent.latLng; 
    
    // 마커 위치를 클릭한 위치로 옮깁니다
    marker.setPosition(latlng);
    
    var message = '위도: ' + latlng.getLat() + ' / ';
    message += '경도: ' + latlng.getLng();
    
    var resultDiv = document.getElementById('clickLatlng'); 
    resultDiv.innerHTML = message;
    
});
</script>
</body>
</html>