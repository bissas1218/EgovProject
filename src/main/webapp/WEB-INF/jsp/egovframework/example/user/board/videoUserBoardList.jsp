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
								<h2>동영상게시판</h2>
								<p>It's a free responsive site template by HTML5 UPIt's a free responsive site template by HTML5 UPIt's a free responsive site template by HTML5 UPIt's a free responsive site template by HTML5 UP</p>
							</div>
						</div>
					</div>
				</div>

			<!-- Features -->
				<div id="features-wrapper">
					<div class="container">
						<div class="row">
							
							<c:forEach items="${videoBoardList}" var="videoBoardList">
							<div class="col-4 col-12-medium">

								<!-- Box -->
									<section class="box feature">
										<video src="video/<c:out value="${videoBoardList.saveNm}" />" width="100%" height="100%" controls></video>
										<div class="inner">
											<header>
												<h2><c:out value="${videoBoardList.size}" /> 바이트</h2>
												<p><c:out value="${videoBoardList.title}" /></p>
											</header>
											<p><c:out value="${videoBoardList.descr}" /></p>
										</div>
									</section>

							</div>
							</c:forEach>
							
							<form name="videoUploadFrm" id="videoUploadFrm" method="post" enctype="multipart/form-data">
							<input type="hidden" name="boardId" id="boardId" value="<c:out value="${boardId}" />"/>
							<div style="padding-top:10px;">
								<ul class="actions">
									<li><input type="text" name="title" id="title" /></li>
									<li><input type="text" name="descr" id="descr" /></li>
									<li><input type="file" name="video_file1"/></li>
									<li><a href="javascript:fn_video_upload();" class="button icon solid fa-download">신규동영상등록</a></li>
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
			<script src="user/js/browser.min.js"></script>
			<script src="user/js/breakpoints.min.js"></script>
			<script src="user/js/util.js"></script>
			<script src="user/js/main.js"></script>

		<script type="text/javascript">
		
			function fn_video_upload(){
	           	document.videoUploadFrm.action = "<c:url value='/videoUserBoardInsert.do'/>";
	           	document.videoUploadFrm.submit();
			}
			
			function fn_video_delete(videoId){
				alert('사진을 삭제하시겠습니까?');
			}
			
		</script>
		
	</body>
</html>