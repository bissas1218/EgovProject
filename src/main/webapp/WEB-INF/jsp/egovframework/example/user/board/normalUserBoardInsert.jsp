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
			
			<!-- Main -->
				<div id="main">
					<div class="inner">
	
						<!-- Content -->
							<section>
	
								<!-- Content -->
								<h2 id="content">게시글 신규등록</h2>
								<p>Praesent ac adipiscing ullamcorper semper ut amet ac risus. Lorem sapien ut odio odio nunc. Ac adipiscing nibh porttitor erat risus justo adipiscing adipiscing amet placerat accumsan. Vis. Faucibus odio magna tempus adipiscing a non. In mi primis arcu ut non accumsan vivamus ac blandit adipiscing adipiscing arcu metus praesent turpis eu ac lacinia nunc ac commodo gravida adipiscing eget accumsan ac nunc adipiscing adipiscing lorem ipsum dolor sit amet nullam veroeros adipiscing.</p>
							
								<!-- Elements -->
								<h2 id="elements">게시판제목</h2>
										
								<div class="row gtr-200">
									<div class="col-12">

										<div class="row gtr-uniform">
											<div class="col-12">
												<form:input path="postTitle" maxlength="50" placeholder="게시물 제목" />
												&nbsp;<form:errors path="postTitle" />
											</div>
											
											<!-- 
											<div class="col-6 col-12-xsmall">
												<input type="email" name="demo-email" id="demo-email" value="" placeholder="Email" />
											</div>
											 -->
											 
											<!-- Break
											<div class="col-12">
												<select name="demo-category" id="demo-category">
													<option value="">- Category -</option>
													<option value="1">Manufacturing</option>
													<option value="1">Shipping</option>
													<option value="1">Administration</option>
													<option value="1">Human Resources</option>
												</select>
											</div>
											 -->
											 
											<!-- Break 
											<div class="col-4 col-12-small">
												<input type="radio" id="demo-priority-low" name="demo-priority" checked>
												<label for="demo-priority-low">Low</label>
											</div>
											<div class="col-4 col-12-small">
												<input type="radio" id="demo-priority-normal" name="demo-priority">
												<label for="demo-priority-normal">Normal</label>
											</div>
											<div class="col-4 col-12-small">
												<input type="radio" id="demo-priority-high" name="demo-priority">
												<label for="demo-priority-high">High</label>
											</div>
											-->
											
											<!-- Break 
											<div class="col-6 col-12-small">
												<input type="checkbox" id="demo-copy" name="demo-copy">
												<label for="demo-copy">Email me a copy</label>
											</div>
											<div class="col-6 col-12-small">
												<input type="checkbox" id="demo-human" name="demo-human" checked>
												<label for="demo-human">I am a human</label>
											</div>
											-->
											
										</div>
													
									</div>
								</div>
								
							</section>
					</div>
				</div>
				
				<div class="centered">
					<div id="editor">
						<h2>The three greatest things you learn from traveling</h2>
			
						<p>Like all the great things on earth traveling teaches us by example. Here are some of the most precious lessons I’ve learned over the years of traveling.</p>
			
						<h3>Appreciation of diversity</h3>
			
						<p>Getting used to an entirely different culture can be challenging. While it’s also nice to learn about cultures online or from books, nothing comes close to experiencing <a href="https://en.wikipedia.org/wiki/Cultural_diversity">cultural diversity</a> in person. You learn to appreciate each and every single one of the differences while you become more culturally fluid.</p>
			
						<figure class="image image-style-side"><img src="ckeditor/sample/img/umbrellas.jpg" alt="Three Monks walking on ancient temple.">
							<figcaption>Leaving your comfort zone might lead you to such beautiful sceneries like this one.</figcaption>
						</figure>
			
						<h3>Confidence</h3>
			
						<p>Going to a new place can be quite terrifying. While change and uncertainty makes us scared, traveling teaches us how ridiculous it is to be afraid of something before it happens. The moment you face your fear and see there was nothing to be afraid of, is the moment you discover bliss.</p>
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
												<li><input type="button" value="등록하기" class="primary" id="boardInsertBtn" /></li>
												<li><input type="reset" value="취소하기" /></li>
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
	
	$('#boardInsertBtn').on('click', function () {
		
		var value = window.editor.getData();
		$("#postContent").val(value);
		
		frm = document.normalBoardFrm;
    	if(!validateNormalBoardVO(frm)){
            return;
        }else{
        	frm.action = "<c:url value='/normalUserBoardInsert.do'/>";
            frm.submit();
        }
	});
	
</script>


			
</body>
</html>
