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
										<h2 id="elements">오늘날짜 : <c:out value="${today}"/> 선택한날짜 : <font id="selDate"></font></h2>
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
								
												<!-- Form -->
													<h3>코스설정</h3>

													<form method="post" action="#">
														<div class="row gtr-uniform">
														
														<!-- Break -->
															<div class="col-3 col-12-small">
																<input type="radio" id="total-hole-num-9" name="total-hole-num" value="9" >
																<label for="total-hole-num-9">9홀</label>
															</div>
															<div class="col-3 col-12-small">
																<input type="radio" id="total-hole-num-18" name="total-hole-num" value="18" checked>
																<label for="total-hole-num-18">18홀</label>
															</div>
															<div class="col-3 col-12-small">
																<input type="radio" id="total-hole-num-27" name="total-hole-num" value="27" >
																<label for="total-hole-num-27">27홀</label>
															</div>
															<div class="col-3 col-12-small">
																<input type="radio" id="total-hole-num-36" name="total-hole-num" value="36" >
																<label for="total-hole-num-36">36홀</label>
															</div>
															
															<div class="col-6 col-12-xsmall">
																<input type="text" name="A-course-nm" id="A-course-nm" value="동코스" placeholder="A코스명" />
															</div>
															<div class="col-6 col-12-xsmall">
																<input type="text" name="B-course-nm" id="B-course-nm" value="서코스" placeholder="B코스명" />
															</div>
															<div class="col-6 col-12-xsmall">
																<input type="text" name="C-course-nm" id="C-course-nm" value="" placeholder="C코스명" />
															</div>
															<div class="col-6 col-12-xsmall">
																<input type="text" name="D-course-nm" id="D-course-nm" value="" placeholder="D코스명" />
															</div>
															
															<!-- 1부시간설정 -->
															<div class="col-3 col-12-xsmall">
																1부시간설정
															</div>
															<div class="col-4 col-12-xsmall">
																<input type="text" name="part1_srt_time" id="part1_srt_time" value="06:00" placeholder="1부시작시간" />
															</div>
															<div class="col-1 col-12-xsmall">
																~
															</div>
															<div class="col-4 col-12-xsmall">
																<input type="text" name="part1_end_time" id="part1_end_time" value="11:59" placeholder="1부종료시간" />
															</div>
															
															<!-- 2부시간설정 -->
															<div class="col-3 col-12-xsmall">
																2부시간설정
															</div>
															<div class="col-4 col-12-xsmall">
																<input type="text" name="part2_srt_time" id="part2_srt_time" value="12:00" placeholder="2부시작시간" />
															</div>
															<div class="col-1 col-12-xsmall">
																~
															</div>
															<div class="col-4 col-12-xsmall">
																<input type="text" name="part2_end_time" id="part2_end_time" value="17:59" placeholder="2부종료시간" />
															</div>
															
															<!-- 3부시간설정 -->
															<div class="col-3 col-12-xsmall">
																3부시간설정
															</div>
															<div class="col-4 col-12-xsmall">
																<input type="text" name="part3_srt_time" id="part3_srt_time" value="18:00" placeholder="3부시작시간" />
															</div>
															<div class="col-1 col-12-xsmall">
																~
															</div>
															<div class="col-4 col-12-xsmall">
																<input type="text" name="part3_end_time" id="part3_end_time" value="21:00" placeholder="3부종료시간" />
															</div>
															
															<!-- Break -->
															<div class="col-12">
																<ul class="actions">
																	<li><input type="button" onclick="fn_createReserv();" value="저장하기" class="primary" /></li>
																	<li><input type="reset" value="Reset" /></li>
																</ul>
															</div>
															
														</div>
													</form>
													
													<h3>예약설정</h3>		
													<form method="post" action="#">
														<div class="row gtr-uniform">
														
															<div class="col-6 col-12-small">
																<input type="radio" id="golf-course-A" name="golf-course" value="A" checked>
																<label for="golf-course-A">동코스</label>
															</div>
															<div class="col-6 col-12-small">
																<input type="radio" id="golf-course-B" name="golf-course" value="B" >
																<label for="golf-course-B">서코스</label>
															</div>
															
															<div class="col-4 col-12-small">
																<input type="radio" id="golf-part-1" name="golf-part" value="1" checked>
																<label for="golf-part-1">1부</label>
															</div>
															<div class="col-4 col-12-small">
																<input type="radio" id="golf-part-2" name="golf-part" value="2" >
																<label for="golf-part-2">2부</label>
															</div>
															<div class="col-4 col-12-small">
																<input type="radio" id="golf-part-3" name="golf-part" value="3" >
																<label for="golf-part-3">3부</label>
															</div>
															
															<!-- 시간간격 -->
															<div class="col-4 col-12-xsmall">
																시간간격
															</div>
															<div class="col-6 col-12-xsmall">
																<input type="text" name="time-interval" id="time-interval" value="7" placeholder="분입력" />
															</div>
															<div class="col-2 col-12-xsmall">
																분
															</div>
															
															<!-- 홀수 -->
															<div class="col-4 col-12-xsmall">
																홀수
															</div>
															<div class="col-6 col-12-xsmall">
																<input type="text" name="hole" id="hole" value="18" placeholder="홀수입력" />
															</div>
															<div class="col-2 col-12-xsmall">
																홀
															</div>
															
															<!-- 캐디여부 -->
															<div class="col-6 col-12-small">
																<input type="radio" id="caddy-Y" name="caddy" value="Y" checked>
																<label for="caddy-Y">캐디</label>
															</div>
															<div class="col-6 col-12-small">
																<input type="radio" id="caddy-N" name="caddy" value="N" >
																<label for="caddy-N">노캐디</label>
															</div>
															
															<!-- 라운딩 인원 -->
															<div class="col-4 col-12-xsmall">
																인원
															</div>
															<div class="col-6">
																<select name="person" id="person">
																	<option value="">- 인원수 -</option>
																	<option value="1">1</option>
																	<option value="2">2</option>
																	<option value="3">3</option>
																	<option value="4" selected>4</option>
																	<option value="5">5</option>
																	<option value="6">6</option>
																</select>
															</div>
															<div class="col-2 col-12-xsmall">
																명
															</div>
															
															<!-- 그린피 -->
															<div class="col-4 col-12-xsmall">
																그린피
															</div>
															<div class="col-6 col-12-xsmall">
																<input type="text" name="green_fee" id="green_fee" value="130,000" placeholder="그린피입력" />
															</div>
															<div class="col-2 col-12-xsmall">
																원
															</div>
															
															<!-- 공휴일여부 -->
															<div class="col-6 col-12-small">
																<input type="radio" id="holiday_yn-Y" name="holiday_yn" value="Y" >
																<label for="holiday_yn-Y">공휴일</label>
															</div>
															<div class="col-6 col-12-small">
																<input type="radio" id="holiday_yn-N" name="holiday_yn" value="N" checked>
																<label for="holiday_yn-N">평일</label>
															</div>
															
															<!-- Break -->
															<div class="col-12">
																<ul class="actions">
																	<li><input type="button" onclick="fn_createReserv();" value="예약생성하기" class="primary" /></li>
																	<li><input type="reset" value="Reset" /></li>
																</ul>
															</div>
															
														</div>
													</form>

											</div>
											<div class="col-6 col-12-medium">

												<form method="post" action="#" name="golfRservFrm" id="golfRservFrm">
												<h4>2023년7월21일 동코스 1부 신규등록</h4>
													<div class="table-wrapper">
														<table class="alt" id="reserv_list">
															<thead>
																<tr>
																	<th style="width:18%">시간</th>
																	<th style="width:15%">홀수</th>
																	<th style="width:25%">캐디</th>
																	<th style="width:12%">인원</th>
																	<th style="width:30%">그린피</th>
																</tr>
															</thead>
															<tbody>
																
															</tbody>
															<!--  -->
															<tfoot>
																<tr>
																	<td colspan="3">총 <font id="total_reserv_cnt_txt"></font>건의 예약생성</td>
																	<td></td>
																</tr>
															</tfoot>
														</table>
													</div>

													<!-- Break -->
													<div class="col-12">
														<ul class="actions">
															<li><input type="button" onclick="fn_insertReserv();" value="예약저장하기" class="primary" /></li>
															<li><input type="reset" value="Reset" /></li>
														</ul>
													</div>
													
													<input type="hidden" name="total_reserv_cnt" id="total_reserv_cnt" />
													<input type="hidden" name="reserv_date" id="reserv_date" />
													<input type="hidden" name="golf_course" id="golf_course" />
													<input type="hidden" name="holiday_yn" id="holiday_yn" />
													<input type="hidden" name="part" id="part" />
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
		    	$("#selDate").text(this.id);
		    	
		    	/* 일정조회
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
		    	*/
		    	
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
		
		// 총홀수 체크값
		var totalHoleNum = $("input[name='total-hole-num']:checked").val();
		if(totalHoleNum == 9){
			$("#B-course-nm").hide();
			$("#C-course-nm").hide();
			$("#D-course-nm").hide();
		}else if(totalHoleNum == 18){
			$("#C-course-nm").hide();
			$("#D-course-nm").hide();
		}else if(totalHoleNum == 27){
			$("#D-course-nm").hide();
		}else if(totalHoleNum == 36){
			
		}
		
		// 총홀수 변경
		$("input[name='total-hole-num']:radio").change(function () {
			console.log(this.value);
			
			$("#A-course-nm").hide();
			$("#B-course-nm").hide();
			$("#C-course-nm").hide();
			$("#D-course-nm").hide();
			
			if(this.value == 9){
				$("#A-course-nm").show();
			}else if(this.value == 18){
				$("#A-course-nm").show();
				$("#B-course-nm").show();
			}else if(this.value == 27){
				$("#A-course-nm").show();
				$("#B-course-nm").show();
				$("#C-course-nm").show();
			}else if(this.value == 36){
				$("#A-course-nm").show();
				$("#B-course-nm").show();
				$("#C-course-nm").show();
				$("#D-course-nm").show();
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
	
	function fn_createReserv(){
		// part1_end_time
		let date = new Date(2023, 7, 27);
		let hour = 6;
		//console.log($("input[name='golf-part']:checked").val());
		var golfPart = $("input[name='golf-part']:checked").val();
		var part1_srt = $("#part1_srt_time").val();
		var part1_end = $("#part1_end_time").val();
		var part2_srt = $("#part2_srt_time").val();
		var part2_end = $("#part2_end_time").val();
		var part3_srt = $("#part3_srt_time").val();
		var part3_end = $("#part3_end_time").val();
		
		if( golfPart == '1'){
			date.setHours(part1_srt.substr(0,2));
			date.setMinutes(part1_srt.substr(3,2));
		}else if( golfPart == '2'){
			date.setHours(part2_srt.substr(0,2));
			date.setMinutes(part2_srt.substr(3,2));
		}else if( golfPart == '3'){
			date.setHours(part3_srt.substr(0,2));
			date.setMinutes(part3_srt.substr(3,2));
		}
		console.log('기준일자 : ' + date + '<br>');
		
		$("#reserv_list tbody tr").remove();
		
		let html = "";
		let num = 1;
		for(var i=0; i<1000; i++){
			
			//console.log('7분 후 : ' + date + ', 시간'+date.getHours()+', 분'+date.getMinutes()+', '+Number(part1_end.substr(0,2))+',' +Number(part1_end.substr(3,2)));
			//if(date.getHours() >= Number(part1_end.substr(0,2)) && date.getMinutes() > Number(part1_end.substr(3,2))){
			//	break;
			//}
			//console.log(new Date(2023, 7, 23, Number(part1_end.substr(0,2)), Number(part1_end.substr(3,2))));
			let chkHour, chkMin;
			if( golfPart == '1'){
				chkHour = Number(part1_end.substr(0,2));
				chkMin = Number(part1_end.substr(3,2));
			}else if(golfPart == '2'){
				chkHour = Number(part2_end.substr(0,2));
				chkMin = Number(part2_end.substr(3,2));
			}else if(golfPart == '3'){
				chkHour = Number(part3_end.substr(0,2));
				chkMin = Number(part3_end.substr(3,2));
			}
			
			if(date > new Date(2023, 7, 27, chkHour, chkMin)){
				break;
			}
			
			let hourTxt = date.getHours();
			if(String(date.getHours()).length == 1){
				hourTxt = '0' + date.getHours();
			}
			
			let minTxt = date.getMinutes();
			if(String(date.getMinutes()).length == 1){
				minTxt = '0' + date.getMinutes();
			}
			
			var caddy_yn = $("input[name='caddy']:checked").val();
			let caddy_y = '';
			let caddy_n = '';
			if(caddy_yn == 'Y'){
				caddy_y = 'selected';
			}else if(caddy_yn == 'N'){
				caddy_n = 'selected';
			}
			
			html += "<tr>";
			html += "<td><input type='text' name='reservTime_"+num+"' id='reservTime_"+num+"' value='"+hourTxt+":"+minTxt+"'/><br/></td>"+
				    "<td><input type='text' name='hole_"+num+"' id='hole_"+num+"' value='"+$("#hole").val()+"' /></td>"+
				    "<td><select name='caddy_"+num+"' id='caddy_"+num+"'>"+
				    	"<option value='Y' "+caddy_y+">캐디</option><option value='N' "+caddy_n+">노캐디</option>"+
				    	"</select></td>"+
				    "<td><input type='text' name='person_"+num+"' id='person_"+num+"' value='"+$("#person").val()+"' /></td>"+
				    "<td><input type='text' name='green_fee_"+num+"' id='green_fee_"+num+"' value='"+$("#green_fee").val()+"'/></td>";
				    
			html += "</tr>";	
			
			date.setMinutes(date.getMinutes() + Number($("#time-interval").val()));
			
			num++;
		}
		
		$("#total_reserv_cnt_txt").text(num);
		$("#total_reserv_cnt").val(num);
		
		$("#reserv_date").val($("#selDate").text()); // 예약일 저장
		$("#golf_course").val( $("input[name='golf-course']:checked").val() ); // 코스저장
		$("#holiday_yn").val( $("input[name='holiday_yn']:checked").val() ); // 공휴일여부
		$("#part").val( $("input[name='golf-part']:checked").val() ); // 부저장
		
		$("#reserv_list tbody").append(html);
	}
	
	function fn_insertReserv(){
	
		
		var frmData = $("#golfRservFrm").serialize();
		//console.log(frmData);
		
		$.ajax({
            cache : false,
            url : "/insertGolfReserv.do", // 요기에
            type : 'POST', 
            data : frmData, 
	        success : function(data) {
	            //var jsonObj = JSON.parse(data);
	        	$("#reserv_list tbody tr").remove();
	        	
	        	// 선택월 달력 새로고침
				fn_selectGolfReservMonth($("#txtYear").text(), $("#txtMonth").text());
	        	
	        }, // success 
	        error : function(xhr, status) {
	            alert(xhr + " : " + status);
	        }
		});
	}
	
</script>

	</body>
</html>