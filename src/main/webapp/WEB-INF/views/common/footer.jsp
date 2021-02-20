<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"
 %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>

    <!-- 부트스트랩 경로 지정 폴더에 넣어놨음-->
    <%-- <link rel="stylesheet" href="${contextPath}/resources/bootstrap/bootstrap.css"> --%>
    
  <meta charset="UTF-8">
  <title>하단 부분</title>
  <style>
    p {
     font-size:20px;
      text-align:center;
    }
	/*수정 */
     #footerBox{ 
      	width:100%;
      	bottom:0px;
        clear: both;
        padding: 5px;
        border: 0px solid #bcbcbc;
        background-color: lightblue;
      }
  </style>
</head>
<body>

<div id="footer_section">

<div id="footerBox">

<p> e-mail:admin@test.com</p> 
<p> 명예의 전당 : 김 태 수</p>
<p>찾아오는 길:<a href="#">약도</a></p>
</div>
</body>
</html>