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

							<h4>일정확인 오늘날짜:<c:out value="${today}"/></h4>
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
									
									<input type="hidden" name="s_date" id="s_date" />
									
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
//	console.log(result);
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