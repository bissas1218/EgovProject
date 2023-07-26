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
										<h1>골프예약목록</h1>
									</header>

									<!-- Content -->
										<h2 id="content">골프예약관리 방법</h2>
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
														
															<div class="col-12 col-12-xsmall">
																동코스 06:00 18홀 4인 120,000
															</div>
															<div class="col-12 col-12-xsmall">
																동코스 06:00 18홀 4인 120,000
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
		    	
		    	$("#s_date").val(this.id);
		    	$("#"+this.id).css("background","gold");
		    	
		    	// 일정조회
		    	$.ajax({
					type: 'get',
					url: '/selectScheduleList.do',
					data: {
						sDate:$("#s_date").val()
					},
					dataType: 'json',
					success: function(result){
						
						fn_schedule_list(result);
					},
					error:function(){
						console.log('ajax schedule list error!!!');
					}
				});
		    	
			}
			
	    });
		
		// 시간체크
		$("input[name='srt-time']:radio").change(function () {
	        //라디오 버튼 값을 가져온다.
	        var srtTimeChk = this.value;
	                        
	        if(srtTimeChk == 'all'){
	        	$("#srt-hour").attr('disabled', true);
	        	$("#srt-min").attr('disabled', true);
	        	$("input[name='end-time']").attr('disabled', true);
	        	$("#end-hour").attr('disabled', true);
	        	$("#end-min").attr('disabled', true);
	        }else{
	        	$("#srt-hour").attr('disabled', false);
	        	$("#srt-min").attr('disabled', false);
	        	$("input[name='end-time']").attr('disabled', false);
	        	$("#end-hour").attr('disabled', false);
	        	$("#end-min").attr('disabled', false);
	        }         
		});
	});

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
	

	function fn_saveSchedule(){
		//console.log(selDate);
		if( $("#s_date").val() == '' ){
			alert('일정을 저장할 날짜를 선택하세요!');
		}else if( $("#title").val() == '' ){
			alert('일정제목을 입력하세요!');
			$("#title").focus();
		}else{
			
			var srtTime = '';
			var endTime = '';
			
			if( $("input[name='srt-time']:checked").val() == 'all'){
				srtTime = 'all';	
			}else{
				srtTime = $("input[name='srt-time']:checked").val() + $("#srt-hour").val() + $("#srt-min").val();
				endTime = $("input[name='end-time']:checked").val() + $("#end-hour").val() + $("#end-min").val();
			}
			
			$.ajax({
				type: 'post',
				url: '/updateSchedule.do',
				data: {
					sDate:$("#s_date").val(), 
					title:$("#title").val(),
					srtTime:srtTime,
					endTime:endTime
				},
				dataType: 'json',
				success: function(result){
					
					fn_schedule_list(result);
					
					// 선택월 달력 새로고침
					fn_selectGolfReservMonth($("#txtYear").text(), $("#txtMonth").text());
					
					fn_reset();
				},
				error:function(){
					console.log('ajax schedule insert error!!!');
				}
			});
		}
	}
	
	function fn_schedule_list(result){
//		console.log(result);
		$("#schedule_list").children().remove();
		for(var i=0; i<result.length; i++){
		
			let txtTitle = '';
			if(result[i].srtTime == 'all'){
				txtTitle = '(하루종일)';
			}else{
				txtTitle = '('+result[i].srtTime.substr(0,4)+':'+result[i].srtTime.substr(4,2)+"~"+result[i].endTime.substr(0,4)+':'+result[i].endTime.substr(4,2)+')';
			}
			
			if(result[i].holiDayYn == 'Y'){
				$("#schedule_list").append("<li style='color:red;'>"+result[i].title+" "+txtTitle+"</li>");
			}else{
				$("#schedule_list").append("<li>"+result[i].title+" "+txtTitle+"</li>");
			}
			
		}

	}
	
	function fn_reset(){
		$("#s_date").val('');
		$("#title").val('');
		$("#schedule_list").children().remove();
		
		//$("input:radio[name='srt-time']:input[value='all']").attr('checked',true);
		$("input:radio[name='srt-time']:input[value='all']").prop("checked", true);
		$("#srt-hour").val('');
		$("#srt-hour").attr('disabled', true);
		$("#srt-min").val('');
    	$("#srt-min").attr('disabled', true);
    	
    	$("input:radio[name='end-time']:input[value='pm']").prop('checked',true);
    	$("input[name='end-time']").attr('disabled', true);
    	$("#end-hour").val('');
    	$("#end-hour").attr('disabled', true);
    	$("#end-min").val('');
    	$("#end-min").attr('disabled', true);
    	
    	backupSdate = '';
    	backupColor = '';
	}
	
</script>

	</body>
</html>