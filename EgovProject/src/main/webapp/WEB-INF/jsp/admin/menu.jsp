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
		<!-- 
		<button type="button" class="btn btn-danger btn-sm" onclick="all_save();"><i class="glyphicon glyphicon-remove"></i> All Save</button>
		 -->
	</div>
	
	<div id="wrap">
		<div id="jstree_demo" class="menu">
		</div>
		
		<div class="menu">
			Menu Code : <font id="menuCdTxt"></font><br/>
			Menu Name : <font id="menuNmTxt"></font><br/>
			
			메뉴타입:	<label id="content"><input type="radio" name="menuType" id="content" value="content" checked>컨텐츠</label> 
					<label id="board"><input type="radio" name="menuType" id="board" value="board">게시판</label>
					<label id="program"><input type="radio" name="menuType" id="program" value="program">프로그램</label><br/>
					
			<font id="urlTxt">접근URL</font>:<input type="text" id="url" name="url"><br/>
			<button type="button" class="btn btn-success btn-sm" onclick="demo_save();"><i class="glyphicon glyphicon-asterisk"></i> 선택된 메뉴저장</button>
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
	
	$("input[name='menuType']:radio").change(function () {
	    //라디오 버튼 값을 가져온다.
	    var menuType = this.value;
	    changeUrlTxt(menuType);
	});

	function changeUrlTxt(menuType){
		switch(menuType){
	    case 'content':
	    	$("#urlTxt").text('컨텐츠ID');
	    	break;
	    case 'board':
	    	$("#urlTxt").text('게시판ID');
	    	break;
		case 'program':
	    	$("#urlTxt").text('접근URL');
	    	break;
    	}  
	}
	
	function demo_save() { 
		var ref = $('#jstree_demo').jstree(true);
		var sel = ref.get_selected();
	
		if(!sel.length) { return false; }
		sel = sel[0];
		
		//console.log(sel);
		var node = $("#jstree_demo").jstree(true).get_node(sel)
		//console.log($("input[name='menuType']:checked").val());
		
		var data = [];
		
		$.ajax({
			type : "post",
			url : "/menuSave.do",
			data : {'menuCd':node.id, 'menuNm':node.text, 'pMenuCd':node.parent, 'url':$("#url").val(), 'type':$("input[name='menuType']:checked").val()},
			dataType : "json",
			contentType: 'application/x-www-form-urlencoded; charset=utf-8',
			success : function(data2){
				alert(data2.result);
				
				data = jstree_set_data(data2);
				
			},complete : function(){
				//jstree_draw();
				$("#jstree_demo").jstree(true).settings.core.data = data;
				$("#jstree_demo").jstree(true).refresh();
			}
		});
	}
	
	function jstree_set_data(data2){
		
		var data = [];
		var children1 = [];
		var children2 = [];
		var tempCd;
		
		$.each(data2.menuList, function(i, v){
			
			//	console.log(i+', '+v.menuCd+','+v.menuNm+', '+v.depth);
			if(v.depth == '0'){
				data.push({id:v.menuCd, text:v.menuNm, icon:"/images/tree_icon.png", data:{depth:'0'}, children:children1});
			}else if(v.depth == '1'){
				if(children2!=''){
					var len = children1.length - 1;
					var menuCd = children1[len].id;
					var menuNm = children1[len].text;
					children1[len] = {id:menuCd, text:menuNm, data:{depth:'1'}, children:children2};
					children2 = [];
					children1.push({id:v.menuCd, text:v.menuNm, data:{depth:'1'}});
				}else{
					children1.push({id:v.menuCd, text:v.menuNm, data:{depth:'1'}});
				}
				
			}else if(v.depth == '2'){
				children2.push({id:v.menuCd, text:v.menuNm, icon:"/images/menu-icon.png", data:{url:v.url, type:v.type, depth:'2'}});	
			}
		//	console.log(children2);
		});
		
		if(children2 != ''){
			var len = children1.length - 1;
			var menuCd = children1[len].id;
			var menuNm = children1[len].text;
			children1[len] = {id:menuCd, text:menuNm, children:children2};
		}
		
		return data;
	}
	
	/** * 현재 트리구조 + 원본 데이터를 Merge 하여 데이터를 리턴 * */ 
	function all_save() { 
		var newData = []; 
		var jdata = $('#jstree_demo').jstree(true).get_json("#", {flat:true}); 
		for (var i=0; i<jdata.length; i++) { 
			var current = jdata[i]; 
			var id = current.id; 
			var name = current.text;
			var parent = current.parent;
			var depth = current.data.depth;
			var url = current.data.url;
			
			console.log(id+','+name+','+parent+','+depth+','+url);
			
			if(depth == '2' && url == null){
				console.log('null');
			}
		//	if(depth=='2' && url == ''){
		//		alert('접근 URL을 입력하세요.');
		//		return false;
		//	}
		//	var data = this.findCoreData(id); 
		//	if (data) { 
				// current.text = $("<div>"+current.text+"</div>").text(); 
		//		newData.push($.extend(data, current)); 
		//	} 
		} 
		return newData; 
	};

	// create node
	function demo_create() {
		
		var ref = $('#jstree_demo').jstree(true),
			sel = ref.get_selected();
		
		if(!sel.length) { return false; }
		sel = sel[0];
		var depth = $("#jstree_demo").jstree(true).get_node(sel).data.depth;

		if(depth == '0'){
			sel = ref.create_node(sel, {"data":{"depth":"1"}});
		}else if(depth == '1'){
			sel = ref.create_node(sel, {"data":{"depth":"2"}, "icon":"/images/menu-icon.png"});
		}else if(depth == '2'){
			return false;
		}
		
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

		jstree_data();
		
	});
				
	function jstree_data(){
		
		var data = [];
		
		$.ajax({
			type : "get",
			url : "/menuList.do",
			data : {'id':'admin'},
			dataType : "json",
			contentType: 'application/x-www-form-urlencoded; charset=utf-8',
			success : function(result){
				
				data = jstree_set_data(result);
				
			},error : function(xhr, status, error){
				alert(status);
			},complete : function(){
				
				jstree_draw(data);
			}
		});
	}
	
	function jstree_draw(data){

		// 트리메뉴 그리기
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
			//	"root" : { "icon" : "/images/tree_icon.png", "valid_children" : ["default"] },
				"default" : { "valid_children" : ["default","file"] },
			//	"file" : { "icon" : "glyphicon glyphicon-file", "valid_children" : [] }
			},
			"plugins" : [ "contextmenu", "dnd", "search", "state", "types", "wholerow" ]
			
		}).bind("select_node.jstree", function(e, data){	// 트리노드 선택
			console.log('-------select node------->');
			var node = data.node;
			$("#menuCdTxt").text(node.id);
			$("#menuNmTxt").text(node.text);
			
			if(node.data.depth == '2'){
				$("#url").attr('disabled', false);
				$("input[name='menuType']:radio").attr('disabled', false);
				$("input:radio[name='menuType']").attr('checked', false);
				console.log('type:'+node.data.type);
				$("input[name='menuType'][value="+node.data.type+"]").prop('checked', true);
				$("#url").val(node.data.url);	
				changeUrlTxt(node.data.type);
			}else{
				$("#url").val('');
				$("input[name='menuType']:radio").attr('disabled', true);
				$("#url").attr('disabled', true);
			}
			
		});
		
	}
	
</script>

</body>
</html>