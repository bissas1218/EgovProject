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
	
	div#wrap{
		width:100%;
		heigth:500px;
		background-color:silver;
		display:flex;
		flex-direction:row;
		flex-wrap:wrap;
		justify-content:flex-end;
	}
	
	div.menu{
		width:50%;
		height:500px;
	}
	</style>
	
	<link rel="stylesheet" href="/dist/themes/default/style.min.css" />
	
	<link rel="icon" href="//static.jstree.com/3.3.12/assets/favicon.ico" type="image/x-icon" />
	
	<script type="text/javascript" src="/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="/js/dist/jstree.min.js"></script>
	
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
					<li><a href="/menu.do" class="nav-link">메뉴관리</a></li>
					<li><a href="/contentMng.do" class="nav-link">컨텐츠관리</a></li>
				</ul>
			</div>
			
		</div>
	</nav>
</header>

<main>
	<div class="container">

	<h1>Data format demo</h1>
	

	<div>
		<button type="button" class="btn btn-success btn-sm" onclick="demo_create();"><i class="glyphicon glyphicon-asterisk"></i> Create</button>
		<button type="button" class="btn btn-warning btn-sm" onclick="demo_rename();"><i class="glyphicon glyphicon-pencil"></i> Rename</button>
		<button type="button" class="btn btn-danger btn-sm" onclick="demo_delete();"><i class="glyphicon glyphicon-remove"></i> Delete</button>
		<button type="button" class="btn btn-danger btn-sm" onclick="jstree_draw();"><i class="glyphicon glyphicon-remove"></i> Save</button>
	</div>
	
	<div id="wrap">
		<div id="jstree_demo" class="menu">
		</div>
		
		<div class="menu">
			<input type="text" id="menuId" name="menuId">
		</div>
	
	</div>
	
</main>

<footer>
	<div class="container-fluid text-center">
		<p id="copyright">
		Copyright © 2021 Oracle and/or its affiliates.  All rights reserved. 
		</p>
	</div>
</footer>

<script>
							function demo_create() {
								var ref = $('#jstree_demo').jstree(true),
									sel = ref.get_selected();
								if(!sel.length) { return false; }
								sel = sel[0];
							//	sel = ref.create_node(sel, {"type":"file"});
								sel = ref.create_node(sel);
								if(sel) {
									ref.edit(sel);
								}
							};
							function demo_rename() {
								var ref = $('#jstree_demo').jstree(true),
									sel = ref.get_selected();
								if(!sel.length) { return false; }
								sel = sel[0];
								ref.edit(sel);
							};
							function demo_delete() {
								var ref = $('#jstree_demo').jstree(true),
									sel = ref.get_selected();
								if(!sel.length) { return false; }
								ref.delete_node(sel);
							};
							
							$(function () {
								
								var to = false;
								
								$('#demo_q').keyup(function () {
									if(to) { clearTimeout(to); }
									to = setTimeout(function () {
										var v = $('#demo_q').val();
										$('#jstree_demo').jstree(true).search(v);
									}, 250);
								});
	
								jstree_draw();
								
							});
							
							function jstree_draw(){
								
								$.ajax({
									type : "get",
									url : "/menuList.do",
									data : {'id':'admin'},
							//		dataType : "json",
									success : function(result){
										alert(result);
									},error : function(xhr, status, error){
										console.log(error);
									}
								});
								
								$('#jstree_demo').jstree({
									"core" : {
										"animation" : 0,
										"check_callback" : true,
										'force_text' : true,
										"themes" : { "stripes" : true },
										'data' : 
											[
												{ "id" : "aaa", "text" : "EgovProject", "icon" : "/images/tree_icon.png", //"type" : "root", 
													"children" : [
														{ "id" : "bbb", "text" : "EgovFramework" }, 
														{ "id" : "ccc", "text" : "Language", 
															"children" : [ 
																{ "id" : "ddd", "text" : "Java", "type" : "file" },
																{ "id" : "eee", "text" : "Jquery", "type" : "file" }
															] 
														},
														{ "id" : "fff", "text" : "Server" }
													]	
												}
												
											]
										
									},
									"types" : {
										"#" : { "max_children" : 1, "max_depth" : 4, "valid_children" : ["root"] },
										"root" : { "icon" : "/images/tree_icon.png", "valid_children" : ["default"] },
										"default" : { "valid_children" : ["default","file"] },
										"file" : { "icon" : "glyphicon glyphicon-file", "valid_children" : [] }
									},
									"plugins" : [ "contextmenu", "dnd", "search", "state", "types", "wholerow" ]
									
								}).bind("select_node.jstree", function(e, data){
									console.log('change'+data);	
								});
							}
							</script>

</body>
</html>