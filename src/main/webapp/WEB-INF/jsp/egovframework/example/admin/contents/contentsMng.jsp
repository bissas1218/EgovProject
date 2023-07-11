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
		<!-- 
		<link type="text/css" href="ckeditor/sample/css/sample.css" rel="stylesheet" media="screen" />
		 -->
		<script src="admin/js/jquery.min.js"></script>
	
		<!--For Commons Validator Client Side-->
	    <script type="text/javascript" src="<c:url value='/cmmn/validator.do'/>"></script>
	    <validator:javascript formName="contentsVO" staticJavascript="false" xhtml="true" cdata="false"/>
	    
	    <style>
			.ck-editor__editable{ height: 400px; }
		/*	.ck-content{ font-size: 12px; } */
		</style>
	
	</head>
	<body class="is-preload">
	
		<!-- Wrapper -->
			<div id="wrapper">

				<form:form modelAttribute="contentsVO" id="contentsFrm" name="contentsFrm">
				<form:hidden path="contentsText" />
				<form:hidden path="contentsId" />
				
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
										<h1>컨텐츠관리</h1>
									</header>

									<!-- Content -->
									<h2 id="content">컨텐츠 관리방법</h2>
									<p>게시판을 신규추가하실 때는 게시판정보 입력 후 신규추가버튼을 눌러주세요. 좌측에서 게시판 검색 선택 후 우측의 게시판관리에서 추가 또는 삭제,수정해 주세요.</p>

									<hr class="major" />

										<div class="row gtr-200">
									
											<div class="col-6 col-12-medium">

												<!-- Table -->
													<h3>컨텐츠목록</h3>

														<hr />
														
													<div class="table-wrapper">
														<table class="alt" id="boardList">
															<thead>
																<tr>
																	<th>컨텐츠ID</th>
																	<th>컨텐츠명</th>
																	<th>마지막수정일</th>
																</tr>
															</thead>
															<tbody>
																
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
													
													</ul>
													
													<hr />
											</div>
											
											
											
											<div class="col-6 col-12-medium">

												<!-- Table -->
													<h3>컨텐츠 히스토리</h3>

														<hr />
														
													<div class="table-wrapper">
														<table class="alt" id="boardList2">
															<thead>
																<tr>
																	<th>컨텐츠ID</th>
																	<th>컨텐츠명</th>
																	<th>마지막수정일</th>
																</tr>
															</thead>
															<tbody>
																
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

													<ul class="pagination2">
													
													</ul>
													
													<hr />

											</div>	
										</div>

								</section>

								<div>
									<form:input path="contentsNm" maxlength="50" placeholder="컨텐츠 제목" />
								</div>
								
								<br/>
									
								<div class="centered">
									<div id="editor">
										
									</div>
							
								</div>
				
				<!-- Content -->
						<section>

							<div class="row gtr-200">
								<div class="col-12">
									<div class="row gtr-uniform">
										
										<!-- Break -->
										<div class="col-12">
											<ul class="actions">
												<li><input type="button" value="등록하기" class="primary" id="contentsInsertBtn" /></li>
												<li><input type="button" value="수정하기" id="contentsUpdateBtn" /></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
							
						</section>
						
						</div>
					</div>

					</form:form>

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

	<script src="ckeditor/ckeditor.js"></script>

	<script>
	
	$(document).ready(function() {
		selectContentsList(1);
		
	});
	
	ClassicEditor.create( document.querySelector( '#editor' ), {
		language: 'ko',
	//	toolbar: [ 'heading', '|', 'bold', 'italic', 'link' ],
	} )
	.then( editor => {
		window.editor = editor;
	} )
	.catch( err => {
		console.error( err.stack );
	} );

	
	function selectContentsList(pageNum){
		
		$.ajax({
			type: 'get',
			url: '/selectContentsList.do',
			dataType: 'json',
			success: function(result){
				$("#boardList > tbody:last > tr").remove();
				
				for(var i=0; i<result.length; i++){
					if(result[i].contentsId != null){
						$("#boardList > tbody:last").append("<tr><td>"+result[i].contentsId+'</td><td><a href="javascript:selectContents(\''+result[i].contentsId+'\');">'+result[i].contentsNm+"</a></td><td>"+result[i].regDate+"</td></tr>");	
					}else{
						
						// pagination
						var ul_list = $(".pagination"); //ul_list선언
						ul_list.children().remove();
						
						var prevClassVal = "button";
						if(result[i].currentPageNo - 1 == 0){
							prevClassVal = "button disabled";
						}
						ul_list.append("<li>"+"<a href='javascript:selectBoardList("+(result[i].currentPageNo-1)+");' class='"+prevClassVal+"'>Prev</a>"+"</li>"); //ul_list안쪽에 li추가
						
						for(var j = result[i].firstPageNoOnPageList; j <= result[i].lastPageNoOnPageList; j++){
							var classVal = "page";
							if(result[i].currentPageNo == j){
								classVal = "page active";
							}
							ul_list.append("<li>"+"<a href='javascript:selectBoardList("+j+");' class='"+classVal+"'>"+j+"</a>"+"</li>");
						}
						
						var nextClassVal = "button";
						//console.log(result[i].totalPageCount, result[i].currentPageNo);
						if(result[i].totalPageCount == result[i].currentPageNo){
							nextClassVal = "button disabled";
						}
						ul_list.append("<li><a href='javascript:selectBoardList("+(parseInt(result[i].currentPageNo)+1)+");' class='"+nextClassVal+"'>Next</span></li>");
					}
					
				}
			},
			error: function(){
				console.log('ajax selectContentsList error!');
			}
		});
	}
	
	$('#contentsInsertBtn').on('click', function() {
		
		var val = window.editor.getData();
		$("#contentsText").val(val);
		
		frm = document.contentsFrm;
		frm.action = "<c:url value='/insertContents.do'/>";
		frm.submit();
		
	});
	
	function selectContents(contentsId){
		//console.log(contentsId);
		$.ajax({
			type: 'get',
			data: {contentsId: contentsId},
			url: '/selectContents.do',
			dataType: 'json',
			success: function(result){
				//console.log(result.contentsText);
				window.editor.setData(result.contentsText);
				$("#contentsId").val(result.contentsId);
				$("#contentsNm").val(result.contentsNm);
			},
			error : function( jqXHR, textStatus, errorThrown ) {
				console.log('---selectContents error!---');
				console.log( jqXHR.status );
				console.log( jqXHR.statusText );
				console.log( jqXHR.responseText );
				console.log( jqXHR.readyState );
				console.log( textStatus );
				console.log( errorThrown );

			}
		});
	}
	
	$("#contentsUpdateBtn").on("click", function() {
		
		var val = window.editor.getData();
		$("#contentsText").val(val);
		
		frm = document.contentsFrm;
		frm.action = "<c:url value='/updateContents.do'/>";
		frm.submit();
	});
	
	</script>
	
	
	</body>
</html>