<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function(){
		$("#loginBtn").click(function(){
			location.href='../member/loginForm.do';
		})
	})
</script>
<title>아이디 찾기</title>
<style>
.findId{
font-family: 'SDSamliphopangche_Basic';
}
.wrapFindId{
			width : 600px;
            margin: 0 auto;
            margin-top: 100px;
            display: grid;
            grid-template-columns:5% 22.5% 22.5% 22.5% 22.5% 5%;
            grid-template-rows: 100px 100px 100px;
            border-radius: 5px;
            background-color:#FFFDFF;
            box-shadow: 5px 5px 5px 5px rgba(0,0,0,0.15);
}
.grid0{
grid-column-start: 1; grid-column-end: 7;
}
.grid1{
grid-column-start: 2; grid-column-end: 4;
}
.grid2{
grid-column-start: 4; grid-column-end: 6;
}
.grid3{
grid-column-start: 2; grid-column-end: 4;
}
.grid4{
grid-column-start: 4; grid-column-end: 6;
}
.findLebel1{
		margin-top:15px;
		margin-left:25px;
		padding-right: 380px;
		font-size: 37px;
		text-align: left;
		color: white;
		background: #2e2751;
		}
.findLebel2{
		
		margin-top:4px;
		margin-bottom:8px;
		margin-left:25px;
		font-size: 33px;
		text-align: center;
		}
.findLebel3{
		margin-top:4px;
		margin-bottom:8px;
		padding-right: 215px;
		font-size: 33px;
		text-align: center;
		background:  #f4f9fc;
}
.findButton{
		width: 250px; height: 50px;
        border-radius: 5px;
        font-weight:bold;
        text-align:center;  line-height:30px; 
        border : 1px solid  #000042;
        background-color:white;
}
.findButton:hover{
		color:#000042;
    	font-weight:bold;
        background-color:white;
        border : 2px solid  #000042;
}

</style>
</head>
<body>
	<div class="findID">
		<div class="wrapFindId">
			<div class="grid0">
				<label class="findLebel1 findId">&nbsp;&nbsp;ID 찾기 결과</label>
			</div>
			<div class="grid1">
				<label class="findLebel2 findId">가입하신 ID는 </label>
			</div>
			
			<div class="grid2">
				<label class="findLebel3 findId ">${user_id}</label>	
			</div>
			<div class="grid3">
				<button type="button" id=loginBtn class="findButton findId">Login</button>
			</div>
			<div class="grid4">
				<button type="button" onclick="history.go(-1);" class="findButton findId">Cancel</button>
			</div>
			
		</div>
	</div>
</body>
</html>