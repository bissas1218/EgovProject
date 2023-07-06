<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>

<!DOCTYPE html>
<!--
Copyright (c) 2003-2023, CKSource Holding sp. z o.o. All rights reserved.
For licensing, see LICENSE.md or https://ckeditor.com/legal/ckeditor-oss-license
-->
<html>
<head>
	<title>Verti by HTML5 UP</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="user/css/main.css" />
	<link type="text/css" href="ckeditor/sample/css/sample.css" rel="stylesheet" media="screen" />
	<script src="user/js/jquery.min.js"></script>
	
	<!--For Commons Validator Client Side-->
    <script type="text/javascript" src="<c:url value='/cmmn/validator.do'/>"></script>
    <validator:javascript formName="normalBoardVO" staticJavascript="false" xhtml="true" cdata="false"/>
    
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
		
		<form:form modelAttribute="normalBoardVO" id="normalBoardFrm" name="normalBoardFrm" method="POST">
		
		<!-- Main -->
		<div id="main-wrapper">
			
			<div class="container">
	
				<!-- Content -->

					<!-- Content -->
					<h2 id="content">게시글 수정하기</h2>
					<p>게시글수정은 이렇게 하세요.</p>
				
					<!-- Elements -->
					<h2 id="elements"><c:out value="${normalBoardVO.boardNm}"/></h2>
							
					<div class="row gtr-200">
						<div class="col-12">

								<div>
									<form:input path="postTitle" maxlength="50" placeholder="게시물 제목" />
									&nbsp;<form:errors path="postTitle" />
								</div>
								
										
						</div>
					</div>
					
				
				<div class="centered">
					<div id="editor">
						<c:out value="${normalBoardVO.postContent}" escapeXml="false"/>
					</div>
				</div>
				
				<!-- Main -->
				<div id="main">
					<div class="inner">
	
						<!-- Content -->
						<section>

							<div class="row gtr-200">
								<div class="col-12">
									<div class="row gtr-uniform">
										
										<!-- Break -->
										<div class="col-12">
											<ul class="actions">
												<li><input type="button" value="수정하기" class="primary" id="boardUpdateBtn" /></li>
												<li><input type="button" onclick="history.back();" value="취소하기" /></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
							
						</section>
						
					</div>
				</div>
				
			</div>
			
		</div>
		
		<!-- 검색조건 유지 -->
		<input type="hidden" name="postContent" id="postContent" value="" />
		<input type="hidden" name="norBrdId" id="norBrdId" value="<c:out value="${normalBoardVO.norBrdId}" />" />
		<input type="hidden" name="boardId" id="boardId" value="<c:out value="${normalBoardVO.boardId}" />" />
		
		</form:form>
		
		<!-- Footer -->
		<div id="footer-wrapper">
			<jsp:include page="/userFooter.do"></jsp:include>
		</div>
				
	</div>

<!-- Scripts -->

			
			<script src="user/js/jquery.dropotron.min.js"></script>
			<script src="user/js/browser.min.js"></script>
			<script src="user/js/breakpoints.min.js"></script>
			<script src="user/js/util.js"></script>
			<script src="user/js/main.js"></script>
			
<script src="ckeditor/ckeditor.js"></script>

<script>

	$(document).ready(function() {
		//window.editor.setData(<c:out value="${normalBoardVO.postContent}"/>);
		
	});

	ClassicEditor
		.create( document.querySelector( '#editor' ), {
			// toolbar: [ 'heading', '|', 'bold', 'italic', 'link' ]
		} )
		.then( editor => {
			window.editor = editor;
		} )
		.catch( err => {
			console.error( err.stack );
		} );
	
	$('#boardUpdateBtn').on('click', function () {
		
		var value = window.editor.getData();
		$("#postContent").val(value);
		
		frm = document.normalBoardFrm;
    	if(!validateNormalBoardVO(frm)){
            return;
        }else{
        	frm.action = "<c:url value='/normalUserBoardUpdate.do'/>";
            frm.submit();
        }
	});
	
</script>


			
</body>
</html>
