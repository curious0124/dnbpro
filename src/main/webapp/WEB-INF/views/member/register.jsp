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
<script src="${contextPath}/resources/js/jquery-3.5.1.min.js"> </script> 
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
                document.getElementById('check2').innerHTML='비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다';
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
/*     * {

        padding: 2px;
    } */

    #bottom_btn {
/*         margin-top: 50px;
        margin-bottom: 100px; */
    }

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

    <div>
        <section id="container">
            <form class="col" action="${contextPath}/member/addMember.do" method="post">
                <!-- 필수 입력 정보 -->
                <div>
                    <span id="main_reg">회 원 가 입</span>
                    <hr>
                    <div>
                        <span id="company_text">필수 입력 정보</span>
                    </div>
                </div>
                <div class="">
                    <div class="row">
                        <div class="col-2"><label class="control-label" for="user_pwd">아이디</label></div>
                        <div class="col">
                            <input class="form-control" type="text" name="_user_id" id="_user_id" placeholder="6자리 이상 입력하세요." />
                        </div>
                        <input class="form-control" type="hidden" name="user_id" id="user_id" />
                        <div class="col-3">
                            <input class="btn btn-primary" type="button" id="btnOverlapped" value="중복체크" onClick="fn_overlapped()" />
                        </div>
                    </div>
                    <br>

                    <div class="row">
                        <div class="col-2"><label class="control-label" for="user_pwd">패스워드</label></div>
                        <div class="col">
                            <input class="form-control" type="password" name="" id="pw" onchange="check_pw()" placeholder="비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다">
                        </div>
                        <div class="col-3"><span id="check2"></span></div>
                    </div>
                    <br>

                    <div class="row">
                        <div class="col-2"><label class="control-label" for="user_pwd">패스워드 확인</label></div>
                        <div class="col">
                            <input class="form-control" type="password" name="user_pwd" id="user_pwd" onchange="check_pw()" placeholder="비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다">
                        </div>
                        <div class="col-3"><span id="check"></span></div>
                    </div>
                    <br>

                    <div class="row">
                        <div class="col-2"><label class="control-label" for="user_name">성명</label></div>
                        <div class="col">
                            <input class="form-control" type="text" id="user_name" name="user_name" placeholder="이름을 입력하세요." />
                        </div>
                        <div class="col-3"></div>
                    </div>
                    <br>

                    <div class="row">
                        <div class="col-2"><label class="control-label" for="user_email">이메일</label></div>
                        <div class="col">
                            <input class="form-control" type="email" id="user_email" name="user_email" placeholder="이메일을 입력하세요." />
                        </div>
                        <div class="col-3"></div>
                    </div>
                    <br>

                    <div class="row">
                        <div class="col-2"><label class="control-label" for="user_identity">주민등록번호</label></div>
                        <div class="col"><input class="form-control" type="text" id="user_identity" name="user_identity" placeholder="생년월일" /></div>
                        <div class="col"><input class="form-control" type="text" id="user_identity" name="user_identity" placeholder="뒷자리" /></div>
                        <div class="col-3"></div>
                    </div>
                    <br>

                    <div class="row">
                        <div class="col-2"> <label class="control-label" for="user_phone">핸드폰</label></div>
                        <div class="col"><input class="form-control" type="text" id="user_phone" name="user_phone" placeholder="010" /></div>
                        <div class="col"><input class="form-control" type="text" id="user_phone" name="user_phone" placeholder="앞자리" /></div>
                        <div class="col"><input class="form-control" type="text" id="user_phone" name="user_phone" placeholder="뒷자리" /></div>
                        <div class="col-3"></div>
                    </div>
                    <br>

                    <div class="row">
                        <div class="col-2"><label class="control-label" for="user_addr">주소</label></div>
                        <div class="col"><input class="form-control" type="text" id="user_addr" name="user_addr" placeholder="우편번호" /></div>
                        <div class="col"><input class="form-control" type="text" id="user_addr" name="user_addr" placeholder="주소" /></div>
                        <div class="col"><input class="form-control" type="text" id="user_addr" name="user_addr" placeholder="상세주소" /></div>
                        <div class="col"><input class="form-control" type="text" id="user_addr" name="user_addr" placeholder="참고자료" /></div>
                        <div class="col-3"></div>
                    </div>
                    <br>
                    
                    
                    <div class="row">
                        <div class="col-2"><label class="control-label">개인 팩스</label></div>
                        <div class="col"><input class="form-control" type="text" name="user_fax" /></div>
                        <div class="col"><input class="form-control" type="text" name="user_fax" /></div>
                        <div class="col"><input class="form-control" type="text" name="user_fax" /></div>
                        <div class="col-3"></div>
                    </div>
                    <br>
                    
                </div>
                <!-- 필수 입력 정보 -->
                <hr>

                <div>
                    <div>
                        <span id="company_text">회사 정보</span><span>(선택사항)</span>
                    </div>
                </div>
                <!-- 회사 입력 정보 -->
                <div>
                    <div>
                        <div class="row">
                            <div class="col-2"><label class="control-label">회사 이름</label></div>
                            <div class="col"><input class="form-control" type="text" name="user_comp" /></div>
                            <div class="col-3"></div>
                        </div>
                    </div>
                    <br>
                    <div>
                        <div class="row">
                            <div class="col-2"><label class="control-label">회사 주소</label></div>
                            <div class="col"><input class="form-control" type="text" name="comp_addr" placeholder="우편번호"/></div>
                            <div class="col"><input class="form-control" type="text" name="comp_addr" placeholder="주소"/></div>
                            <div class="col"><input class="form-control" type="text" name="comp_addr" placeholder="상세주소"/></div>
                            <div class="col"><input class="form-control" type="text" name="comp_addr" placeholder="참고자료"/></div>
                            <div class="col-3"></div>
                        </div>
                    </div>
                    <br>
                    <div>
                        <div class="row">
                            <div class="col-2"><label class="control-label">회사 전화</label></div>
                            <div class="col"><input class="form-control" type="text" name="comp_phon" /></div>
                            <div class="col"><input class="form-control" type="text" name="comp_phon" /></div>
                            <div class="col"><input class="form-control" type="text" name="comp_phon" /></div>
                            <div class="col-3"></div>
                        </div>
                    </div>
                    <br>
                    <div>
                        <div class="row">
                            <div class="col-2"><label class="control-label">회사 팩스</label></div>
                            <div class="col"><input class="form-control" type="text" name="comp_fax" /></div>
                            <div class="col"><input class="form-control" type="text" name="comp_fax" /></div>
                            <div class="col"><input class="form-control" type="text" name="comp_fax" /></div>
                            <div class="col-3"></div>
                        </div>
                    </div>
                    <br>
                    <div>
                        <div class="row">
                            <div class="col-2"><label class="control-label">회사 이메일</label></div>
                            <div class="col"><input class="form-control" type="text" name="comp_email"/></div>
                            <div class="col-3"></div>
                        </div>
                    </div>
                    <br>
                        <div class="row">
                            <div class="col-2"><label class="control-label">사업자 등록 번호</label></div>
                            <div class="col"><input class="form-control" type="text" name="comp_num"/></div>
                            <div class="col"><input class="form-control" type="text" name="comp_num"/></div>
                            <div class="col"><input class="form-control" type="text" name="comp_num"/></div>
                            <div class="col"><input class="form-control" type="text" name="comp_num"/></div>
                            <div class="col-3"></div>
                        </div>
                        <br>
                </div>
                <!-- 회사 입력 정보 끝!-->

                <!-- 버튼 -->
                <div class="col">
                    <div class="row" id="bottom_btn">
                        <div class="col-3"></div>
                        <div class="col"><button class="btn btn-success" type="submit" id="submit">회원가입</button></div>
                        <div class="col"><button class="cencle btn btn-danger" type="button">취소</button></div>
                        <div class="col-3"></div>
                    </div>
                </div>
                <!-- 버튼 -->
            </form>
        </section>
    </div>
</body>

</html>