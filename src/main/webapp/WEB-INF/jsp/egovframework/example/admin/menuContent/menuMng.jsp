<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"         uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"      uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="spring"    uri="http://www.springframework.org/tags"%>
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
		
		<!--For Commons Validator Client Side-->
	    <script type="text/javascript" src="<c:url value='/cmmn/validator.do'/>"></script>
	    <validator:javascript formName="menuVO" staticJavascript="false" xhtml="true" cdata="false"/>
	    
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
													<h3>JStree</h3>
													
													<!-- 3 setup a container element -->
												  <div id="tree">
												   
												  </div>
												  
												  <br/>
												  
													<!-- button id="nodeSelect">선택된노드</button> -->
													<button id="menuAddBtn">메뉴추가</button>
													
													<hr />
											</div>
											
											
											<div class="col-6 col-12-medium">


												<!-- Form -->
												<h3>Form</h3>

												<form:form modelAttribute="menuVO" id="detailForm2" name="detailForm2">
												
													<div class="row gtr-uniform">
														<div class="col-6 col-12-xsmall">
															<form:input path="menuId" maxlength="10" readonly="true" placeholder="메뉴ID" />
														</div>
														<div class="col-6 col-12-xsmall">
															<form:input path="menuNm" maxlength="20" placeholder="메뉴명" />
															&nbsp;<form:errors path="menuNm" />
														</div>
														
														<!-- Break -->
														<div class="col-4 col-12-small">
															<input type="radio" id="menuType-directory" name="menuType" value="directory" checked>
															<label for="menuType-directory">디렉토리</label>
														</div>
														<div class="col-4 col-12-small">
															<input type="radio" id="menuType-board" name="menuType" value="board">
															<label for="menuType-board">게시판</label>
														</div>
														<div class="col-4 col-12-small">
															<input type="radio" id="menuType-content" name="menuType" value="content">
															<label for="menuType-content">컨텐츠</label>
														</div>
														<div class="col-4 col-12-small">
															<input type="radio" id="menuType-program" name="menuType" value="program">
															<label for="menuType-program">프로그램</label>
														</div>
														<div class="col-4 col-12-small">
															<input type="radio" id="menuType-link" name="menuType" value="link">
															<label for="menuType-link">링크</label>
														</div>
														
														<!-- Break -->
														<div class="col-12">
															<select name="board_list" id="board_list">
																<option value="">- 게시판목록 -</option>
																<c:forEach var="boardList" items="${boardList}">
																<option value="<c:out value="${boardList.boardId}"/>"><c:out value="${boardList.boardNm}"/></option>
																</c:forEach>
															</select>
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
															<ul class="actions">
																<li><input type="button" id="menuUpdateBtn" value="메뉴 저장" class="primary" /></li>
																<li><input type="reset" value="메뉴 삭제" /></li>
															</ul>
														</div>
													</div>
												</form:form>
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
  <script src="admin/js/jquery.min.js"></script>
  -->
  
  <!-- 5 include the minified jstree source -->
  <script src="jstree/dist/jstree.js"></script>
  
  <script>
  
  var menuList = [];
  
  $(document).ready(function() {
		
	  console.log('document ready');  
		
	  selectMenuList();
		
	//  console.log('--open all--');
	//  openAll();
  });
  
  function selectMenuList(){
		console.log('---menuList---');
		menuList = [];
		
		$.ajax({
			type: 'get',
			url: '/menuList.do',
			//contentType: 'application/json; charset=euc-kr',
			contentType: 'application/x-www-form-urlencoded; charset=utf-8',
			data: {id:"testVal"},
			dataType: 'json',
			success: function(result){
				
				for(var i=0; i<result.length; i++){
				//	console.log(result[i].id+', '+result[i].parent+', '+result[i].text);
					menuList.push({ "id" : result[i].id, "parent" : result[i].parent, "text" : result[i].text, 
						"li_attr" : result[i].li_attr, "a_attr" : result[i].a_attr });
				}
				
			//	console.log(menuList);
				
				$('#tree').jstree(true).settings.core.data = menuList; // jstree원시데이터 삽입
				
				refresh();
				
				
			},
			error:function(){
				console.log('ajax json list error!');
			},
			complete:function(){
				console.log('ajax json list complete!');
				//$("#tree").jstree("open_all");
				//console.log('--open all--');
			}
		});
  }
  

