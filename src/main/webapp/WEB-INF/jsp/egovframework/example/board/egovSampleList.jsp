<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
  /**
  * @Class Name : egovSampleList.jsp
  * @Description : Sample List 화면
  * @Modification Information
  *
  *   수정일         수정자                   수정내용
  *  -------    --------    ---------------------------
  *  2009.02.01            최초 생성
  *
  * author 실행환경 개발팀
  * since 2009.02.01
  *
  * Copyright (C) 2009 by MOPAS  All right reserved.
  */
%>
<!DOCTYPE HTML>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title><spring:message code="title.sample" /></title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<script type="text/javaScript" language="javascript" defer="defer">
	        <!--
	        /* 글 수정 화면 function */
	        function fn_egov_select(id) {
	        	document.listForm.selectedId.value = id;
	           	document.listForm.action = "<c:url value='/updateSampleView.do'/>";
	           	document.listForm.submit();
	        }
	        
	        /* 글 등록 화면 function */
	        function fn_egov_addView() {
	           	document.listForm.action = "<c:url value='/addSample.do'/>";
	           	document.listForm.submit();
	        }
	        
	        /* 글 목록 화면 function */
	        function fn_egov_selectList() {
	        	document.listForm.action = "<c:url value='/egovSampleList.do'/>";
	           	document.listForm.submit();
	        }
	        
	        /* pagination 페이지 링크 function */
	        function fn_egov_link_page(pageNo){
	        	document.listForm.pageIndex.value = pageNo;
	        	document.listForm.action = "<c:url value='/egovSampleList.do'/>";
	           	document.listForm.submit();
	        }
	        
	        //-->
	    </script>
	</head>
	<body class="is-preload">
		<form:form modelAttribute="searchVO" id="listForm" name="listForm" method="post">
        	<input type="hidden" name="selectedId" />
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
										<h1>Board예제</h1>
									</header>

									

									<hr class="major" />

									<!-- Elements -->
										<h2 id="elements">게시판예제</h2>
										<!-- 
										<div class="row gtr-200">
 										-->
 										<div>
											 <div class="col-6 col-12-medium">	
												<!-- Blockquote -->
													<h3>게시판설명</h3>
													<blockquote>본 가이드는 전자정부 표준프레임워크 기반의 단순한 응용프로그램(HelloWorld)를 직접 실습해 봄으로써 빠른 시간 내에 전자정부 프레임워크의 기본 기능을 파악하기 위하여 제공된다.본 가이드는 전자정부 표준프레임워크 기반의 단순한 응용프로그램(HelloWorld)를 직접 실습해 봄으로써 빠른 시간 내에 전자정부 프레임워크의 기본 기능을 파악하기 위하여 제공된다.본 가이드는 전자정부 표준프레임워크 기반의 단순한 응용프로그램(HelloWorld)를 직접 실습해 봄으로써 빠른 시간 내에 전자정부 프레임워크의 기본 기능을 파악하기 위하여 제공된다.</blockquote>

													<ul class="actions">
														<li>
									        				<form:select path="searchCondition">
									        					<form:option value="1" label="Name" />
									        					<form:option value="0" label="ID" />
									        				</form:select>
														</li>
														<li><form:input path="searchKeyword" placeholder="검색어를 입력" /></li>
														<li><a href="javascript:fn_egov_selectList();" class="button"><spring:message code="button.search" /></a></li>
													</ul>
													
												<!-- Table -->
													<div class="table-wrapper">
														<table>
														<caption style="visibility:hidden">카테고리ID, 케테고리명, 사용여부, Description, 등록자 표시하는 테이블</caption>
														<colgroup>
												 				<col width="10%"/>
												 				<col width="20%"/>
												 				<col width="20%"/>
												 				<col width="10%"/>
												 				<col width="20%"/>
												 				<col width="20%"/>
												 			</colgroup>
															<thead>
															
																<tr>
																	<th>No</th>
																	<th><spring:message code="title.sample.id" /></th>
																	<th><spring:message code="title.sample.name" /></th>
																	<th><spring:message code="title.sample.useYn" /></th>
																	<th><spring:message code="title.sample.description" /></th>
																	<th><spring:message code="title.sample.regUser" /></th>
																</tr>
															</thead>
															<tbody>
															<c:forEach var="result" items="${resultList}" varStatus="status">
																<tr>
																	<td><c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}"/></td>
																	<td><a href="javascript:fn_egov_select('<c:out value="${result.id}"/>')"><c:out value="${result.id}"/></a></td>
																	<td><c:out value="${result.name}"/></td>
																	<td><c:out value="${result.useYn}"/></td>
																	<td><c:out value="${result.description}"/></td>
																	<td><c:out value="${result.regUser}"/></td>
																</tr>
															</c:forEach>
																
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
												
													<ul class="actions">
														<li><a href="javascript:fn_egov_addView();" class="button primary"><spring:message code="button.create" /></a></li>
													</ul>

													<ul class="pagination">
													<!-- 
														<li><span class="button disabled">Prev</span></li>
														<li><a href="javascript:fn_egov_link_page('1');" class="button<c:if test="${paginationInfo.currentPageNo-1 eq 0}"> disabled</c:if>">First</a></li>
														 -->
														<li><a href="javascript:fn_egov_link_page('${paginationInfo.currentPageNo-1}');" class="button<c:if test="${paginationInfo.currentPageNo-1 eq 0}"> disabled</c:if>">Prev</a></li>
														 
														<c:forEach var="pageNum" begin="${paginationInfo.firstPageNoOnPageList}" end="${paginationInfo.lastPageNoOnPageList}">
														<li><a href="javascript:fn_egov_link_page('${pageNum}');" class="page<c:if test="${paginationInfo.currentPageNo eq pageNum}"> active</c:if>">${pageNum }</a></li>
														</c:forEach>
														
														<li><a href="javascript:fn_egov_link_page('${paginationInfo.currentPageNo+1}');" class="button<c:if test="${paginationInfo.totalPageCount eq paginationInfo.currentPageNo}"> disabled</c:if>">Next</a></li>
														<!-- 
														<li><a href="javascript:fn_egov_link_page('${paginationInfo.totalPageCount}');" class="button<c:if test="${paginationInfo.totalPageCount eq paginationInfo.currentPageNo}"> disabled</c:if>">Last</a></li>
														 -->
													</ul>
													
													<form:hidden path="pageIndex" />
													<!-- 
													currentPageNo:${paginationInfo.currentPageNo}<br/>		
													recordCountPerPage:${paginationInfo.recordCountPerPage}<br/>
													pageSize:${paginationInfo.pageSize}<br/>								
													totalRecordCount:${paginationInfo.totalRecordCount}<br/>
													totalPageCount:${paginationInfo.totalPageCount}<br/>
													firstPageNoOnPageList:${paginationInfo.firstPageNoOnPageList}<br/>
													lastPageNoOnPageList:${paginationInfo.lastPageNoOnPageList}<br/>
													firstRecordIndex:${paginationInfo.firstRecordIndex}<br/>
													lastRecordIndex:${paginationInfo.lastRecordIndex}<br/>
 -->
													
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
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
	</form:form>
	</body>
</html>