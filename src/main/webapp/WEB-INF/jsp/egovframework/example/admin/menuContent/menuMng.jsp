
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
		<title>Elements - Editorial by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="admin/css/main.css" />
		
		<!-- 2 load the theme CSS file -->
  		<link rel="stylesheet" href="jstree/dist/themes/default/style.min.css" />
  		
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
										<h1>메뉴관리</h1>
									</header>


									<!-- Elements -->
										<h2 id="elements">Elements</h2>
										<div class="row gtr-200">
											<div class="col-6 col-12-medium">

												<!-- Text stuff -->
													<h3>Text</h3>
													
													<!-- 3 setup a container element -->
												  <div id="jstree">
												    <!-- in this example the tree is populated from inline HTML -->
												    <ul>
												      <li>Root node 1
												        <ul>
												          <li id="child_node_1">Child node 1</li>
												          <li>Child node 2</li>
												        </ul>
												      </li>
												      <li>Root node 2</li>
												    </ul>
												  </div>
													<hr />
													<button>click</button>
													<button>메뉴추가</button>
											</div>
											<div class="col-6 col-12-medium">


												<!-- Form -->
												<h3>Form</h3>

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

<!-- 4 include the jQuery library 
  <script src="jstree/dist/libs/jquery.js"></script>
  -->
  
  <!-- 5 include the minified jstree source -->
  <script src="jstree/dist/jstree.min.js"></script>
  <script>
  $(function () {
    // 6 create an instance when the DOM is ready
    $('#jstree').jstree();
    // 7 bind to events triggered on the tree
    $('#jstree').on("changed.jstree", function (e, data) {
      console.log(data.selected);
    });
    // 8 interact with the tree - either way is OK
    $('button').on('click', function () {
    	console.log('click');
      $('#jstree').jstree(true).select_node('child_node_1');
      $('#jstree').jstree('select_node', 'child_node_1');
      $.jstree.reference('#jstree').select_node('child_node_1');
    });
  });
  </script>
  
	</body>
</html>