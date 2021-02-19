<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<script src="${contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.mainbodybody {
	width: 100%;
}

.fireset {
	width: 95%;
	margin: auto;
}

.fireset2 {
	float: right;
}

.divset2 {
	width: 50%;
}

.divset3 {
	width: 50%;
	float: right;
}

.fieldsetall {
	margin: 0 auto;
	width: 100%;
}

.fireP {
	text-align: center;
	margin: 0 auto;
}

.set2 {
	width: 94%;	
}

.set3 {
	width: 94%;
}
.fireside{
	text-align:left;
}
.firebutton {
	width:100%;
	text-align: center;
}

.text {
	width: 50%;
	height: 100px;
	vertical-align: text-top;
}
.form-control{
	text-align:center;
}
</style>
<script>
	$(function() {
		$(".fire1").click(function() {
			if ($("#user_pwd").val() == "") {
				alert("비밀번호를 입력하세요.");
				$("#user_pwd").focus();
				return false;
			}

			var confirm_val = confirm("탈퇴하시겠습니까?");

			if (confirm_val) {
				var checkArr = new Array();
				var user_pwd = "";

				$("input[class='cb']:checked").each(function() {
					checkArr.push($(this).attr("value"));
				});
				var user_pwd = $("#user_pwd").val();

				$.ajax({
					type : "post",
					data : {
						cb : checkArr,
						pwd : user_pwd
					},
					url : "${contextPath}/mypage/memberRemove.do",
					success : function(data) {
						console.log(data);
						if (data == 0) {
							alert("패스워드가 틀렸습니다.");
						} else {
 							location.href = "${contextPath}/mypage/fireBye.do";
						}
					}
				});

			}
		});

	});
</script>
</head>
<body>
	<div class=mainbody>
		<fieldset class=fireset>
			<legend>회원탈퇴</legend>
			<div>
				<form action="${contextPath }/mypage/fireBye" method="post">
					<p class=fireP>
						<strong>회원탈퇴 전 유의사항</strong>
					</p>
					<p class=fireP>※ 회원 탈퇴전에 모든 장비를 반납해야 탈퇴가 가능합니다.</p>
					<p class=fireP>※ 장비를 잃어버리거나, 미 반납시에는 불이익을 받으실 수 있습니다.</p>
					<p class=fireP>※ 회원을 탈퇴하시겠습니까?</p>
					<div class="fieldsetall">
						<div class=divset3>
							<fieldset class="fireset2 set3">
								<legend>탈퇴추가인증</legend>
								<p class=fireP>▼ 타인에 의한 탈퇴를 방지하기 위해 추가 인증을 진행합니다.</p>
								<div class="bside side">
									<div class="form-group has-feedback">
										<label class="control-label" for="user_id">아이디</label> <input
											class="form-control" type="text" id="user_id" name="user_id"
											value="${member.user_id}" readonly="readonly" />
									</div>
									<div class="form-group has-feedback">
										<label class="control-label" for="user_pwd">패스워드</label> <input
											class="form-control" type="password" id="user_pwd"
											name="user_pwd" />
									</div>
								</div>
							</fieldset>
						</div>
						<div class=divset2>
							<fieldset class="fireset2 set2">
								<legend>탈퇴사유입력</legend>
								<p class=fireP>▼ 향후 더 나은 서비스를 위해 탈퇴사유를 입력해주세요.</p>
								<div class="fireside">
									<input type=checkbox class=cb value="학업/업무 전념">학업/업무 전념<br>
									<input type=checkbox class=cb value="군입대영장">군입대영장<br>
									<input type=checkbox class=cb value="지구온난화">지구온난화<br>
									<input type=checkbox class=cb value="자연주의로의 회귀">자연주의로의
									회귀<br>
									<input type=checkbox class=cb value="기타">기타<br>
								</div>
							</fieldset>
						</div>
						<div class=firebutton>
							<input type="button" style="width: 100px; height: 30px;"
								class="fire1" value="회원탈퇴"> <input
								type="button" style="width: 100px; height: 30px;"
								class="fire2"
								onclick="location.href='${contextPath}/main/main.do'"
								value="탈퇴취소">
						</div>
					</div>
				</form>
			</div>
		</fieldset>
	</div>
</body>
</html>