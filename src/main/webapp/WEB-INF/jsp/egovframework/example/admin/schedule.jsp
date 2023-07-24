<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"         uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"      uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="spring"    uri="http://www.springframework.org/tags"%>
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
										<h1>일정관리</h1>
									</header>

									<!-- Content -->
										<h2 id="content">일정관리 방법</h2>
										<p>Praesent ac adipiscing ullamcorper semper ut amet ac risus. Lorem sapien ut odio odio nunc. Ac adipiscing nibh porttitor erat risus justo adipiscing adipiscing amet placerat accumsan. Vis. Faucibus odio magna tempus adipiscing a non. In mi primis arcu ut non accumsan vivamus ac blandit adipiscing adipiscing arcu metus praesent turpis eu ac lacinia nunc ac commodo gravida adipiscing eget accumsan ac nunc adipiscing adipiscing lorem ipsum dolor sit amet nullam veroeros adipiscing.</p>

									<hr class="major" />

									<!-- Elements -->
										<h2 id="elements">오늘날짜 : <c:out value="${today}"/></h2>
										<div class="row gtr-200">
											<div class="col-6 col-12-medium">

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
								
												<!-- Lists -->
													<div class="row">
														<div class="col-6 col-12-small">

															<h4>일정목록</h4>
															<ul>
																<li>예진휴무 09:00 ~ 13:00</li>
																<li>치과예약 14:00</li>
																<li>약먹기 하루종일</li>
															</ul>

														</div>
														
													</div>

											</div>
											<div class="col-6 col-12-medium">

												<!-- Form -->

													<form method="post" action="#">
														<div class="row gtr-uniform">
															<div class="col-6 col-12-xsmall">
																<input type="text" name="demo-name" id="demo-name" value="" placeholder="Name" />
															</div>
															<div class="col-6 col-12-xsmall">
																<input type="email" name="demo-email" id="demo-email" value="" placeholder="Email" />
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
															<!-- Break -->
															<div class="col-6 col-12-small">
																<input type="checkbox" id="demo-copy" name="demo-copy">
																<label for="demo-copy">Email me a copy</label>
															</div>
															<div class="col-6 col-12-small">
																<input type="checkbox" id="demo-human" name="demo-human" checked>
																<label for="demo-human">I am a human</label>
															</div>
															<!-- Break -->
															<div class="col-12">
																<textarea name="demo-message" id="demo-message" placeholder="Enter your message" rows="6"></textarea>
															</div>
															<!-- Break -->
															<div class="col-12">
																<ul class="actions">
																	<li><input type="submit" value="Send Message" class="primary" /></li>
																	<li><input type="reset" value="Reset" /></li>
																</ul>
															</div>
														</div>
													</form>

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
							html += '<td id="'+dayCssId+'"><b style="color:blue;">' + disDay + '</b></td>';	// 토요일
							html += '</tr><tr>';
							trNum++;
							chk = 0;
						}else if(chk == 1){
							html += '<td id="'+dayCssId+'"><b style="color:red;">' + disDay + '</b></td>';	// 일요일
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