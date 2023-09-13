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
		
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

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
											<div class="col-12 col-12-medium">

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

											</div>
											
										</div>
										
										<div class="row gtr-200">
											<div class="col-12 col-12-medium">
												
												<h3>예약목록</h3>
												<h4><font id="cur_reserv_date_txt"></font></h4>
												
													<div class="table-wrapper">
														<table class="alt" id="reserv_list">
															<thead>
																<tr>
																	<th style="width:12%">코스명</th>
																	<th style="width:6%">파트</th>
																	<th style="width:9%">예약여부</th>
																	<th style="width:9%">시간</th>
																	<th style="width:9%">홀수</th>
																	<th style="width:13%">캐디</th>
																	<th style="width:9%">인원</th>
																	<th style="width:12%">그린피</th>
																	<th style="width:7%">휴일여부</th>
																	<th style="width:14%">관리</th>
																</tr>
															</thead>
															<tbody>
																
															</tbody>
															<!--  
															<tfoot>
																<tr>
																	<td colspan="3">총 <font id="total_reserv_cnt_txt"></font>건의 예약생성</td>
																	<td></td>
																</tr>
															</tfoot>
															-->
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
													<input type="hidden" name="member_type" id="member_type" />
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

		<!-- Scripts
			<script src="admin/js/jquery.min.js"></script> -->
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
		    	
		    	$("#reserv_date").val(this.id);
		    	$("#"+this.id).css("background","gold");
		    	$("#selDate").text(this.id);
		    	
		    	/* 예약목록 조회 */
		    	fn_reserv_list();
		    	
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
		var totalHoleNum = $("input[name='holeNum']:checked").val();
		if(totalHoleNum == 9){
			$("#bCourseNm").hide();
			$("#cCourseNm").hide();
			$("#dCourseNm").hide();
		}else if(totalHoleNum == 18){
			$("#cCourseNm").hide();
			$("#dCourseNm").hide();
		}else if(totalHoleNum == 27){
			$("#dCourseNm").hide();
		}else if(totalHoleNum == 36){
			
		}
		
		// 총홀수 변경
		$("input[name='holeNum']:radio").change(function () {
			//console.log(this.value);
			
			$("#aCourseNm").hide();
			$("#bCourseNm").hide();
			$("#cCourseNm").hide();
			$("#dCourseNm").hide();
			
			if(this.value == 9){
				$("#aCourseNm").show();
			}else if(this.value == 18){
				$("#aCourseNm").show();
				$("#bCourseNm").show();
			}else if(this.value == 27){
				$("#aCourseNm").show();
				$("#bCourseNm").show();
				$("#cCourseNm").show();
			}else if(this.value == 36){
				$("#aCourseNm").show();
				$("#bCourseNm").show();
				$("#cCourseNm").show();
				$("#dCourseNm").show();
			}
		});
		
		// 코스명
		$("input:radio[name='holeNum']:input[value='${golfSetting.holeNum}']").prop('checked',true);
		
		$("#aCourseNm").hide();
		$("#bCourseNm").hide();
		$("#cCourseNm").hide();
		$("#dCourseNm").hide();
		
		if('${golfSetting.holeNum}' == '9'){
			$("#aCourseNm").show();
		}else if('${golfSetting.holeNum}' == '18'){
			$("#aCourseNm").show();
			$("#bCourseNm").show();
		}else if('${golfSetting.holeNum}' == '27'){
			$("#aCourseNm").show();
			$("#bCourseNm").show();
			$("#cCourseNm").show();
		}else if('${golfSetting.holeNum}' == '36'){
			$("#aCourseNm").show();
			$("#bCourseNm").show();
			$("#cCourseNm").show();
			$("#dCourseNm").show();
		}
		
		$("#bring_reserv_date").datepicker({
			dateFormat: 'yy-mm-dd' // 달력 날짜 형태
			,showOtherMonths: true // 빈 공간에 현재월의 앞뒤월의 날짜를 표시
			,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
         //   ,changeYear: true //option값 년 선택 가능
         //   ,changeMonth: true //option값  월 선택 가능                
         //   ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
         //   ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
         //   ,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
            ,buttonText: "선택" //버튼 호버 텍스트              
            ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
            ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
            ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
            ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
            ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
         //   ,minDate: "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
         //   ,maxDate: "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후) 
		});
	});

	/* 예약목록 조회 */
	function fn_reserv_list(){
		
		/* 예약목록조회 */
    	$.ajax({
			type: 'get',
			url: '/selectGolfReservList.do',
			contentType: 'application/json; charset=utf-8',
			data: {
				date:$("#reserv_date").val(),
				part:'all',
				course:'all'
			},
			dataType: 'json',
			success: function(result){
				
				$("#reserv_list tbody tr").remove();
				
				let html = '';
				if(result.length == 0){
					html += '<tr>' + 
					'<td style="background-color:#dbffe6;" colspan="10">등록된 예약이 없습니다.</td></tr>';
				}else{
					
					for(let i=0; i<result.length; i++){
					//	console.log(result[i]);
					
						/* 예약여부 */
						let reservTxt = '';
						let colorTxt = '';
						if(result[i].reservId != '' && result[i].reservId != 'null'){
							reservTxt = '<a href="javascript:fn_user_info(\''+result[i].reservId+'\');">'+result[i].reservId + ' ' + result[i].reservDate + '</a>';
							colorTxt = '#dbff00';
						}else{
							reservTxt = '미예약';
							colorTxt = '#dbffe6';
						}
						
						let caddy_y = "";
						let caddy_n = "";
						if(result[i].caddy == 'Y') {
							caddy_y = "selected";
						}else {
							caddy_n = "selected";
						}
						
						let holidayTxt = "평일";
						if(result[i].holiDayYn == 'Y') {
							holidayTxt = "휴일";
						}
					
						html += '<tr>' + 
							'<td style="background-color:'+colorTxt+';">'+result[i].courseNm+'</td>' +
							'<td style="background-color:'+colorTxt+';">'+result[i].part+'부</td>' +
							'<td style="background-color:'+colorTxt+';">'+reservTxt+'</td>' +
							'<td style="background-color:'+colorTxt+';"><input type="text" name="reservTime_'+(i+1)+'" id="reservTime_'+(i+1)+'" value="'+result[i].time+'"/></td>' +
							'<td style="background-color:'+colorTxt+';"><input type="text" name="hole_'+(i+1)+'" id="hole_'+(i+1)+'" value="'+result[i].hole+'" /></td>'+
						    '<td style="background-color:'+colorTxt+';"><select name="caddy_'+(i+1)+'" id="caddy_'+(i+1)+'">'+
						    	'<option value="Y" '+caddy_y+'>캐디</option><option value="N" '+caddy_n+'>노캐디</option>'+
						    	'</select></td>'+
						    '<td style="background-color:'+colorTxt+';"><input type="text" name="person_'+(i+1)+'" id="person_'+(i+1)+'" value="'+result[i].person+'"/></td>'+
						    '<td style="background-color:'+colorTxt+';"><input type="text" name="green_fee_'+(i+1)+'" id="green_fee_'+(i+1)+'" value="'+result[i].greenFee+'"/></td>'+
						    '<td style="background-color:'+colorTxt+';">'+holidayTxt+'</td>'+
						    '<td style="background-color:'+colorTxt+';">'
						    + '<input type="button" onclick="fn_update_reserv(\''+(i+1)+'\', \''+result[i].date+'\', \''+result[i].course+'\', \''+result[i].time+'\');" value="수정" class="button primary small"/> '
						    + '<a href="javascript:fn_delete_reserv(\''+(i+1)+'\', \''+result[i].date+'\', \''+result[i].course+'\', \''+result[i].time+'\');" class="button primary small">삭제</a></td>'+
							'</tr>';
							
					} // end for
				}
				
				
				$("#reserv_list tbody").append(html);
				
				$("#cur_reserv_date_txt").text($("#reserv_date").val().substr(0,4)+'년'+
						$("#reserv_date").val().substr(4,2)+'월'+
						$("#reserv_date").val().substr(6,2)+'일 총 '+result.length+'건의 예약이 있습니다.');
				
				
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
			data: {month:month, year:year, type:'admin'},
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
		
		if( $("#reserv_date").val() == '' ){
			alert('예약을 생성할 날짜를 선택해주세요!');
			return;
		}
		
		// part1EndTime
		let date = new Date(2023, 7, 27);
		let hour = 6;
		//console.log($("input[name='golf-part']:checked").val());
		var golfPart = $("input[name='golf-part']:checked").val();
		var part1_srt = $("#part1SrtTime").val();
		var part1_end = $("#part1EndTime").val();
		var part2_srt = $("#part2SrtTime").val();
		var part2_end = $("#part2EndTime").val();
		var part3_srt = $("#part3SrtTime").val();
		var part3_end = $("#part3EndTime").val();
		
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
			html += "<td style='background-color:#fffea6;'><input type='text' name='reservTime_"+num+"' id='reservTime_"+num+"' value='"+hourTxt+":"+minTxt+"'/></td>"+
				    "<td style='background-color:#fffea6;'><input type='text' name='hole_"+num+"' id='hole_"+num+"' value='"+$("#hole").val()+"' /></td>"+
				    "<td style='background-color:#fffea6;'><select name='caddy_"+num+"' id='caddy_"+num+"'>"+
				    	"<option value='Y' "+caddy_y+">캐디</option><option value='N' "+caddy_n+">노캐디</option>"+
				    	"</select></td>"+
				    "<td style='background-color:#fffea6;'><input type='text' name='person_"+num+"' id='person_"+num+"' value='"+$("#person").val()+"' /></td>"+
				    "<td style='background-color:#fffea6;'><input type='text' name='green_fee_"+num+"' id='green_fee_"+num+"' value='"+$("#green_fee").val()+"'/></td>";
				    
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
		$("#member_type").val( $("input[name='member_type']:checked").val() ); // 회원종류
		
		$("#reserv_list tbody").append(html);
		
		$("#cur_reserv_date_txt").text('총 '+num+'건의 예약생성');
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
	
	// 골프장 환경저장
	function fn_golfSettingSave(){
		
		if( $("input[name='holeNum']:checked").val() == 9 ){
			if($("#aCourseNm").val() == ''){
				alert('코스명을 입력해주세요!');
				$("#aCourseNm").focus();
				return false;
			}
		}else if( $("input[name='holeNum']:checked").val() == 18 ){
			if($("#aCourseNm").val() == ''){
				alert('코스명을 입력해주세요!');
				$("#aCourseNm").focus();
				return false;
			}
			if($("#bCourseNm").val() == ''){
				alert('코스명을 입력해주세요!');
				$("#bCourseNm").focus();
				return false;
			}
		}else if( $("input[name='holeNum']:checked").val() == 27 ){
			if($("#aCourseNm").val() == ''){
				alert('코스명을 입력해주세요!');
				$("#aCourseNm").focus();
				return false;
			}
			if($("#bCourseNm").val() == ''){
				alert('코스명을 입력해주세요!');
				$("#bCourseNm").focus();
				return false;
			}
			if($("#cCourseNm").val() == ''){
				alert('코스명을 입력해주세요!');
				$("#cCourseNm").focus();
				return false;
			}
		}else if( $("input[name='holeNum']:checked").val() == 36 ){
			if($("#aCourseNm").val() == ''){
				alert('코스명을 입력해주세요!');
				$("#aCourseNm").focus();
				return false;
			}
			if($("#bCourseNm").val() == ''){
				alert('코스명을 입력해주세요!');
				$("#bCourseNm").focus();
				return false;
			}
			if($("#cCourseNm").val() == ''){
				alert('코스명을 입력해주세요!');
				$("#cCourseNm").focus();
				return false;
			}
			if($("#dCourseNm").val() == ''){
				alert('코스명을 입력해주세요!');
				$("#dCourseNm").focus();
				return false;
			}
		} 
		
		if( $("#part1SrtTime").val() == '') {
			alert('1부 시작시간을 입력해주세요!');
			$("#part1SrtTime").focus();
			return false;
		}
		
		if( $("#part1EndTime").val() == '') {
			alert('1부 종료시간을 입력해주세요!');
			$("#part1EndTime").focus();
			return false;
		}
		
		if( $("#part2SrtTime").val() == '') {
			alert('2부 시작시간을 입력해주세요!');
			$("#part2SrtTime").focus();
			return false;
		}
		
		if( $("#part2EndTime").val() == '') {
			alert('2부 종료시간을 입력해주세요!');
			$("#part2EndTime").focus();
			return false;
		}
		
		if( $("#part3SrtTime").val() == '') {
			alert('3부 시작시간을 입력해주세요!');
			$("#part3SrtTime").focus();
			return false;
		}
		
		if( $("#part3EndTime").val() == '') {
			alert('3부 종료시간을 입력해주세요!');
			$("#part3EndTime").focus();
			return false;
		}
		
		$("#golf_setting_frm").submit();
	}
	
	/* 예약생성 불러오기 */
	function fn_bring_reserv(){
		
		if($("#bring_reserv_date").val() == ''){
			alert('불러올 예약된 날짜를 선택해주세요!');
			return;
		}
		
		if( $("#reserv_date").val() == '' ){
			alert('예약을 생성할 날짜를 선택해주세요!');
			return;
		}
		
		//console.log($("#bring_reserv_date").val().replaceAll('-',''), $("#reserv_date").val());
		
		/* 예약목록조회 */
    	$.ajax({
			type: 'get',
			url: '/selectCreateGolfReservList2.do',
			contentType: 'application/json; charset=utf-8',
			data: {
				date:$("#bring_reserv_date").val().replaceAll('-',''),
				part:'all',
				course:'all'
			},
			dataType: 'json',
			success: function(result){
				$("#reserv_list tbody tr").remove();
			//	console.log(result);
				//fn_schedule_list(result);
				if(result == ''){
					$("#reserv_list tbody").append("<tr><td colspan='5'>등록된 예약이 없습니다.</td></tr>");
					$("#cur_reserv_date_txt").text('');
				}else{
					
					let html = '';
					for(var i=0; i<result.length; i++){
						console.log(result[i].time);
						let caddy_y = '';
						let caddy_n = '';
						if(result[i].caddy == 'Y'){
							caddy_y = "selected";
						}else{
							caddy_n = "selected";
						}
						html += '<tr>' +
									'<td style="background-color:#fffea6;"><input type="text" name="reservTime_'+(i+1)+'" id="reservTime_'+(i+1)+'" value="'+result[i].time+'"/></td>' +
									'<td style="background-color:#fffea6;"><input type="text" name="hole_'+(i+1)+'" id="hole_'+(i+1)+'" value="'+result[i].hole+'"/></td>' +
									'<td style="background-color:#fffea6;"><select name="caddy_'+(i+1)+'" id="caddy_'+(i+1)+'">' +
										'<option value="Y" '+caddy_y+'>캐디</option><option value="N" '+caddy_n+'>노캐디</option>'+
										'</select></td>' +
									'<td style="background-color:#fffea6;"><input type="text" name="person_'+(i+1)+'" id="person_'+(i+1)+'" value="'+result[i].person+'"/></td>' +
									'<td style="background-color:#fffea6;"><input type="text" name="green_fee_'+(i+1)+'" id="green_fee_'+(i+1)+'" value="'+result[i].greenFee+'"/></td>' +
									'<input type="hidden" name="golf_course_'+(i+1)+'" id="golf_course_'+(i+1)+'" value="'+result[i].course+'" />'+
									'<input type="hidden" name="part_'+(i+1)+'" id="part_'+(i+1)+'" value="'+result[i].part+'" />'+
									'<input type="hidden" name="member_type_'+(i+1)+'" id="member_type_'+(i+1)+'" value="'+result[i].part+'" />'+
								'</tr>';
					}
				//	$("#total_reserv_cnt_txt").text(num);
					$("#total_reserv_cnt").val(result.length+1);
					
					$("#reserv_date").val($("#selDate").text()); // 예약일 저장
					$("#golf_course").val( 'Non' ); // 코스저장
					$("#holiday_yn").val( "N" ); // 공휴일여부
					$("#part").val( "Non" ); // 부저장
					$("#member_type").val( "Non" ); // 회원종류
					
				//	console.log($("#selDate").text());
					
					$("#reserv_list tbody").append(html);
					
					//$("#cur_reserv_date_txt").text('총 '+num+'건의 예약생성');
				}
				
				
				$("#cur_reserv_date_txt").text(
						//$("#reserv_date").val().substr(0,4)+'년'+
						//$("#reserv_date").val().substr(4,2)+'월'+
						//$("#reserv_date").val().substr(6,2)+'일'+
						'총 '+result.length+'건의 예약 불러옴');
				
				
			},
			error:function(){
				console.log('ajax golf reserv list error!!!');
			}
		});
	}
	
	function fn_delete_reserv(index, date, course, time){
		
		if(confirm('예약을 삭제하시겠습니까?')){
			//console.log('->'+date+', '+time);
			$.ajax({
				type: 'post',
				url: '/deleteGolfReserv.do',
			//	contentType: 'application/json; charset=utf-8',
				data: {
					date:date,
					course:course,
					time:time
				},
				dataType: 'text',
				success: function(result){
					alert(result);
					
					/* 예약목록 조회 */
			    	fn_reserv_list();
				},
				error:function(){
					console.log('ajax golf reserv delete error!!!');
				}
			});
		}
	}
	
	function fn_update_reserv(index, date, course, time){
		//console.log($("#reservTime_"+index).val());
		
		if(confirm('예약을 수정하시겠습니까?')){
			//console.log('->'+date+', '+time);
			$.ajax({
				type: 'post',
				url: '/updateGolfReserv.do',
			//	contentType: 'application/json; charset=utf-8',
				data: {
					date:date,
					course:course,
					time:time,
					updateTime:$("#reservTime_"+index).val(),
					updateHole:$("#hole_"+index).val(),
					updateCaddy:$("#caddy_"+index).val(),
					updatePerson:$("#person_"+index).val(),
					updateGreenFee:$("#green_fee_"+index).val()
				},
				dataType: 'text',
				success: function(result){
					alert(result);
				},
				error:function(){
					console.log('ajax golf reserv update error!!!');
				}
			});
		}
	}
	
	function fn_user_info(userId){
		alert(userId);
	}
	
</script>

	</body>
</html>