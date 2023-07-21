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

						<div class="" style="width:100%">

							<h4>예약하기 오늘날짜:<c:out value="${today}"/></h4>
								<div class="table-wrapper" id="carendarDiv">
									<table class="alt" id="carendarTable">
										<thead>
											<tr>
												<th>일</th>
												<th>월</th>
												<th>화</th>
												<th>수</th>
												<th>목</th>
												<th>금</th>
												<th>토</th>
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
	
	$(document).ready(function() {
		fn_selectCalendarList('${year}', '${month}');
		
		// 날짜선택 이밴트
		$('#carendarTable tbody').on('click', 'td', function () {
	    	//console.log(this.id);
	    	$("#"+this.id).css("background","gold");
	    });
	});

	// 전월 달력이동
	function fn_before_month(){
		//console.log(beforeDate.substr(0,4)+', '+beforeDate.substr(4,2));
		fn_selectCalendarList(beforeDate.substr(0,4), beforeDate.substr(4,2));
	}
	
	// 다음월 달력이동
	function fn_next_month(){
		//console.log(nextDate);
		fn_selectCalendarList(nextDate.substr(0,4), nextDate.substr(4,2));
	}
	
	function fn_selectCalendarList(year, month){
		//console.log(month);
		$.ajax({
			type: 'get',
			url: '/selectMonth.do',
			contentType: 'application/json; charset=utf-8',
			data: {month:month, year:year},
			dataType: 'json',
			success: function(result){
			//	console.log('ajax json list success! result : ' + result.dayOfWeekNumber + ', ' + result.endDate.substr(8,2));
			//	console.log(result.length);
				
				var dayOfWeekNumber = 0;
				if(Number(result.dayOfWeekNumber) != 7){
					dayOfWeekNumber = Number(result.dayOfWeekNumber);	
				}
				
				var html = '<tr>';
				var dayEnd = Number(result.endDate.substr(8,2)) + dayOfWeekNumber;
				var trNum = 1;
				
				//console.log( result );
				var beforeMonthDay = Number(result.beforeDate.substr(6,2)) - dayOfWeekNumber;
				var chk = 0;
				// 전월, 현재월, 다음월 날짜 그리기
				for(var i = 1; i <= dayEnd; i++){
					
					chk++;
					
					//console.log(i, ', '+i%7);
					if(i<=dayOfWeekNumber){
						
						html += '<td id="'+result.beforeDate.substr(0,6)+(beforeMonthDay+i)+'">'+(beforeMonthDay+i)+'</td>';	// 이전월 날짜 채우기
						
					}else{
						
						// css 날짜 id값 구하기
						var disDay = i-dayOfWeekNumber;
						var dayCssId = result.curYear;
						
						if(String(result.curMonth).length == 1){
							dayCssId += '0' + result.curMonth;
						}else{
							dayCssId += result.curMonth;
						}
						
						if(String(disDay).length == 1){
							dayCssId += '0' + disDay;	
						}else{
							dayCssId += disDay;
						}
						
						// 현대월 날짜 그리기
						if(i%7 == 0){
							html += '<td id="'+dayCssId+'"><b style="color:blue;">' + disDay + '</b></td>';
							html += '</tr><tr>';
							trNum++;
							chk = 0;
						}else if(chk == 1){
							html += '<td id="'+dayCssId+'"><b style="color:red;">' + disDay + '</b></td>';
						}else{
							html += '<td id="'+dayCssId+'"><b>' + disDay + '</b></td>';
						}
						
						//console.log(trNum);
					}
				}
				
				// 다음달 1일부터 채우기
				for(var j = 1; j <= ((trNum * 7) - dayEnd); j++){
					html += '<td id="'+(result.nextDate + '0' + j)+'">'+j+'</td>';
				}
				
				html += '</tr>';
				
				$("#carendarTable tbody").empty();
				$("#carendarTable tbody").append(html);
				
				$("#txtYear").text(result.curYear);
				$("#txtMonth").text(result.curMonth);
				
				//console.log(result.beforeDate+', '+result.nextDate);
				beforeDate = result.beforeDate;
				nextDate = result.nextDate;
				
				$("#"+${today}+" b").css("text-decoration","underline");
				
			},
			error:function(){
				console.log('ajax json select month error!');
			}
		});
	}
	

	
</script>

	</body>
</html>