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
									<h2 id="content">게시판 관리방법</h2>
									<p>게시판을 신규추가하실 때는 게시판정보 입력 후 신규추가버튼을 눌러주세요. 좌측에서 게시판 검색 선택 후 우측의 게시판관리에서 추가 또는 삭제,수정해 주세요.</p>

									<hr class="major" />

										<div class="row gtr-200">
									
											<div class="col-6 col-12-medium">

												<!-- Table -->
													<h3>게시판목록</h3>

													<div class="row gtr-uniform">
															<!-- Break -->
															<div class="col-4 col-12-small">
																<input type="radio" id="search_board_type-all" name="search_board_type" value="all" checked>
																<label for="search_board_type-all">전체</label>
															</div>
															<div class="col-4 col-12-small">
																<input type="radio" id="search_board_type-normal" name="search_board_type" value="normal">
																<label for="search_board_type-normal">일반게시판</label>
															</div>
															<div class="col-4 col-12-small">
																<input type="radio" id="search_board_type-QandA" name="search_board_type" value="QandA">
																<label for="search_board_type-QandA">Q&A게시판</label>
															</div>
															<div class="col-4 col-12-small">
																<input type="radio" id="search_board_type-photo" name="search_board_type" value="photo">
																<label for="search_board_type-photo">사진게시판</label>
															</div>
															<div class="col-4 col-12-small">
																<input type="radio" id="search_board_type-video" name="search_board_type" value="video">
																<label for="search_board_type-video">동영상게시판</label>
															</div>
													</div>
														
														<hr />
														
													<div class="table-wrapper">
														<table class="alt" id="boardList">
															<thead>
																<tr>
																	<th>게시판ID</th>
																	<th>게시판명</th>
																	<th>형태</th>
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

												<!-- Form -->
													<h3>게시판관리하기</h3>

													<form:form modelAttribute="boardVO" id="boardFrm" name="boardFrm">
													
														<div class="row gtr-uniform">
															<div class="col-12">
																<form:input path="boardId" maxlength="20" placeholder="게시판ID" readonly="true"/>
															</div>
															
															<div class="col-12">
																<form:input path="boardNm" maxlength="20" placeholder="게시판명" />
																&nbsp;<form:errors path="boardNm" />
															</div>
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
															<!-- Break -->
															<div class="col-4 col-12-small">
																<input type="radio" id="board_type-normal" name="board_type" value="normal">
																<label for="board_type-normal">일반게시판</label>
															</div>
															<div class="col-4 col-12-small">
																<input type="radio" id="board_type-QandA" name="board_type" value="QandA">
																<label for="board_type-QandA">Q&A게시판</label>
															</div>
															<div class="col-4 col-12-small">
																<input type="radio" id="board_type-photo" name="board_type" value="photo">
																<label for="board_type-photo">사진게시판</label>
															</div>
															<div class="col-4 col-12-small">
																<input type="radio" id="board_type-video" name="board_type" value="video">
																<label for="board_type-video">동영상게시판</label>
															</div>
															
															<!-- Break 
															<div class="col-4 col-12-small">
																<input type="radio" id="demo-priority2-low" name="demo-priority2" checked>
																<label for="demo-priority2-low">사용</label>
															</div>
															<div class="col-4 col-12-small">
																<input type="radio" id="demo-priority2-normal" name="demo-priority2">
																<label for="demo-priority2-normal">미사용</label>
															</div>
															-->
															<!-- Break
															<div class="col-6 col-12-small">
																<input type="checkbox" id="demo-copy" name="demo-copy">
																<label for="demo-copy">검색기능사용</label>
															</div>
															<div class="col-6 col-12-small">
																<input type="checkbox" id="demo-human" name="demo-human" checked>
																<label for="demo-human">첨부파일사용</label>
															</div>
															 -->
														</div>
														<hr/>
														<div class="row gtr-uniform">
															<!-- Break -->
															<h3>게시판 설명</h3>
															<div class="col-4 col-12-small">
																<input type="radio" id="board_descr_yn-Y" name="board_descr_yn" value="Y">
																<label for="board_descr_yn-Y">사용</label>
															</div>
															<div class="col-4 col-12-small">
																<input type="radio" id="board_descr_yn-N" name="board_descr_yn" value="N" checked>
																<label for="board_descr_yn-N">미사용</label>
															</div>
															<div class="col-12" id="board_descr_div" style="display:none;">
																<textarea name="board_descr" id="board_descr" placeholder="게시판설명글을 입력하세요." rows="6" ></textarea>
															</div>
															
															<!-- Break -->
															<div class="col-12">
																<ul class="actions">
																	<li><input type="button" value="신규추가" id="newBoardBtn" class="primary"/></li>
																	<li><input type="button" value="수정" id="boardUpdateBtn" /></li>
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
	
	$(document).ready(function() {
		selectBoardList(1);
		//console.log( $("input[type=hidden]").val(), $("input[name=boardId]").val(), $("#boardId").val() );
		
	});
	
	$("#boardUpdateBtn").on('click', function() {
		
		if( $("#boardId").val() == '' ){
			alert('수정할 게시판을 선택해 주세요!');
			return false;
		}
		
		frm = document.boardFrm;
    	if(!validateBoardVO(frm)){
            return;
        }else{
        	
        	
        	if( $('input:radio[name="board_type"]:checked').val() == '' || $('input:radio[name="board_type"]:checked').val() == null){
        		alert('게시판 유형을 선택해주세요!');
        		$("#board_type-normal").focus();
        		return false;
        	}
        	
        	if( $('input:radio[name="board_descr_yn"]:checked').val() == '' || $('input:radio[name="board_descr_yn"]:checked').val() == null){
        		alert('게시판설명글 사용유무를 선택해주세요!');
        		$("#board_descr_yn-Y").focus();
        		return false;
        	}
        	
        	if( $('input:radio[name="board_descr_yn"]:checked').val() == 'Y' && $("#board_descr").val()==''){
    			alert('게시판설명글을 입력해주세요!');
    			$("#board_descr").focus();
    			return false;
    		}
        	
        	$.ajax({
				type: 'post',
				url: '/boardUpdate.do',
				data: { boardId:$("#boardId").val(),
						boardNm:$("#boardNm").val(),
						boardType:$('input:radio[name="board_type"]:checked').val(),
						boardDescrYn:$('input:radio[name="board_descr_yn"]:checked').val(),
						boardDescr:$("#board_descr").val()
					},
				dataType: 'text',
				success: function(result){
					console.log('ajax text success! : '+result);
					if(result == 'success'){
						boardInfoReset();
						alert('게시판정보가 변경되었습니다.');
						selectBoardList(1);
					}else if(result == 'fail'){
						alert('게시판정보변경중 에러가 발생하였습니다!');
					}
				},
				error:function(){
					console.log('ajax text error!');
				}
			});
        }
	});
	
	$('#newBoardBtn').on('click', function() {
		//console.log('---new board add---'+$('input:radio[name="board_type"]:checked').val() );
		frm = document.boardFrm;
    	if(!validateBoardVO(frm)){
            return;
        }else{
        	
        	if( $('input:radio[name="board_type"]:checked').val() == '' || $('input:radio[name="board_type"]:checked').val() == null){
        		alert('게시판 유형을 선택해주세요!');
        		$("#board_type-normal").focus();
        		return false;
        	}
        	
        	if( $('input:radio[name="board_descr_yn"]:checked').val() == '' || $('input:radio[name="board_descr_yn"]:checked').val() == null){
        		alert('게시판설명글 사용유무를 선택해주세요!');
        		$("#board_descr_yn-Y").focus();
        		return false;
        	}
        	
        	if( $('input:radio[name="board_descr_yn"]:checked').val() == 'Y' && $("#board_descr").val()==''){
    			alert('게시판설명글을 입력해주세요!');
    			$("#board_descr").focus();
    			return false;
    		}
        	
        	$.ajax({
				type: 'post',
				url: '/boardInsert.do',
				data: { boardNm:$("#boardNm").val(),
						boardType:$('input:radio[name="board_type"]:checked').val(),
						boardDescrYn:$('input:radio[name="board_descr_yn"]:checked').val(),
						boardDescr:$("#board_descr").val()
					},
				dataType: 'text',
				success: function(result){
					console.log('ajax text success! : '+result);
					if(result == 'success'){
						boardInfoReset();
						alert('신규게시판이 추가되었습니다.');
						selectBoardList(1);
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
	
	function selectBoardList(pageNum) {
		
		$.ajax({
			type: 'get',
			url: '/selectBoardList.do',
			data: { searchKeyword:$('input:radio[name="search_board_type"]:checked').val(), pageIndex:pageNum },
			dataType: 'json',
			success: function(result){
				//console.log(result);
				$("#boardList > tbody:last > tr").remove();
				
				for(var i=0; i<result.length; i++){
					if(result[i].boardId != null){
						$("#boardList > tbody:last").append("<tr><td>"+result[i].boardId+'</td><td><a href="javascript:selectBoard(\''+result[i].boardId+'\');">'+result[i].boardNm+"</a></td><td>"+result[i].boardType+"</td></tr>");	
					}else{
						/*
						console.log(result[i].totalRecordCount); // 
						console.log(result[i].currentPageNo); 
						console.log(result[i].recordCountPerPage);
						console.log(result[i].pageSize);
						console.log(result[i].firstPageNoOnPageList); 
						console.log(result[i].lastPageNoOnPageList); 
						*/
						
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
						console.log(result[i].totalPageCount, result[i].currentPageNo);
						if(result[i].totalPageCount == result[i].currentPageNo){
							nextClassVal = "button disabled";
						}
						ul_list.append("<li><a href='javascript:selectBoardList("+(parseInt(result[i].currentPageNo)+1)+");' class='"+nextClassVal+"'>Next</span></li>");
					}
					
				}
			},
			error: function(){
				console.log('ajax selectBoardList error!');
			}
		});
		
		boardInfoReset();
	}
	
	// 검색용 게시판타입 선택이벤트
	$("input[name='search_board_type']").change(function(){
		selectBoardList(1);			
	});
	
	// 게시판설명글 사용유무 선택이벤트
	$("input[name='board_descr_yn']").change(function(){
		if( $('input:radio[name="board_descr_yn"]:checked').val() == 'Y' ){
			$("#board_descr").val('');
			$("#board_descr_div").show();
		}else{
			$("#board_descr_div").hide();
		}
	});
	
	
	function selectBoard(boardId){
		//console.log(boardId);
		console.log( $("input[type=hidden]").val(), $("input[name=boardId]").val() );
		
		$.ajax({
			type: 'get',
			url: '/selectBoard.do',
			data: { boardId:boardId },
			dataType: 'json',
			success: function(result){
				//console.log(result.boardNm);
				
				$("#boardNm").val(result.boardNm);
				$('input:radio[name="board_type"]:input[value="'+result.boardType+'"]').prop("checked", true);
				$('input:radio[name="board_descr_yn"]:input[value="'+result.boardDescrYn+'"]').prop("checked", true);
				
				$("#boardId").val(result.boardId);
				
				if(result.boardDescrYn == 'Y'){
					$("#board_descr_div").show();
					$("#board_descr").val(result.boardDescr);
				}else{
					$("#board_descr_div").hide();
				}
				
			},
			error: function(){
				console.log('ajax selectBoard error!');
			}
		});
	}
	
	// 입력객체 초기화
	function boardInfoReset(){
		
		$("#boardId").val('');
		$("#boardNm").val('');
		$('input:radio[name="board_type"]').prop("checked", false);
		$('input:radio[name="board_descr_yn"]').prop("checked", false);
		$("#board_descr_div").hide();
	}
	
	</script>
	
	
	</body>
</html>