<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/gallery/private/upload_form.jsp</title>
<jsp:include page="../../include/resource.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../../include/navbar.jsp"></jsp:include>
<div class="container">
<br />
	<h1>이 책을 추천합니다</h1>
	<form action="upload.do" method="post" enctype="multipart/form-data">
		<div>
			<label for="title"><strong>책 제목</strong></label>
			<input class="form-control" type="text" name="title" id="title"/>
		</div><br />
		
		<div>
			<label for="caption"><strong>리뷰</strong></label><br />
			<input class="form-control" type="text" name="caption" id="caption" style="width:400px; height:200px;" placeholder="             재밌게 읽으신 내용을 공유해 주세요 :) "/>
		</div><br />
		
		<div>
			<label for="image">이미지</label><br />
			<p><strong>※스포일러 방지를 위해 책 표지를 업로드해 주시기 바랍니다.※</strong></p>
			<input type="file" name="image" id="image"
				accept=".jpg, .jpeg, .png, .JPG, .JPEG"/>
		</div><br />
		
		<button type="submit" class="btn btn-primary">업로드</button>
	</form>
</div>
</body>
</html>