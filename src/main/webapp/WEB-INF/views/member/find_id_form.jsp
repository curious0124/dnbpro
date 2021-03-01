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
grid-column-start: 2; grid-column-end: 3;
}
.grid2{
grid-column-start: 3; grid-column-end: 6;
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
		padding-right: 427px;
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
.findInputBox{
		width: 387px;
		height: 50px;
        font-size: 1.5em;
        border-radius: 5px;
        margin: 0 auto;
        text-align :left ;
}

</style>
</head>
<body>
	<div class="findID">	
			<form action="../member/find_id.do" method="post">
			<div class="wrapFindId">
				<div class="grid0"><label class="findLebel1 findId">&nbsp;&nbsp;&nbsp;&nbsp;ID 찾기</label></div>
				<div class="grid1"><label class="findLebel2 findId">Email</label></div>
				<div class="grid2"><input class="findInputBox findId" type="text" id="user_email" name="user_email" placeholder="가입하신 이메일을 입력해 주세요" required></div>
				<div class="grid3"><button type="submit" id="findBtn" class="findButton findId">find</button></div>
				<div class="grid4"><button type="button" onclick="history.go(-1);" class="findButton findId">Cancel</button></div>
			</div>
			</form>
	</div>
</body>
</html>