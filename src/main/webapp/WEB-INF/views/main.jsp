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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
  <style>
        #popupzone{
            width: 400px;
            height: 500px;
            position: absolute;
            left: 100px;
            z-index: 10;
            board: 5px solid red;
        }
        #pop_img{
            width: 400px;
            height: 500px;
        }
        #pop_img>a>img{
            width: 100%;
            height: 100%;
        }
        #popch{
            text-align: right;
            margin-top: -50px;
        }
        .banner_img{
        width:100%;
        height:300px;
        }
        #carouselExampleControls{

    }
    </style>
    <script>
    /* 팝업 로드 */
        $(function(){
            $("#popupclose").click(function(){
                $('#popupzone').hide();
            });
        });

    </script>
</head>
<body>
<!-- 배너시작 -->
<div id="rollingbanner">
<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="${contextPath}/resources/image/logo.png" class="banner_img" alt="">
    </div>
    
    <c:forEach items="${bannerList}" var="bannerList">
    <div class="carousel-item">
      <img class="banner_img" src="${contextPath}/download.do?board_num=${bannerList.board_num}&board_img=${bannerList.board_img}" />
    </div>
    </c:forEach>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls"  data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls"  data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
</div>
<!-- 배너끝! -->

<!-- 팝업 시작 -->
   <c:choose> 
	<c:when test="${not empty articlesNoticeList[0].board_img && articlesNoticeList[0].board_img!='null' }">
    <div id="popupzone">
        <div id="pop_img">
            <a href="${contextPath}/cust/viewNoticeArticle.do?board_num=${articlesNoticeList[0].board_num}">
            <img src="${contextPath}/download.do?board_num=${articlesNoticeList[0].board_num}&board_img=${articlesNoticeList[0].board_img}"></a>
        </div>
        <div id="popch">
            <input type="checkbox" id="popupclose" >닫기
        </div>
    </div></c:when><c:otherwise></c:otherwise></c:choose>
<!-- 팝업끝! -->
    
    
    

    
    <div>
        <h1>테스트❤❤❤🧡🧡🧡💛💛💛💚💚💚💙💙💙💜💜💜🤎🤎🤎🖤🖤🖤🤍🤍🤍💔💔💔❣❣❣💕💕💕💞💞💞💓💓💓💗💗💗💖💖💖💘💘💘💝💝💝💟💟💟테스트❤❤❤🧡🧡🧡💛💛💛💚💚💚💙💙💙💜💜💜🤎🤎🤎🖤🖤🖤🤍🤍🤍💔💔💔❣❣❣💕💕💕💞💞💞💓💓💓💗💗💗💖💖💖💘💘💘💝💝💝💟💟💟</h1>
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