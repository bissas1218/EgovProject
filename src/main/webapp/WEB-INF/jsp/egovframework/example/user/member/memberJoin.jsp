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
	<body class="is-preload homepage">
		<div id="page-wrapper">

			<!-- Header -->
				<div id="header-wrapper">
					<jsp:include page="/userNavi.do"></jsp:include>
				</div>

			<!-- Banner -->
				<div id="banner-wrapper">
					<div id="banner" class="box container">
						<div class="row">
							<div class="col-12 col-12-small">
								<h2>약관동의</h2>
								<p>회원가입하시면 더 많은 혜택이 있습니다.</p>
								<textarea rows="10" cols="2" style="width:100%;border:1px solid red;margin:5px 0;padding:3px;">
개인정보 수집이용

1. 개인정보 수집, 이용목적
- 예약 및 취소 확인
- 고객 관리 및 마일리지 적립
- 안내 우편물 및 문자메시지(SMS) 발송

2. 수집하는 개인정보 항목
- 성명, 주소, 전화번호, 사진
- 개인정보 수집 방법 : 프론트방명록, 전화, 팩스, 홈페이지, 이메일

3. 개인정보의 보유 및 이용기간
클럽디는 개인정보 수집 및 이용목적이 달성된 후에는 해당정보를 파기합니다. 단, 관계법령 및 관련규정 등에 의하여 보존할 필요가 있는 경우, 클럽디는 아래와 같이 일정한 기간 동안 회원정보를 보관합니다.
- 계약 또는 청약 철회 등에 관한 기록: 5년
- 대금결제 및 재화 등의 공급에 관한기록: 5년
- 소비자의불만 또는 분쟁처리에 관한기록: 3년

개인정보의 제공

