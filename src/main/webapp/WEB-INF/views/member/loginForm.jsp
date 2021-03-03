<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인창</title>
<style>
body{background-color: #F4F9FC;}
		.loginfs{font-family: 'SDSamliphopangche_Basic';}
        .wrap2{
            width : 600px;
            margin: 0 auto;
            margin-top: 100px;
            display: grid;
            grid-template-columns: 25% 25% 25% 25%;
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
    .login_btn{
        width: 140px; height: 130px;
        border-radius: 5px;
        margin-top:50px;
        margin-left:-10px;
        font-size: 2em; 
        font-weight:bold;
        color:white;
        background-color:#2e2751;
    }
    .login_btn:hover{
    	color:#000042;
    	font-weight:bold;
        background-color:white;
        border : 2px solid  #000042;
    }
    .inputbox{
        width: 400px;height: 50px;
        font-size: 1.5em;
        border-radius: 5px;
        margin-left:20px;
        text-align : center;
    }
    .inputid{margin-top:50px;   }
    .inputpw{margin-top:30px;   }
    .find_btn{
        width: 250px; height: 50px;
        border-radius: 5px;
        font-weight:bold;
        text-align:center;  line-height:30px; 
        border : 1px solid  #000042;
        background-color:white;
    }
    
    
        
    </style>
<c:choose>
	<c:when test="${result==2}">
		<script>
			window.onload = function() {
				alert("정지된 회원입니다. 센터에 문의 바랍니다.");
				location.href = "${contextPath}/main/main.do";
			}
		</script>
	</c:when>
	<c:when test="${result==1 }">
		<script>
			window.onload = function() {
				alert("아이디나 비밀번호가 틀립니다.다시 로그인 하세요!");
			}
		</script>
	</c:when>
</c:choose>

<script>
	/* $("#submit").on("click", function(){
	 var userid = $("#user_id").val();
	
	
	
	
	 } */
</script>
</head>

<body>
	<form name="login" method="post"
		action="${contextPath}/member/login.do">
		 <div class="wrap2">
       <div class="grid1"><input type="text" class="inputbox inputid loginfs" name="user_id" value="" size="20" placeholder="ID를 입력하세요."></div>
       <div class="grid2"><button type="submit" class="login_btn loginfs">Login</button></div>
       <div class="grid3"><input type="password" class="inputbox inputpw loginfs" name="user_pwd" value="" size="20"placeholder="비밀번호를 입력하세요."></div>
       <div class="grid4"><button type="button" class="find_btn find_id_form loginfs" onclick="location.href='${contextPath}/member/find_id_form.do'">ID 찾기</button></div>
       <div class="grid5"><button type="button" class="find_btn find_pw_form loginfs" onclick="location.href='${contextPath}/member/find_pw_form.do'">PW 찾기</button></div>
       
       
   </div>
		<!-- 
		<table border="1" width="80%" align="center">
			<tr align="center">
				<td>아이디</td>
				<td>비밀번호</td>
			</tr>
			<tr align="center">
				<td><input type="text" name="user_id" value="" size="20">
				</td>
				<td><input type="password" name="user_pwd" value="" size="20">
				</td>
			</tr>
			<tr align="center">
				<td colspan="2"><input type="submit" value="로그인"> <input
					type="reset" value="다시입력"></td>
				<td><button type="button" class="find_id_form" onclick="location.href='${contextPath}/member/find_id_form.do'">아이디 찾기</button></td>
				<td><button type="button" class="find_pw_form" onclick="location.href='${contextPath}/member/find_pw_form.do'">비밀번호 찾기</button></td>
			</tr>
		</table>
		 -->
	</form>
</body>
</html>