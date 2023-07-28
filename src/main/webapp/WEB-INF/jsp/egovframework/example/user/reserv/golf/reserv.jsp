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
		
		<style type="text/css">
		 #carendarDiv table {
		    
		  }
		  #carendarDiv table tbody td {
		    background-color:white;
		  }
		  #carendarDiv table th:first-child, td:first-child {
		    
		  }
		  
		</style>
		
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

			<!-- Main -->
				<div id="main-wrapper">
				
					<div class="container">
					
					<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Content -->
								<section>

									<!-- Content -->
										<h2 id="content">예약하기</h2>
										<p>Praesent ac adipiscing ullamcorper semper ut amet ac risus. Lorem sapien ut odio odio nunc. Ac adipiscing nibh porttitor erat risus justo adipiscing adipiscing amet placerat accumsan. Vis. Faucibus odio magna tempus adipiscing a non. In mi primis arcu ut non accumsan vivamus ac blandit adipiscing adipiscing arcu metus praesent turpis eu ac lacinia nunc ac commodo gravida adipiscing eget accumsan ac nunc adipiscing adipiscing lorem ipsum dolor sit amet nullam veroeros adipiscing.</p>

									<hr class="major" />

									<!-- Elements -->
										<div class="row gtr-200">
											<div class="col-6 col-12-medium">

												<!-- Table -->
													<h3>Table</h3>

													<h4>오늘날짜 : <c:out value="${today}"/> 선택한날짜 : <font id="selDate"></font></h4>
													<div class="table-wrapper" id="carendarDiv">
														<table id="carendarTable">
															<thead>
																<tr>
																<th style="width:14.3%">일</th>
																<th style="width:14.3%">월</th>
																<th style="width:14.3%">화</th>
																<th style="width:14.3%">수</th>
																<th style="width:14.3%">목</th>
																<th style="width:14.3%">금</th>
																<th style="width:14.3%">토</th>
															</tr>
															</thead>
															<tbody>
																
															</tbody>
															<tfoot>
																<tr>
																<td colspan="7" style="text-align:center;">
																	<p style="font-size:28px;font-weight:bold;">
																	<a href="javascript:fn_before_month();" style="text-decoration: none;"><</a>
																	&nbsp;<font id="txtYear"></font>.<font id="txtMonth"></font>&nbsp;
																	<a href="javascript:fn_next_month();" style="text-decoration: none;">></a>
																	</p>
																</td>
															</tr>
															</tfoot>
														</table>
													</div>

													<!-- Form -->
													<h3>Form</h3>

													<form method="post" action="#">
														<div class="row gtr-uniform">
															
															<!-- Break -->
															<div class="col-3 col-12-small">
																<input type="radio" id="golf_part-all" name="golf_part" value="all" checked>
																<label for="golf_part-all">전체</label>
															</div>
															<div class="col-3 col-12-small">
																<input type="radio" id="golf_part-1" name="golf_part" value="1">
																<label for="golf_part-1">1부</label>
															</div>
															<div class="col-3 col-12-small">
																<input type="radio" id="golf_part-2" name="golf_part" value="2">
																<label for="golf_part-2">2부</label>
															</div>
															<div class="col-3 col-12-small">
																<input type="radio" id="golf_part-3" name="golf_part" value="3">
																<label for="golf_part-3">3부</label>
															</div>
															
														</div>
														
														<input type="hidden" name="reserv_date" id="reserv_date" />
														
													</form>

											</div>
											<div class="col-6 col-12-medium">

												<!-- Table -->
													<h3>Table</h3>

													<h4>2023년7월21일 동코스 1부</h4>
													<div class="table-wrapper">
														<table id="reserv_list">
															<thead>
																<tr>
																	<th style="width:15%">코스</th>
																	<th style="width:18%">시간</th>
																	<th style="width:15%">홀수</th>
																	<th style="width:15%">캐디</th>
																	<th style="width:12%">인원</th>
																	<th style="width:15%">그린피</th>
																	<th style="width:10%">예약</th>
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
												</div>
										</div>

								</section>

						</div>
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

	var beforeDate = '';
	var nextDate = '';
	var backupSdate = '';
	var backupColor = '';

	$(document).ready(function() {
		
		fn_selectGolfReservMonth('${year}', '${month}');
		
		// 날짜선택 이밴트
		$('#carendarTable tbody').on('click', 'td', function () {
			
			// 입력된 월이 현재월이 아닐경우 입력월로 이동
			if($("#txtYear").text()+$("#txtMonth").text() != this.id.substr(0,4)+''+Number(this.id.substr(4,2))){
				fn_selectGolfReservMonth(this.id.substr(0,4), Number(this.id.substr(4,2)));
				return false;
			}else{
				
				if(backupSdate != ''){
		    		$("#"+backupSdate).css("background", backupColor);	
		    	}
		    	
		    //	console.log(this.id+', '+$("#"+this.id).css("background-color"));
		    	backupSdate = this.id;
		    	backupColor = $("#"+this.id).css("background-color");
		    	
		    	$("#reserv_date").val(this.id);
		    	$("#"+this.id).css("background","gold");
		    	$("#selDate").text(this.id);
		    	
		    	fn_reset();
		    	
		    	fn_golfReservList();
		    	
			}
		});
		
		// 파트 변경
		$("input[name='golf_part']:radio").change(function () {
			//console.log(this.value);
			//fn_selectGolfReservMonth($("#txtYear").text(), $("#txtMonth").text());
			fn_golfReservList();
		});
		
	});

	function fn_golfReservList(){
		
		/* 예약목록조회 */
    	$.ajax({
			type: 'get',
			url: '/selectUserGolfReservList.do',
			contentType: 'application/json; charset=utf-8',
			data: {
				date:$("#reserv_date").val(),
				part:$("input[name='golf_part']:checked").val()
			},
			dataType: 'text',
			success: function(result){
				//fn_reset();
				$("#reserv_list tbody tr").remove();
				//console.log(result);
				//fn_schedule_list(result);
				if(result == ''){
					$("#reserv_list tbody").append("<tr><td colspan='7'>등록된 예약이 없습니다.</td></tr>");
				}else{
					$("#reserv_list tbody").append(result);
				}
				
			},
			error:function(){
				console.log('ajax golf reserv list error!!!');
			}
		});
	}
	
	// 전월 달력이동
	function fn_before_month(){
		fn_selectGolfReservMonth(beforeDate.substr(0,4), beforeDate.substr(4,2));
	}
	
	// 다음월 달력이동
	function fn_next_month(){
		fn_selectGolfReservMonth(nextDate.substr(0,4), nextDate.substr(4,2));
	}
	
	// 달력조회
	function fn_selectGolfReservMonth(year, month){
		//console.log(month);
		$.ajax({
			type: 'get',
			url: '/selectGolfReservMonth.do',
			contentType: 'application/json; charset=utf-8',
			data: {month:month, year:year},
			dataType: 'json',
			success: function(result){
				
			//	console.log(result.html);
				$("#carendarTable tbody").empty();
				$("#carendarTable tbody").append(result.html);
				
				$("#txtYear").text(result.curYear);
				$("#txtMonth").text(result.curMonth);
				
				beforeDate = result.beforeDate;
				nextDate = result.nextDate;
				
				$("#"+${today}+" b").css("text-decoration","underline");
				
				fn_reset();
			},
			error:function(){
				console.log('ajax json select month error!');
			}
		});
	}
	
	function fn_user_reserv(time){
		alert(time);
	}
	
	function fn_reset(){
		$("#reserv_list tbody tr").remove();
		$("input:radio[name='golf_part']:input[value='all']").prop('checked',true);
	//	$("#txtYear").text('');
	}
	
</script>

	</body>
</html>