//console.log(menuList);
	
	$('#tree').jstree({ 
		'core' : {
			'data' : menuList,
			"check_callback" : true  // plugins 'dnd'와 같이 사용 이동하고싶을때
		},
		//'plugins' : ["contextmenu"]
		"plugins" : ["dnd","types"],
	    "types" : {
	      "valid_children" : [ "default" ],
	      "default" : {
	        "max_depth" : 3 // 하위 depth 제한
	      }
	    }
	}); 

	//트리 구조 로딩 완료 시
	$('#tree').bind("loaded.jstree", function(e) {
		console.log('jstree loading complete!');
		this.openAll();
	}.bind(this));

	// 트리 구조 새로고침 시
  	$("#tree").bind("refresh.jstree", function(e,d) {
  		console.log('jstree refresh!');
  		this.openAll();
  	}.bind(this));

  /**
   * 해당 ID 값의 데이터를 리턴
   *  id : node.id
   * */ 
   this.findCoreData = function(id) {
   	var coreData = $('#tree').jstree(true).settings.core.data;
   	for (var i=0; i<coreData.length; i++) {
   		var data = coreData[i];
   		if (data.id == id) {
   			return data;
   		}
   	}
   	return null;
   };
   
 //  console.log( findCoreData('ajson4') );
   
   /**
    * root node get
    * */ 
    this.getRootNode = function() {
    	return $('#tree').jstree(true).get_node('#');
    };
    
  //  console.log( getRootNode() );
    
    /**
     * 노드의 원시 데이터 set
     * data : arry
     * */ 
     this.setCoreData = function(data) {
     	$('#tree').jstree(true).settings.core.data = data;
     };
     
     /**
      * 노드의 원시 데이터 get
      * */ 
      this.getCoreData = function() {
      	return $('#tree').jstree(true).settings.core.data;
      };
      
      //console.log( getCoreData() );
    
      /**
       * 현재 트리구조 + 원본 데이터를 Merge 하여 데이터를 리턴
       * */ 
       this.getData = function() {
       	var newData = [];
       	var jdata = $('#tree').jstree(true).get_json("#", {flat:true});
       	for (var i=0; i<jdata.length; i++) {
       		var current = jdata[i];
       		var id = current.id;
       		var data = this.findCoreData(id);
       		if (data) {
//               current.text = $("<div>"+current.text+"</div>").text();
       			newData.push($.extend(data, current));
       		}
       	}
       	return newData; 
       };
       
      // console.log( getData() );
       
       /**
        * 새로고침
        * */
        this.refresh = function() {
        	$('#tree').jstree(true).refresh();
        }
       //console.log( refresh() );
       
       /**
        * 데이터 추가
        * d : obj
        * */
        this.addData = function(d){
        	var data = this.getData();
            data.splice(data.length, 0 ,d);
        	this.setCoreData(data);
        	//this.refresh(data);
        	this.refresh();
        }
       
        
       
    // node add
       $('#menuAddBtn').on('click', function () {
    		console.log('add node!');
    		
    		var model = $("#tree").jstree(true)._model.data;

        	var add_chk = true;
       		$.each(model, function (el, index){
       			console.log(index.id.substr(0,1));
       			if(index.id.substr(0,1) == 'j'){
       				alert('메뉴추가는 한개씩 가능합니다. 기존 추가된 메뉴를 저장해주세요.');
       				add_chk = false;
       				return false;
       			}
       		});
       		
       		if(add_chk){
       			var ref = $('#tree').jstree(true),
    			sel = ref.get_selected();
    			if(!sel.length) { return false; }
    			sel = sel[0];
    			sel = ref.create_node(sel, {"type":"file"});
    			if(sel) {
    				ref.edit(sel);
    			}
       		}
    		
       });
    
    	$('#menuUpdateBtn').on('click', function() {
    		console.log('update menu!' + $("#menuId").val() );
    		
    		if($("#menuId").val() == ''){
    			alert('저장할 메뉴를 선택해주세요!');
    			return false;
    		}
    		
    		if($("#menuNm").val() == ''){
    			alert('저장할 메뉴명을 입력해주세요!');
    			return false;
    		}
		
    	//	console.log(parentNode($("#menuId").val()).id);
    	
    	// depth 구하기
    		var p_node = parentNode($("#menuId").val()).id;
    		var num = 0;
    		while(p_node){
    			num++;
    			console.log(p_node);
    			p_node = parentNode(p_node);
    		}
    		//console.log(num-1);
    		
    		$.ajax({
				type: 'post',
				url: '/menuUpdate.do',
			//	contentType: 'application/json; charset=utf-8',
			//	data: 'menuId='+$("#menuId").val(),
				data: { menuId:$("#menuId").val(), 
						menuNm:$("#menuNm").val(), 
						pMenuId:parentNode($("#menuId").val()).id,
						depth:num-1,
						menuType:$('input:radio[name="menuType"]:checked').val(),
						typeVal:$("#board_list option:selected").val()
					},
				dataType: 'text',
				success: function(result){
					console.log('ajax text success! : '+result);
					if(result == 'success'){
						selectMenuList();
					}else if(result == 'fail'){
						alert('메뉴수정중 에러가 발생하였습니다!');
					}
				},
				error:function(){
					console.log('ajax text error!');
				}
			});
    	//	refresh();
    	});
    	
    	
       $('#tree').on("changed.jstree", function (e, data) {
      	//  console.log(data.selected);
      //	console.log(getNode(data.selected[0]));
      //	  console.log(getNode(data.selected[0]).id);
      //	console.log( getNode(data.selected[0]).original );
      //	var obj = getNode(data.selected[0]).original;
      //	console.log(obj);
    //	var keys = Object.keys(obj);
      	//console.log(obj);
     // 	console.log(getNode(data.selected[0]).original.id);
      //	  $("#menuId").val(data.selected[0]);
      //	  $("#menuNm").val(getNode(data.selected[0]).text);
      	//  console.log(getNode(data.selected[0]).li_attr);
      	});
       
       $('#tree').on("select_node.jstree", function(e, data){
    		console.log('node_select');   
    		$("#menuId").val(data.selected[0]);
        	  $("#menuNm").val(getNode(data.selected[0]).text);
        	  console.log(getNode(data.selected[0]).original.li_attr);	// menu type
        	  console.log(getNode(data.selected[0]).original.a_attr);	// type val
        	//  $("input:radio[name ='menuType']:input[value='"+getNode(data.selected[0]).original.li_attr+"']").attr("checked", true);
        	  $("input[name='menuType'][value='"+getNode(data.selected[0]).original.li_attr+"']").prop("checked", true);	// 메뉴타입 선택
        	  $("#board_list").val(getNode(data.selected[0]).original.a_attr).prop("selected", true);	// 게시판 선택
       });
       
    // tree node 선택
    // 8 interact with the tree - either way is OK
   	$('#nodeSelect').on('click', function () {
       	
   		console.log('click');
         	
       //	$('#tree').jstree(true).select_node('child_node_1');
       //  	$('#tree').jstree('select_node', 'child_node_1');
       //  	$.jstree.reference('#tree').select_node('child_node_1');
       });
    
       /**
		  * 노드 이름 수정 폼
		  *  id
		  * */ 
		  this.edit = function(id) {
		  	$tree.jstree(true).edit(id);
		  };
		  

