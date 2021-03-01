<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function(){
		$("#findBtn").click(function(){
			$.ajax({
				url : "../member/find_pw.do",
				type : "POST",
				data : {
					user_id : $("#user_id").val(),
					user_email : $("#user_email").val()
				},
				success : function(result) {
					alert(result);
				},
			})
		});
	})
</script>
<title>비밀번호 찾기</title>
<style>
.findPW{
font-family: 'SDSamliphopangche_Basic';
}
.wrapFindPW{
	width : 600px;
    margin: 0 auto;
    margin-top: 100px;
    display: grid;
    grid-template-columns:25% 25% 25% 25%;
    grid-template-rows: 100px 100px 100px;
    border-radius: 5px;
    background-color:#FFFDFF;
    box-shadow: 5px 5px 5px 5px rgba(0,0,0,0.15);
}
.grid1{grid-column-start: 1; grid-column-end: 4;}
.grid2{grid-column-start: 4; grid-column-end: 5;
       grid-row-start: 1; grid-row-end: 3;
       }
.grid3{grid-column-start: 1; grid-column-end: 4;}
.grid4{grid-column-start: 1; grid-column-end: 3;margin: 0 auto;margin-top:20px;}
.grid5{grid-column-start: 3; grid-column-end: 6;margin: 0 auto;margin-top:20px;}
.findPW_btn{
        width: 140px; height: 130px;
        border-radius: 5px;
        margin-top:50px;
        margin-left:-10px;
        font-size: 2em; 
        font-weight:bold;
        color:white;
        background-color:#2e2751;
    }
    .findPW_btn:hover{
    	color:#000042;
    	font-weight:bold;
        background-color:white;
        border : 2px solid  #000042;
    }
    .findPWInputBox{
        width: 400px;height: 50px;
        font-size: 1.5em;
        border-radius: 5px;
        margin-left:20px;
        text-align : center;
    }
    .findInputId{margin-top:50px;}
    .findInputEmail{margin-top:30px;}
    .findPwButton{
    width: 250px; height: 50px;
        border-radius: 5px;
        font-weight:bold;
        text-align:center;  line-height:30px; 
        border : 1px solid  #000042;
        background-color:white;
    }
</style>
</head>
<body>
	<div class="">
		
			<div class="wrapFindPW">
				<div class="grid1">
					<input class="findPWInputBox findInputId findPW" type="text" id="user_id" name="user_id" placeholder="아이디를 입력해주세요" required>
				</div>
				<div class="grid2">
					<button type="button" id=findBtn class=" findPW_btn findPW">PassWord 찾기</button>
				</div>
				<div class="grid3"> 
					<input class="findPWInputBox findInputEmail findPW" type="text" id="user_email" name="user_email" placeholder="가입하신 E_mail을 입력해주세요" required>
				</div>
				<div class="grid4">
					<button type="button" onclick="location.href='${contextPath}find_id_form.do'" class="findPwButton findPW">ID 찾기</button>
				</div>
				<div class="grid5">	
					<button type="button" onclick="history.go(-1);" class="findPwButton findPW">Cancel</button>
				</div>
			</div>
		
	</div>
</body>
</html>