<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE HTML>
<!--
	Verti by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Verti by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="user/css/main.css" />
		<noscript><link rel="stylesheet" href="user/css/noscript.css" /></noscript>
	</head>
	<body class="is-preload no-sidebar">
	
		<div id="page-wrapper">

			<!-- Header -->
				<div id="header-wrapper">
					<header id="header" class="container">

						<!-- Logo -->
							<div id="logo">
								<h1><a href="index.html">Verti</a></h1>
								<span>by HTML5 UP</span>
							</div>

						<!-- Nav -->
							<nav id="nav">
								<jsp:include page="/userNavi.do"></jsp:include>
							</nav>

					</header>
				</div>

<!-- Banner -->
				<div id="banner-wrapper">
					<div id="banner" class="box container">
						<div class="row">
							<div class="col-12">
								<h2>사진게시판</h2>
								<p>추억이 담긴 사진게시판 입니다.</p>
							</div>
						</div>
					</div>
				</div>

			<!-- Features -->
				<div id="features-wrapper">
					
					<div class="container">
					
						<!-- Wrapper -->
						<div id="wrapper">
							<!-- Main -->
							<div id="main">
							<c:forEach items="${photoBoardList}" var="photoBoardList">
								<article class="thumb">
									<a href="images/fulls/<c:out value="${photoBoardList.saveNm}"/>" class="image"><img src="images/thumbs/<c:out value="${photoBoardList.saveNm}"/>" alt="" /></a>
									<h2><c:out value="${photoBoardList.title}"/></h2>
									<p><c:out value="${photoBoardList.descr}"/> &nbsp;&nbsp;&nbsp; 
										<a href="javascript:fn_photo_delete('P-0000001');" style="font-size:12pt;color:red;">[삭제]</a></p>
								</article>
							</c:forEach>
							</div>
							
							<form name="photoUploadFrm" id="photoUploadFrm" method="post" enctype="multipart/form-data">
							<input type="hidden" name="boardId" id="boardId" value="<c:out value="${boardId}" />"/>
							<div style="padding-top:10px;">
								<ul class="actions">
									<li><input type="text" name="title" id="title" /></li>
									<li><input type="text" name="descr" id="descr" /></li>
									<li><input type="file" name="photo_file1"/></li>
									<li><a href="javascript:fn_photo_upload();" class="button icon solid fa-download">신규사진등록</a></li>
								</ul>
							</div>
							</form>
														
						</div>
			
					</div>
					
				</div>
				

			<!-- Footer -->
				<div id="footer-wrapper">
					<jsp:include page="/userFooter.do"></jsp:include>
				</div>

			</div>

		<!-- Scripts -->
			<script src="user/js/jquery.min.js"></script>
			<script src="user/js/jquery.dropotron.min.js"></script>
			<script src="user/js/jquery.poptrox.min.js"></script>
			<script src="user/js/browser.min.js"></script>
			<script src="user/js/breakpoints.min.js"></script>
			<script src="user/js/util.js"></script>
			<script src="user/js/main.js"></script>
			<script src="user/js/photoMain.js"></script>

		<script type="text/javascript">
		
			function fn_photo_upload(){
	           	document.photoUploadFrm.action = "<c:url value='/photoUserBoardInsert.do'/>";
	           	document.photoUploadFrm.submit();
			}
			
			function fn_photo_delete(photoId){
				alert('사진을 삭제하시겠습니까?');
			}
			
		</script>
	</body>
</html>