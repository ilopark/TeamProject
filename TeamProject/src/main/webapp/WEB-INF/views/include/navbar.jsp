<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style type="text/css">
	.nav-pills{
		width: 100%;
		display: inline-block;
	}
	.left-tab{
		float: left;
	}
	.center-tab{
		float: center;
	}
	
	.right-tab{
		float: right;
	}

</style>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container-fluid">
    <a class="navbar-brand" href="${pageContext.request.contextPath }/home.do">SongPring</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav nav-pills">
      	<li class="nav-item right-tab">
          <a class="nav-link" href="${pageContext.request.contextPath }/qna/list.do">Q&A</a>
        </li>
        <li class="nav-item right-tab">
          <a class="nav-link" href="${pageContext.request.contextPath }/notice/list.do">공지사항</a>
        </li>
        <li class="nav-item right-tab">
          <a class="nav-link" href="${pageContext.request.contextPath }/shop/list1.do">전체 상품</a>
        </li>
        <li class="nav-item right-tab">
          <c:if test="${not empty sessionScope.id }">
          	<a class="nav-link" href="${pageContext.request.contextPath }/shop/private/orderList.do">주문/배송</a>
          </c:if>
        </li>
        <li class="nav-item right-tab">
	        <c:if test="${not empty sessionScope.id }">
	          <a class="nav-link" href="${pageContext.request.contextPath }/shop/private/cartList.do">카트</a>
	        </c:if>
        </li>
        <li class="nav-item right-tab">
          <c:choose>
				<c:when test="${empty sessionScope.id}"><a class="nav-link" href="${pageContext.request.contextPath }/users/signup_form.do">회원가입</a></c:when>
				<c:when test="${sessionScope.userGrade eq 'manager' }"><a class="nav-link" href="${pageContext.request.contextPath }/manager/managerPage.do">관리자페이지</a></c:when>
				<c:when test="${sessionScope.userGrade eq 'user' }"><a class="nav-link" shref="${pageContext.request.contextPath }/users/private/info.do">마이페이지</a></c:when>
			</c:choose>
        </li>
        <li class="nav-item right-tab">
          <c:choose>
				<c:when test="${empty sessionScope.id }"><a class="nav-link" href="${pageContext.request.contextPath }/users/loginform.do">로그인</a></c:when>
				<c:otherwise><a class="nav-link" href="${pageContext.request.contextPath }/users/logout.do">로그아웃</a></c:otherwise>
		  </c:choose>
        </li>
        
		
       
      </ul>
      
    </div>
  </div>
  
</nav>

<div class="container">
	<ul class="nav justify-content-end" style="background: black;">
		<li class="nav-item">
			<a class="nav-link" href="${pageContext.request.contextPath }/home.do">
				<img style="width: 244px; height: 65px;" src="${pageContext.request.contextPath }/resources/images/logo.png" />
			</a>
		</li>
		<li class="nav-item">
			<c:choose>
				<c:when test="${empty sessionScope.id }"><a class="nav-link" style="color: #cecece; height: 65px; line-height: 65px;" href="${pageContext.request.contextPath }/users/loginform.do">로그인</a></c:when>
				<c:otherwise><a class="nav-link" style="color: #cecece; height: 65px; line-height: 65px;" href="${pageContext.request.contextPath }/users/logout.do">로그아웃</a></c:otherwise>
			</c:choose>
		</li>
		<li class="nav-item">
			<c:choose>
				<c:when test="${empty sessionScope.id}"><a class="nav-link" style="color: #cecece; height: 65px; line-height: 65px;" href="${pageContext.request.contextPath }/users/signup_form.do">회원가입</a></c:when>
				<c:when test="${sessionScope.userGrade eq 'manager' }"><a class="nav-link" style="color: #cecece; height: 65px; line-height: 65px;" href="${pageContext.request.contextPath }/manager/managerPage.do">관리자페이지</a></c:when>
				<c:when test="${sessionScope.userGrade eq 'user' }"><a class="nav-link" style="color: #cecece; height: 65px; line-height: 65px;" href="${pageContext.request.contextPath }/users/private/info.do">마이페이지</a></c:when>
			</c:choose>
		</li>
		<li class="nav-item">
		<a class="nav-link" style="color: #cecece; height: 65px; line-height: 65px;" href="${pageContext.request.contextPath }/shop/private/cartList.do">카트</a>
		</li>
		<li class="nav-item">
		<a class="nav-link" style="color: #cecece; height: 65px; line-height: 65px;" href="${pageContext.request.contextPath }/shop/private/orderList.do">주문/배송</a>
		</li>
		<li class="nav-item">
		<a class="nav-link" style="color: #cecece; height: 65px; line-height: 65px;" href="${pageContext.request.contextPath }/qna/list.do">Q&A</a>
		</li>
	</ul>
	<div style="height: 20px"></div>
</div>