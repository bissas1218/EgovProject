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
														
															<div class="col-6 col-12-xsmall">
																<input type="text" name="s_date" id="s_date" value="" placeholder="날짜" readonly="readonly"  />
															</div>
															<div class="col-12 col-12-xsmall">
																<input type="text" name="title" id="title" value="" placeholder="일정제목" maxlength="50" />
															</div>
															
															<!-- Break -->
															<div class="col-4 col-12-small">
																<input type="radio" id="srt-time-all" name="srt-time" value="all" checked>
																<label for="srt-time-all">하루종일</label>
															</div>
															<div class="col-4 col-12-small">
																<input type="radio" id="srt-time-am" name="srt-time" value="am">
																<label for="srt-time-am">오전</label>
															</div>
															<div class="col-4 col-12-small">
																<input type="radio" id="srt-time-pm" name="srt-time" value="pm">
																<label for="srt-time-pm">오후</label>
															</div>
															
															<!-- Break -->
															<div class="col-6">
																<select name="srt-hour" id="srt-hour" disabled="disabled">
																	<option value="">시작시간</option>
																	<option value="01">1</option>
																	<option value="02">2</option>
																	<option value="03">3</option>
																	<option value="04">4</option>
																	<option value="05">5</option>
																	<option value="06">6</option>
																	<option value="07">7</option>
																	<option value="08">8</option>
																	<option value="09">9</option>
																	<option value="10">10</option>
																	<option value="11">11</option>
																	<option value="12">12</option>
																</select>
															</div>
															<!-- Break -->
															<div class="col-6">
																<select name="srt-min" id="srt-min" disabled="disabled">
																	<option value="">시작분</option>
																	<option value="00">0</option>
																	<option value="01">1</option>
																	<option value="02">2</option>
																	<option value="03">3</option>
																	<option value="04">4</option>
																	<option value="05">5</option>
																	<option value="06">6</option>
																	<option value="07">7</option>
																	<option value="08">8</option>
																	<option value="09">9</option>
																	<option value="10">10</option>
																	<option value="11">11</option>
																	<option value="12">12</option>
																	<option value="13">13</option>
																	<option value="14">14</option>
																	<option value="15">15</option>
																	<option value="16">16</option>
																	<option value="17">17</option>
																	<option value="18">18</option>
																	<option value="19">19</option>
																	<option value="20">20</option>
																	<option value="21">21</option>
																	<option value="22">22</option>
																	<option value="23">23</option>
																	<option value="24">24</option>
																	<option value="25">25</option>
																	<option value="26">26</option>
																	<option value="27">27</option>
																	<option value="28">28</option>
																	<option value="29">29</option>
																	<option value="30">30</option>
																	<option value="31">31</option>
																	<option value="32">32</option>
																	<option value="33">33</option>
																	<option value="34">34</option>
																	<option value="35">35</option>
																	<option value="36">36</option>
																	<option value="37">37</option>
																	<option value="38">38</option>
																	<option value="39">39</option>
																	<option value="40">40</option>
																	<option value="41">41</option>
																	<option value="42">42</option>
																	<option value="43">43</option>
																	<option value="44">44</option>
																	<option value="45">45</option>
																	<option value="46">46</option>
																	<option value="47">47</option>
																	<option value="48">48</option>
																	<option value="49">49</option>
																	<option value="50">50</option>
																	<option value="51">51</option>
																	<option value="52">52</option>
																	<option value="55">53</option>
																	<option value="54">54</option>
																	<option value="55">55</option>
																	<option value="56">56</option>
																	<option value="57">57</option>
																	<option value="58">58</option>
																	<option value="59">59</option>
																</select>
															</div>
															
															<div class="col-4 col-12-small">
																<input type="radio" id="end-time-am" name="end-time" disabled="disabled" value="am">
																<label for="end-time-am">오전</label>
															</div>
															<div class="col-4 col-12-small">
																<input type="radio" id="end-time-pm" name="end-time" disabled="disabled" value="pm" checked>
																<label for="end-time-pm">오후</label>
															</div>
															
															<!-- Break -->
															<div class="col-6">
																<select name="end-hour" id="end-hour" disabled="disabled">
																	<option value="">종료시간</option>
																	<option value="01">1</option>
																	<option value="02">2</option>
																	<option value="03">3</option>
																	<option value="04">4</option>
																	<option value="05">5</option>
																	<option value="06">6</option>
																	<option value="07">7</option>
																	<option value="08">8</option>
																	<option value="09">9</option>
																	<option value="10">10</option>
																	<option value="11">11</option>
																	<option value="12">12</option>
																</select>
															</div>
															<!-- Break -->
															<div class="col-6">
																<select name="end-min" id="end-min" disabled="disabled">
																	<option value="">종료분</option>
																	<option value="00">0</option>
																	<option value="01">1</option>
																	<option value="02">2</option>
																	<option value="03">3</option>
																	<option value="04">4</option>
																	<option value="05">5</option>
																	<option value="06">6</option>
																	<option value="07">7</option>
																	<option value="08">8</option>
																	<option value="09">9</option>
																	<option value="10">10</option>
																	<option value="11">11</option>
																	<option value="12">12</option>
																	<option value="13">13</option>
																	<option value="14">14</option>
																	<option value="15">15</option>
																	<option value="16">16</option>
																	<option value="17">17</option>
																	<option value="18">18</option>
																	<option value="19">19</option>
																	<option value="20">20</option>
																	<option value="21">21</option>
																	<option value="22">22</option>
																	<option value="23">23</option>
																	<option value="24">24</option>
																	<option value="25">25</option>
																	<option value="26">26</option>
																	<option value="27">27</option>
																	<option value="28">28</option>
																	<option value="29">29</option>
																	<option value="30">30</option>
																	<option value="31">31</option>
																	<option value="32">32</option>
																	<option value="33">33</option>
																	<option value="34">34</option>
																	<option value="35">35</option>
																	<option value="36">36</option>
																	<option value="37">37</option>
																	<option value="38">38</option>
																	<option value="39">39</option>
																	<option value="40">40</option>
																	<option value="41">41</option>
																	<option value="42">42</option>
																	<option value="43">43</option>
																	<option value="44">44</option>
																	<option value="45">45</option>
																	<option value="46">46</option>
																	<option value="47">47</option>
																	<option value="48">48</option>
																	<option value="49">49</option>
																	<option value="50">50</option>
																	<option value="51">51</option>
																	<option value="52">52</option>
																	<option value="55">53</option>
																	<option value="54">54</option>
																	<option value="55">55</option>
																	<option value="56">56</option>
																	<option value="57">57</option>
																	<option value="58">58</option>
																	<option value="59">59</option>
																</select>
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
	var backupSdate = '';
	var backupColor = '';
	
	$(document).ready(function() {
		
		fn_selectCalendarList('${year}', '${month}');
		
		// 날짜선택 이밴트
		$('#carendarTable tbody').on('click', 'td', function () {
			
			// 입력된 월이 현재월이 아닐경우 입력월로 이동
			if($("#txtYear").text()+$("#txtMonth").text() != this.id.substr(0,4)+''+Number(this.id.substr(4,2))){
				fn_selectCalendarList(this.id.substr(0,4), Number(this.id.substr(4,2)));
				return false;
			}
			
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
					fn_selectCalendarList($("#txtYear").text(), $("#txtMonth").text());
					
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