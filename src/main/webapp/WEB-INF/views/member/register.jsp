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

<title>회원가입</title>
</head>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		// 취소
		$(".cencle").on("click", function() {

			location.href = "/pro/main/main.do";

		})

		$("#submit").on("click", function() {
			if ($("#user_id").val() == "") {
				alert("아이디를 입력해주세요.");
				$("#user_id").focus();
				return false;
			}
			if ($("#user_pwd").val() == "") {
				alert("비밀번호를 입력해주세요.");
				$("#user_pwd").focus();
				return false;
			}
			if ($("#user_name").val() == "") {
				alert("성명을 입력해주세요.");
				$("#user_name").focus();
				return false;
			}
			if ($("#user_email").val() == "") {
				alert("이메일을 입력해주세요.");
				$("#user_email").focus();
				return false;
			}
			if ($("#user_identity").val() == "") {
				alert("주민번호 입력해주세요.");
				$("#user_identity").focus();
				return false;
			}
			if ($("#user_email").val() == "") {
				alert("핸드폰을 입력해주세요.");
				$("#user_phone").focus();
				return false;
			}
			if ($("#user_email").val() == "") {
				alert("주소를 입력해주세요.");
				$("#user_addr").focus();
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



<!-- 비밀번호 검사 -->
<script>
        function check_pw(){
 
            var pw = document.getElementById('pw').value;
            var SC = ["!","@","#","$","%"];
            var check_SC = 0;
 
            if(pw.length < 6 || pw.length > 16){
                document.getElementById('check2').innerHTML='비밀번호는 7글자 이상, 특수문자를 포함해야 합니다';
                document.getElementById('check2').style.color='red';
                document.getElementById('pw').value='';
            }
            for(var i=0;i<SC.length;i++){
                if(pw.indexOf(SC[i]) != -1){
                    check_SC = 1;
                    document.getElementById('check2').innerHTML='적절한 비밀번호 입니다.'
                    document.getElementById('check2').style.color='blue';
                }
            }
            if(check_SC == 0){
                document.getElementById('check2').innerHTML='비밀번호가 형식에 맞지 않습니다.'
                document.getElementById('check2').style.color='red';
                document.getElementById('pw').value='';
            }
            if(document.getElementById('pw').value !='' && document.getElementById('user_pwd').value!=''){
                if(document.getElementById('pw').value==document.getElementById('user_pwd').value){
                    document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
                    document.getElementById('check').style.color='blue';
                }
                else{
                    document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
                    document.getElementById('check').style.color='red';
                    document.getElementById('user_pwd').value='';
                }
            }
            if(document.getElementById('pw').value != document.getElementById('user_pwd').value){
            	document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
                document.getElementById('check').style.color='red';
                document.getElementById('user_pwd').value='';
            }
        }
       
    </script>
<style>
#company_text {
	font-size: 20px;
	font-weight: bold;
	color: red;
}

#main_reg {
	font-size: 30px;
	font-weight: bold;
	color: black;
}
</style>
<body>
	<section class="features-area section-bg">
		<div class="container" id="">
			<div>
				<section id="container">
					<form class="col" action="${contextPath}/member/addMember.do"
						method="post">
						<!-- 필수 입력 정보 -->
						<div>
							<span id="main_reg">회 원 가 입</span>
							<hr>
							<div>
								<span id="company_text01"></span>
							</div>
						</div>
						<div class="">
							<div class="row">
								<div class="col-2">
									<label class="control-label" for="user_pwd">아이디</label>
								</div>
								<div class="col">
									<input class="form-control" type="text" name="_user_id"
										id="_user_id" placeholder="6자리 이상 입력하세요." />
								</div>
								<input class="form-control" type="hidden" name="user_id"
									id="user_id" />
								<div class="col-3">
									<input class="btn btn-primary" type="button" id="btnOverlapped"
										value="중복체크" onClick="fn_overlapped()" />
								</div>
							</div>
							<br>

							<div class="row">
								<div class="col-2">
									<label class="control-label" for="user_pwd">패스워드</label>
								</div>
								<div class="col">
									<input class="form-control" type="password" name="" id="pw"
										onchange="check_pw()"
										placeholder="비밀번호는 7글자 이상, 특수문자를 포함해야 합니다">
								</div>
								<div class="col-3">
									<span id="check2"></span>
								</div>
							</div>
							<br>

							<div class="row">
								<div class="col-2">
									<label class="control-label" for="user_pwd">패스워드 확인</label>
								</div>
								<div class="col">
									<input class="form-control" type="password" name="user_pwd"
										id="user_pwd" onchange="check_pw()"
										placeholder="비밀번호는 7글자 이상, 특수문자를 포함해야 합니다">
								</div>
								<div class="col-3">
									<span id="check"></span>
								</div>
							</div>
							<br>

							<div class="row">
								<div class="col-2">
									<label class="control-label" for="user_name">성명</label>
								</div>
								<div class="col">
									<input class="form-control" type="text" id="user_name"
										name="user_name" placeholder="이름을 입력하세요." />
								</div>
								<div class="col-3"></div>
							</div>
							<br>

							<div class="row">
								<div class="col-2">
									<label class="control-label" for="user_email">이메일</label>
								</div>
								<div class="col">
									<input class="form-control" type="email" id="user_email"
										name="user_email" placeholder="이메일을 입력하세요." />
								</div>
								<div class="col-3"></div>
							</div>
							<br>

							<div class="row">
								<div class="col-2">
									<label class="control-label" for="user_identity">주민등록번호</label>
								</div>
								<div class="col">
									<input class="form-control" type="text" id="user_identity"
										name="user_identity" placeholder="생년월일" />
								</div>
								<div class="col">
									<input class="form-control" type="text" id="user_identity"
										name="user_identity" placeholder="뒷자리" />
								</div>
								<div class="col-3"></div>
							</div>
							<br>

							<div class="row">
								<div class="col-2">
									<label class="control-label" for="user_phone">핸드폰</label>
								</div>
								<div class="col">
									<input class="form-control" type="text" id="user_phone"
										name="user_phone" placeholder="010" />
								</div>
								<div class="col">
									<input class="form-control" type="text" id="user_phone"
										name="user_phone" placeholder="앞자리" />
								</div>
								<div class="col">
									<input class="form-control" type="text" id="user_phone"
										name="user_phone" placeholder="뒷자리" />
								</div>
								<div class="col-3"></div>
							</div>
							<br>

							<div class="row">
							<!--  -->
							<div class="col-2">
									<label class="control-label" for="user_addr">주소</label>
							</div>
							<div class="col-2">
									<input class="form-control" type="text" id="sample6_postcode" name="user_addr" placeholder="우편번호">
							</div>
							<div class="col-3">
								<div class="col-6">
								<input type="button" onclick="sample6_execDaumPostcode()" class="form-control" value="우편번호 찾기"><br>
								</div>
								
							</div>
							<div calss="row"></div>
							<div class="col-2"></div>
							<div class="col">
									<input class="form-control" type="text" id="sample6_address"
										name="user_addr" placeholder="주소" />
							</div>
							<div class="col">
									<input class="form-control" type="text" id="sample6_detailAddress" 
										name="user_addr" placeholder="상세주소" />
							</div>
							<div class="col">
									<input class="form-control" type="text" id="sample6_extraAddress"
										name="user_addr" placeholder="참고항목" />
							</div>						
							<span id="guide" style="color:#999;display:none"></span>

							<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
							<script>
							 function sample6_execDaumPostcode() {
							        new daum.Postcode({
							            oncomplete: function(data) {
							                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
							                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							                var addr = ''; // 주소 변수
							                var extraAddr = ''; // 참고항목 변수

							                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							                    addr = data.roadAddress;
							                } else { // 사용자가 지번 주소를 선택했을 경우(J)
							                    addr = data.jibunAddress;
							                }

							                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							                if(data.userSelectedType === 'R'){
							                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
							                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
							                        extraAddr += data.bname;
							                    }
							                    // 건물명이 있고, 공동주택일 경우 추가한다.
							                    if(data.buildingName !== '' && data.apartment === 'Y'){
							                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
							                    }
							                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							                    if(extraAddr !== ''){
							                        extraAddr = ' (' + extraAddr + ')';
							                    }
							                    // 조합된 참고항목을 해당 필드에 넣는다.
							                    document.getElementById("sample6_extraAddress").value = extraAddr;
							                
							                } else {
							                    document.getElementById("sample6_extraAddress").value = '';
							                }

							                // 우편번호와 주소 정보를 해당 필드에 넣는다.
							                document.getElementById('sample6_postcode').value = data.zonecode;
							                document.getElementById("sample6_address").value = addr;
							                // 커서를 상세주소 필드로 이동한다.
							                document.getElementById("sample6_detailAddress").focus();
							            }
							        }).open();
							    }
							    
							</script>
							<!--  -->
								
								
								
		
								<div class="col-3"></div>
							</div>
							<br>


							<div class="row">
								<div class="col-2">
									<label class="control-label">개인 팩스</label>
								</div>
								<div class="col">
									<input class="form-control" type="text" name="user_fax" />
								</div>
								<div class="col">
									<input class="form-control" type="text" name="user_fax" />
								</div>
								<div class="col">
									<input class="form-control" type="text" name="user_fax" />
								</div>
								<div class="col-3"></div>
							</div>
							<br>

						</div>
						<!-- 필수 입력 정보 -->
						<hr>


						<!-- 회사 입력 정보 -->
						<!-- 삭제 -->
						<!-- 회사 입력 정보 끝!-->

						<!-- 버튼 -->
						<div class="col">
							<div class="row" id="bottom_btn">
								<div class="col-3"></div>
								<div class="col">
									<button class="btn btn-success" type="submit" id="submit">회원가입</button>
								</div>
								<div class="col">
									<button class="cencle btn btn-danger" type="button">취소</button>
								</div>
								<div class="col-3"></div>
							</div>
						</div>
						<!-- 버튼 -->
					</form>
				</section>
			</div>
		</div>
	</section>
</body>
</html>