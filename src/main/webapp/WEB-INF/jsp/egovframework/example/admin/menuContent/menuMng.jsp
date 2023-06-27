
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
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
												  
													<hr />
													<button id="nodeSelect">선택된노드</button>
													<button id="menuAddBtn">메뉴추가</button>
											</div>
											<div class="col-6 col-12-medium">


												<!-- Form -->
												<h3>Form</h3>

												<form:form modelAttribute="menuVO" id="detailForm" name="detailForm">
													<div class="row gtr-uniform">
														<div class="col-6 col-12-xsmall">
														<!-- 
															<input type="text" name="demo-name" id="demo-name" value="" placeholder="Name" />
															 -->
															<form:input path="menuId" maxlength="10" readonly="true" placeholder="메뉴ID" />
														</div>
														<div class="col-6 col-12-xsmall">
															<form:input path="menuNm" maxlength="20" placeholder="메뉴명" />
															&nbsp;<form:errors path="menuNm" />
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
  
  var data = [
		{ "id" : "ajson1", "parent" : "#", "text" : "My Homepage" },
		{ "id" : "ajson2", "parent" : "ajson1", "text" : "Child 1" },
		{ "id" : "ajson3", "parent" : "ajson1", "text" : "Child 2" },
	];

$('#tree').jstree({ 
		'core' : {
			'data' : data,
			"check_callback" : true  // plugins 'dnd'와 같이 사용 이동하고싶을때
		},
		//'plugins' : ["contextmenu"]
		"plugins" : ["dnd","types"],
	    "types" : {
	      "valid_children" : [ "default" ],
	      "default" : {
	        "max_depth" : 2 // 하위 depth 제한
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
    		
    		var ref = $('#tree').jstree(true),
			sel = ref.get_selected();
			if(!sel.length) { return false; }
			sel = sel[0];
			sel = ref.create_node(sel, {"type":"file"});
			if(sel) {
				ref.edit(sel);
			}
       });
    
       $('#tree').on("changed.jstree", function (e, data) {
      	  console.log(data.selected);
      	  console.log(getNode(data.selected[0]));
      	  $("#menuId").val(data.selected[0]);
      	  $("#menuNm").val(getNode(data.selected[0]).text);
      	});
       
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