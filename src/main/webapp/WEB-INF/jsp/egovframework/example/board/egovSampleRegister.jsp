<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"         uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"      uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="spring"    uri="http://www.springframework.org/tags"%>
<%
  /**
  * @Class Name : egovSampleRegister.jsp
  * @Description : Sample Register 화면
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
		<c:set var="registerFlag" value="${empty sampleVO.id ? 'create' : 'modify'}"/>
		<title>Sample <c:if test="${registerFlag == 'create'}"><spring:message code="button.create" /></c:if>
                  <c:if test="${registerFlag == 'modify'}"><spring:message code="button.modify" /></c:if>
        </title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		
		<!--For Commons Validator Client Side-->
	    <script type="text/javascript" src="<c:url value='/cmmn/validator.do'/>"></script>
	    <validator:javascript formName="sampleVO" staticJavascript="false" xhtml="true" cdata="false"/>
	    
		<script type="text/javaScript" language="javascript" defer="defer">
			<!--
	        /* 글 목록 화면 function */
	        function fn_egov_selectList() {
	           	document.detailForm.action = "<c:url value='/egovSampleList.do'/>";
	           	document.detailForm.submit();
	        }
	        
	        /* 글 삭제 function */
	        function fn_egov_delete() {
	           	document.detailForm.action = "<c:url value='/deleteSample.do'/>";
	           	document.detailForm.submit();
	        }
	        
	        /* 글 등록 function */
	        function fn_egov_save() {
	        	frm = document.detailForm;
	        	if(!validateSampleVO(frm)){
	                return;
	            }else{
	            	frm.action = "<c:url value="${registerFlag == 'create' ? '/addSample.do' : '/updateSample.do'}"/>";
	                frm.submit();
	            }
	        }
	        
	        -->
	    </script>
	</head>
	<body class="is-preload">
		<form:form modelAttribute="sampleVO" id="detailForm" name="detailForm">
		
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
										<h2 id="elements">
										<c:if test="${registerFlag == 'create'}"><spring:message code="button.create" /></c:if>
                    					<c:if test="${registerFlag == 'modify'}"><spring:message code="button.modify" /></c:if>
										</h2>
										<!-- 
										<div class="row gtr-200">
 										-->
 										<div>
											 <div class="col-6 col-12-medium">	
												<!-- Blockquote -->
													<h3>게시판설명</h3>
													<blockquote>본 가이드는 전자정부 표준프레임워크 기반의 단순한 응용프로그램(HelloWorld)를 직접 실습해 봄으로써 빠른 시간 내에 전자정부 프레임워크의 기본 기능을 파악하기 위하여 제공된다.본 가이드는 전자정부 표준프레임워크 기반의 단순한 응용프로그램(HelloWorld)를 직접 실습해 봄으로써 빠른 시간 내에 전자정부 프레임워크의 기본 기능을 파악하기 위하여 제공된다.본 가이드는 전자정부 표준프레임워크 기반의 단순한 응용프로그램(HelloWorld)를 직접 실습해 봄으로써 빠른 시간 내에 전자정부 프레임워크의 기본 기능을 파악하기 위하여 제공된다.</blockquote>

												<!-- Form -->
													<h3>Form</h3>
<!-- 
													<form method="post" action="#"> -->
														<div class="row gtr-uniform">
														
															<c:if test="${registerFlag == 'modify'}">
															<div class="col-6 col-12-xsmall">
																<label for="id"><spring:message code="title.sample.id" /></label>
																<!-- 
																<input type="text" name="demo-name" id="demo-name" value="" placeholder="카테고리ID" />
																 -->
																<form:input path="id" maxlength="10" readonly="true" placeholder="카테고리ID" />
															</div>
															</c:if>
															
															<div class="col-6 col-12-xsmall">
																<label for="name"><spring:message code="title.sample.name" /></label>
																<!-- <input type="email" name="demo-email" id="demo-email" value="" placeholder="카테고리명" /> -->
																<form:input path="name" maxlength="30" placeholder="카테고리명" />
    															&nbsp;<form:errors path="name" />
															</div>
															
															<!-- Break -->
															<div class="col-12">
																<label for="useYn"><spring:message code="title.sample.useYn" /></label>
																<!-- 
																<select name="demo-category" id="demo-category">
																	<option value="">- Category -</option>
																	<option value="1">Manufacturing</option>
																	<option value="1">Shipping</option>
																	<option value="1">Administration</option>
																	<option value="1">Human Resources</option>
																</select> -->
																<form:select path="useYn">
											    					<form:option value="Y" label="Yes" />
											    					<form:option value="N" label="No" />
											    				</form:select>
															</div>
															
														
															<!-- Break -->
															<div class="col-12">
																<label for="description"><spring:message code="title.sample.description" /></label>
																<!-- 
																<textarea name="demo-message" id="demo-message" placeholder="Enter your message" rows="6"></textarea>
																 -->
																<form:textarea path="description" rows="5" cols="58" />&nbsp;<form:errors path="description" />
															</div>
															
															<div class="col-6 col-12-xsmall">
																<label for="regUser"><spring:message code="title.sample.regUser" /></label>
																<c:if test="${registerFlag == 'modify'}">
											        				<form:input path="regUser" maxlength="10" readonly="true" />
											        				&nbsp;<form:errors path="regUser" />
											                    </c:if>
											                    <c:if test="${registerFlag != 'modify'}">
											        				<form:input path="regUser" maxlength="10" />
											        				&nbsp;<form:errors path="regUser" />
											                    </c:if>
															</div>
															
															<!-- Break -->
															<div class="col-12">
																<ul class="actions">
																	<li><input type="button" value="<spring:message code="button.list" />" onclick="fn_egov_selectList();"/></li>
																	<c:if test="${registerFlag == 'create'}">
																	<li><input type="button" value="<spring:message code="button.create" />" onclick="fn_egov_save();"/></li>
																	</c:if>
                            										<c:if test="${registerFlag == 'modify'}">
                            										<li><input type="button" value="<spring:message code="button.modify" />" onclick="fn_egov_save();"/></li>
                            										</c:if>
                            										<c:if test="${registerFlag == 'modify'}">
                            										<li><input type="button" value="<spring:message code="button.delete" />" onclick="fn_egov_delete();"/></li>
                            										</c:if>
															
																</ul>
															</div>
														</div>
												<!-- 	</form> -->

											
													
												

											</div>
											<div class="col-6 col-12-medium">

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
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
			
			<!-- 검색조건 유지 -->
		    <input type="hidden" name="searchCondition" value="<c:out value='${searchVO.searchCondition}'/>"/>
		    <input type="hidden" name="searchKeyword" value="<c:out value='${searchVO.searchKeyword}'/>"/>
		    <input type="hidden" name="pageIndex" id="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
		    
		</form:form>
	</body>
</html>