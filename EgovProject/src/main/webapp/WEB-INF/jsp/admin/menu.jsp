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
								
								var data = [];
								var children1 = [];
								var children2 = [];
								var tempCd;
								
								$.ajax({
									type : "get",
									url : "/menuList.do",
									data : {'id':'admin'},
									dataType : "json",
									contentType: 'application/x-www-form-urlencoded; charset=utf-8',
									success : function(result){
										
										$.each(result.menuList, function(i, v){
											
											console.log(i+', '+v.menuCd+','+v.menuNm+', '+v.depth);
											if(v.depth == '0'){
												//data.push({id:v.menuCd, text:v.menuNm, icon:"/images/tree_icon.png"});
												data.push({id:v.menuCd, text:v.menuNm, icon:"/images/tree_icon.png", children:children1});
											}else if(v.depth == '1'){
												//console.log('1:'+v.menuCd+','+v.pMenuCd+','+children2);
												if(children2!=''){
													//console.log(children1.length);
													//console.log(children1[children1.length-1].id);
													var len = children1.length - 1;
													var menuCd = children1[len].id;
													var menuNm = children1[len].text;
													children1[len] = {id:menuCd, text:menuNm, children:children2};
													children2 = [];
													children1.push({id:v.menuCd, text:v.menuNm});//, children:children2});
												}else{
													children1.push({id:v.menuCd, text:v.menuNm});
												}
												
											//	tempCd = v.menuCd;
											}else if(v.depth == '2'){//} && tempCd == v.pMenuCd){
											//	console.log('2:'+v.menuCd+','+v.pMenuCd);
												children2.push({id:v.menuCd, text:v.menuNm, type:"file"});	
											}
											console.log(children2);
										});
										
										if(children2 != ''){
											var len = children1.length - 1;
											var menuCd = children1[len].id;
											var menuNm = children1[len].text;
											children1[len] = {id:menuCd, text:menuNm, children:children2};
										}
										
										//data.push({children:children});
										//data.push({id:'M0001', text:'EgovProject', icon:"/images/tree_icon.png", children:children2});
										
									//	console.log(data);
										
									},error : function(xhr, status, error){
										alert(status);
									},complete : function(){
										
										$('#jstree_demo').jstree({
											"core" : {
												"animation" : 0,
												"check_callback" : true,
												'force_text' : true,
												"themes" : { "stripes" : true },
												'data' : data
											},
											"types" : {
												"#" : { "max_children" : 1, "max_depth" : 3, "valid_children" : ["root"] },
												"root" : { "icon" : "/images/tree_icon.png", "valid_children" : ["default"] },
												"default" : { "valid_children" : ["default","file"] },
												"file" : { "icon" : "glyphicon glyphicon-file", "valid_children" : [] }
											},
											"plugins" : [ "contextmenu", "dnd", "search", "state", "types", "wholerow" ]
											
										}).bind("select_node.jstree", function(e, data){
											console.log('change'+data);	
										});
									}
								});
								
								/*
								var data = [
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
									
								];
								*/
								
								//var data = [{id:'aaa', text:'aaa'},{id:'bbb', text:'bbb'}];
								
								
								
							}
							</script>

</body>
</html>