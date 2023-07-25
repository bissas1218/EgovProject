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
															<ul id="schedule_list">
															</ul>

														</div>
														
													</div>

											</div>
											<div class="col-6 col-12-medium">

												<!-- Form -->

													<form method="post" action="#">
														<div class="row gtr-uniform">
															<div class="col-6 col-12-xsmall">
																<input type="text" name="s_date" id="s_date" value="" placeholder="날짜" readonly="readonly"/>
															</div>
															<div class="col-6 col-12-xsmall">
																<input type="text" name="title" id="title" value="" placeholder="일정제목" />
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
																	<li><input type="button" onclick="fn_saveSchedule();" value="일정저장하기" class="primary" /></li>
																	<li><input type="reset" value="일정삭제하기" /></li>
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
			
			var s_date = $("#s_date").val();
			
			if(s_date != ''){
				//$("#"+s_date).css("background", "white");	
			}
			
	    	//console.log(this.id);
	    	//$("#"+this.id).css("background","gold");
	    	$("#s_date").val(this.id);
	    	
	    	// 일정조회
	    	$.ajax({
				type: 'get',
				url: '/selectScheduleList.do',
				data: {
					sDate:$("#s_date").val()
				},
				dataType: 'json',
				success: function(result){
					console.log(result);
					$("#schedule_list").children().remove();
					for(var i=0; i<result.length; i++){
						console.log(result[i].title);
						$("#schedule_list").append("<li>"+result[i].title+"</li>");
					}
				},
				error:function(){
					console.log('ajax schedule list error!!!');
				}
			});
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
	
	// 달력조회
	function fn_selectCalendarList(year, month){
		//console.log(month);
		$.ajax({
			type: 'get',
			url: '/selectScheduleMonth.do',
			contentType: 'application/json; charset=utf-8',
			data: {month:month, year:year},
			dataType: 'json',
			success: function(result){
				
				console.log(result.html);
				$("#carendarTable tbody").empty();
				$("#carendarTable tbody").append(result.html);
				
				$("#txtYear").text(result.curYear);
				$("#txtMonth").text(result.curMonth);
				
				beforeDate = result.beforeDate;
				nextDate = result.nextDate;
				
				$("#"+${today}+" b").css("text-decoration","underline");
				
			},
			error:function(){
				console.log('ajax json select month error!');
			}
		});
	}
	

	function fn_saveSchedule(){
		//console.log(selDate);
		if( $("#s_date").val() == '' ){
			alert('일정을 저장할 날짜를 선택하세요!');
		}else if( $("#title").val() == '' ){
			alert('일정제목을 입력하세요!');
			$("#title").focus();
		}else{
			
			$.ajax({
				type: 'post',
				url: '/updateSchedule.do',
				data: {
					sDate:$("#s_date").val(), 
					title:$("#title").val()
				},
				dataType: 'json',
				success: function(result){
					console.log(result);
					$("#schedule_list").children().remove();
					for(var i=0; i<result.length; i++){
						console.log(result[i].title);
						$("#schedule_list").append("<li>"+result[i].title+"</li>");
					}
				},
				error:function(){
					console.log('ajax schedule insert error!!!');
				}
			});
		}
	}
	
</script>

	</body>
</html>