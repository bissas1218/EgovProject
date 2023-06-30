<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>

<!DOCTYPE HTML>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Elements - Editorial by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="admin/css/main.css" />
		
		<!--For Commons Validator Client Side-->
	    <script type="text/javascript" src="<c:url value='/cmmn/validator.do'/>"></script>
	    <validator:javascript formName="boardVO" staticJavascript="false" xhtml="true" cdata="false"/>
	    
	</head>
	<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
								<header id="header">
									<a href="index.html" class="logo"><strong>Editorial</strong> by HTML5 UP</a>
									<ul class="icons">
										<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
										<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
										<li><a href="#" class="icon brands fa-snapchat-ghost"><span class="label">Snapchat</span></a></li>
										<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
										<li><a href="#" class="icon brands fa-medium-m"><span class="label">Medium</span></a></li>
									</ul>
								</header>

							<!-- Content -->
								<section>
									<header class="main">
										<h1>게시판관리</h1>
									</header>

									<!-- Content -->
										<h2 id="content">관리방법</h2>
										<p>개발자 개발환경을 다운로드 받아 설치 후 프로젝트를 생성해서 실행하기까지의 가이드를 제공한다. 개발자 개발환경을 다운로드 받아 설치 후 프로젝트를 생성해서 실행하기까지의 가이드를 제공한다. 개발자 개발환경을 다운로드 받아 설치 후 프로젝트를 생성해서 실행하기까지의 가이드를 제공한다. 개발자 개발환경을 다운로드 받아 설치 후 프로젝트를 생성해서 실행하기까지의 가이드를 제공한다.</p>

									<hr class="major" />

									<!-- Elements -->
										<h2 id="elements">Elements</h2>
										<div class="row gtr-200">
											<div class="col-6 col-12-medium">

												<!-- Table -->
													<h3>게시판목록</h3>

													<h4>Alternate</h4>
													<div class="table-wrapper">
														<table class="alt">
															<thead>
																<tr>
																	<th>번호</th>
																	<th>게시판명</th>
																	<th>형태</th>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td>1</td>
																	<td>우리집 멍멍이 게시판.</td>
																	<td>일반게시판</td>
																</tr>
																<tr>
																	<td>Item2</td>
																	<td>Vis ac commodo adipiscing arcu aliquet.</td>
																	<td>19.99</td>
																</tr>
																<tr>
																	<td>Item3</td>
																	<td> Morbi faucibus arcu accumsan lorem.</td>
																	<td>29.99</td>
																</tr>
																<tr>
																	<td>Item4</td>
																	<td>Vitae integer tempus condimentum.</td>
																	<td>19.99</td>
																</tr>
																<tr>
																	<td>Item5</td>
																	<td>Ante turpis integer aliquet porttitor.</td>
																	<td>29.99</td>
																</tr>
															</tbody>
															<tfoot>
															<!-- 
																<tr>
																	<td colspan="2"></td>
																	<td>100.00</td>
																</tr>
																 -->
															</tfoot>
														</table>
													</div>

													<ul class="pagination">
														<li><span class="button disabled">Prev</span></li>
														<li><a href="#" class="page active">1</a></li>
														<li><a href="#" class="page">2</a></li>
														<li><a href="#" class="page">3</a></li>
														<li><span>&hellip;</span></li>
														<li><a href="#" class="page">8</a></li>
														<li><a href="#" class="page">9</a></li>
														<li><a href="#" class="page">10</a></li>
														<li><a href="#" class="button">Next</a></li>
													</ul>
													
													<hr />
											</div>
											
											
											
											<div class="col-6 col-12-medium">

												<!-- Form -->
													<h3>게시판관리하기</h3>

													<form:form modelAttribute="boardVO" id="boardFrm" name="boardFrm">
														<div class="row gtr-uniform">
															<div class="col-12">
																<form:input path="boardNm" maxlength="20" placeholder="게시판명" />
																&nbsp;<form:errors path="boardNm" />
															</div>
															<!-- Break -->
															<div class="col-12">
																<select name="demo-category" id="demo-category">
																	<option value="">- Category -</option>
																	<option value="1">Manufacturing</option>
																	<option value="1">Shipping</option>
																	<option value="1">Administration</option>
																	<option value="1">Human Resources</option>
																</select>
															</div>
															<!-- Break -->
															<div class="col-4 col-12-small">
																<input type="radio" id="boardType-nomal" name="boardType" value="normal" checked>
																<label for="boardType-nomal">일반게시판</label>
															</div>
															<div class="col-4 col-12-small">
																<input type="radio" id="boardType-photo" name="boardType" value="photo">
																<label for="boardType-photo">사진게시판</label>
															</div>
															<div class="col-4 col-12-small">
																<input type="radio" id="boardType-video" name="boardType" value="video">
																<label for="boardType-video">동영상게시판</label>
															</div>
															
															<!-- Break -->
															<div class="col-4 col-12-small">
																<input type="radio" id="demo-priority2-low" name="demo-priority2" checked>
																<label for="demo-priority2-low">사용</label>
															</div>
															<div class="col-4 col-12-small">
																<input type="radio" id="demo-priority2-normal" name="demo-priority2">
																<label for="demo-priority2-normal">미사용</label>
															</div>
															
															<!-- Break -->
															<div class="col-6 col-12-small">
																<input type="checkbox" id="demo-copy" name="demo-copy">
																<label for="demo-copy">검색기능사용</label>
															</div>
															<div class="col-6 col-12-small">
																<input type="checkbox" id="demo-human" name="demo-human" checked>
																<label for="demo-human">첨부파일사용</label>
															</div>
															<!-- Break -->
															<div class="col-12">
																<textarea name="demo-message" id="demo-message" placeholder="Enter your message" rows="6"></textarea>
															</div>
															<!-- Break -->
															<div class="col-12">
																<ul class="actions">
																	<li><input type="button" value="신규추가" id="newBoardBtn" class="primary"/></li>
																	<li><input type="reset" value="수정" /></li>
																	<li><input type="reset" value="삭제" /></li>
																</ul>
															</div>
														</div>
													</form:form>

											</div>	
										</div>

								</section>

						</div>
					</div>

				<!-- Sidebar -->
					<div id="sidebar">
						<jsp:include page="/sidebar.do"></jsp:include>
					</div>

			</div>

		<!-- Scripts -->
			<script src="admin/js/jquery.min.js"></script>
			<script src="admin/js/browser.min.js"></script>
			<script src="admin/js/breakpoints.min.js"></script>
			<script src="admin/js/util.js"></script>
			<script src="admin/js/main.js"></script>

	<script>
	
	$('#newBoardBtn').on('click', function() {
		console.log('---new board add---'+$('input:radio[name="boardType"]:checked').val() );
		frm = document.boardFrm;
    	if(!validateBoardVO(frm)){
            return;
        }else{
        	
        	$.ajax({
				type: 'post',
				url: '/boardInsert.do',
				data: { boardNm:$("#boardNm").val(),
						boardType:$('input:radio[name="boardType"]:checked').val()
					},
				dataType: 'text',
				success: function(result){
					console.log('ajax text success! : '+result);
					if(result == 'success'){
						$("#boardNm").val('');
						$('input:radio[name="boardType"]:input[value="normal"]').prop("checked", true);
						alert('신규게시판이 추가되었습니다.');
						//selectMenuList();
					}else if(result == 'fail'){
						alert('게시판 신규추가중 에러가 발생하였습니다!');
					}
				},
				error:function(){
					console.log('ajax text error!');
				}
			});
        }
	});
	
	</script>
	
	</body>
</html>