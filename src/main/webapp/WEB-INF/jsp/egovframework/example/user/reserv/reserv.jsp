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

							<h4>예약하기</h4>
								<div class="table-wrapper">
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
											<tr>
												<td>1</td>
												<td>2</td>
												<td>3</td>
												<td>4</td>
												<td>5</td>
												<td>6</td>
												<td>7</td>
											</tr>
											<tr>
												<td>1</td>
												<td>2</td>
												<td>3</td>
												<td>4</td>
												<td>5</td>
												<td>6</td>
												<td>7</td>
											</tr>
											<tr>
												<td>1</td>
												<td>2</td>
												<td>3</td>
												<td>4</td>
												<td>5</td>
												<td>6</td>
												<td>7</td>
											</tr>
											<tr>
												<td>1</td>
												<td>2</td>
												<td>3</td>
												<td>4</td>
												<td>5</td>
												<td>6</td>
												<td>7</td>
											</tr>
										</tbody>
										<tfoot>
											<tr>
												<td colspan="7" style="text-align:center;">
													<p style="font-size:28px;font-weight:bold;">
													<a href="javascript:selectMonth(2023, 6);" style="text-decoration: none;"><</a>
													&nbsp;<font id="txtYear"></font>.<font id="txtMonth"></font>&nbsp;
													<a href="javascript:selectMonth(2023, 8);" style="text-decoration: none;">></a>
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

	$(document).ready(function() {
		selectMonth('${year}', '${month}');
	});

	function selectMonth(year, month){
		console.log(month);
		$.ajax({
			type: 'get',
			url: '/selectMonth.do',
			contentType: 'application/json; charset=utf-8',
			data: {month:month, year:year},
			dataType: 'json',
			success: function(result){
				console.log('ajax json list success! result : ' + result.dayOfWeekNumber + ', ' + result.endDate.substr(8,2));
			//	console.log(result.length);
				var html = '<tr>';
				for(var i=1; i<=Number(result.endDate.substr(8,2))+Number(result.dayOfWeekNumber); i++){
					//console.log(i, ', '+i%7);
					if(i<=Number(result.dayOfWeekNumber)){
						html += '<td></td>';
					}else{
						html += '<td>' + (i-Number(result.dayOfWeekNumber)) + '</td>';
						if(i%7 == 0){
							console.log('---');
							html += '</tr><tr>';
						}
					}
					
					
				}
				
				html += '</tr>';
				
				$("#carendarTable tbody").empty();
				$("#carendarTable tbody").append(html);
				
				$("#txtYear").text(result.curYear);
				$("#txtMonth").text(result.curMonth);
				
			},
			error:function(){
				console.log('ajax json select month error!');
			}
		});
	}
</script>

	</body>
</html>