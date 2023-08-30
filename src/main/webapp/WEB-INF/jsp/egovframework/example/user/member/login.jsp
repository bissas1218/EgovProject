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
	<body class="is-preload homepage">
		<div id="page-wrapper">

			<!-- Header -->
				<div id="header-wrapper">
					<jsp:include page="/userNavi.do"></jsp:include>
				</div>

			<!-- Banner -->
				<div id="banner-wrapper">
					<div id="banner" class="box container">
					<form method="post" action="/userLogin.do" name="loginFrm" id="loginFrm">
						<div class="row">
							<div class="col-7 col-12-medium">
								<h2>로그인하기</h2>
								<p>로그인하시면 더 많은 혜택이 있습니다.</p>
							</div>
							<div class="col-5 col-12-medium">
							<ul>
								<li><input type="text" name="userId" id="userId" placeholder="아이디" style="margin-bottom:10px;" /></li>
								<li><input type="password" name="passwd" id="passwd" placeholder="비밀번호" style="margin-bottom:10px;" /></li>
								<li><a href="javascript:fn_login();" class="button large icon solid fa-arrow-circle-right">로그인</a></li>
								<li id="err_txt"></li>
								<li><a href="#" class="button alt large icon solid fa-question-circle">아이디/비밀번호찾기</a></li>
							</ul>
							</div>
						</div>
					</form>
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

	function fn_login(){
		if($("#userId").val() == ''){
			$("#err_txt").text('아이디를 입력해주세요.');
		}else if($("#passwd").val() == ''){
			$("#err_txt").text('비밀번호를 입력해주세요.');
		}else{
			$("#loginFrm").submit();
		}
	}
	
</script>

	</body>
</html>