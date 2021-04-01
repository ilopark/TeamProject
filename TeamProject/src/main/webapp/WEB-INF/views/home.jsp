<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/home.jsp</title>
<jsp:include page="include/resource.jsp"></jsp:include>
<style>
	input {
        border: 1px solid  rgba(0, 0, 0, 0.5);
    }
    input.notfound {
        border: 2px solid  rgba(255, 0, 0, 0.4);
    }

	.img-wrapper {
		width: 300px;
		height: 400px;
		object-fit: scale-down;
	}
	.img-div {
		padding-left: 10px;
		padding-right: 10px;
	}
	.txt_post {
		overflow: hidden;
		text-overflow: ellipsis;
		display: -webkit-box;
		-webkit-line-clamp: 8; /* 라인수 */
		-webkit-box-orient: vertical;
		word-wrap: break-word;
		line-height: 1.5em;
		height: 12em;
	}
	a {
		color: #000;
	}
	
	#support{
		margin: 100px; 20px; 0px; 20px;
		width: 100%;
		text-align: center;
	}
	#CONTACT{
		float:left; width:200px; height:100px;
		width: 250px;
		margin: 0ox; 50px; 20px; 50px; 
		text-align: center;
	}
	#HELP{
		display:inline-block; width:300px; height:100px;
		text-align: center;
	}
	#sup{
		margin-bottom:10px
	}
	#supportdiv{
		margin-left: 200px;
		margin-bottom: 20px;
		text-align:center;
	}
	hr{
		height:3px;
	}
</style>
<script>
	function initialize() {
	  var mapOptions = {
	    center: new google.maps.LatLng(37.4346, 126.7968),
	    zoom: 10,
	    mapTypeId: google.maps.MapTypeId.ROADMAP
	  };
	  var map = new google.maps.Map(document.getElementById('map-canvas'),
	    mapOptions);
	 
	  var input = /** @type {HTMLInputElement} */(document.getElementById('address'));
	  var autocomplete = new google.maps.places.Autocomplete(input);
	 
	  autocomplete.bindTo('bounds', map);
	 
	  var infowindow = new google.maps.InfoWindow();
	  var marker = new google.maps.Marker({
	    map: map
	 });
	  google.maps.event.addListener(autocomplete, 'place_changed', function() {
		    infowindow.close();
		    marker.setVisible(false);
		    input.className = '';
		    var place = autocomplete.getPlace();
		    
		    if (!place.geometry) {
		      // Inform the user that the place was not found and return.
		      input.className = 'notfound';
		      return;
		    }
		 
		    // If the place has a geometry, then present it on a map.
		    if (place.geometry.viewport) {
		      map.fitBounds(place.geometry.viewport);
		    } else {
		      map.setCenter(place.geometry.location);
		      map.setZoom(17);  // Why 17? Because it looks good.
		    }
		    
		    marker.setIcon(/** @type {google.maps.Icon} */({
		      url: place.icon,
		      size: new google.maps.Size(71, 71),
		      origin: new google.maps.Point(0, 0),
		      anchor: new google.maps.Point(17, 34),
		      scaledSize: new google.maps.Size(35, 35)
		    }));
		    
		    //위치 등록 부분
		    marker.setPosition(place.geometry.location);
		    var pot = place.geometry.location;
		    var x    = pot.lat().toFixed(4);
		    var y    = pot.lng().toFixed(4);
		    
		    alert("x = "+x + " y = "+ y);
		    
		    marker.setVisible(true);
		 
		    var address = '';
		    if (place.address_components) {
		      address = [
		        (place.address_components[2] && place.address_components[2].short_name || ''),
		        (place.address_components[1] && place.address_components[1].short_name || ''),
		        (place.address_components[0] && place.address_components[0].short_name || '')
		      ].join(' ');
		    }
		 
		    infowindow.setContent('<div><strong>' + place.name + '</strong><br>' + address);
		    infowindow.open(map, marker);
		  });
		 
		  // Sets a listener on a radio button to change the filter type on Places
		  // Autocomplete.
		   autocomplete.setTypes([]); // 전체 주소
		}
		 
		google.maps.event.addDomListener(window, 'load', initialize);
