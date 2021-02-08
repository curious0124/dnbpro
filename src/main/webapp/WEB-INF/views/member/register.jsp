<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>회원가입</title>
</head>
<%-- <script src="${contextPath}/resources/js/jquery-3.5.1.min.js"> </script> --%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		// 취소
		$(".cencle").on("click", function() {

			location.href = "/pro/main/main.do";

		})

		$("#submit").on("click", function() {
			if ($("#mem_id").val() == "") {
				alert("아이디를 입력해주세요.");
				$("#mem_id").focus();
				return false;
			}
			if ($("#mem_pw").val() == "") {
				alert("비밀번호를 입력해주세요.");
				$("#mem_pw").focus();
				return false;
			}
			if ($("#mem_name").val() == "") {
				alert("성명을 입력해주세요.");
				$("#mem_name").focus();
				return false;
			}
			if ($("#mem_email").val() == "") {
				alert("이메일을 입력해주세요.");
				$("#mem_email").focus();
				return false;
			}
		});

	})

	function fn_overlapped() {
		var _user_id = $("#_user_id").val();
		if (_user_id == '') {
			alert("ID를 입력하세요");
			return;
		}
		$.ajax({
			type : "post",
			async : false,
			url : "${contextPath}/member/overlapped.do",
			dataType : "text",
			data : {
				user_id : _user_id
			},
			success : function(data, textStatus) {
				if (data == 'false') {
					alert("사용할 수 있는 ID입니다.");
					$('#btnOverlapped').prop("disabled", true);
					$('#_user_id').prop("disabled", true);
					$('#user_id').val(_user_id);
				} else {
					alert("사용할 수 없는 ID입니다.");
				}
			},
			error : function(data, textStatus) {
				alert("에러가 발생했습니다.");
			},
			complete : function(data, textStatus) {
				//alert("작업을완료 했습니다");
			}
		}); //end ajax	 
	}
</script>
<body>
	<section id="container">
		<form action="${contextPath}/member/addMember.do" method="post">
			<div class="form-group has-feedback">
				<!-- <label class="control-label" for="user_id">아이디</label> -->
				<!-- <input class="form-control" type="text" id="user_id" name="user_id" /> -->
				<input type="text" name="_user_id" id="_user_id" size="20" /> 
				<input type="hidden" name="user_id" id="user_id" /> 
				<input type="button" id="btnOverlapped" value="중복체크" onClick="fn_overlapped()" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="user_pwd">패스워드</label> <input
					class="form-control" type="password" id="user_pwd" name="user_pwd" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="user_name">성명</label> <input
					class="form-control" type="text" id="user_name" name="user_name" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="user_email">이메일</label> <input
					class="form-control" type="text" id="user_email" name="user_email" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="user_identity">주민등록번호(123-123)</label>
				<input class="form-control" type="text" id="user_identity"
					name="user_identity" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="user_phone">핸드폰</label> <input
					class="form-control" type="text" id="user_phone" name="user_phone" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="user_addr">주소</label> <input
					class="form-control" type="text" id="user_addr" name="user_addr" />
			</div>
			<div class="form-group has-feedback">
				<button class="btn btn-success" type="submit" id="submit">회원가입</button>
				<button class="cencle btn btn-danger" type="button">취소</button>
			</div>
		</form>
	</section>

</body>

</html>