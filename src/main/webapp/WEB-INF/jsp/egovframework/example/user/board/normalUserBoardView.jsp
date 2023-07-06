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
	<form:form modelAttribute="normalBoardVO" id="detailForm" name="detailForm">
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

			<!-- Main -->
				<div id="main-wrapper">
				
					<div class="container">
					
						<div id="content">

							<!-- Content -->
								<article>

									<h2><c:out value="${normalBoardVO.boardNm}"/></h2>

									<p><c:out value="${normalBoardVO.boardDescr}"/></p>
<hr/>
									<h3><c:out value="${normalBoardVO.postTitle}"/></h3>
									<c:out value="${normalBoardVO.postContent}" escapeXml="false"/>
									
								</article>

												
						</div>
						
						<div style="margin-top:10px;">
							<ul class="actions">
								<li><a href="javascript:fn_egov_selectList();" class="button primary icon solid fa-search">목록보기</a></li>
								<li><a href="/normalUserBoardUpdate.do?norBrdId=<c:out value="${normalBoardVO.norBrdId}"/>" class="button icon solid fa-download">수정하기</a></li>
							</ul>	
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

			<!-- 검색조건 유지 -->
		    <input type="hidden" name="searchCondition" value="<c:out value='${normalBoardVO.searchCondition}'/>"/>
		    <input type="hidden" name="searchKeyword" value="<c:out value='${normalBoardVO.searchKeyword}'/>"/>
		    <input type="hidden" name="pageIndex" id="pageIndex" value="<c:out value='${normalBoardVO.pageIndex}'/>"/>
		    <input type="hidden" name="boardId" id="boardId" value="<c:out value='${normalBoardVO.boardId}'/>"/>
		    
		</form:form>
		
		<script type="text/javascript">
		/* 글 목록 화면 function */
        function fn_egov_selectList() {
           	document.detailForm.action = "<c:url value='/normalUserBoardList.do'/>";
           	document.detailForm.submit();
        }
		</script>
	</body>
</html>