</script>
</head>
<body>
<jsp:include page="include/navbar.jsp"></jsp:include>
<div class="container">
	<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<a href="${pageContext.request.contextPath }/shop/detail.do?num=${list[0].num}">
						<img src="${pageContext.request.contextPath }${list[0].imagePath}" class="d-block w-100" height="300" style="object-fit: contain;">
				</a>
			</div>
			<div class="carousel-item">
				<a href="${pageContext.request.contextPath }/shop/detail.do?num=${list[1].num}">
						<img src="${pageContext.request.contextPath }${list[1].imagePath}" class="d-block w-100" height="300" style="object-fit: contain;">
				</a>
			</div>
			<div class="carousel-item">
				<a href="${pageContext.request.contextPath }/shop/detail.do?num=${list[2].num}">
						<img src="${pageContext.request.contextPath }${list[2].imagePath}" class="d-block w-100" height="300" style="object-fit: contain;">
				</a>
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
			<img src="${pageContext.request.contextPath }/resources/images/left_arrow.png" width="50" height="50"/>
		</a>
		<a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
			<img src="${pageContext.request.contextPath }/resources/images/right_arrow.png" width="50" height="50"/>
		</a>
	</div>
	<div style="height: 20px;"></div>
	<div class="row no-gutters">
		<a href="${pageContext.request.contextPath }/shop/detail.do?num=${list[3].num}">
			<div class="img-div">
				<img class="img-wrapper" src="${pageContext.request.contextPath }${list[3].imagePath}">
			</div>
		</a>
		<div class="col-6 col-md-4 col-lg-4">
			<div class="card-body">
				<h3><a href="${pageContext.request.contextPath }/shop/detail.do?num=${list[3].num}" >오늘의 책</a></h3>
				<h5 class="card-title">[
						<c:choose>
							<c:when test="${list[3].genre eq 'novel'}">소설</c:when>
							<c:when test="${list[3].genre eq 'culture'}">교양</c:when>
							<c:when test="${list[3].genre eq 'workbook'}">문제집</c:when>
							<c:when test="${list[3].genre eq 'comicbook'}">만화</c:when>
							<c:when test="${list[3].genre eq 'dictionary'}">사전</c:when>
						</c:choose>
						] <a href="${pageContext.request.contextPath }/shop/detail.do?num=${list[3].num}">${list[3].title }</a></h5>
				<p class="card-text"><small>저자</small> ${list[3].writer } | <small>출판</small> ${list[3].publisher }</p>
				<p class="card-text">${list[3].regdate } 출판</p>
				<p class="card-text">${list[3].price } 원</p>
			</div>
		</div>
		 
		<div class="col-6 col-md-4 col-lg-4">
			<div class="card" style="width: 100%;">
				<ul class="list-group list-group-flush">
					<li class="list-group-item"><a href="${pageContext.request.contextPath }/shop/list1.do" >전체 상품</a></li>
					<li class="list-group-item"><a href="${pageContext.request.contextPath }/notice/list.do" >공지사항</a></li>
					<li class="list-group-item"><a href="${pageContext.request.contextPath }/qna/list.do" >Q&A</a></li>
				</ul>
			</div>
		</div>
		<section id="support" class="cau">
			<hr width ="95%" color="black" >
			<h3 id="sup">SUPPORT</h3>
		</section>
		<div id="supportdiv" class="container">
			<div id="CONTACT">
				<h3>CONTACT US</h3><br />
				<a href="${pageContext.request.contextPath }/users/contact.do">
					<img src="${pageContext.request.contextPath }/resources/images/contact.png" width="50" height="65"/>
				</a><br />
				<br /><p>송프링에 오시는 길을 안내합니다.</p>
			</div>
			<div id="HELP">
				<h3>HELP DESK</h3><br />
				<a href="${pageContext.request.contextPath }/qna/list.do">
					<img src="${pageContext.request.contextPath }/resources/images/qanda.png" width="50" height="65"/>
				</a><br />
				<br /><p>송프링의 질문게시판으로 안내합니다.</p>
			</div>
		</div>
		
		
		
		
		
		
	</div>
	
		 
</div>
<jsp:include page="include/bottomnavbar.jsp"></jsp:include>
</body>
</html>