/**
* 노드 가져오기
*  id
* */ 
this.getNode = function(id) {
	return $("#tree").jstree(true).get_node(id);
};

/**
* 자식노드 가져오기
*  id
* */ 
this.childrenNode = function(id) {
	var ids = this.getNode(id).children;
	if(!ids) return [];

	var children = [];
	for (var i=0; i<ids.length; i++) {
		children.push(this.getNode(ids[i]));
	}
	return children;
};

/**
* 부모노드 가져오기
*  id
* */ 
this.parentNode = function(id) {
	return this.getNode(this.getNode(id).parent);
};

	/**
	* 전체열기
	* */ 
	this.openAll = function() {
		$("#tree").jstree("open_all");
	};
	

/**
* 전체 닫기
* */ 
this.closeAll = function() {
	$tree.jstree("close_all");
};

/**
* 특정 노드 열기
*  id
* */ 
this.openNode = function(id) {
	$tree.jstree("open_node", id)
};

/**
* 특정 노드 닫기
*  id
* */ 
this.closeNode = function(id) {
	$tree.jstree("close_node", id)
};

/**
* 특정노드 삭제
*  id
* */ 
this.removeNode = function(id) {
	$tree.jstree(true).delete_node(id);
};

/**
* 특정노드 이름변경
* node : 변경할 대상 node
* text : 변경할 이름 string
* */ 
this.renameNode = function(node, text) {
	$tree.jstree("rename_node", node, text);
};


  </script>
  
	</body>
</html>