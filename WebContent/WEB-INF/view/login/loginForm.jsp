<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/base/common/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>찐쭈 놀리기</title>

<link rel="stylesheet" type="text/css" href="/base/css/common.css" />
<link rel="stylesheet" type="text/css" href="/base/css/theme.css" />
<script type="text/javascript" src="/base/js/jquery/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="/base/js/jquery/jquery-ui.js"></script>

<script type="text/javascript">

(function($) {
	
	goLogin = function() {
		var name = $("#username").val();
		var password = $("#password").val();

		if(name == "") {
			alert("이름 넣자");
			$("#username").trigger("focus");
			return false;
		}
		
		if(password == "") {
			alert("암호 넣자");
			$("#password").trigger("focus");
			return false;
		}

		return true;
	};
	
	$(document).ready(function() {

		<c:if test="${!empty param.error}">
			<c:choose>
				<c:when test = "${param.error eq '2'}">
					alert("세션이 만료 되었습니다.");
				</c:when>
				<c:otherwise>
					alert("계정을 확인 해주세요.");
				</c:otherwise>
			</c:choose>
		</c:if>
		
	});
	
})(jQuery);

</script>

</head>

<body>
<div id="blockLogin">
	<form name="loginForm" id="loginForm" action="<c:url value='/login'/>" method="post" onsubmit="return goLogin()">
	<table summary="">
		<caption></caption>
		<tbody>
			<tr>
				<td class="textCenter">
					<div class="loginBox">
						<div><img src="/base/images/login/bg_img.jpg" alt="" /><!--권장이미지 사이즈 : 750x600--></div>
						<div class="loginInput">
							<fieldset>
								<legend>로그인 계정입력</legend>
								<div class="login_id"><input name="username" id="username" type="text" class="inputbox" title="ID" value="" size="16" /></div>
								<div class="login_pw"><input name="password" id="password" type="text" class="inputbox" title="password" value="" size="16" /></div>
								<div class="login_btn"><input type="image" id="btnSubmit" src="/base/images/login/btn_login.gif" alt="로그인" /></div>
								<div class="login_info"><label><input name="" id="savepw" type="checkbox" value="" /> Save ID</label></div>
								<div style="display: block; " class="capslock" id="capslockInfo"><%-- <img alt="" src="/base/images/icon/ic_capslock01.gif"> --%></div>
							</fieldset>
						</div>	
					</div>						
				</td>
			</tr>
		</tbody>
	</table>			
	</form>
</div>
</body>
</html>