1. 개인정보의 제공
클럽다는 원칙적으로 고객님의 개인정보를 외부에 제공하지 않습니다. 다만, 효율적인 고객서비스  그룹사의 다양한 혜택제공을 위해 아래의 기관에 귀하의 개인정보를 제공하고 있습니다.
								</textarea>
							</div>
							
							<div class="col-12 col-12-small">
								<input type="checkbox" id="agree_chk" name="agree_chk">
								<label for="agree_chk">동의합니다.</label>
							</div>
							
						</div>
					</div>
					<br/>
					
					<div id="banner" class="box container">
					
						<form method="post" action="memberJoin.do" name="memberJoinFrm" id="memberJoinFrm" style="display:none;">
							<div class="row gtr-uniform">
							
								<!-- 본인인증 -->
								<div class="col-6 col-12-xsmall">
									<input type="text" name="mobileNumTxt" id="mobileNumTxt" value="" placeholder="휴대폰번호" onkeypress="return checkNumber(event)" maxlength="11"/>
								</div>
								<div class="col-6 col-12-xsmall">
									<input type="button" id="sendAuthNumBtn" value="인증번호발송" onclick="fn_send_auth_num();" />
								</div>
								<div class="col-12 col-12-xsmall">
									<p style="font-size:13pt;color:red;" id="auth_num_txt"></p>
								</div>
								
								<div class="col-6 col-12-xsmall">
									<input type="text" name="auth_num" id="auth_num" value="" placeholder="인증번호" disabled="disabled" onkeypress="return checkNumber(event)" maxlength="5"/>
								</div>
								<div class="col-6 col-12-xsmall">
									<input type="button" id="auth_num_chk" value="인증번호확인" onclick="fn_authnum_chk();" disabled="disabled"/>
								</div>
								<div class="col-12 col-12-xsmall">
									<p style="font-size:13pt;color:red;" id="auth_num_chk_txt"></p>
								</div>
								
								<!-- id -->
								<div class="col-6 col-12-xsmall">
									<input type="text" name="userId" id="userId" value="" placeholder="회원아이디" />
								</div>
								<div class="col-6 col-12-xsmall">
									<input type="button" value="중복확인" onclick="fn_dup_chk();" />
								</div>
								<div class="col-12 col-12-xsmall">
									<p style="font-size:13pt;color:red;" id="id_dup_chk_txt"></p>
								</div>
								
								<!-- 이름 -->
								<div class="col-12 col-12-xsmall">
									<input type="text" name="userName" id="userName" value="" placeholder="이름" />
								</div>
								
								<!-- passwd -->
								<div class="col-12 col-12-xsmall">
									<input type="password" name="passwd" id="passwd" value="" placeholder="비밀번호" />
								</div>
								
								<!-- email -->
								<div class="col-12 col-12-xsmall">
									<input type="email" name="userEmail" id="userEmail" value="" placeholder="이메일" />
								</div>
								
								<!-- Break -->
								<div class="col-6 col-6-small">
									<input type="radio" id="gender-chk-man" name="gender-chk" value="man" checked>
									<label for="gender-chk-man">남자</label>
								</div>
								<div class="col-6 col-6-small">
									<input type="radio" id="gender-chk-woman" name="gender-chk" value="woman">
									<label for="gender-chk-woman">여자</label>
								</div>
								
								<div class="col-5 col-6-xsmall">
									<input type="button" id="member_join_btn" value="가입하기" onclick="fn_member_join();" disabled="disabled" class="button primary"/>
								</div>
								<div class="col-7 col-6-xsmall">
									<input type="button" id="auth_num_chk" value="아이디/비밀번호찾기" onclick="fn_authnum_chk();" />
								</div>
								
							</div>
							
							<input type="hidden" name="mobileNum" id="mobileNum" />
							<input type="hidden" name="idDupChk" id="idDupChk" value="no"/>
							<input type="hidden" name="gender" id="gender" />
							<input type="hidden" name="authNumChk" id="authNumChk" />
							
						</form>
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

	$(document).ready(function(){
		
	    $("#agree_chk").change(function(){
	        if($("#agree_chk").is(":checked")){
	        	$("#memberJoinFrm").show();
	        }else{
	        	$("#memberJoinFrm").hide();
	        }
	    });
	    
	    
	});

	function fn_send_auth_num(){
		
		let mobileNumTxt = $("#mobileNumTxt").val();
		
		if(mobileNumTxt == ''){
			$("#auth_num_txt").text(' 휴대폰번호를 입력해주세요.');
			$("#mobileNumTxt").focus();
		}else{
			
			/* 휴대폰번호 중복확인 */
			$.ajax({
				type: 'get',
				url: '/mobileNumDupChk.do',
			//	contentType: 'application/json; charset=utf-8',
				data: {mobileNum:mobileNumTxt},
				dataType: 'json',
				success: function(result){
					
					if(result.cnt == 0){
						
						$("#auth_num_txt").text(' 인증번호가 발송되었습니다.');
						$("#mobileNumTxt").attr("disabled", true);
						$("#mobileNum").val($("#mobileNumTxt").val());
						$("#sendAuthNumBtn").attr("disabled", true);
						$("#auth_num").attr("disabled", false);
						$("#auth_num_chk").attr("disabled", false);
						
						$("#authNumChk").val(result.authNum);
						
						alert('인증번호 : ' + result.authNum);
						
					}else{
						$("#auth_num_txt").text(' 이미 가입된 전화번호 입니다.');
					}
				},
				error:function(){
					console.log('ajax mobilenum dup chk error!');
				}
			});
			
			
		}
	}
	
	function fn_authnum_chk(){
		if($("#auth_num").val()==''){
			$("#auth_num_chk_txt").text('인증번호를 입력하세요.');
		}else{
			if($("#authNumChk").val() == $("#auth_num").val()){
				$("#auth_num_chk_txt").text('인증번호가 확인되었습니다.');
				$("#member_join_btn").attr("disabled", false);
			}else{
				$("#auth_num_chk_txt").text('인증번호가 다릅니다.');
				$("#member_join_btn").attr("disabled", true);
			}
			
		}
	}
	
	function fn_dup_chk(){
		
		let userId = $("#userId").val();
		
		if(userId == ''){
			$("#id_dup_chk_txt").text(' ID를 입력해주세요.');
			$("#userId").focus();
		}else{
			
			$.ajax({
				type: 'get',
				url: '/userIdDupChk.do',
			//	contentType: 'application/json; charset=utf-8',
				data: {userId:userId},
				dataType: 'text',
				success: function(result){
					console.log('ajax json list success! result : ' + result);
					if(result == 0){
						$("#id_dup_chk_txt").text(' 사용가능한 ID입니다.');
						$("#idDupChk").val('yes');
					}else{
						$("#id_dup_chk_txt").text(' 사용중인 ID입니다.');
						$("#idDupChk").val('no');
					}
				},
				error:function(){
					console.log('ajax id dup chk error!');
				}
			});
		}
	}
	
	function checkNumber(event) {
		  if(event.key === '.' 
		     || event.key === '-'
		     || event.key >= 0 && event.key <= 9) {
		    return true;
		  }
		  
		  return false;
		}
	
	function fn_member_join(){
		
		if($("#idDupChk").val() == 'no'){
			alert('아이디 중복체크를 해주세요.');
		}else if($("#userName").val() == ''){
			alert('이름을 입력해주세요.');
			$("#userName").focus();
		}else if($("#passwd").val() == ''){
			alert('비밀번호를 입력해주세요.');
			$("#passwd").focus();
		}else if($("#userEmail").val() == ''){
			alert('이메일 주소를 입력해주세요.');
			$("#userEmail").focus();
		}else{
			$("#gender").val( $('input:radio[name="gender-chk"]:checked').val() );
			$("#memberJoinFrm").submit();
		}
		
	}
	
</script>

	</body>
</html>