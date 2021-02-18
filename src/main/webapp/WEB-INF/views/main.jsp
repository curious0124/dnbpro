<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%> 

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>메인 페이지</title>
  <script src="http://code.jquery.com/jquery-latest.js"></script>
  <style>
        #popupzone{
            width: 300px;
            height: 400px;
            position: absolute;
            left: 100px;
            z-index: 10;
        }
        #pop_img{
            width: 300px;
            height: 400px;
        }
        #pop_img>a>img{
            width: 100%;
            height: 100%;
        }
        #popch{
            text-align: right;
            margin-top: -20px;
        }
    </style>
    <script>
        $(function(){
            $("#popupclose").click(function(){
                $('#popupzone').hide();
            });
        });
           
    </script>
</head>
<body>
   <h1>메인 페이지입니다!!</h1><br><br><br><br><br>
   
   <c:choose> 
	<c:when test="${not empty articlesNoticeList[0].board_img && articlesNoticeList[0].board_img!='null' }">
			   	
    <div id="popupzone">
        <div id="pop_img">
            <a href="${contextPath}/cust/viewNoticeArticle.do?board_num=${articlesNoticeList[0].board_num}"><img src="${contextPath}/download.do?board_num=${articlesNoticeList[0].board_num}&board_img=${articlesNoticeList[0].board_img}"></a>
        </div>
        <div id="popch">
            <input type="checkbox" id="popupclose" >닫기
        </div>
    </div>
    </c:when>
			<c:otherwise>	    
			</c:otherwise>
	 </c:choose>
    
    
    
    <div id="rollingbanner">
        <h1>롤링배너입니다~~롤링배너입니다~~롤링배너입니다~~</h1>
        <h1>롤링배너입니다~~롤링배너입니다~~롤링배너입니다~~</h1>
        <h1>롤링배너입니다~~롤링배너입니다~~롤링배너입니다~~</h1>
        <h1>롤링배너입니다~~롤링배너입니다~~롤링배너입니다~~</h1>
        <h1>~~컨텐츠~~~~컨텐츠~~~~컨텐츠~~~~컨텐츠~~~~컨텐츠~~~~컨텐츠~~</h1>
        <h1>~~컨텐츠~~~~컨텐츠~~~~컨텐츠~~~~컨텐츠~~~~컨텐츠~~~~컨텐츠~~</h1>
        <h1>~~컨텐츠~~~~컨텐츠~~~~컨텐츠~~~~컨텐츠~~</h1>
        <h1>~~컨텐츠~~~~컨텐츠~~~~컨텐츠~~~~컨텐츠~~</h1>
        <h1>~~컨텐츠~~~~컨텐츠~~~~컨텐츠~~~~컨텐츠~~</h1>
        <h1>~~컨텐츠~~~~컨텐츠~~~~컨텐츠~~~~컨텐츠~~~~컨텐츠~~~~컨텐츠~~~~컨텐츠~~~~컨텐츠~~~~컨텐츠~~</h1>
        <h1>~~컨텐츠~~~~컨텐츠~~~~컨텐츠~~</h1>
        <h1>~~컨텐츠~~~~컨텐츠~~~~컨텐츠~~~~컨텐츠~~</h1>
        <h1>~~컨텐츠~~~~컨텐츠~~~~컨텐츠~~~~컨텐츠~~~~컨텐츠~~</h1>
        <h1>~~컨텐츠~~~~컨텐츠~~~~컨텐츠~~~~컨텐츠~~</h1>
        <h1>~~컨텐츠~~~~컨텐츠~~~~컨텐츠~~~~컨텐츠~~~~컨텐츠~~ㅍ</h1>
        
    </div>
</body>
</html>