<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<title>My Study List</title>

<link rel="stylesheet" href="/css/study/common.css" />
 <style>

	h1 { font-size:1.8em; }
	.demo { overflow:auto; border:1px solid silver; min-height:100px; }
	</style>
	
	<link rel="stylesheet" href="/dist/themes/default/style.min.css" />
	 
</head>
<body>
<header>
	<nav>
		<div class="container-fluid">
			<div id="navbar-logo">
				<a href="/"><img src="/images/doyun.png" alt="Home"></a>
			</div>
			
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
				<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" class="bi" fill="currentColor" viewBox="0 0 16 16">
					<path fill-rule="evenodd" d="M2.5 11.5A.5.5 0 0 1 3 11h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 3 7h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 3 3h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"></path>
				</svg>
			</button>
			
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav mr-auto">
					<li><a href="/study/egov/intro.do" class="nav-link">메뉴관리</a></li>
					
				</ul>
			</div>
			
		</div>
	</nav>
</header>

<main>
	<div class="container">
	<h1>HTML demo</h1>
	

	<h1>Data format demo</h1>
	<div id="frmt" class="demo"></div>

	
	<script src="/dist/jquery.min.js"></script>
	<script src="/dist/jstree.min.js"></script>
	
	<script>


	

	// data format demo
	$('#frmt').jstree({
		'core' : {
			'data' : [
				{
					"text" : "Root node",
					"state" : { "opened" : true },
					"children" : [
						{
							"text" : "EgovFrame",
							"state" : { "selected" : false },
							"icon" : "jstree-file",
							"children" : [
								{
									"text" : "EgovFrame",
									"state" : { "selected" : false },
									"icon" : "jstree-file"
								}]
						},
						{
							"text" : "Language",
							"state" : { "selected" : true },
							"icon" : "jstree-file"
						},
						{ "text" : "Child node 2", "state" : { "disabled" : true } }
					]
				}
			]
		}
	});

	
	</script>
	</div>
</main>

<footer>
	<div class="container-fluid text-center">
		<p id="copyright">
		Copyright © 2021 Oracle and/or its affiliates.  All rights reserved. 
		</p>
	</div>
</footer>



</body>
</html>